# Beispiel eines einfachen Datenanalyseskripts
# -----------------------------------------------------------------------------
# Dieses Skript lädt den Datensatz "Beispieldaten.csv",
# berechnet Mittelwerte und Korrelation,
# und visualisiert die Daten in einem Streu- und einem Balkendiagramm.
# -----------------------------------------------------------------------------
# Seminar "Programmierung und Deskriptive Statistik" WiSe 2025/2026
# Autorin: Belinda Fleischmann
# Datum:   02.12.2025

# Verzeichnis- und Datenmanagement
# -----------------------------------------------------------------------------
skriptpfad     <- sys.frame(1)$ofile         # Pfad des Skripts
skriptordner   <- dirname(skriptpfad)        # Übergeordnetes Verzeichnis, in dem sich dieses R Skript befindet
projektordner  <- dirname(skriptordner)      # Übergeordnetes Verzeichnis, in dem sich der Ordner /Daten befindet
datenordner    <- file.path(projektordner,   # Daten-Ordner, der sich im Projektordner befindet
                            "Daten")

dateiname  <- "Beispieldaten.csv"            # Dateibezeichnung (filename) der .csv Datei
dateipfad  <- file.path(datenordner,         # Pfad zur .csv Datei
                        dateiname)

# Daten von Festplatte einlesen
# -----------------------------------------------------------------------------
daten          <- read.csv(dateipfad)        # Einlesen der Daten

# Daten analysieren
# -----------------------------------------------------------------------------
colnames(daten) <- c("Var_1", "Var_2")       # Spaltenbezeichnungen ändern

# Mittelwerte der Variablen berechnen
mittelwert_1 <- mean(daten$Var_1)            # Mittelwert der Variable 1
mittelwert_2 <- mean(daten$Var_2)            # Mittelwert der Variable 2

# Korrelation der Variablen berechnen
korrelation <- cor(daten$Var_1, daten$Var_2) # Korrelation beider Variablen

# Ausgabe der Ergebnisse
# -----------------------------------------------------------------------------
cat("Mittelwert der ersten Variable: ",      # Ausgabe Mittelwert Var_1
    mittelwert_1, "\n")
cat("Mittelwert der zweiten Variable: ",     # Ausgabe Mittelwert Var_2
    mittelwert_2, "\n")
cat("Korrelation: ",                         # Ausgabe Korrelation
    korrelation, "\n")

# Visualisierung der Daten
# -----------------------------------------------------------------------------
plot(daten$Var_1, daten$Var_2)               # Streudiagramm
barplot(                                     # Balkendiagramm
  c("Var_1" = mittelwert_1,                  # Input: Höhe der Balken mit Namen
    "Var_2" = mittelwert_2)
)
