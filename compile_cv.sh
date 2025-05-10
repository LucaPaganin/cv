#!/bin/sh
# Uscire immediatamente se un comando fallisce
set -e

# File TeX principale da compilare (default a resume_cv.tex se non specificato come argomento)
MAIN_TEX_FILE=${1:-resume_cv.tex}
PDF_FILE=$(basename "$MAIN_TEX_FILE" .tex).pdf

echo "==> Inizio compilazione LaTeX per: $MAIN_TEX_FILE"
echo "==> Il PDF risultante sarà: $PDF_FILE"

# Esegui latexmk con il motore xelatex
# Opzioni:
# -xelatex: Specifica di usare XeLaTeX
# -interaction=nonstopmode: Evita che la compilazione si blocchi in attesa di input
# -file-line-error: Formatta gli errori in modo più leggibile
# -output-directory=out: (Opzionale) Per mettere i file ausiliari in una sottocartella 'out'
#   Se usi output-directory, il PDF sarà in out/$PDF_FILE. Per semplicità, non la usiamo qui.
latexmk -xelatex \
        -interaction=nonstopmode \
        -file-line-error \
        "$MAIN_TEX_FILE"

echo "==> Compilazione terminata."

# Gestione dei permessi dei file generati (importante se il container gira come root e l'host è Linux/macOS)
# Su Docker Desktop per Windows, la gestione dei permessi è solitamente trasparente,
# ma questa parte cerca di generalizzare. Potrebbe dare un warning se 'stat' o 'chown' non si comportano come atteso.
if [ -f "$PDF_FILE" ]; then
    echo "==> Aggiornamento permessi per i file generati..."
    
    # Prova a ottenere UID e GID dalla directory corrente (montata dall'host)
    # Richiede che 'stat' sia disponibile nell'immagine Docker (texlive/texlive è basata su Debian, quindi dovrebbe esserci)
    TARGET_UID=$(stat -c %u .)
    TARGET_GID=$(stat -c %g .)

    echo "==> UID Host Target: $TARGET_UID, GID Host Target: $TARGET_GID"

    # Elenco dei file comuni da aggiornare. Aggiungi altre estensioni se necessario.
    # L'opzione -r di xargs è per non eseguire chown se non ci sono file.
    find . -maxdepth 1 \( \
        -name "*.pdf" -o \
        -name "*.log" -o \
        -name "*.aux" -o \
        -name "*.fls" -o \
        -name "*.fdb_latexmk" -o \
        -name "*.synctex.gz" -o \
        -name "*.toc" -o \
        -name "*.out" \
        \) -print0 | xargs -0 -r chown "$TARGET_UID:$TARGET_GID" 2>/dev/null || echo "==> Avviso: chown potrebbe non aver funzionato come previsto (normale su alcune configurazioni Windows o se i file non sono stati generati)."
    
    echo "==> PDF generato: $PDF_FILE"
else
    echo "==> ERRORE: File PDF $PDF_FILE non trovato dopo la compilazione."
    exit 1
fi

echo "==> Script terminato con successo."