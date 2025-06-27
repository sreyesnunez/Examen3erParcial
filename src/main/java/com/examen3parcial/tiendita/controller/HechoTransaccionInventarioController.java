package com.examen3parcial.tiendita.controller;

import com.examen3parcial.tiendita.dto.TransaccionRequest;
import com.examen3parcial.tiendita.model.*;
import com.examen3parcial.tiendita.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class HechoTransaccionInventarioController {

    @Autowired
    private HechoTransaccionInventarioService transaccionService;

    @Autowired
    private DimProductoService productoService;
    @Autowired
    private DimProveedorService proveedorService;
    @Autowired
    private DimTiendaService tiendaService;
    @Autowired
    private DimEmpleadoService empleadoService;
    @Autowired
    private DimTiempoService tiempoService;

    @PostMapping("/api/load-data")
    public ResponseEntity<?> guardarTransaccion(@RequestBody TransaccionRequest request) {
        HechoTransaccionInventario transaccion = new HechoTransaccionInventario();

        transaccion.setProducto(productoService.findById(request.getIdProducto()).orElse(null));
        transaccion.setProveedor(proveedorService.findById(request.getIdProveedor()).orElse(null));
        transaccion.setTienda(tiendaService.findById(request.getIdTienda()).orElse(null));
        transaccion.setEmpleado(empleadoService.findById(request.getIdEmpleado()).orElse(null));
        transaccion.setCantidad(request.getCantidad());
        transaccion.setTipoTransaccion(request.getTipo());
        transaccion.setValorUnitario(request.getValorUnitario());
        transaccion.setValorTotal(request.getValorTotal());

        // Para fecha/tiempo
        DimTiempo tiempo = tiempoService.findOrCreateByFecha(request.getFecha());
        transaccion.setTiempo(tiempo);

        transaccionService.save(transaccion);

        return ResponseEntity.ok("Transacción guardada correctamente");
    }
}
