## Customizing Script Icons

For a more personalized touch, you can change the icons of the script files to either a Python or Jupyter logo provided in the `/icons` directory of this repository. Here's how to customize the script icons on macOS, Linux, and Windows:

### macOS

1. Navigate to the `/icons` directory and open the desired `.png` file.
2. Copy the image by selecting it and using `Command + C`.
3. Find the script file you want to change the icon for, right-click it, and select `Get Info`.
4. Click on the small icon in the top left corner of the `Info` window to highlight it, then press `Command + V` to paste your copied icon.

### Linux

Please note, for Linux, the process might slightly differ based on the desktop environment, and not all environments may display custom icons for script files directly. The method described here involves creating a desktop shortcut, which is generally supported across various Linux GUIs.

1. Create a `.desktop` file for your script, for example, `JupyterGenesis.desktop`, and open it in a text editor.
2. Fill in the details as follows:

   ```ini
   [Desktop Entry]
   Name=JupyterGenesis
   Comment=Launch JupyterGenesis
   Exec=/path/to/your/script.sh
   Icon=/path/to/your/icons/icon.png
   Terminal=false
   Type=Application
   ```

3. Replace `/path/to/your/script.sh` with the actual path to your script and `/path/to/your/icons/icon.png` with the path to the desired icon in the `/icons` directory.
4. Make the `.desktop` file executable: `chmod +x JupyterGenesis.desktop`.

### Windows

For executable scripts (.bat or .ps1 files), you can change the icon by creating a shortcut:

1. Right-click on the script file and select `Create shortcut`.
2. Right-click on the created shortcut and select `Properties`.
3. In the `Shortcut` tab, click `Change Icon...` and browse to select the icon file provided in the `/icons` directory.
4. Once selected, click `OK` and then `Apply` in the properties window.
