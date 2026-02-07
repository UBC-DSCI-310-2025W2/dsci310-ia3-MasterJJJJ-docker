FROM rocker/rstudio:4.4.2
USER root 
RUN R -e "install.packages('renv')"

COPY renv.lock renv.lock

COPY .Rprofile .Rprofile

COPY renv/activate.R renv/activate.R

COPY renv/settings.json renv/settings.json

COPY test_script.R test_script.R

USER rstudio
RUN R -e "renv::restore()"