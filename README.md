# Idle Pet Game

Un juego idle en el que un personaje camina automáticamente con su mascota, que ataca a los enemigos que van apareciendo.

## Tecnología

- [Godot Engine 4](https://godotengine.org/) — motor de juego gratuito y open source

## Cómo jugar

- El personaje camina solo hacia la derecha
- La mascota ataca automáticamente a los enemigos cercanos
- Ganas monedas con cada enemigo derrotado
- Usa las monedas para mejorar al personaje y a la mascota

## Cómo ejecutar el proyecto

1. Descarga e instala [Godot 4](https://godotengine.org/download/)
2. Clona este repositorio
3. Abre Godot y selecciona "Import Project"
4. Navega hasta la carpeta del proyecto y selecciona `project.godot`

## Estructura del proyecto

```
idle-pet-game/
├── scenes/        # Escenas del juego (personaje, mascota, enemigos, mundo)
├── scripts/       # Scripts GDScript con la lógica del juego
├── assets/        # Sprites, sonidos y otros recursos
└── project.godot  # Archivo de configuración del proyecto Godot
```

## Roadmap

- [ ] Personaje que camina automáticamente
- [ ] Mascota que sigue al personaje
- [ ] Enemigos que aparecen aleatoriamente
- [ ] Sistema de ataque de la mascota
- [ ] Sistema de monedas y mejoras
