# Instalation

Using tpm:

```sh
set -g @plugin 'nihilc/tmux-theme'
```

# Configuration

You just need to set the option name with your value like this:

```sh
set -g @option_name 'your_value'
```

## Options

### Globals

| option        |      default       |
| :------------ | :----------------: |
| theme_flavour | `catppuccin_mocha` |

### Modules

| option                   |   default   |
| :----------------------- | :---------: |
| theme_session_icon       |     ``     |
| theme_session_text       |    `#S`     |
| theme_window_icon        |    `#I`     |
| theme_window_text        |    `#W`     |
| theme_window_active_icon |    `#I`     |
| theme_window_active_text |    `#W`     |
| theme_user_icon          |     ``     |
| theme_user_text          | `$(whoami)` |
| theme_host_icon          |     ``     |
| theme_host_text          |    `#H`     |
| theme_date_icon          |     ``     |
| theme_date_text          | `%Y-%m-%d`  |
| theme_time_icon          |     ``     |
| theme_time_text          |   `%H:%M`   |

You can also set the color in HEX of a specific module with `theme_module_color`
