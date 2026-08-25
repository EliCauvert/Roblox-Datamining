local axis = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler).Axis

return {
	mainOf = function(p0, p1)
		-- upvalues: axis (ref)
		return if p1 == axis.X then p0.X else p0.Y
	end,
	crossOf = function(vectorA, vectorB)
		-- upvalues: axis (ref)
		return if vectorB == axis.X then vectorA.Y else vectorA.X
	end,
	positionFor = function(p2, p3, p4)
		-- upvalues: axis (ref)
		local crossAxisIndex = p2.crossAxisIndex or 1
		local crossAxisCount = p2.crossAxisCount or 1
		local var2 = (crossAxisIndex - 1) / crossAxisCount
		local var3 = (crossAxisIndex - 1) * (p2.crossAxisSpacing or 0) / crossAxisCount
		local var4 = p2.startOffset + (p4 or 0)
		
		return if p3 == axis.X then UDim2.new(0, var4, var2, var3) else UDim2.new(var2, var3, 0, var4)
	end,
	sizeFor = function(p5, p6, p7)
		-- upvalues: axis (ref)
		local crossAxisCount = p5.crossAxisCount or 1
		local var6 = 1 / crossAxisCount
		local var7 = -(crossAxisCount - 1) * (p5.crossAxisSpacing or 0) / crossAxisCount
		local var8 = if p7 then 0 else p5.length
		
		return if p6 == axis.X then UDim2.new(0, var8, var6, var7) else UDim2.new(var6, var7, 0, var8)
	end,
	canvasSizeFor = function(p8, p9)
		-- upvalues: axis (ref)
		return if p9 == axis.X then UDim2.fromOffset(p8, 0) else UDim2.fromOffset(0, p8)
	end
}