local RoduxModule = require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux)

return function(p1)
	-- upvalues: RoduxModule (copy)
	local Storage = p1.storage
	assert(Storage ~= nil, "Persist storage is required")
	
	return RoduxModule.makeActionCreator((Storage.memStorageKey or "") .. "Pause", function()
		return {}
	end)
end