local _ = require(script:FindFirstAncestor("RoduxSquads").Persists.PersistStorage.PersistStorage)

return function(p1)
	local storage = p1.storage
	
	return if storage then {
		update = function(p2)
			-- upvalues: storage (ref)
			return storage:setItem(p2)
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