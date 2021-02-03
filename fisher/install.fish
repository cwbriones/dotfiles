if not functions -q fisher
    info "installing fisher"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

info installing all fisher plugins
set plugins (dirname (status --current-file))/fisher_plugins
for plugin in (cat $plugins)
    fisher install $plugin
end

# FIXME: need to patch tide here.
# _tide_item_context.fish
