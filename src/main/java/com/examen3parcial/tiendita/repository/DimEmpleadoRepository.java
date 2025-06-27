package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.DimEmpleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DimEmpleadoRepository extends JpaRepository<DimEmpleado, Integer> {}
