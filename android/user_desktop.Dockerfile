USER $USER
WORKDIR $HOME_DIR

# CMD TOOLS DOWNLOADING SCRIPT
RUN echo "#!/bin/bash\n \
curl $ANDROID_TOOLS_URL --output android.zip \n \
unzip android.zip -d $ANDROID_SDK_DIR \n \
rm android.zip \n \
mkdir $ANDROID_SDK_DIR/latest \n \
mv $ANDROID_SDK_DIR/cmdline-tools/* $ANDROID_SDK_DIR/latest \n \
mv $ANDROID_SDK_DIR/latest $ANDROID_SDK_DIR/cmdline-tools \n \
" > $SCRIPTS_DIR/download_cmdtools.sh

# PLATFORM DOWNLOADING SCRIPT
RUN echo "#!/bin/bash\n\
yes | $CMD_LINE_BINARIES/sdkmanager --sdk_root=$ANDROID_SDK_PATH \"sources;android-29\" \n \
yes | $CMD_LINE_BINARIES/sdkmanager --sdk_root=$ANDROID_SDK_PATH \"platforms;android-29\" \n \
yes | $CMD_LINE_BINARIES/sdkmanager --sdk_root=$ANDROID_SDK_PATH \"system-images;android-29;google_apis_playstore;x86_64\" \n \
yes | $CMD_LINE_BINARIES/sdkmanager --sdk_root=$ANDROID_SDK_PATH \"build-tools;29.0.3\" \n \
" > $SCRIPTS_DIR/install_components.sh

# SDCARD FOR EMULATOR CREATION SCRIPT
RUN echo "#!/bin/bash\n\
mkdir -p emulators/sdcards/$EMULATOR_OS_VERSION\n \
$ANDROID_SDK_PATH/tools/mksdcard -l $EMULATOR_OS_VERSION 4096M $HOME_DIR/emulators/sdcards/$EMULATOR_OS_VERSION/sdcard1.img\n \
" > $SCRIPTS_DIR/makecard.sh

# AVD CREATING SCRIPT
RUN echo "#!/bin/bash\n \
echo \"no\" | $CMD_LINE_BINARIES/avdmanager create avd  -n \"$EMULATOR_OS_VERSION\" \
 -k \"system-images;android-29;google_apis_playstore;x86_64\" \
 -c \"$HOME_DIR/emulators/sdcards/$EMULATOR_OS_VERSION/sdcard1.img\" \ 
 -d pixel_4" > $SCRIPTS_DIR/create_avd.sh

# EMULATOR LAUNCHER SCRIPT
RUN echo "#!/bin/bash\n \
$ANDROID_SDK_PATH/emulator/emulator -avd $EMULATOR_OS_VERSION \
" > launch_emulator.sh && chmod +x launch_emulator.sh

# PREPARATION SCRIPT
RUN echo "#!/bin/bash\n\
bash $SCRIPTS_DIR/download_cmdtools.sh \n\
bash $SCRIPTS_DIR/install_components.sh \n\
bash $SCRIPTS_DIR/makecard.sh\n\
bash $SCRIPTS_DIR/create_avd.sh\n \
bash $SCRIPTS_DIR/download_jb_toolbox.sh\n \
" > .prepare.sh && chmod +x .prepare.sh
