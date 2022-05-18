## This configuration create dev environment for android development

### Dependencies

On client machine you need to install [scrcpy](https://github.com/Genymobile/scrcpy)

#### Mac OS:

On Mac OS you can install it using `brew`:

$`brew install scrcpy`

However, your might face with errors like this:

``
dyld[78795]: Library not loaded: /usr/local/opt/rav1e/lib/librav1e.0.5.0.dylib
Referenced from: /usr/local/Cellar/ffmpeg/4.4.1_3/lib/libavformat.58.76.100.dylib
Reason: tried: '/usr/local/opt/rav1e/lib/librav1e.0.5.0.dylib' (no such file), '/usr/local/lib/librav1e.0.5.0.dylib' (no such file), '/usr/lib/librav1e.0.5.0.dylib' (no such file), '/usr/local/Cellar/rav1e/0.5.1/lib/librav1e.0.5.0.dylib' (no such file), '/usr/local/lib/librav1e.0.5.0.dylib' (no such file), '/usr/lib/librav1e.0.5.0.dylib' (no such file)Library not loaded: /usr/local/opt/rav1e/lib/librav1e.0.5.0.dylib
Referenced from: /usr/local/Cellar/ffmpeg/4.4.1_3/lib/libavcodec.58.134.100.dylib
``

to solve them try:
`brew install --build-from-source  scrcpy`

### Forwarding emulator to client machine

Run `open_emulator` script:

```bash
 ./open_emulator --ip 127.0.0.1 --port ${PORT_PREFIX}22
```

Where `PORT_PREFIX` is the same one you used with `--prefix` argument of `build` script when creating the container