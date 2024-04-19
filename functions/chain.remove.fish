function chain.remove -a position -d 'Removes chain link at position'

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

    set -e chain_links[$position]

    # If the user runs this command, recompile the prompt for them so that their changes are immediately visible.
    if test "$_" = chain.insert
        chain.compile
    end
end
