from datetime import date, timedelta

start_date = date(2024, 1, 1)
end_date = date(2024, 12, 31)
delta = end_date - start_date

dias_es = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

sql = "INSERT INTO dim_tiempo (fecha, dia_semana, mes, anio, trimestre, semana, festivo) VALUES\n"
lines = []
for i in range(delta.days + 1):
    d = start_date + timedelta(days=i)
    dia_semana = dias_es[d.weekday()]
    mes = d.month
    anio = d.year
    trimestre = (mes - 1) // 3 + 1
    semana = d.isocalendar()[1]
    festivo = "true" if dia_semana == "Domingo" else "false"   # <--- aquí el cambio
    lines.append(f"('{d}', '{dia_semana}', {mes}, {anio}, {trimestre}, {semana}, {festivo})")
sql += ",\n".join(lines) + ";"

print(sql)
