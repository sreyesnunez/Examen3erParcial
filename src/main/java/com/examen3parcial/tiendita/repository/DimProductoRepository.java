package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.DimProducto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DimProductoRepository extends JpaRepository<DimProducto, Integer> {
    // Puedes agregar métodos personalizados aquí
}
