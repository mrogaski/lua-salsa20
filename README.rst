===========
lua-salsa20
===========

.. image:: https://api.travis-ci.org/mrogaski/lua-salsa20.svg?branch=master
   :alt: [Build Status]
   :target: https://travis-ci.org/mrogaski/lua-salsa20

--------------------------------------------------------
A pure Lua implementation of the Salsa20 eSTREAM cipher.
--------------------------------------------------------

Background
==========

The Salsa20 stream cipher was published by `Daniel J. Bernstein <http://cr.yp.to/djb.html>`_ of the University of Illinois at Chicago in 2005 and submitted to the 
`eSTREAM project <http://www.ecrypt.eu.org/stream/salsa20pf.html>`_.

The algorithm is an efficient and well-designed cipher.  As of 2015, there are no effective attacks on this cipher.

Resources
=========

- `Salsa20 Information <http://cr.yp.to/snuffle.html>`_
- `Salsa20 on Wikipedia <https://en.wikipedia.org/wiki/Salsa20>`_
- `Salsa20 Usage and Deployment <http://ianix.com/pub/salsa20-deployment.html>`_


Usage
=====

All byte sequences are implemented as strings, which are 8-bit clean in Lua.

``salsa20.encrypt(key, nonce, plaintext, rounds)``
-------------------------------------

  **Arguments**
    key : string
      A 16-byte or 32-byte sequence representing the secret key.
    nonce : string
      An 8-byte sequence representing the nonce.
    plaintext : string
      The unencrypted message.
    rounds : number
      May be 20 (default), 12, or 8.

  **Returns**
    *string* : The encrypted message.


``salsa20.encrypt_table(key, nonce, plaintab, rounds)``
-------------------------------------

  **Arguments**
    key : string
      A 16-byte or 32-byte sequence representing the secret key.
    nonce : string
      An 8-byte sequence representing the nonce.
    plaintab : string
      A table containing unencrypted messages.
    rounds : number
      May be 20 (default), 12, or 8.

  **Returns**
    *table* : A table containing encypted text strings.


``salsa20.decrypt(key, nonce, ciphertext, rounds)``
-------------------------------------

  **Arguments**
    key : string
      A 16-byte or 32-byte sequence representing the secret key.
    nonce : string
      An 8-byte sequence representing the nonce.
    ciphertext : string
      The encrypted message.
    rounds : number
      May be 20 (default), 12, or 8.

  **Returns**
    *string* : The unencrypted message.


``salsa20.decrypt_table(key, nonce, ciphertab, rounds)``
-------------------------------------

  **Arguments**
    key : string
      A 16-byte or 32-byte sequence representing the secret key.
    nonce : string
      An 8-byte sequence representing the nonce.
    ciphertab : string
      A table containing encrypted messages.
    rounds : number
      May be 20 (default), 12, or 8.

  **Returns**
    *table* : A table containing unencypted text strings.


``salsa20.generate(k, v, i, rounds)``
-------------------------------------

  **Arguments**
    k : string
      A 16-byte or 32-byte sequence representing the secret key.
    v : string
      An 8-byte sequence representing the nonce.
    i : string
      An 8-byte sequence representing the stream position of the 64-byte block.
    rounds : number
      May be 20 (default), 12, or 8.

  **Returns**
    *string* : A 64-byte output block.

