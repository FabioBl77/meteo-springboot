package com.meteo.meteo.model;

import java.util.Map;

public class CityCoordinates {
    public static final Map<String, double[]> CITIES = Map.of(
        "Roma", new double[]{41.9028, 12.4964},
        "Milano", new double[]{45.4642, 9.1900},
        "Napoli", new double[]{40.8518, 14.2681},
        "Torino", new double[]{45.0703, 7.6869},
        "Firenze", new double[]{43.7696, 11.2558}
    );
}
