local _ = require(script:FindFirstAncestor("RoduxSquads").Persists.PersistStorage.PersistStorage)

return function(p0) --[[ line: 11 ]]
	local storage = p0.storage
	
	return if storage then {
		update = function(p1) --[[ line: 18 ]]
			-- upvalues: storage (ref)
			return storage:setItem(p1)
		end,
		get = function() --[[ line: 22 ]]
			-- upvalues: storage (ref)
			return storage:getItem()
		end,
		bindToStorage = function(p2) --[[ line: 26 ]]
			-- upvalues: storage (ref)
			return storage:bindAndFire(p2)
		end
	} else nil
end