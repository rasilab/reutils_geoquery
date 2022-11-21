FROM continuumio/miniconda3:4.12.0

RUN conda install -c conda-forge mamba

RUN mamba install -c conda-forge jupyter=1.0.0

RUN mamba create -y -n R

RUN mamba install -n R -c bioconda -c conda-forge \
	r-irkernel=1.3.1 \
	r-tidyverse=1.3.2 \
	bioconductor-plyranges=1.18.0

RUN /opt/conda/envs/R/bin/R -s -e "IRkernel::installspec(sys_prefix = T)"

RUN mamba install -y -n R -c conda-forge -c bioconda \
    r-janitor \
    r-r.utils \
    r-reutils \
    r-xml2 \
    bioconductor-geoquery
