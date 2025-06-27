package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.DimTienda;
import com.examen3parcial.tiendita.repository.DimTiendaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DimTiendaService {
    @Autowired
    private DimTiendaRepository tiendaRepo;

    public DimTienda save(DimTienda tienda) {
        return tiendaRepo.save(tienda);
    }

    public Optional<DimTienda> findById(Integer id) {
        return tiendaRepo.findById(id);
    }

    public List<DimTienda> findAll() {
        return tiendaRepo.findAll();
    }

    public void deleteById(Integer id) {
        tiendaRepo.deleteById(id);
    }
}
