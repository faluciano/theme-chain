function chain:unshift -d 'Like chain:pop, but removes the bottom link'
  if set -q __chain_links[1]
    set -e __chain_links[1]
  end

  # If the user runs this command, recompile the prompt for them so that their changes are immediately visible.
  if test "$_" = chain:unshift
    chain:compile
  end
end