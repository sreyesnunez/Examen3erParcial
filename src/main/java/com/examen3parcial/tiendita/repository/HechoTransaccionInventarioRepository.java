package com.examen3parcial.tiendita.repository;

import com.examen3parcial.tiendita.model.HechoTransaccionInventario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HechoTransaccionInventarioRepository extends JpaRepository<HechoTransaccionInventario, Integer> {

    // 1. Productos más vendidos (suma de cantidades, solo "venta")
    @Query("SELECT h.producto.nombre, SUM(h.cantidad) as total " +
           "FROM HechoTransaccionInventario h " +
           "WHERE h.tipoTransaccion = 'venta' " +
           "GROUP BY h.producto.nombre " +
           "ORDER BY total DESC")
    List<Object[]> findProductosMasVendidos();

    // 2. Proveedor con más ventas (por cantidad de ventas suministradas)
    @Query("SELECT h.proveedor.nombre, SUM(h.cantidad) as total " +
           "FROM HechoTransaccionInventario h " +
           "WHERE h.tipoTransaccion = 'venta' " +
           "GROUP BY h.proveedor.nombre " +
           "ORDER BY total DESC")
    List<Object[]> findProveedorTop();

    // 3. Días con más ventas (nombre del día y suma de ventas)
    @Query("SELECT h.tiempo.fecha, SUM(h.cantidad) as total " +
           "FROM HechoTransaccionInventario h " +
           "WHERE h.tipoTransaccion = 'venta' " +
           "GROUP BY h.tiempo.fecha " +
           "ORDER BY total DESC")
    List<Object[]> findDiasMasVentas();
}
