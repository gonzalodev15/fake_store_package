# fake_store_package

Este es un paquete que permite una fácil interacción con la API de FakeStore. Aquí los pasos para isntalarla correctamente en tu proyecto:

# Agrega la dependencia en pubspec.yaml

dependencies:
  fake_store_package:
    git:
      url: git://github.com/gonzalodev15/fake_store_package.git


# Instala la dependencia
Después de agregar la dependencia en pubspec.yaml, ejecuta el comando 'flutter pub get' en la terminal para instalar el paquete

#Importa y utiliza el paquete en tu código
Agrega el siguiente import: 

import 'package:fake_store_package/API/fakestore_api.dart';


# Una vez hecho esto podrás acceder a todos los métodos implementados los cuales son los siguientes:

fetchProduct(int id) => Método que trae un producto en específico, solo debe pasársele como parámetro el id del mismo.

fetchProducts() => Método que trae la lista completa de productos, no requiere parámetros.

fetchCategories() => Método que trae la lista completa de categorías, no requiere parámetros.

fetchUsers() => Método que trae la lista completa de usuarios, no requiere parámetros.

# Con esto hecho, solo obten la información y preséntala de la manera más conveniente que encuentres


