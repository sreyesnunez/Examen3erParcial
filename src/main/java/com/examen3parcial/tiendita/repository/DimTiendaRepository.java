package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.DimTienda;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DimTiendaRepository extends JpaRepository<DimTienda, Integer> {}
