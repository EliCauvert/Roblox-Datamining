local parent = script.Parent.Parent
local signalsModule = require(parent.Parent.Signals)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)
local _ = require(parent.HttpStoreTypes)

return function(p1)
	-- upvalues: httpSessionTrackerModule (ref), signalsModule (ref)
	local var1 = httpSessionTrackerModule.currentSession()
	
	return signalsModule.createComputed(function(p2)
		-- upvalues: p1 (ref), var1 (ref), httpSessionTrackerModule (copy)
		local var2 = p1(p2)
		
		return if var1 == httpSessionTrackerModule.currentSession() then var2 else {
			status = "Failed",
			cancelled = true,
			config = var2.config
		}
	end)
end