package com.examen3parcial.tiendita.dto;

import lombok.Data;

@Data
public class TransaccionRequest {
    private Integer idProducto;
    private Integer idProveedor;
    private Integer idTienda;
    private Integer idEmpleado;
    private String fecha;
    private String tipo;
    private Integer cantidad;
    private Double valorUnitario;
    private Double valorTotal;
}
