ARG USER=dev
ARG DEBIAN_FRONTEND=noninteractive
ARG HOME_DIR="/home/dev"
ARG ROOT_HOME_DIR="/root"

ARG PASS_USER="dev"
ARG PASS_VNC="dev"

ARG PORT_PROJECTOR=9999
ARG PORT_VNC=9998
ARG PORT_RDP=9997
ARG SCRIPTS_DIR="$HOME_DIR/scripts"

ARG JETBRAINS_TOOLBOX_URL="https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.11947.tar.gz"

EXPOSE $PORT_PROJECTOR $PORT_VNC $PORT_RDP 9996 9995 9994 9993 9992 9991 9990