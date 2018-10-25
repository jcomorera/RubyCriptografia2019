# RubyCriptografia2019
Scripts de generación de claves, encriptación y desencriptación en RSA

#https://repl.it/@JoanComorera/CriptografiaRuby

Ejemplo de uso:

load 'rsa_keys.rb'
load 'criptografia.rb'

#Generacion de claves:
=begin
claves = RSA_keys.new("privado.pem","publico.pem")
claves.generar_claves
=end

#Para encriptar el contenido de un archivo:
=begin
#Abrimos el fichero de entrada
file = File.open("entrada.txt", "rb")
#Leemos el fichero de entrada dentro de la string
texto_entrada = file.read
=end

texto_entrada = 'texto a encriptar'

cript = Criptografia.new('publico.pem',texto_entrada)
cript.encriptar
encriptado = cript.string_salida
print encriptado

#Crear un fichero con el contenido encriptado:
=begin
archivo_salida = 'salida.txt'
if File.exist?(archivo_salida)
    File.delete(archivo_salida)
end
open archivo_salida, 'w' do |io| io.write encriptado end
=end

cript = Criptografia.new('privado.pem',encriptado)
cript.desencriptar
print cript.string_salida


