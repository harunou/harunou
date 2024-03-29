# ~/.grml.help.zsh
# vim: ft=sh sw=2

function zsh_grml_help_all(){
  zsh_grml_help_commands
  zsh_grml_help_keybindings
  zsh_grml_help_expansion
  zsh_grml_help_hashes
  zsh_grml_help_glob
}

function zsh_grml_help_commands(){
  print ' Commands:

  logg		Take a look at the most recent record of sys journal 
  loga		Take a look at the sys journal

  isutfenv	Are we running within an utf environment?

  da	Execute du -sch

  sll	List symlinks in detail

  sax	Smart archive extractor

  l, ll	List files without dotfiles (ls -l ...)
  la	List all files (ls -la ...)
  lh	List files with human readable sizes (ls -lAh ...)

  lsd	List directories
  lad	List dot-directories
  lse	List empty directories

  lsdnew	Display the ten newest directories and ten newest .directories
  lsdold	Display the ten oldest directories and ten oldest .directories

  lsf	List files
  lsa	List dot-files
  lsx	List executables
  lsl	List symlinks
  lsw	List world-readable,writable,executable files
  lss	List files with setgid/setuid/sticky flag

  lsnew		Display the ten newest files
  lsold		Display the ten oldest files
  lssmall	Display the ten smallest files
  lsbig		Display the ten biggest files

  accessed	List files which have been accessed within the last n days, n defaults to 1
  modified	List files which have been modified within the last n days, n defaults to 1
  changed 	List files which have been changed within the last n days, n defaults to 1

  bk	Backup file_or_folder to file_or_folder_timestamp
  mkt	Create temporary directory and cd to it
  cdl	cd to directory and list files
  mcd	Create Directory and cd to it
  rmad	Remove current empty directory. Execute cd ..; rmdir $OLDCWD

  '
}

function zsh_grml_help_hashes(){
  print ' Hashes:

  USAGE:  ~doc
  doc	 /usr/share/doc
  linux	 /lib/modules/$(command uname -r)/build/
  log	 /var/log
  src	 /usr/src

  '
}

function zsh_grml_help_keybindings(){
  print ' Keybindings:

  CTRL-x b	Display help list of abbreviations that would expand
  CTRL-x z	Display help list of keybindings and ZLE
  CTRL-x .	Perform abbreviation expansion
  CTRL-o s	Prepend the current command with "sudo"
  CTRL-x M	mkdir -p <dir> from string under cursor or marked area
  CTRL-x d	Insert a timestamp on the command line (yyyy-mm-dd)
  CTRL-x f	Insert files and test globbing
  CTRL-x i	Insert Unicode character
  CTRL-x CTRL-x	Complete word (list words) from history with menu
  ALT-e		Edit the current line in $EDITOR
  ALT-h		Call run-help for the 1st word on the command line
  ALT-v		Kill left-side word or everything up to next slash
  ALT-m		Insert last typed word
  ALT-i		Trigger menu-complete
  ALT-return	Pick item from menu but stay in the menu

  '
}

function zsh_grml_help_expansion(){
  print ' Abbreviation expansion:

  USAGE: co<C-x .> expands to: ./configure && make && sudo make install
  .... ../../..
  ... ../..
  BG	& exit
  C	| wc -l
  G	|& grep
  Hl	-help |& less -r (Display help in pager)
  H	| head
  LL	|& less -r
  L	| less
  M	| most
  N	&>/dev/null (No Output)
  R	| tr A-z N-za-m (ROT13)
  SL	| sort | less
  S	| sort -u
  T	| tail
  V	|& vim -
  NOTE: |& is a shortcut for 2>&1 |

  '
  }

function zsh_grml_help_glob(){
  print ' Globbing:'
  H-Glob
  print '
  '
}

