package com.examen3parcial.tiendita.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "hecho_transaccion_inventario")
@Data
public class HechoTransaccionInventario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "fecha_id")
    private DimTiempo tiempo;

    @ManyToOne
    @JoinColumn(name = "producto_id")
    private DimProducto producto;

    @ManyToOne
    @JoinColumn(name = "proveedor_id")
    private DimProveedor proveedor;

    @ManyToOne
    @JoinColumn(name = "tienda_id")
    private DimTienda tienda;

    @ManyToOne
    @JoinColumn(name = "empleado_id")
    private DimEmpleado empleado;

    private String tipoTransaccion;
    private Integer cantidad;
    private Double valorUnitario;
    private Double valorTotal;
}
