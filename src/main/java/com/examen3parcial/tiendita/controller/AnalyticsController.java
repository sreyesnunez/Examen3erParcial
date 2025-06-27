package com.examen3parcial.tiendita.controller;


import com.examen3parcial.tiendita.repository.HechoTransaccionInventarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/analytics")
public class AnalyticsController {

    @Autowired
    private HechoTransaccionInventarioRepository hechoRepo;

    // 1. Productos más vendidos (ejemplo)
    @GetMapping("/productos-mas-vendidos")
    public List<Object[]> getProductosMasVendidos() {
        // Cambia esta consulta según lo que necesitas
        return hechoRepo.findProductosMasVendidos();
    }

    // 2. Proveedor con más productos suministrados (ejemplo)
    @GetMapping("/proveedor-top")
    public List<Object[]> getProveedorTop() {
        return hechoRepo.findProveedorTop();
    }

    // 3. Días con más ventas/mermas (ejemplo)
    @GetMapping("/dias-mas-ventas")
    public List<Object[]> getDiasMasVentas() {
        return hechoRepo.findDiasMasVentas();
    }
}
