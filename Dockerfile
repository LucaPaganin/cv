# Usa un'immagine TeX Live che includa XeLaTeX e i pacchetti necessari
FROM texlive/texlive:latest

# Variabili d'ambiente per evitare interazioni
ENV DEBIAN_FRONTEND=noninteractive

# Imposta la directory di lavoro nel container
WORKDIR /cv_src

# Copia lo script di compilazione per primo e rendilo eseguibile
COPY compile_cv.sh /cv_src/compile_cv.sh
RUN chmod +x /cv_src/compile_cv.sh

# Copia tutti gli altri file del progetto CV nella directory di lavoro del container
# Questo include resume_cv.tex, awesome-cv.cls, la cartella cv-sections/, e la cartella fonts/ se presente.
COPY . /cv_src

# (Opzionale) Installa pacchetti TeX specifici se non sono inclusi nell'immagine base.
# La maggior parte dei pacchetti per Awesome CV dovrebbe essere in texlive:latest.
# Esempio:
# RUN tlmgr update --self && \
#     tlmgr install xindy # Esempio se ti servisse xindy per gli indici


# Comando predefinito (sarà sovrascritto da docker-compose, ma è buona pratica averlo)
# Esegue lo script di compilazione passando il nome del file principale.
CMD ["/cv_src/compile_cv.sh", "resume_cv.tex"]