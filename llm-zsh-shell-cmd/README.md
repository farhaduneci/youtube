# LLM zsh shell command generator

Press `^O` in your zsh prompt to turn plain-English intent into a shell command using a local LLM.

## How it works

The widget reads whatever you've typed, sends it to `llm` with a tightly scoped system prompt, and replaces the buffer with the generated command — ready to review and run.

## Dependencies

- [`llm`](https://llm.datasette.io) CLI
- `jq`
- A local model served via Ollama: `gemma3:1b-it-qat` (swap in `gemma3:4b-it-qat` for better quality)

## Setup

1. Copy the role config to the expected path:
   ```zsh
   mkdir -p ~/.config/llm-roles
   cp configs/shell_command_generator.json ~/.config/llm-roles/
   ```

2. Source the widget from your `.zshrc`:
   ```zsh
   source /path/to/llm_shell_cmd.zsh
   ```

3. Reload your shell:
   ```zsh
   exec zsh
   ```

## Usage

Type a description of what you want, then press `^O`:

```
list all open ports  ^O  →  lsof -iTCP -sTCP:LISTEN -n -P
```
