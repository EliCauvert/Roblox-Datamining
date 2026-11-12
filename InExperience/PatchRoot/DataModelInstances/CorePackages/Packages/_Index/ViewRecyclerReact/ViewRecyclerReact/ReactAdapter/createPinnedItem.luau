local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact084
local RecyclableViewRegistryModule = require(script:FindFirstAncestor("ViewRecyclerReact").ReactAdapter.Private.RecyclableViewRegistry)

return function(p1)
	-- upvalues: RecyclableViewRegistryModule (copy), FFlagViewRecyclerReact084 (copy)
	assert(p1.key ~= "", "createPinnedItem: `key` must not be empty")
	assert(RecyclableViewRegistryModule.isRegistered(p1.itemType), "createPinnedItem: `itemType` must be a Recyclable view type")
	
	return table.freeze({
		key = p1.key,
		value = p1.value,
		itemType = p1.itemType,
		estimatedLength = if FFlagViewRecyclerReact084 then p1.estimatedLength else nil
	})
end