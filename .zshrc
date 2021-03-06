# ~/.zshrc
# vim:set et sw=2:

. $HOME/.shrc
. $HOME/.grml.zsh
. $HOME/.grml.help.zsh

alias lap="list_all_pager"
alias lsf="ls *(.)"
alias lsdnew="lsnewdir"
alias lsdold="lsolddir"
alias mkt="cdt"
alias cdl="cl"
alias mcd="mkcd"
alias rmad="rmcdir"
alias sax="simple-extract"
alias helpgrml="zsh_grml_help_all | $PAGER"
alias helpgrmlglob="zsh_grml_help_glob | $PAGER"
alias helpgrmlcommands="zsh_grml_help_commands | $PAGER"
alias helpgrmlhashes="zsh_grml_help_hashes | $PAGER"
alias helpgrmlkeybindings="zsh_grml_help_keybindings | $PAGER"
alias helpgrmlkeybindings="zsh_grml_help_expansion | $PAGER"

hash -d Downloads=$HOME/Downloads

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

if [[ -n "$NVM_DIR" ]]; then
  alias nvmstart="source $NVM_DIR/nvm.sh"
fi

function list_all_pager() {
  ls -la $1 | $PAGER
}

[ ! -f "$HOME/.zshrc.local" ] || . "$HOME/.zshrc.local"
