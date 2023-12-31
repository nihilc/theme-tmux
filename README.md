## Content

1. Instalation
2. Configuration Options
   1. Themes
   2. Status
   3. Modules
   4. Windows
3. Configuration Examples

## Instalation

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
- catppuccin_macchiaton
- catppuccin_frappe

### Status

#### Status separator style:

```sh
set -g @theme_status_left_style 'none'
set -g @theme_status_right_style 'none'
```

Values:

- none
- a
- b
- c
- d

#### Status separators spaced:

```sh
set -g @theme_status_spaced "true"
```

Values:

- true - Separates the modules from each other
- false - Don't Separates the modules from each other

### Modules:

```sh
set -g @theme_status_left_modules 'session'
set -g @theme_status_right_modules 'user host date time'
```

Values:

- session - show session name
- user - show user name
- host - show host name
- date - show date YYYY-MM-DD
- time - show time HH:MM

> [!WARNING]
> At the moment, you should add at least one module on each side of the status

#### Customizing Modules

You can change the icon, color and text displayed in each module:

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
|         | color  |    `01`     |
|         |  text  |    `#S`     |
| user    |  icon  |     ``     |
|         | color  |    `02`     |
|         |  text  | `$(whoami)` |
| host    |  icon  |     ``     |
|         | color  |    `03`     |
|         |  text  |    `#H`     |
| date    |  icon  |     ``     |
|         | color  |    `04`     |
|         |  text  | `%Y-%m-%d`  |
| time    |  icon  |     ``     |
|         | color  |    `05`     |
|         |  text  |   `%H:%M`   |

### Windows
