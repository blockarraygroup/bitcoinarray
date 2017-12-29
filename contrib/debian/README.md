
Debian
====================
This directory contains files used to package bitcoinarrayd/bitcoinarray-qt
for Debian-based Linux systems. If you compile bitcoinarrayd/bitcoinarray-qt yourself, there are some useful files here.

## bitcoinarray: URI support ##


bitcoinarray-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bitcoinarray-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bitcoinarray-qt binary to `/usr/bin`
and the `../../share/pixmaps/bitcoinarray128.png` to `/usr/share/pixmaps`

bitcoinarray-qt.protocol (KDE)

