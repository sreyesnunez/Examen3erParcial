package com.examen3parcial.tiendita.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "dim_empleado")
@Data
public class DimEmpleado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String rol;
    private String turno;
}
