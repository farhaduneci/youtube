_llm_shell_cmd() {
  if [[ -n "$BUFFER" ]]; then
    _llm_prev_cmd=$BUFFER
    BUFFER+=" ✨"
    zle -I && zle redisplay
    BUFFER=$(llm -s "$(jq -r .role ~/.config/llm-roles/shell_command_generator.json)" -m "${LLM_SHELL_CMD_MODEL:-qwen3.5:0.8b-mlx}" -o think false <<< "$_llm_prev_cmd")
    zle end-of-line
  fi
}

zle -N _llm_shell_cmd
bindkey ^o _llm_shell_cmd
