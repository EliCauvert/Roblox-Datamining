local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local _ = require(roduxSquads.Persists.PersistManager.createInternalPersistManager)
local createPause = require(roduxSquads.Persists.Actions).createPause
local createPersistAndUpdateState = require(roduxSquads.Persists.Actions).createPersistAndUpdateState

return function(p1, p2)
	-- upvalues: createPersistAndUpdateState (ref), createPause (ref)
	return if p2 then {
		reset = function()
			-- upvalues: p2 (ref)
			p2.update(nil)
		end,
		persistAndUpdateState = function(p3)
			-- upvalues: createPersistAndUpdateState (copy), p1 (ref)
			local var1 = createPersistAndUpdateState(p1)
			
			if var1 then
				p3(var1())
			end
		end,
		pause = function(p3)
			-- upvalues: createPause (copy), p1 (ref)
			local var1 = createPause(p1)
			
			if var1 then
				p3(var1())
			end
		end
	} else nil
end