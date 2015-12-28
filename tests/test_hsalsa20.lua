--[[--------------------------------------------------------------------------

The MIT License (MIT)

Copyright (c) 2014-2015, Mark Rogaski.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]]--------------------------------------------------------------------------

package.path = package.path..';../hsalsa20.lua'
local hsalsa20 = require "hsalsa20"

local pass = true

local key = string.char(
    0x74, 0x68, 0x69, 0x73, 0x20, 0x69, 0x73, 0x20,
    0x33, 0x32, 0x2d, 0x62, 0x79, 0x74, 0x65, 0x20,
    0x6b, 0x65, 0x79, 0x20, 0x66, 0x6f, 0x72, 0x20,
    0x68, 0x73, 0x61, 0x6c, 0x73, 0x61, 0x32, 0x30 
)

local nonce = string.char(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

local expected = string.char(
    0x0e, 0x9a, 0x6a, 0x57, 0xfd, 0x52, 0x0e, 0xad,
    0x19, 0xb4, 0xa2, 0xf5, 0xaa, 0x3e, 0xe5, 0x51,
    0x92, 0xb3, 0x88, 0x97, 0x89, 0x6e, 0x43, 0xe7,
    0x5f, 0x07, 0x44, 0x92, 0x6f, 0x8d, 0x1c, 0xba
)

local result = hsalsa20.generate(key, nonce, 20)
pass = (result == expected)
print(string.format("% 32s => %s", "HSalsa20", pass))

return pass
