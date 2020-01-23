#!/bin/sh

echo "Copie des fichiers utilisateur à la racine de latex"

cp /latex/user_content/* /latex

echo "Creation du repertoire output si il n'existe pas"

mkdir /latex/user_content/output

echo "Deplacement dans le reprtoire latex"

cd /latex

echo "Compilation du latex en pdf"

pdflatex -shell-escape -output-directory=/latex/user_content/output -jobname=${OUTPUT_PDF_FILENAME} ${ENTRYPOINT_LATEX_FILE}

echo "Changement des droits sur les fichiers de sortie"

chmod -R 666 /laext/user_content
