# powershell-music-player

## How to use

```
.\music-player.ps1 .\path\to\file.txt
```

## Syntax in your `.txt`-file

You write the notes you want the script to play in a `.txt`-file like this: For example, `d:4` is a D quarter note. Each line of the file contains one note.

## Run the example

```
.\music-player.ps1 example.txt
```

## Formula for music note frequencies

In order to play musical notes I needed the frequencies in Hertz for each note I wanted to play. For this I used a formula from [this website](https://pages.mtu.edu/~suits/NoteFreqCalcs.html).
