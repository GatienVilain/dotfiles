# Explicitly define XDG Base Directory varibles according to the specification.
# -Where user-specific configurations should be written (analogous to /etc).
export XDG_CONFIG_HOME="$HOME"/.config
# -Where user-specific non-essential (cached) data should be written
#  (analogous to /var/cache).
export XDG_CACHE_HOME="$HOME"/.cache
# -Where user-specific data files should be written (analogous to /usr/share).
export XDG_DATA_HOME="$HOME"/.local/share
# -Where user-specific state files should be written (analogous to /var/lib).
export XDG_STATE_HOME="$HOME"/.local/state

# Fix program not following XDG path
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup # Rust toolchain manager
export CARGO_HOME="$XDG_DATA_HOME"/cargo # Rust Cargo tool
export CONDA_ENVS_PATH="$XDG_DATA_HOME"/conda
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export WINEPREFIX="$XDG_DATA_HOME"/wine/prefixes/default

# Shell variables
export EDITOR=vim

if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Abbreviations
    abbr --add --global v nvim
    abbr --add --global ff fastfetch
    abbr --add --global inst sudo dnf5 install
    abbr --add --global rem sudo dnf5 remove
    abbr --add --global serv systemctl start httpd mariadb
    abbr --add --global hserv "systemctl stop httpd mariadb; firewall-cmd --reload"
    abbr --add --global ftpserv systemctl start vsftpd mariadb
    abbr --add --global ftphserv "systemctl stop vsftpd mariadb; firewall-cmd --reload"
   
    # Functions
    # Easily manage dotfiles git repo 
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

    # Fzf and Ripgrep work together
    if type rg &> /dev/null
      set --export --global FZF_DEFAULT_COMMAND 'rg --files'
      set --export --global FZF_DEFAULT_OPTS '-m' # Allows us to make multiple selections
    end
    
    # Add components
    starship init fish | source
    zoxide init fish | source
end
