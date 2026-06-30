_llm_shell_cmd() {
  if [[ -n "$BUFFER" ]]; then
    _llm_prev_cmd=$BUFFER
    BUFFER+=" ✨"
    zle -I && zle redisplay
    BUFFER=$(llm -s "$(jq -r .role ~/.config/llm-roles/shell_command_generator.json)" -m gemma3:1b-it-qat <<< "$_llm_prev_cmd")
    zle end-of-line
  fi
}

zle -N _llm_shell_cmd
bindkey ^o _llm_shell_cmd
