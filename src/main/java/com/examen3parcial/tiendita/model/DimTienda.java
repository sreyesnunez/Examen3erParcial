package com.examen3parcial.tiendita.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "dim_tienda")
@Data
public class DimTienda {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String ubicacion;
    private Integer superficie;
}
