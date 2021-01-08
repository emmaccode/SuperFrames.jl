module SuperFrames
import DataFrames
import DataFrames: AbstractDataFrame, Index
mutable struct SuperFrame <: AbstractDataFrame
        columns::Vector{AbstractVector}
        colindex::Index
end
# -----
end
