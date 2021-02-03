function setu
    echo "parse $argv"
    argparse -x 'append,prepend' 'x/export' 'p/prepend' 'a/append' -- $argv
    if test (count $argv) -lt 2
        echo "expected at least two more arguments."
        return 1
    end
    set -l varname $argv[1]
    set -l value $argv[2..-1]

    set -U $_flag_x $_flag_p $_flag_a $varname $value

    if test -n "$_flag_p" -o -n "$_flag_a"
        # dedupe this flag since it could have been set before
        # we called this.
        set -U $varname (printf '%s\n' $$varname | uniq)
    end
end

setu -xa foo bar baz
