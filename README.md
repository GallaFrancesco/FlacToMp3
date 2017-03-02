# FLACTOMP3

A fast and reliable BASH script that uses **ffmpeg** and **libmp3lame** to convert FLAC files to mp3.
It stores them in an organized folder which preserves the FLAC files directory structure, so that it is easy to find, copy and manage mp3 copies of your files.

It is created with mobile devices in mind: FlacToMp3 makes it dead simple to convert your flac files and copy them to your device/smartphone, since it recreates the given directory structure inside the `mp3s` folder.

**Example:**
IF the given directory is `./Music/myflacdir` then the resulting converted files will be stored in `mp3s/Music/myflacdir`

**Important!**
Be aware that FlacToMp3 operates **RECURSIVELY**, that is, it searches every subdirectory inside the one given via command line and converts it, recreating the directory structure inside the `mp3s` folder. 
**Conversion times (of ffmpeg) might be long**, depending on the number of files to convert, the dimension of those files and the capabilities of your machine. 

## Usage

Clone this repository:
```
git clone https://github.com/GallaFrancesco/FlacToMp3.git
```

Run with:

```
./ftoMp3.sh [path/to/myflacdir]
```

And retrieve your converted files in the created directory as shown in the example above.


