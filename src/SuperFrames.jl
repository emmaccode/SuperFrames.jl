module SuperFrames
import Base: getindex, setindex!
# ----
mutable struct SuperFrame
        lookup::Dict
        function SuperFrame(p::Pair ...)
                new(Dict([pair for pair in p]))
        end
end

function head(sf::SuperFrame)
        lookup = sf.lookup
        thead = "<thead><tr>"
        tbody = "<tbody>"
        [thead = string(thead, "<th>", string(name),
         "</th>") for name in keys(lookup)]
         thead = string(thead, "</tr></thead>")
         cols = values(lookup)
         features = [push!(val) for val in cols]
         for i in 1:length(features[1])
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

getindex(sf::SuperFrame, s::Symbol) = sf.lookup[s]
setindex!(sf::SuperFrame, x::Array, s::Symbol) = push!(sf.lookup, s => x)

export SuperFrame, head
# -----
end
