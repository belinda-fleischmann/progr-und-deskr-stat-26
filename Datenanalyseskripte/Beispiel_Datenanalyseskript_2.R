# Beispiel eines einfaches Datenanalyseskripts
# -----------------------------------------------------------------------------
# Dieses Skript lädt den Datensatz "Beispieldaten.csv",
# berechnet Mittelwerte und Korrelation,
# und visualisiert die Daten in einem Streu- und einem Balnkendiagramm.
# -----------------------------------------------------------------------------
# Seminar "Progammierung und Deskriptive Statistik" WiSe 2025/2026
# Autorin: Belinda Fleischmann
# Datum:   02.12.2025

# Verzeichnis- und Datenmanagement
# -----------------------------------------------------------------------------
skript         <- sys.frame(1)$ofile         # Pfad des Skripts
skriptordner   <- dirname(skript)            # Übergordnetes Verzeichnis, in dem sich dieses R Skript befindet
projektordner  <- dirname(skriptordner)      # Übergordnetes Verzeichnis, in dem sich der Ordner /Daten befindet
datenordner    <- file.path(projektordner,   # Daten-Ordner, der sich Projektordner befindet
                            "Daten")

data_filename  <- "Beispieldaten.csv"        # Dateibezeichnung (filename) der .csv Datei
data_filepath  <- file.path(datenordner,     # Pfad zur .csv Datei
                            data_filename)

# Daten von Festplatte einlesen
# -----------------------------------------------------------------------------
daten          <- read.csv(data_filepath)    # Einlesen der Daten

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

# Visualisierung der Var_2
# -----------------------------------------------------------------------------
plot(daten$Var_1, daten$Variable2)           # Streudigramm
barplot(                                     # Balkendiagramm
  c("Var_1" = mittelwert_1,                  # Input: Höhe der Balken mit Namen
    "Var_2" = mittelwert_2)
)
