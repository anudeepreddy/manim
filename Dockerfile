FROM gitpod/workspace-full-vnc
RUN add-apt-repository ppa:videolan/stable-daily \
    && apt-get update \
    && apt-get install -qqy --no-install-recommends \
        apt-utils \
        ffmpeg \
        sox \
        libcairo2-dev \
        texlive \
        texlive-fonts-extra \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-science \
        tipa \
        vls \
    && rm -rf /var/lib/apt/lists/*
COPY . /manim
RUN cd /manim \
    && python3 setup.py sdist \
    && python3 -m pip install dist/manimlib*

