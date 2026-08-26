return function(p1, p2)
	return if p2 == nil then p1 elseif typeof(p1) == "number" then p1 * p2 elseif typeof(p1) == "UDim" then UDim.new(p1.Scale, p1.Offset * p2) elseif typeof(p1) == "UDim2" then UDim2.new(p1.X.Scale, p1.X.Offset * p2, p1.Y.Scale, p1.Y.Offset * p2) else p1
end