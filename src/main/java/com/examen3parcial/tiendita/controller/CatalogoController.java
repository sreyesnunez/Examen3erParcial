package com.examen3parcial.tiendita.controller;

import com.examen3parcial.tiendita.model.DimProducto;
import com.examen3parcial.tiendita.service.DimProductoService;
import com.examen3parcial.tiendita.model.DimProveedor;
import com.examen3parcial.tiendita.service.DimProveedorService;
import com.examen3parcial.tiendita.model.DimEmpleado;
import com.examen3parcial.tiendita.service.DimEmpleadoService;
import com.examen3parcial.tiendita.model.DimTienda;
import com.examen3parcial.tiendita.service.DimTiendaService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/catalogo")
public class CatalogoController {
    private final DimProductoService productoService;
    private final DimProveedorService proveedorService;
    private final DimEmpleadoService empleadoService;
    private final DimTiendaService tiendaService;

    public CatalogoController(
            DimProductoService productoService,
            DimProveedorService proveedorService,
            DimEmpleadoService empleadoService,
            DimTiendaService tiendaService
    ) {
        this.productoService = productoService;
        this.proveedorService = proveedorService;
        this.empleadoService = empleadoService;
        this.tiendaService = tiendaService;
    }

    @GetMapping("/productos")
    public List<DimProducto> getProductos() {
        return productoService.findAll();
    }
    @GetMapping("/proveedores")
    public List<DimProveedor> getProveedores() {
        return proveedorService.findAll();
    }
    @GetMapping("/empleados")
    public List<DimEmpleado> getEmpleados() {
        return empleadoService.findAll();
    }
    @GetMapping("/tiendas")
    public List<DimTienda> getTiendas() {
        return tiendaService.findAll();
    }
}
