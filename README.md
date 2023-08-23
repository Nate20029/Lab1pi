# Lab1pi

## Compilación programa paralelo
### Base
```
gcc -fopenmp .c -o output
```

### Generico
```
gcc -fopenmp <nombre_archivo_c_con_extension> -o <nombre_output>
```
### Ejemplo
Para un archivo hello.c
```
gcc -fopenmp hello.c -o hello
```