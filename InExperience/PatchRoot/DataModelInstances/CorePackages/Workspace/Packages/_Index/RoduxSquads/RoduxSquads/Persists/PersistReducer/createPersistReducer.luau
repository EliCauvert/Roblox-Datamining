local roduxSquads = script:FindFirstAncestor("RoduxSquads")
local roduxModule = require(roduxSquads.Parent.Rodux)
local createInternalPersistManager = require(roduxSquads.Persists.PersistManager).createInternalPersistManager
local createPersistManager = require(roduxSquads.Persists.PersistManager).createPersistManager
local createPause = require(roduxSquads.Persists.Actions).createPause
local createPersistAndUpdateState = require(roduxSquads.Persists.Actions).createPersistAndUpdateState
local t = { isPaused = false }

return function(p1, p2)
	-- upvalues: createPause (ref), createPersistAndUpdateState (ref), createInternalPersistManager (ref), createPersistManager (ref), t (ref), roduxModule (ref)
	local var1 = false
	local var2 = createPause(p1)
	local var3 = createPersistAndUpdateState(p1)
	local var4 = createInternalPersistManager(p1)
	local var5 = createPersistManager(p1, var4)
	local isPaused = t.isPaused
	local var6 = nil
	local var7 = nil
	
	if var4 then
		var7 = var4.bindToStorage(function(p3)
			-- upvalues: var6 (write)
			var6 = p3
		end)
		var6 = var4.get()
	end
	return function(p3, p4)
		-- upvalues: var4 (ref), var1 (write), var6 (write), var3 (ref), isPaused (write), p2 (ref)
		if var4 and not var1 then
			p3 = var6 or p3
		end
		var1 = true
		local var8 = p3
		
		if var3.name == p4.type then
			var8 = var6
			
			return var8
		elseif not isPaused then
			var8 = p2(p3, p4)
			
			if var4 and var8 ~= p3 then
				var4.update(var8)
			end
		end
		return var8
	end, roduxModule.createReducer(t, {
		[var3.name] = function(_, _)
			-- upvalues: isPaused (write)
			isPaused = false
			
			return { isPaused = isPaused }
		end,
		[var2.name] = function(_, _)
			-- upvalues: isPaused (write)
			isPaused = true
			
			return { isPaused = isPaused }
		end
	}), var5
end