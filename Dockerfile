FROM gitpod/workspace-full-vnc
RUN sudo add-apt-repository ppa:videolan/stable-daily \
    && sudo apt-get update \
    && sudo apt-get install -qqy --no-install-recommends \
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
    && sudo rm -rf /var/lib/apt/lists/*
COPY . /manim
RUN cd /manim \
    && python3 setup.py sdist \
    && python3 -m pip install dist/manimlib*

