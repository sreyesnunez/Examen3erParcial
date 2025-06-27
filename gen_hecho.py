import random

n_trans = 5000

tipos = ['venta', 'compra', 'merma']

sql = "INSERT INTO hecho_transaccion_inventario (fecha_id, producto_id, proveedor_id, tienda_id, empleado_id, tipo_transaccion, cantidad, valor_unitario, valor_total) VALUES\n"
lines = []
for i in range(n_trans):
    fecha_id = random.randint(1, 366)           # Ajusta según tus ids en dim_tiempo (1–366 si es todo 2024)
    producto_id = random.randint(1, 100)
    proveedor_id = random.randint(1, 20)
    tienda_id = random.randint(1, 3)
    empleado_id = random.randint(1, 5)
    tipo = random.choice(tipos)
    cantidad = random.randint(1, 30)
    valor_unitario = round(random.uniform(5, 100), 2)
    valor_total = round(valor_unitario * cantidad, 2)
    lines.append(f"({fecha_id}, {producto_id}, {proveedor_id}, {tienda_id}, {empleado_id}, '{tipo}', {cantidad}, {valor_unitario}, {valor_total})")
sql += ",\n".join(lines) + ";"

print(sql)
