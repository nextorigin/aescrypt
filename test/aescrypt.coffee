{expect}   = require "chai"
AESCrypt   = require "../src/aescrypt"


describe "AESCrypt", ->
  describe "#key", ->
    it "should return a hash of the input value", ->
      key       = AESCrypt.key "toomanysecrets"
      base64key = key.toString "base64"

      expect(base64key).to.equal "Kz5yjBpdHvoDXDB8IvgOR/hw21eV4veozvWZ31GTp5Y="

  describe "#salt", ->
    it "should return a random value for as many bits as the input", ->
      for bytes in [4, 8, 16, 32]
        values = {}

        for i in [0..100]
          value       = AESCrypt.salt bytes
          base64value = value.toString "base64"

          expect(value).to.have.length bytes
          expect(values[base64value]).to.not.exist
          values[base64value] = true

  describe "#decryptWithSalt", ->
    it "should decrypt the salted+encrypted input value", ->
      keytext   = "toomanysecrets"
      cleardata = "we have explosive"
      encrypted = "nm6Ky1J/L7oBmiCont3hBzMwIf7uG9scThAakcokykg="
      salt      = "C/GzCUNDSjiotRNei17TfQ=="

      decrypted = AESCrypt.decryptWithSalt keytext, salt, encrypted
      expect(decrypted).to.equal cleardata

    it "should return null if failing to decode the salted+encrypted input value", ->
      keytext   = "toomanysecrets"
      cleardata = "we have explosive"
      encrypted = "nm6Ky1J/L7oBmiCont3hBzMwIf7cThAakcokykg="
      salt      = "C/GzCUNDSjiotRNei17TfQ=="

      decrypted = AESCrypt.decryptWithSalt keytext, salt, encrypted
      expect(decrypted).to.not.exist

  describe "#encryptWithSalt", ->
    it "should return the salted+encrypted input value", ->
      keytext   = "toomanysecrets"
      cleardata = "we have explosive"

      {encrypted, salt} = AESCrypt.encryptWithSalt keytext, cleardata

      expect(encrypted).to.be.a.string
      expect(encrypted).to.have.length 44
      expect(salt).to.be.a.string
      expect(salt).to.have.length 24

      decrypted = AESCrypt.decryptWithSalt keytext, salt, encrypted
      expect(decrypted).to.equal cleardata
