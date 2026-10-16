local RoduxModule = require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: RoduxModule (copy)
	local Storage = p1.storage
	assert(Storage ~= nil, "Persist storage is required")
	
	return RoduxModule.makeActionCreator((Storage.memStorageKey or "") .. "Pause", function() --[[ Line: 10 ]]
		return {}
	end)
end