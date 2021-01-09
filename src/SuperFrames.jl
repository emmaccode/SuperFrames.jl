module SuperFrames
# ----
import DataFrames: AbstractDataFrame
import DataFrames: Index
mutable struct SuperFrame <: AbstractDataFrame
        columns::Vector{AbstractVector}
        colindex::Index
        function SuperFrame(dict::Dict)
                index = 0
                names = []
                lookup = Dict()
                for (name, data) in dict
                        append!(names, name)
                        index += 1
                        push!(lookup, name => index)
                end
                names = Vector{Symbol}(names)
                index = Index(lookup, names)
        end
end
# -----
end
