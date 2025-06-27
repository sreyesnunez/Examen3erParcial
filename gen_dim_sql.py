import random

# === PRODUCTOS ===
categorias = [
    ("Dulces", "Gamesa"), ("Botanas", "Sabritas"), ("Bebidas", "CocaCola"), ("Panadería", "Bimbo"),
    ("Lácteos", "Lala"), ("Cereales", "Kellogg's"), ("Limpieza", "Cloralex"), ("Congelados", "Nestlé"),
    ("Snacks", "Barcel"), ("Abarrotes", "La Moderna")
]
presentaciones = ["Paquete 100g", "Bolsa 50g", "Botella 1L", "Paquete 500g", "Caja 250g", "Lata 355ml", "Envase 2L", "Sobre 10g"]
unidades = ["g", "ml", "pz", "kg", "L"]

sql_productos = "INSERT INTO dim_producto (nombre, codigo, categoria, marca, presentacion, unidad_medida) VALUES\n"
for i in range(1, 101):
    categoria, marca = random.choice(categorias)
    nombre = f"Producto_{i:03d}"
    codigo = f"PRD{i:03d}"
    presentacion = random.choice(presentaciones)
    unidad = random.choice(unidades)
    sql_productos += f"('{nombre}', '{codigo}', '{categoria}', '{marca}', '{presentacion}', '{unidad}'){',' if i < 100 else ';'}\n"

print("------ 100 PRODUCTOS (SQL) ------")
print(sql_productos)


# === PROVEEDORES ===
tipos = ["Mayorista", "Bebidas", "Botanas", "Panadería", "Lácteos", "Limpieza", "Congelados", "Snacks", "Abarrotes", "Granos"]
sql_proveedores = "INSERT INTO dim_proveedor (nombre, tipo, telefono, correo) VALUES\n"
for i in range(1, 21):
    tipo = random.choice(tipos)
    nombre = f"Proveedor_{i:02d}"
    telefono = f"555{random.randint(1000000,9999999)}"
    correo = f"contacto{i:02d}@proveedor.com"
    sql_proveedores += f"('{nombre}', '{tipo}', '{telefono}', '{correo}'){',' if i < 20 else ';'}\n"

print("\n------ 20 PROVEEDORES (SQL) ------")
print(sql_proveedores)
