package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.DimProducto;
import com.examen3parcial.tiendita.repository.DimProductoRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class DimProductoService {
    private final DimProductoRepository productoRepo;

    public DimProductoService(DimProductoRepository productoRepo) {
        System.out.println("---- DimProductoService inicializado ----");
        this.productoRepo = productoRepo;
    }

    public List<DimProducto> findAll() {
        System.out.println("---- findAll llamado ----");
        return productoRepo.findAll();
    }

    public Optional<DimProducto> findById(Integer id) { return productoRepo.findById(id); }
    public DimProducto save(DimProducto producto) { return productoRepo.save(producto); }
    public void deleteById(Integer id) { productoRepo.deleteById(id); }
}
