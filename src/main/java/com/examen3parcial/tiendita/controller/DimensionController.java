package com.examen3parcial.tiendita.controller;

import com.examen3parcial.tiendita.model.DimProducto;
import com.examen3parcial.tiendita.service.DimProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/dimension")
public class DimensionController {

    @Autowired
    private DimProductoService productoService;

    // PUT /api/dimension/producto/1
    @PutMapping("/producto/{id}")
    public DimProducto updateProducto(@PathVariable Integer id, @RequestBody DimProducto updatedProducto) {
        Optional<DimProducto> optionalProducto = productoService.findById(id);
        if (optionalProducto.isPresent()) {
            DimProducto producto = optionalProducto.get();
            producto.setNombre(updatedProducto.getNombre());
            producto.setCodigo(updatedProducto.getCodigo());
            producto.setCategoria(updatedProducto.getCategoria());
            producto.setMarca(updatedProducto.getMarca());
            producto.setPresentacion(updatedProducto.getPresentacion());
            producto.setUnidadMedida(updatedProducto.getUnidadMedida());
            return productoService.save(producto);
        } else {
            throw new RuntimeException("Producto no encontrado");
        }
    }

}
