local roduxModule = require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux)

return function(p0)
	-- upvalues: roduxModule (ref)
	local storage = p0.storage
	assert(storage ~= nil, "Persist storage is required")
	
	return roduxModule.makeActionCreator((storage.memStorageKey or "") .. "PersistAndUpdateState", function()
		return {}
	end)
end