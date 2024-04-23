function chain.custom -d 'Sets chain to saved custom chain'
    set -U chain_links $custom_chain

    if test "$_" = chain.custom
        chain.compile
    end
end
