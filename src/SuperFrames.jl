module SuperFrames
import Base: getindex, setindex!
# ----
mutable struct SuperFrame
        lookup::Dict
        function SuperFrame(p::Pair ...)
                new(Dict([pair for pair in p]))
        end
end

getindex(sf::SuperFrame, s::Symbol) = sf.lookup[s]
setindex!(sf::SuperFrame, x::Array, s::Symbol) = push!(sf.lookup, s => x)

export SuperFrame
# -----
end
