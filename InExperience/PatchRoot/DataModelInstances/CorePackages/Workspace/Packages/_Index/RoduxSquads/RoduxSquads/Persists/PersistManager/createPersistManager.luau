local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local _ = require(roduxSquads.Persists.PersistManager.createInternalPersistManager)
local createPause = require(roduxSquads.Persists.Actions).createPause
local createPersistAndUpdateState = require(roduxSquads.Persists.Actions).createPersistAndUpdateState

return function(p0, p1)
	-- upvalues: createPersistAndUpdateState (ref), createPause (ref)
	return if p1 then {
		reset = function()
			-- upvalues: p1 (ref)
			p1.update(nil)
		end,
		persistAndUpdateState = function(p2)
			-- upvalues: createPersistAndUpdateState (copy), p0 (ref)
			local var1 = createPersistAndUpdateState(p0)
			
			if var1 then
				p2(var1())
			end
		end,
		pause = function(p3)
			-- upvalues: createPause (copy), p0 (ref)
			local var2 = createPause(p0)
			
			if var2 then
				p3(var2())
			end
		end
	} else nil
end