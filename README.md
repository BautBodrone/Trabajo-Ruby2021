# Polycon

## Uso de `polycon`

Para ejecutar el comando principal de la herramienta se utiliza el script `bin/polycon`,
el cual puede correrse de las siguientes manera:

```bash
$ ruby bin/polycon [args]
```

O bien:

```bash
$ bundle exec bin/polycon [args]
```

O simplemente:

```bash
$ bin/polycon [args]
```

### Instalación de dependencias

Este proyecto utiliza Bundler para manejar sus dependencias. Si aún no sabés qué es eso
o cómo usarlo, no te preocupes: ¡lo vamos a ver en breve en la materia! Mientras tanto,
todo lo que necesitás saber es que Bundler se encarga de instalar las dependencias ("gemas")
que tu proyecto tenga declaradas en su archivo `Gemfile` al ejecutar el siguiente comando:

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

## Comentarios
  * El codigo esta escrito en ingles el codigo ya que los argumentos estan todos en ingles
  * La entrada de la fecha no me gusta como esta ahora ya que no funciona correctamente. No encontre forma de obligar al usuario a escribir hora. Cuando se agregue una UI se va a poder arreglar ese error
  * No hice ningun utils ya que para los que queria como por ejemplo el checkeo de directorio ya era una linea de codigo
  * El edit es el mas flojo de todos ya que utiliza un case para checkear si es la opcion correcta, intente de busca un 'in' como hay en python pero no encontre asi que termine optando por el case. Y el abrir el archivo para guardar no es lo mas optimo ya que abre y guarda dependiendo de la cantidad de opciones. Una solucion que se me ocurrio es guardandolo en formato json pero no se podia ya que el archivo pedia que sea .paf
