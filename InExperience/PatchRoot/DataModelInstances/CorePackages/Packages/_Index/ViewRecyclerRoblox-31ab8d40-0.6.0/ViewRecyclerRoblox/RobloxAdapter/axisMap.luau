local Axis = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler).Axis

return {
	mainOf = function(Vector, X)
		-- upvalues: Axis (copy)
		return if X == Axis.X then Vector.X else Vector.Y
	end,
	crossOf = function(Vector, X)
		-- upvalues: Axis (copy)
		return if X == Axis.X then Vector.Y else Vector.X
	end,
	positionFor = function(p1, X, p2): UDim2
		-- upvalues: Axis (copy)
		local CrossAxisIndex = p1.crossAxisIndex or 1
		local CrossAxisCount = p1.crossAxisCount or 1
		local YScale = (CrossAxisIndex - 1) / CrossAxisCount
		local YOffset = (CrossAxisIndex - 1) * (p1.crossAxisSpacing or 0) / CrossAxisCount
		local NewStartOffset = p1.startOffset + (p2 or 0)
		
		return if X == Axis.X then UDim2.new(0, NewStartOffset, YScale, YOffset) else UDim2.new(YScale, YOffset, 0, NewStartOffset)
	end,
	sizeFor = function(p1, X, p2): UDim2
		-- upvalues: Axis (copy)
		local CrossAxisCount = p1.crossAxisCount or 1
		local YScale = 1 / CrossAxisCount
		local YOffset = -(CrossAxisCount - 1) * (p1.crossAxisSpacing or 0) / CrossAxisCount
		local Length = if p2 then 0 else p1.length
		
		return if X == Axis.X then UDim2.new(0, Length, YScale, YOffset) else UDim2.new(YScale, YOffset, 0, Length)
	end,
	canvasSizeFor = function(XOffset, X): UDim2
		-- upvalues: Axis (copy)
		return if X == Axis.X then UDim2.fromOffset(XOffset, 0) else UDim2.fromOffset(0, XOffset)
	end
}