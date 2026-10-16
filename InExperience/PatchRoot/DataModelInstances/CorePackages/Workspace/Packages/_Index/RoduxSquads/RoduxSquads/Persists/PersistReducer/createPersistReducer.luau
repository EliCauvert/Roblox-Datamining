local RoduxSquads = script:FindFirstAncestor("RoduxSquads")
local RoduxModule = require(RoduxSquads.Parent.Rodux)
local CreateInternalPersistManagerFunction = require(RoduxSquads.Persists.PersistManager).createInternalPersistManager
local CreatePersistManagerFunction = require(RoduxSquads.Persists.PersistManager).createPersistManager
local CreatePauseFunction = require(RoduxSquads.Persists.Actions).createPause
local CreatePersistAndUpdateStateFunction = require(RoduxSquads.Persists.Actions).createPersistAndUpdateState
local config = { isPaused = false }

return function(p1, Callback) --[[ Line: 13 ]]
	-- upvalues: CreatePauseFunction (copy), CreatePersistAndUpdateStateFunction (copy), CreateInternalPersistManagerFunction (copy), CreatePersistManagerFunction (copy), config (copy), RoduxModule (copy)
	local Flag = false
	local Pause = CreatePauseFunction(p1)
	local PersistAndUpdateState = CreatePersistAndUpdateStateFunction(p1)
	local InternalPersistManager = CreateInternalPersistManagerFunction(p1)
	local PersistManager = CreatePersistManagerFunction(p1, InternalPersistManager)
	local IsPaused = config.isPaused
	local GetResult = nil
	
	if InternalPersistManager then
		local _ = InternalPersistManager.bindToStorage(function(p2) --[[ Line: 27 ]]
			-- upvalues: GetResult (ref)
			GetResult = p2
		end)
		GetResult = InternalPersistManager.get()
	end
	return function(p2, p3) --[[ Line: 33 ]]
		-- upvalues: InternalPersistManager (copy), Flag (ref), GetResult (ref), PersistAndUpdateState (copy), IsPaused (ref), Callback (copy)
		if InternalPersistManager and not Flag then
			p2 = GetResult or p2
		end
		Flag = true
		local v1 = p2
		
		if PersistAndUpdateState.name == p3.type then
			v1 = GetResult
			
			return v1
		end
		if not IsPaused then
			v1 = Callback(p2, p3)
			
			if InternalPersistManager and v1 ~= p2 then
				InternalPersistManager.update(v1)
			end
		end
		return v1
	end, RoduxModule.createReducer(config, {
		[PersistAndUpdateState.name] = function(_, _) --[[ Line: 55 ]]
			-- upvalues: IsPaused (ref)
			IsPaused = false
			
			return { isPaused = IsPaused }
		end,
		[Pause.name] = function(_, _) --[[ Line: 59 ]]
			-- upvalues: IsPaused (ref)
			IsPaused = true
			
			return { isPaused = IsPaused }
		end
	}), PersistManager
end