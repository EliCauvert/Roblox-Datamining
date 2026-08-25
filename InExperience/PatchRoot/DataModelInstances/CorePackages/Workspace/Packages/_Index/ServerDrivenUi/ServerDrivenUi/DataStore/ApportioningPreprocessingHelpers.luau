local flaggedMutedError = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Loggers).flaggedMutedError

local var0 = function(p0, p1, p2, p3)
	p0[p1] = {
		gridApportioningMetadata = { { sortIndex = p3, capacity = p2 } }
	}
end

local var1 = function(p4, p5, p6)
	-- upvalues: flaggedMutedError (ref)
	for i, v in p4.gridApportioningMetadata do
		if v.sortIndex == p6 then
			flaggedMutedError("ApportioningSameSortIndex", `Multiple collections at sort index {p6}`)
		elseif p6 < v.sortIndex then
			table.insert(p4.gridApportioningMetadata, i, { sortIndex = p6, capacity = p5 })
			
			return
		end
	end
	table.insert(p4.gridApportioningMetadata, { sortIndex = p6, capacity = p5 })
end

return {
	addToApportioningData = function(p7, p8, p9, p10)
		-- upvalues: var1 (ref), var0 (ref)
		local var2 = p7[p8]
		
		if var2 then
			var1(var2, p9, p10)
			
			return
		end
		var0(p7, p8, p9, p10)
	end,
	populateStartingItemIndices = function(a)
		for i, v in a do
			local var3 = 1
			
			for i_1, v_1 in v.gridApportioningMetadata do
				v_1.startingItemIndex = var3
				var3 += v_1.capacity
			end
		end
	end
}