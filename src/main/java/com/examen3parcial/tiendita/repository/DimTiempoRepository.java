package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.DimTiempo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface DimTiempoRepository extends JpaRepository<DimTiempo, Integer> {
    Optional<DimTiempo> findByFecha(LocalDate fecha);
}
