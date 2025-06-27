package com.examen3parcial.tiendita.dto;

import lombok.Data;

@Data
public class TransaccionDTO {
    private Integer idProducto;
    private Integer idProveedor;
    private Integer idTienda;
    private Integer idEmpleado;
    private String fecha; // Formato: "YYYY-MM-DD"
    private String tipo; // ENTRADA/SALIDA
    private Integer cantidad;
}
