## Content

1. Installation
2. Configuration Options
   1. Themes
   2. Status
   3. Modules
   4. Windows
3. Configuration Examples

## Installation

Using tpm:

```sh
set -g @plugin 'nihilc/tmux-theme'
```

## Configuration Options

### Themes

> [!NOTE]
> You can add your own theme read [COLORS](./COLORS.md)

Set your theme flavour:

```sh
set -g @theme_flavour "catppuccin_mocha"
```

Values:

- catppuccin_mocha
- catppuccin_macchiato
- catppuccin_frappe

### Status

#### Status separator style:

Set global style:

```sh
set -g @theme_style 'none'
```

Set specific style:

```sh
set -g @theme_style_left 'none'
set -g @theme_style_right 'none'
```

Values:

- none
- a
- b
- c
- d

#### Status separators spaced:

Set global spaced

```sh
set -g @theme_spaced "true"
```

Set specific spaced

```sh
set -g @theme_spaced_left "true"
set -g @theme_spaced_right "true"
```

Values:

- true - Separates the modules from each other
- false - Don't Separates the modules from each other

### Modules:

```sh
set -g @theme_modules_left 'session'
set -g @theme_modules_right 'user host date time'
```

Values:

- session - show session name
- user - show user name
- host - show host name
- date - show date YYYY-MM-DD
- time - show time HH:MM

> [!WARNING]
> You should add at least one module on each side of the status

#### Customizing Modules

You can change the icon, text and colors displayed in each module:

```sh
set -g @theme_module_<module_name>_<option>
```

Example to change the format of the date in date module

```sh
set -g @theme_module_date_text '%b %d'
```

Default options:

| module  | option |   default   |
| :------ | :----: | :---------: |
| session |  icon  |     ``     |
|         | color1 |    `01`     |
|         | color2 |    `00`     |
|         |  text  |    `#S`     |
| user    |  icon  |     ``     |
|         | color1 |    `02`     |
|         | color2 |    `00`     |
|         |  text  | `$(whoami)` |
| host    |  icon  |     ``     |
|         | color1 |    `03`     |
|         | color2 |    `00`     |
|         |  text  |    `#H`     |
| date    |  icon  |     ``     |
|         | color1 |    `04`     |
|         | color2 |    `00`     |
|         |  text  | `%Y-%m-%d`  |
| time    |  icon  |     ``     |
|         | color1 |    `05`     |
|         | color2 |    `00`     |
|         |  text  |   `%H:%M`   |

### Windows

#### Windows justify

Set the windows position

```sh
set -g @theme_justify "left"
```

Values:

- left
- right
- centre

#### Windows style

By default, windows take on the style of the status bar to which they are justified. But you can set a specific style.

```sh
set -g @theme_style_window
```

#### Windows spaced

By default windows take on the spaced of the status bar to which they are justified. But you can set a specific spaced.

```sh
set -g @theme_spaced_window
```

#### Windows modules

As the status modules you can edit the icon, text and colors of the windows modules

```sh
set -g @theme_window_<state>_<option> 'value'
```

Example to change the colors of the current window

```sh
set -g @theme_window_current_color1 '06'
set -g @theme_window_current_color2 '08'
```

Options:

| state   | option | default |
| :------ | :----: | :-----: |
| default |  icon  |  `#I`   |
|         |  text  |  `#W`   |
|         | color1 |  `07`   |
|         | color2 |  `00`   |
| current |  icon  |  `#I`   |
|         |  text  |  `#W`   |
|         | color1 |  `13`   |
|         | color2 |  `00`   |
