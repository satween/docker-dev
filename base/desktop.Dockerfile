USER root
# XFCE DEPENDENCIES
RUN apt-get install -y --no-install-recommends xubuntu-desktop \
      dbus-x11 \
      xfce4-battery-plugin \
      xfce4-clipman-plugin \
      xfce4-cpufreq-plugin \
      xfce4-cpugraph-plugin \
      xfce4-diskperf-plugin \
      xfce4-datetime-plugin \
      xfce4-fsguard-plugin \
      xfce4-genmon-plugin \
      xfce4-indicator-plugin \
      xfce4-netload-plugin \
      xfce4-notes-plugin \
      xfce4-places-plugin \
      xfce4-sensors-plugin \
      xfce4-smartbookmark-plugin \
      xfce4-systemload-plugin \
      xfce4-timer-plugin \
      xfce4-verve-plugin \
      xfce4-weather-plugin \
      xfce4-whiskermenu-plugin \
      xfce4-notifyd \
      xfce4-taskmanager \
      xfce4-terminal \
      xfce4-goodies \
      xfce4

RUN apt-get remove -y gnome-terminal