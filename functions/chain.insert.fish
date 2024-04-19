function chain.insert -a command position -d 'Adds a link to your prompt chain at given position'

    if test -z $position
        echo "Position argument is required"
        return 1
    end

    if not string match -qr '^-?\d+$' $position
        echo "Position not an integer"
        return 1
    end

    set -l current_length (count $chain_links)
    if test $position -lt 0 -o $position -gt $current_length
        echo "Invalid position"
        return 1
    end

    if test $position -eq $current_length
        set -U chain_links $chain_links "$command"
    else if test $position -eq 0
        set -U chain_links "$command" $chain_links
    else
        set -l before_slice $chain_links[1..$position]
        set -l after_slice $chain_links[(math $position + 1)..-1]
        set -U chain_links $before_slice "$command" $after_slice
    end

    # If the user runs this command, recompile the prompt for them so that their changes are immediately visible.
    if test "$_" = chain.insert
        chain.compile
    end
end
