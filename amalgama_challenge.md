# Ejercicio de Amalgama - Modelado de Ejercitos

## Indicaciones
El ejercicio consiste en modelar ejércitos.
Tiempo estimado: ~3 horas

## Ejercitos
Los ejércitos poseen una cantidad inicial de piqueros, arqueros y caballeros dependiendo de la civilización. Pueden coexistir muchos ejércitos de la misma civilización.
También poseen 1000 monedas de oro al momento de la creación.
Cada ejército posee un historial de todas las batallas en las que participó.

## Unidades
Hay tres tipos de unidades:
- Piquero
- Arquero
- Caballero

Cada unidad posee puntos de fuerza, según la siguiente tabla:
| **Unidad** | **Puntos aportados** |
| --- | --- |
| Piquero | 5 |
| Arquero | 10 |
| Caballero | 20 |

Nunca puede disminuir la fuerza de una unidad.
La cantidad inicial de unidades es determinada por la siguiente tabla:
| **Civilización** | **Piqueros** | **Arqueros** | **Caballeros** |
| --- | --- | --- | --- |
| Chinos | 2 | 25 | 2 |
| Ingleses | 10 | 10 | 10 |
| Bizantinos | 5 | 8 | 15 |

## Entrenamiento
Cada unidad se puede entrenar, esto tiene un costo en monedas de oro y un beneficio en puntos de fuerza que se le suman a la unidad, según la siguiente tabla:
| **Unidad** | **Puntos obtenidos** | **Costo del entrenamiento (monedas de oro)** |
| --- | --- | --- |
| Piquero | 3 | 10 |
| Arquero | 7 | 20 |
| Caballero | 10 | 30 |

## Transformacion
Cada unidad puede transformarse, a un costo, para convertirse en otra, según la siguiente tabla:
| **Unidad original** | **Unidad a la que se convierte** | **Costo (monedas de oro)** |
| --- | --- | --- |
| Piquero | Arquero | 30 |
| Arquero | Caballero | 40 |
| Caballero | No se puede transformar | - |

## Batalla
Un ejército puede atacar a otro en cualquier momento, incluso si son de la misma civilización. Al hacerlo el ganador de la batalla es simplemente el ejército que tiene más puntos. Las consecuencias de la batalla son las siguientes:
- Ejército perdedor: Pierde las dos unidades con mayor puntaje.
- Ejército ganador: Obtiene 100 unidades de oro.
- En caso de empate: Ambos jugadores pierden alguna unidad (queda a criterio del programador).

## Casos a tener en cuenta
- En el futuro se podría agregar una nueva unidad, Mago. Con 50 de fuerza, que se puede entrenar pero no transformar y ninguna otra unidad se puede transformar en Mago. ¿Cuánto código hay que cambiar? ¿Cómo cambia?
- ¿Qué pasa si un Arquero se entrena tres veces y luego se transforma? ¿Qué sucede con su fuerza?
- ¿Cómo responde el programa si no se usa correctamente? ¿Si el ejército no puede realizar una acción o no está permitida?

## Notas
- El ejercicio es de modelado, lo más importante es representar correctamente el dominio del problema.
- Puede ser desarrollado en el lenguaje preferido, recomendamos SmallTalk, Ruby o Python.
- Focalizarse en desarrollar lo que se pide, no es necesario ni recomendable realizar funcionalidades extra.
- No luchar con detalles no esenciales, ante dudas o ambigüedades del enunciado tomar una decisión y, si se cree necesario, justificarla.
- No se deben persistir los objetos.
- No se debe realizar una interfaz de usuario.
- Preferentemente resolverlo en inglés
