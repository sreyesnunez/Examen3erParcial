package com.examen3parcial.tiendita.service;

import com.examen3parcial.tiendita.model.DimTiempo;
import com.examen3parcial.tiendita.repository.DimTiempoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;
import java.util.Optional;

@Service
public class DimTiempoService {
    @Autowired
    private DimTiempoRepository tiempoRepo;

    public DimTiempo findOrCreateByFecha(String fechaStr) {
        LocalDate fecha = LocalDate.parse(fechaStr); // formato: "yyyy-MM-dd"
        Optional<DimTiempo> existenteOpt = tiempoRepo.findByFecha(fecha);
        if (existenteOpt.isPresent()) {
            return existenteOpt.get();
        }

        DimTiempo dim = new DimTiempo();
        dim.setFecha(fecha);

        // Día de la semana en español (uso de Locale moderno)
        String diaSemana = fecha.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.forLanguageTag("es-ES"));
        dim.setDiaSemana(diaSemana);

        dim.setMes(fecha.getMonthValue());
        dim.setAnio(fecha.getYear());
        dim.setTrimestre((fecha.getMonthValue() - 1) / 3 + 1);

        // Semana del año
        int semana = fecha.get(java.time.temporal.IsoFields.WEEK_OF_WEEK_BASED_YEAR);
        dim.setSemana(semana);

        // Festivo: por defecto false
        dim.setFestivo(false);

        return tiempoRepo.save(dim);
    }
}
