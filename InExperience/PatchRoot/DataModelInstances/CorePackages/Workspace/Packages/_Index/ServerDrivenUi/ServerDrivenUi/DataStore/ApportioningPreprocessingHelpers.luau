local FlaggedMutedErrorFunction = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Loggers).flaggedMutedError

local function v0(p1, Key, Capacity, SortIndex) --[[ Line: 11 ]]
	p1[Key] = {
		gridApportioningMetadata = { { sortIndex = SortIndex, capacity = Capacity } }
	}
end

local function v1(p1, Capacity, SortIndex) --[[ Line: 22 ]]
	-- upvalues: FlaggedMutedErrorFunction (copy)
	for i, value in p1.gridApportioningMetadata do
		if value.sortIndex == SortIndex then
			FlaggedMutedErrorFunction("ApportioningSameSortIndex", `Multiple collections at sort index {SortIndex}`)
		elseif SortIndex < value.sortIndex then
			table.insert(p1.gridApportioningMetadata, i, { sortIndex = SortIndex, capacity = Capacity })
			
			return
		end
	end
	table.insert(p1.gridApportioningMetadata, { sortIndex = SortIndex, capacity = Capacity })
end

return {
	addToApportioningData = function(p2, p3, Capacity, SortIndex) --[[ Line: 43 ]]
		-- upvalues: v1 (copy), v0 (copy)
		local v1 = p2[p3]
		
		if v1 then
			v1(v1, Capacity, SortIndex)
			
			return
		else
			v0(p2, p3, Capacity, SortIndex)
		end
	end,
	populateStartingItemIndices = function(List) --[[ Line: 53 ]]
		for _, value in List do
			local NewCapacity = 1
			
			for _, value1 in value.gridApportioningMetadata do
				value1.startingItemIndex = NewCapacity
				NewCapacity += value1.capacity
			end
		end
	end
}