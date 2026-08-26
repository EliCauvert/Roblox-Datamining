local flaggedMutedError = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Loggers).flaggedMutedError

local var1 = function(p1, p2, p3, p4)
	p1[p2] = {
		gridApportioningMetadata = { { sortIndex = p4, capacity = p3 } }
	}
end

local var2 = function(p1, p2, p3)
	-- upvalues: flaggedMutedError (ref)
	for i, v in p1.gridApportioningMetadata do
		if v.sortIndex == p3 then
			flaggedMutedError("ApportioningSameSortIndex", `Multiple collections at sort index {p3}`)
		elseif p3 < v.sortIndex then
			table.insert(p1.gridApportioningMetadata, i, { sortIndex = p3, capacity = p2 })
			
			return
		end
	end
	table.insert(p1.gridApportioningMetadata, { sortIndex = p3, capacity = p2 })
end

return {
	addToApportioningData = function(p4, p5, p6, p7)
		-- upvalues: var2 (ref), var1 (ref)
		local var3 = p4[p5]
		
		if var3 then
			var2(var3, p6, p7)
			
			return
		end
		var1(p4, p5, p6, p7)
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