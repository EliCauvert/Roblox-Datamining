local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local roduxModule = require(roduxSquads.Parent.Rodux)
local createInternalPersistManager = require(roduxSquads.Persists.PersistManager).createInternalPersistManager
local createPersistManager = require(roduxSquads.Persists.PersistManager).createPersistManager
local createPause = require(roduxSquads.Persists.Actions).createPause
local createPersistAndUpdateState = require(roduxSquads.Persists.Actions).createPersistAndUpdateState
local t = { isPaused = false }

return function(p0, p1) --[[ line: 13 ]]
	-- upvalues: createPause (ref), createPersistAndUpdateState (ref), createInternalPersistManager (ref), createPersistManager (ref), t (ref), roduxModule (ref)
	local var3 = false
	local var4 = createPause(p0)
	local var5 = createPersistAndUpdateState(p0)
	local var6 = createInternalPersistManager(p0)
	local var7 = createPersistManager(p0, var6)
	local isPaused = t.isPaused
	local var8 = nil
	local var9 = nil
	
	if var6 then
		var9 = var6.bindToStorage(function(p2) --[[ line: 27 ]]
			-- upvalues: var8 (write)
			var8 = p2
		end)
		var8 = var6.get()
	end
	return function(p3, p4) --[[ line: 33 ]]
		-- upvalues: var6 (ref), var3 (write), var8 (write), var5 (ref), isPaused (write), p1 (ref)
		if var6 and not var3 then
			p3 = var8 or p3
		end
		var3 = true
		local var10 = p3
		
		if var5.name == p4.type then
			var10 = var8
			
			return var10
		elseif not isPaused then
			var10 = p1(p3, p4)
			
			if var6 and var10 ~= p3 then
				var6.update(var10)
			end
		end
		return var10
	end, roduxModule.createReducer(t, {
		[var5.name] = function(_, _) --[[ line: 55 ]]
			-- upvalues: isPaused (write)
			isPaused = false
			
			return { isPaused = isPaused }
		end,
		[var4.name] = function(_, _) --[[ line: 59 ]]
			-- upvalues: isPaused (write)
			isPaused = true
			
			return { isPaused = isPaused }
		end
	}), var7
end