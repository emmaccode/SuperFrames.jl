module SuperFrames
import Base: getindex, setindex!
# ----
mutable struct SuperFrame
        lookup::Dict
        head::Function
        function SuperFrame(p::Pair ...)
                lookup = Dict([pair for pair in p])
                length_check(lookup)
                head(x::Int64) = _head(lookup, x)
                new(lookup, head)
        end
        function _head(lookup::Dict, count::Int64)
                thead = "<thead><tr>"
                tbody = "<tbody>"
                [thead = string(thead, "<th>", string(name),
                 "</th>") for name in keys(lookup)]
                 thead = string(thead, "</tr></thead>")
                 cols = values(lookup)
                 features = [push!(val) for val in cols]
                 for i in 1:count)
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
        function _drop(lookup::Dict, column::Symbol)
                delete!(lookup, column)
        end
        function _drop(lookup::Dict, row::Int64)
                [splice!(val[2], row) for val in lookup]
        end
end

function length_check(lookup)
        ps = values(lookup)
        ourlen = length(ps[1])
        [if length(x) != ourlen throw(DimensionMismatch(
        "Columns must be the same size")) for x in ps]
end

getindex(sf::SuperFrame, s::Symbol) = sf.lookup[s]
setindex!(sf::SuperFrame, x::Array, s::Symbol) = push!(sf.lookup, s => x)
function getindex(sf::SuperFrame, mask::BitArray)
        [if mask[i] == 0 sf.drop(i) end for i in 1:length(mask)]
end
export SuperFrame
# -----
end
