return function(p0, p1) --[[ line: 1 | named "scaleValue" ]]
	return if p1 == nil then p0 elseif typeof(p0) == "number" then p0 * p1 elseif typeof(p0) == "UDim" then UDim.new(p0.Scale, p0.Offset * p1) elseif typeof(p0) == "UDim2" then UDim2.new(p0.X.Scale, p0.X.Offset * p1, p0.Y.Scale, p0.Y.Offset * p1) else p0
end