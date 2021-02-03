function man --description 'Format and display the on-line manual pages'
    # Work around the "builtin" manpage that everything symlinks to,
    # by prepending our fish datadir to man. This also ensures that man gives fish's
    # man pages priority, without having to put fish's bin directories first in $PATH.

    # Preserve the existing MANPATH, and default to the system path (the empty string).
    set -l manpath
    if set -q MANPATH
        set manpath $MANPATH
    else if set -l p (command man -p 2>/dev/null)
        # NetBSD's man uses "-p" to print the path.
        # FreeBSD's man also has a "-p" option, but that requires an argument.
        # Other mans (men?) don't seem to have it.
        #
        # Unfortunately NetBSD prints things lke "/usr/share/man/man1",
        # while not allowing them as $MANPATH components.
        # What it needs is just "/usr/share/man".
        #
        # So we strip the last component.
        # This leaves a few wrong directories, but that should be harmless.
        set manpath (string replace -r '[^/]+$' '' $p)
    else
        set manpath ''
    end
    # Notice the shadowing local exported copy of the variable.
    set -lx MANPATH $manpath

    # Prepend fish's man directory if available.
    set -l fish_manpath (dirname $__fish_data_dir)/fish/man
    if test -d $fish_manpath
        set MANPATH $fish_manpath $MANPATH
    end
    # based on this group of settings and explanation for them:
    # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
    # converted to Fish shell syntax thanks to this page:
    # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

    # start of bold:
    set -x LESS_TERMCAP_md (set_color --bold red)
    # end of all formatting:
    set -x LESS_TERMCAP_me (set_color normal)

    # start of standout (inverted colors):
    set -x LESS_TERMCAP_so (set_color --reverse)
    # end of standout (inverted colors):
    set -x LESS_TERMCAP_se (set_color normal)

    # start of underline:
    set -x LESS_TERMCAP_us (set_color --underline)
    # end of underline:
    set -x LESS_TERMCAP_ue (set_color normal)

    command man $argv
end
