fish_add_path /usr/local/sbin
fish_add_path /usr/local/opt/gettext/bin
fish_add_path /usr/local/opt/openssl@1.1/bin
fish_add_path /usr/local/bin
fish_add_path /usr/local/opt/icu4c/bin

source ("/usr/local/bin/starship" init fish --print-full-init | psub)
