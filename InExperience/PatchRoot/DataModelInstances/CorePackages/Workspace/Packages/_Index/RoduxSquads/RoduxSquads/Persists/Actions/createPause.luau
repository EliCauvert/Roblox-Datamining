local roduxModule = require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux)

return function(p1)
	-- upvalues: roduxModule (ref)
	local storage = p1.storage
	assert(storage ~= nil, "Persist storage is required")
	
	return roduxModule.makeActionCreator((storage.memStorageKey or "") .. "Pause", function()
		return {}
	end)
end