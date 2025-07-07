package com.meteo.meteo.controller;

import com.meteo.meteo.model.CityCoordinates;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class WeatherController {

    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("cities", CityCoordinates.CITIES.keySet());
        return "index";
    }

    @ResponseBody
    @GetMapping("/api/weather/{city}")
    public ResponseEntity<String> getWeather(@PathVariable String city) {
        double[] coords = CityCoordinates.CITIES.get(city);
        if (coords == null) return ResponseEntity.badRequest().body("Invalid city");

        String url = String.format(
            "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&hourly=temperature_2m",
            coords[0], coords[1]
        );

        return restTemplate.getForEntity(url, String.class);
    }
}
