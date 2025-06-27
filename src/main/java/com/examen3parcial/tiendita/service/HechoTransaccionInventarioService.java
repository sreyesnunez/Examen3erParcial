package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.HechoTransaccionInventario;
import com.examen3parcial.tiendita.repository.HechoTransaccionInventarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HechoTransaccionInventarioService {
    @Autowired
    private HechoTransaccionInventarioRepository hechoRepo;

    public HechoTransaccionInventario save(HechoTransaccionInventario hecho) {
        return hechoRepo.save(hecho);
    }

    public Optional<HechoTransaccionInventario> findById(Integer id) {
        return hechoRepo.findById(id);
    }

    public List<HechoTransaccionInventario> findAll() {
        return hechoRepo.findAll();
    }

    public void deleteById(Integer id) {
        hechoRepo.deleteById(id);
    }

    // Aquí puedes agregar métodos para queries personalizados (para analytics)
}
