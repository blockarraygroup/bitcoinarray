#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOINARRAYD=${BITCOINARRAYD:-$SRCDIR/bitcoinarrayd}
BITCOINARRAYCLI=${BITCOINARRAYCLI:-$SRCDIR/bitcoinarray-cli}
BITCOINARRAYTX=${BITCOINARRAYTX:-$SRCDIR/bitcoinarray-tx}
BITCOINARRAYQT=${BITCOINARRAYQT:-$SRCDIR/qt/bitcoinarray-qt}

[ ! -x $BITCOINARRAYD ] && echo "$BITCOINARRAYD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BRYVER=($($BITCOINARRAYCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoinarrayd if --version-string is not set,
# but has different outcomes for bitcoinarray-qt and bitcoinarray-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOINARRAYD --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOINARRAYD $BITCOINARRAYCLI $BITCOINARRAYTX $BITCOINARRAYQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BRYVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BRYVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
