local axis = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler).Axis

return {
	mainOf = function(p1, p2)
		-- upvalues: axis (ref)
		return if p2 == axis.X then p1.X else p1.Y
	end,
	crossOf = function(vectorA, vectorB)
		-- upvalues: axis (ref)
		return if vectorB == axis.X then vectorA.Y else vectorA.X
	end,
	positionFor = function(p1, p2, p3)
		-- upvalues: axis (ref)
		local crossAxisIndex = p1.crossAxisIndex or 1
		local crossAxisCount = p1.crossAxisCount or 1
		local var1 = (crossAxisIndex - 1) / crossAxisCount
		local var2 = (crossAxisIndex - 1) * (p1.crossAxisSpacing or 0) / crossAxisCount
		local var3 = p1.startOffset + (p3 or 0)
		
		return if p2 == axis.X then UDim2.new(0, var3, var1, var2) else UDim2.new(var1, var2, 0, var3)
	end,
	sizeFor = function(p1, p2, p3)
		-- upvalues: axis (ref)
		local crossAxisCount = p1.crossAxisCount or 1
		local var1 = 1 / crossAxisCount
		local var2 = -(crossAxisCount - 1) * (p1.crossAxisSpacing or 0) / crossAxisCount
		local var3 = if p3 then 0 else p1.length
		
		return if p2 == axis.X then UDim2.new(0, var3, var1, var2) else UDim2.new(var1, var2, 0, var3)
	end,
	canvasSizeFor = function(p1, p2)
		-- upvalues: axis (ref)
		return if p2 == axis.X then UDim2.fromOffset(p1, 0) else UDim2.fromOffset(0, p1)
	end
}