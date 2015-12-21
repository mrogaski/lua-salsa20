# lua-salsa20

[![Build Status](https://travis-ci.org/mrogaski/lua-salsa20.png?branch=master)](https://travis-ci.org/mrogaski/lua-salsa20)

__Salsa20 eStream cipher in Lua.__

The Salsa20 stream cipher was published by [Daniel J. Bernstein][1] of the University of Illinois at Chicago in 2005 and submitted to the [eSTREAM project][2].

The algorithm is an efficient and well-designed cipher.  As of 2015, there are no effective attacks on this cipher.

## Resources

- [Salsa20 Information][3]
- [Wikipedia][4]
- [Salsa20 Usage and Deployment][5]


## Usage

All byte sequences are implemented as strings, which are 8-bit clean in Lua.

### generate

```lua
salsa20.generate(k, v, i, rounds)
```
#### Arguments

<dl>
    <dt>k</dt>
    <dd>A 16-byte or 32-byte sequence representing the secret key.</dd>
    <dt>v</dt>
    <dd>An 8-byte sequence representing the nonce.</dd>
    <dt>i</dt>
    <dd>An 8-byte sequence representing the stream position of the 64-byte block.</dd>
    <dt>rounds (optional)</dt>
    <dd>May be 20 (default), 12, or 8.</dd>
</dl>

#### Return Value

A 64-byte output block.


### encrypt

```lua
salsa20.encrypt(key, nonce, plaintext, rounds)
```
#### Arguments

<dl>
    <dt>key</dt>
    <dd>A 16-byte or 32-byte sequence representing the secret key.</dd>
    <dt>nonce</dt>
    <dd>An 8-byte sequence representing the nonce.</dd>
    <dt>plaintext</dt>
    <dd>The unencrypted message.</dd>
    <dt>rounds (optional)</dt>
    <dd>May be 20 (default), 12, or 8.</dd>
</dl>

#### Return Value

The encrypted message.


### encrypt_table

```lua
salsa20.encrypt_table(key, nonce, plaintab, rounds)
```

This is a convenience function for encrypting multiple strings while maintaining state.

#### Arguments

<dl>
    <dt>key</dt>
    <dd>A 16-byte or 32-byte sequence representing the secret key.</dd>
    <dt>nonce</dt>
    <dd>An 8-byte sequence representing the nonce.</dd>
    <dt>plaintab</dt>
    <dd>A table containing unencrypted messages.</dd>
    <dt>rounds (optional)</dt>
    <dd>May be 20 (default), 12, or 8.</dd>
</dl>

#### Return Value

A table containing encrypted messages.


### decrypt

```lua
salsa20.decrypt(key, nonce, ciphertext, rounds)
```
#### Arguments

<dl>
    <dt>key</dt>
    <dd>A 16-byte or 32-byte sequence representing the secret key.</dd>
    <dt>nonce</dt>
    <dd>An 8-byte sequence representing the nonce.</dd>
    <dt>ciphertext</dt>
    <dd>The encrypted message.</dd>
    <dt>rounds (optional)</dt>
    <dd>May be 20 (default), 12, or 8.</dd>
</dl>

#### Return Value

The unencrypted message.


### decrypt_table

```lua
salsa20.decrypt_table(key, nonce, ciphertab, rounds)
```

This is a convenience function for decrypting multiple strings while maintaining state.

#### Arguments

<dl>
    <dt>key</dt>
    <dd>A 16-byte or 32-byte sequence representing the secret key.</dd>
    <dt>nonce</dt>
    <dd>An 8-byte sequence representing the nonce.</dd>
    <dt>ciphertab</dt>
    <dd>A table containing encrypted messages.</dd>
    <dt>rounds (optional)</dt>
    <dd>May be 20 (default), 12, or 8.</dd>
</dl>

#### Return Value

A table containing unencrypted messages.



[1]: http://cr.yp.to/djb.html
[2]: http://www.ecrypt.eu.org/stream/salsa20pf.html
[3]: http://cr.yp.to/snuffle.html
[4]: https://en.wikipedia.org/wiki/Salsa20
[5]: http://ianix.com/pub/salsa20-deployment.html