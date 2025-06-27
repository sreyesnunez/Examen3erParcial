package com.examen3parcial.tiendita.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "dim_proveedor")
@Data
public class DimProveedor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String tipo;
    private String telefono;
    private String correo;
}
