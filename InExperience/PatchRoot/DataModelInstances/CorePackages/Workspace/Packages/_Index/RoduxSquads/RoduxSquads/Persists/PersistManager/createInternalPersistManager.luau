local _ = require(script:FindFirstAncestor("RoduxSquads").Persists.PersistStorage.PersistStorage)

return function(p0)
	local storage = p0.storage
	
	return if storage then {
		update = function(p1)
			-- upvalues: storage (ref)
			return storage:setItem(p1)
		end,
		get = function()
			-- upvalues: storage (ref)
			return storage:getItem()
		end,
		bindToStorage = function(p2)
			-- upvalues: storage (ref)
			return storage:bindAndFire(p2)
		end
	} else nil
end