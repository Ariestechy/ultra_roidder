FROM ariestechy/ultra_roidder:main

# set timezone
ENV TZ=Asia/Kolkata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \

    # cloning the repo and installing requirements.
    && git clone https://github.com/Ariestechy/ultra_roidder.git /root/TeamUltroid/ \
    && pip3 install --no-cache-dir -r root/TeamUltroid/requirements.txt \
    && pip3 uninstall av -y && pip3 install av --no-binary av

# changing workdir
WORKDIR /root/TeamUltroid/

# start the bot
CMD ["bash", "resources/startup/startup.sh"]
