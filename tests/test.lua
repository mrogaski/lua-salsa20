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

local pass = true

print('Testing SalsaCore ...')
pass = pass and require "test_core"
print()

print('Testing Salsa20 ...')
pass = pass and require "test_salsa20"
print()

print('Testing HSalsa20 ...')
pass = pass and require "test_hsalsa20"
print()

print('Testing XSalsa20 ...')
pass = pass and require "test_xsalsa20"
print()

local result = pass and 'PASS' or 'FAIL'
print(string.format('Result: %s', result))

os.exit(pass and 0 or 1)
