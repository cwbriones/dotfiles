if not functions -q fisher
    info "installing fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

info installing all fisher plugins
set plugins (dirname (status --current-file))/fisher_plugins
for plugin in (cat $plugins)
    string match -vr '^#' $plugin
    if test $status -eq 0
        fisher install $plugin
    end
end

# FIXME: need to patch tide here.
# _tide_item_context.fish
