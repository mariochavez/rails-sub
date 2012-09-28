if [[ ! -o interactive ]]; then
    return
fi

compctl -K _bf bf

_bf() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(bf commands)"
  else
    completions="$(bf completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
