local RecyclableViewRegistryModule = require(script:FindFirstAncestor("ViewRecyclerReact").ReactAdapter.Private.RecyclableViewRegistry)

return function(p1) --[[ Line: 11 | Named "createPinnedItem" ]]
	-- upvalues: RecyclableViewRegistryModule (copy)
	assert(p1.key ~= "", "createPinnedItem: `key` must not be empty")
	assert(RecyclableViewRegistryModule.isRegistered(p1.itemType), "createPinnedItem: `itemType` must be a Recyclable view type")
	
	return table.freeze({ key = p1.key, value = p1.value, itemType = p1.itemType })
end