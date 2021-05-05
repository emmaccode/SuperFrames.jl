module SuperFrames
import Base: getindex, setindex!
# ----
mutable struct SuperFrame{h, d}
        lookup::Dict
        names::Array{Symbol}
        cols::Array{Array}
        head::h
        drop::d
        function SuperFrame(p::Pair ...)
                lookup = Dict([pair for pair in p])
                names = Array([Symbol(key) for key in keys(lookup)])
                cols = values(lookup)
                cols = Array{Array}([Array(val) for val in values(lookup)])
                head(count::Int64) = _head(lookup, count)
                drop(slice::Int64) = _drop(lookup, slice)
                new{typeof(head),
                 typeof(drop)}(lookup, names, cols, head)
        end
        function _head(lookup::Dict, count::Int64)
                thead = "<thead><tr>"
                tbody = "<tbody>"
                [thead = string(thead, "<th>", string(name),
                 "</th>") for name in keys(lookup)]
                 thead = string(thead, "</tr></thead>")
                 cols = values(lookup)
                 features = [push!(val) for val in cols]
                 for i in 1:count
                         obs = [row[i] for row in features]
                         tbody = string(tbody, "<tr>")
                         for observ in obs

                         end
                         [tbody = string(tbody, "<td>", observ,
        "</td>") for observ in obs]
                        tbody = string(tbody, "</tr>")
                 end
                 tbody = string(tbody, "</tbody>")
                 final = string("<table>", thead, tbody, "</table")
                 display("text/html", final)
        end
end

function _drop(lookup::Dict, slice::Int64)
        [deleteat!(x, slice) for x in values(lookup)]
end
getindex(sf::SuperFrame, s::Symbol) = sf.lookup[s]
setindex!(sf::SuperFrame, x::Array, s::Symbol) = push!(sf.lookup, s => x)

export SuperFrame, head
# -----
end
