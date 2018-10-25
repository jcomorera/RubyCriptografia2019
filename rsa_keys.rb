require 'openssl'

#https://blog.udemy.com/ruby-openssl/


class RSA_keys

    attr_reader :fichero_privado
    attr_reader :fichero_publico

    ###
    # @description: Metodo que inicializa el objeto.
    # @param {any}: Nombre de los archivos con la clave privada y la publica.
    ###
    def initialize(fichero_privado,fichero_publico)
        @fichero_privado = fichero_privado
        @fichero_publico = fichero_publico
        @rsa_key = OpenSSL::PKey::RSA.new(2048)
    end

    ###
    # @description: Metodo que crea los ficheros y escribe las claves.
    ###
    def generar_claves
        #generacion de la clave privada.
        if File.exist?(@fichero_privado)
            File.delete(@fichero_privado)
        end
        open @fichero_privado, 'w' do |io| io.write @rsa_key.to_pem end
        #generacion de la clave publica.
        if File.exist?(@fichero_publico)
            File.delete(@fichero_publico)
        end
        open @fichero_publico, 'w' do |io| io.write @rsa_key.public_key.to_pem end
    end

end
