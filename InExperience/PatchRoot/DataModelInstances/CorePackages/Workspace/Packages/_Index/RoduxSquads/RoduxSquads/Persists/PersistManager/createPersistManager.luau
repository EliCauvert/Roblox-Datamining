local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local _ = require(RoduxSquads.Persists.PersistManager.createInternalPersistManager)
local CreatePauseFunction = require(RoduxSquads.Persists.Actions).createPause
local CreatePersistAndUpdateStateFunction = require(RoduxSquads.Persists.Actions).createPersistAndUpdateState

return function(p1, p2) --[[ Line: 15 ]]
	-- upvalues: CreatePersistAndUpdateStateFunction (copy), CreatePauseFunction (copy)
	return if p2 then {
		reset = function() --[[ Line: 21 ]]
			-- upvalues: p2 (copy)
			p2.update(nil)
		end,
		persistAndUpdateState = function(Callback: (any) -> ()) --[[ Line: 25 ]]
			-- upvalues: CreatePersistAndUpdateStateFunction (upval), p1 (copy)
			local PersistAndUpdateState = CreatePersistAndUpdateStateFunction(p1)
			
			if PersistAndUpdateState then
				Callback(PersistAndUpdateState())
			end
		end,
		pause = function(Callback: (any) -> ()) --[[ Line: 32 ]]
			-- upvalues: CreatePauseFunction (upval), p1 (copy)
			local Pause = CreatePauseFunction(p1)
			
			if Pause then
				Callback(Pause())
			end
		end
	} else nil
end