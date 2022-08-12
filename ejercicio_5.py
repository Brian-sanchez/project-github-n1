historial = (2350, 5960, 23000, 1000, 8900)


def totales(hist):
    total = 0
    for monto in hist:
        total += monto

    if total < 30000:
        print('Gastos por atención de Puppy', total)
    else:
        print('Gastos por encima de lo presupuestado')


totales(historial)
