package com.examen3parcial.tiendita.model;

import java.time.LocalDate;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "dim_tiempo")
@Data
public class DimTiempo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private LocalDate fecha;
    private String diaSemana;
    private Integer mes;
    private Integer anio;
    private Integer trimestre;
    private Integer semana;
    private Boolean festivo;
}
