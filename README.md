# Polycon

## Uso de `polycon`

Para ejecutar es requerido rals 6 (6.1.4.1 se utilizo en el desarrollo) y ruby 3
Se debe para en la root de la crpeta del programa y ejecutar:

```bash
$ rails s
```

O bien:

```bash
$ rails server
```
Para poder ejecutar el servidor de rails y usar la applicacion.

### Instalación de dependencias

Este proyecto utiliza Bundler para manejar sus dependencias

```bash
$ bundle install
```

> Nota: Bundler debería estar disponible en tu instalación de Ruby, pero si por algún
> motivo al intentar ejecutar el comando `bundle` obtenés un error indicando que no se
> encuentra el comando, podés instalarlo mediante el siguiente comando:
>
> ```bash
> $ gem install bundler
> ```

### Primer inicio

En el primer inicio se dera correr el siguinte comando para tener una base de datos

>
> ```bash
> $ rails db:migrate
> ```

Si se desa tener algunos datos cargados se dbera correr el siguiente comando

>
> ```bash
> $ rails db:seed
> ```

Admin: admin@gmail.com password:123123
Assistant: assistant@gmail.com password:123123
Watcher: watcher@gmail.com password:123123

## Comentarios
Primera entrega:
  * El codigo esta escrito en ingles el codigo ya que los argumentos estan todos en ingles
  * La entrada de la fecha no me gusta como esta ahora ya que no funciona correctamente. No encontre forma de obligar al usuario a escribir hora. Cuando se agregue una UI se va a poder arreglar ese error
  * No hice ningun utils ya que para los que queria como por ejemplo el checkeo de directorio ya era una linea de codigo
  * El edit es el mas flojo de todos ya que utiliza un case para checkear si es la opcion correcta, intente de busca un 'in' como hay en python pero no encontre asi que termine optando por el case. Y el abrir el archivo para guardar no es lo mas optimo ya que abre y guarda dependiendo de la cantidad de opciones. Una solucion que se me ocurrio es guardandolo en formato json pero no se podia ya que el archivo pedia que sea .paf

Tercera entrega:
  * El programa esta completamente en ingles porque me parecio mas consistete con la forma en la ruby pide que escribamos los nombres de las variables
  * El archivos pasos_seguidos.doc es una pequeña parte de los camando que fui utilizando mientras que empezaba a leer sobre ruby
