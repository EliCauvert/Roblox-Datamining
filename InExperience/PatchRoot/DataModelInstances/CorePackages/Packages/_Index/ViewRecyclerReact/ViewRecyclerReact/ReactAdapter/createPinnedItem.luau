local recyclableViewRegistryModule = require(script:FindFirstAncestor("ViewRecyclerReact").ReactAdapter.Private.RecyclableViewRegistry)

return function(p0) --[[ line: 11 | named "createPinnedItem" ]]
	-- upvalues: recyclableViewRegistryModule (ref)
	assert(p0.key ~= "", "createPinnedItem: `key` must not be empty")
	assert(recyclableViewRegistryModule.isRegistered(p0.itemType), "createPinnedItem: `itemType` must be a Recyclable view type")
	
	return table.freeze({ key = p0.key, value = p0.value, itemType = p0.itemType })
end