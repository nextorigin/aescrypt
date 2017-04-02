crypto = require "crypto"


class AESCrypt
  @key: (tohash) -> ((crypto.createHash "sha256").update tohash).digest()

  @salt: (bytes = 16) -> crypto.randomBytes bytes

  @decrypt: (cryptkey, iv, encryptdata) ->
    encryptdata = (new Buffer encryptdata, "base64").toString "binary"
    decipher    = crypto.createDecipheriv "aes-256-cbc", cryptkey, iv
    decoded     = decipher.update encryptdata, "binary", "utf8"
    try
      decoded  += decipher.final "utf8"
    catch e
      decoded   = null
    decoded

  @encrypt: (cryptkey, iv, cleardata) ->
    encipher     = crypto.createCipheriv "aes-256-cbc", cryptkey, iv
    encryptdata  = encipher.update cleardata, "utf8", "binary"
    encryptdata += encipher.final "binary"
    encoded      = (new Buffer encryptdata, "binary").toString "base64"
    encoded

  @encryptWithSalt: (keytext, cleardata) =>
    key = @key keytext
    iv  = @salt()
    encrypted: @encrypt key, iv, cleardata
    salt: iv.toJSON()

  @decryptWithSalt: (keytext, salt, encryptdata) =>
    key = @key keytext
    iv  = new Buffer salt
    @decrypt key, iv, encryptdata


module.exports = AESCrypt
