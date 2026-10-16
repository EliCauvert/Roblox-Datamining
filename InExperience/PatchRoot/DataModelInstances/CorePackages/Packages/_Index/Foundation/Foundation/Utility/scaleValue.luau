return function(Vector, p1) --[[ Line: 1 | Named "scaleValue" ]]
	return if p1 == nil then Vector elseif typeof(Vector) == "number" then Vector * p1 elseif typeof(Vector) == "UDim" then UDim.new(Vector.Scale, Vector.Offset * p1) elseif typeof(Vector) == "UDim2" then UDim2.new(Vector.X.Scale, Vector.X.Offset * p1, Vector.Y.Scale, Vector.Y.Offset * p1) else Vector
end