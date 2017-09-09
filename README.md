# AESCrypt

[![Greenkeeper badge](https://badges.greenkeeper.io/nextorigin/aescrypt.svg)](https://greenkeeper.io/)

[![Build Status][ci-master]][travis-ci]
[![Coverage Status][coverage-master]][coveralls]
[![Dependency Status][dependency]][david]
[![devDependency Status][dev-dependency]][david-dev]
[![Downloads][downloads]][npm]

AES Salted Encryption helper

Partially inspired by [AESCrypt Ruby gem][aescrypt-ruby].

[![NPM][npm-stats]][npm]

## Installation
```sh
npm install --save aescrypt
```

## Usage

### AESCrypt.encryptWithSalt(keytext, cleardata)
```coffee
AESCrypt = require "aescrypt"

keytext   = "toomanysecrets"
cleardata = "we have explosive"

{encrypted, salt} = AESCrypt.encryptWithSalt keytext, cleardata

###
encrypted = "nm6Ky1J/L7oBmiCont3hBzMwIf7cThAakcokykg="
salt      = "C/GzCUNDSjiotRNei17TfQ=="
###
```

### AESCrypt.decryptWithSalt(keytext, salt, encrypted)
```coffee
AESCrypt = require "aescrypt"

encrypted = "nm6Ky1J/L7oBmiCont3hBzMwIf7cThAakcokykg="
salt      = "C/GzCUNDSjiotRNei17TfQ=="

decrypted = AESCrypt.decryptWithSalt keytext, salt, encrypted

###
decrypted = "we have explosive"
###
```
## License

MIT

  [aescrypt-ruby]: https://github.com/Gurpartap/aescrypt

  [ci-master]: https://img.shields.io/travis/nextorigin/aescrypt/master.svg?style=flat-square
  [travis-ci]: https://travis-ci.org/nextorigin/aescrypt
  [coverage-master]: https://img.shields.io/coveralls/nextorigin/aescrypt/master.svg?style=flat-square
  [coveralls]: https://coveralls.io/r/nextorigin/aescrypt
  [dependency]: https://img.shields.io/david/nextorigin/aescrypt.svg?style=flat-square
  [david]: https://david-dm.org/nextorigin/aescrypt
  [dev-dependency]: https://img.shields.io/david/dev/nextorigin/aescrypt.svg?style=flat-square
  [david-dev]: https://david-dm.org/nextorigin/aescrypt?type=dev
  [downloads]: https://img.shields.io/npm/dm/aescrypt.svg?style=flat-square
  [npm]: https://www.npmjs.org/package/aescrypt
  [npm-stats]: https://nodei.co/npm/aescrypt.png?downloads=true&downloadRank=true&stars=true
