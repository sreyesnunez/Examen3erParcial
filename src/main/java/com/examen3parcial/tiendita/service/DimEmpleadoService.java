package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.DimEmpleado;
import com.examen3parcial.tiendita.repository.DimEmpleadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DimEmpleadoService {
    @Autowired
    private DimEmpleadoRepository empleadoRepo;

    public DimEmpleado save(DimEmpleado empleado) {
        return empleadoRepo.save(empleado);
    }

    public Optional<DimEmpleado> findById(Integer id) {
        return empleadoRepo.findById(id);
    }

    public List<DimEmpleado> findAll() {
        return empleadoRepo.findAll();
    }

    public void deleteById(Integer id) {
        empleadoRepo.deleteById(id);
    }
}
