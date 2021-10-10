# Bash Menu
#### A useful bash script allowing you to easily create your own menu, which uses the directional keys! Quickly add your title, options and commands and you're good to go!

![](exemple.gif)

### Install :
<p>Simply past this line in your shell :</p>

```bash
git clone https://github.com/HadiDotSh/bashmenu
```

### How to use it :

```bash
source /path/to/bashmenu.sh -t "title" -s "my subtitle" "{option 1}" ... "{option N}"
# The result is stored in the array nammed $selected
# Arguments :
# -t to specify a title
# -s to specify a subtitle
# The rest will be considered options
```

### Alternative menu :

![](exemple_alternative.gif)

<p> Simply add "-a" to the command to request a number instead of using the keyboard arrow</p>

### Exemple :

<p>A script is available to understand how bashmenu is used, it is named "exemple.sh"</p>

