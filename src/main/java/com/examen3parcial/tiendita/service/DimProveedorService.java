package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.DimProveedor;
import com.examen3parcial.tiendita.repository.DimProveedorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DimProveedorService {
    @Autowired
    private DimProveedorRepository proveedorRepo;

    public DimProveedor save(DimProveedor proveedor) {
        return proveedorRepo.save(proveedor);
    }

    public Optional<DimProveedor> findById(Integer id) {
        return proveedorRepo.findById(id);
    }

    public List<DimProveedor> findAll() {
        return proveedorRepo.findAll();
    }

    public void deleteById(Integer id) {
        proveedorRepo.deleteById(id);
    }
}
