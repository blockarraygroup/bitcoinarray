// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINARRAY_QT_BITCOINARRAYADDRESSVALIDATOR_H
#define BITCOINARRAY_QT_BITCOINARRAYADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BitcoinArrayAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinArrayAddressEntryValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

/** BitcoinArray address widget validator, checks for a valid bitcoinarray address.
 */
class BitcoinArrayAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinArrayAddressCheckValidator(QObject* parent);

    State validate(QString& input, int& pos) const;
};

#endif // BITCOINARRAY_QT_BITCOINARRAYADDRESSVALIDATOR_H
