#!/bin/sh
set -e
set -u

__init_uvpip() {

    ##################
    # Install uvpip  #
    ##################

    pkg_cmd_name="uvpip"

    pkg_dst_cmd="$HOME/.local/bin/uvpip"
    pkg_dst="$pkg_dst_cmd"

    pkg_src_cmd="$HOME/.local/opt/uvpip-v$WEBI_VERSION/bin/uvpip"
    pkg_src_dir="$HOME/.local/opt/uvpip-v$WEBI_VERSION"
    pkg_src="$pkg_src_cmd"

    pkg_install() {
        # ~/.local/opt/uvpip-v1.1.0/bin
        mkdir -p "$(dirname "$pkg_src_cmd")"
        mv ./"$pkg_cmd_name"* "$pkg_src_cmd"
        chmod a+x "$pkg_src_cmd"
    }

    pkg_get_current_version() {
        uvpip --version 2> /dev/null | head -n 1 | cut -d ' ' -f 2 | sed 's:^v::'
    }

}

__init_uvpip
