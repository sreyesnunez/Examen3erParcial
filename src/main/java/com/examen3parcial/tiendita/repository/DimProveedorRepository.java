package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.DimProveedor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface DimProveedorRepository extends JpaRepository<DimProveedor, Integer> {}
