local _ = require(script:FindFirstAncestor("RoduxSquads").Persists.PersistStorage.PersistStorage)

return function(p1)
	local Storage = p1.storage
	
	return if Storage then {
		update = function(p2)
			-- upvalues: Storage (copy)
			return Storage:setItem(p2)
		end,
		get = function()
			-- upvalues: Storage (copy)
			return Storage:getItem()
		end,
		bindToStorage = function(p2)
			-- upvalues: Storage (copy)
			return Storage:bindAndFire(p2)
		end
	} else nil
end