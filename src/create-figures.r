# Edição 2020-01
# Distribuição espacial dos municípios selecionados
regioes <- geobr::read_intermediate_region(code_intermediate = "PR")
municipios <- geobr::read_municipality(code_muni = "PR")
name_muni <- c(
  "Abatiá", "Adrianópolis", "Ampére", "Antonina", "Astorga", "Corbélia", "Farol",
  "Fernandes Pinheiro", "Guamiranga", "Jaguariaíva", "Mato Rico", "Miraselva", "Reserva", "Xambrê"
)
idx <- municipios[["name_muni"]] %in% name_muni
municipios <- municipios[idx, ]
centroide <- sf::st_coordinates(sf::st_centroid(municipios[, "name_muni"]))

dev.off()
png("res/municipios-selecionados.png", width = 16, height = 10, units = "cm", res = 300)
plot(
  regioes[, "name_intermediate"], col = "transparent", reset = FALSE, main = "",
  graticule = TRUE, axes = TRUE, cex.axis = 0.6)
plot(municipios[, "name_muni"], add = TRUE, col = terrain.colors(14))
legend(
  x = -55.7, y = -22.3, legend = municipios[["name_muni"]], cex = 0.6, box.lwd = 0,
  fill = terrain.colors(14), bg = "transparent")
dev.off()

