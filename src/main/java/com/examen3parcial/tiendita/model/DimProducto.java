package com.examen3parcial.tiendita.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "dim_producto")
@Data
public class DimProducto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String codigo;
    private String categoria;
    private String marca;
    private String presentacion;
    private String unidadMedida;
}
