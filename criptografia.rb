#!/usr/bin/env ruby

require 'openssl'
require 'base64'

class Criptografia

    attr_writer :password
    attr_accessor :string_entrada
    attr_accessor :string_salida

    ###
    # @description: Metodo que inicializa el objeto.
    # @param {any}: Requiere de la clave(archivo.pem)necesaria para encriptar/desencriptar,la cadena de entrada y la password(opcional).
    ###
    def initialize(key,string_entrada,password=nil)
        @public_key_file = key
        @private_key_file = key
        @string_entrada = string_entrada
        @password = password
    end

    ###
    # @description: Metodo que encripta la string_entrada utilizando la clave publica.
    ###
    def encriptar
        public_key = OpenSSL::PKey::RSA.new(File.read(@public_key_file))
        @string_salida = Base64.encode64(public_key.public_encrypt(@string_entrada))
    end

    ###
    # @description: Metodo que desencripta la string_entrada utilizando la clave privada.
    ###
    def desencriptar
        private_key = OpenSSL::PKey::RSA.new(File.read(@private_key_file),@password)
        @string_salida = private_key.private_decrypt(Base64.decode64(@string_entrada))
    end

end
