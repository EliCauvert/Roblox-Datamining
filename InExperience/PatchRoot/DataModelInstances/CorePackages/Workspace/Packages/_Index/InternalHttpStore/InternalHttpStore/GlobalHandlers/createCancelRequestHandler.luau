local parent = script.Parent.Parent
local signalsModule = require(parent.Parent.Signals)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)
local _ = require(parent.HttpStoreTypes)

return function(p0)
	-- upvalues: httpSessionTrackerModule (ref), signalsModule (ref)
	local var2 = httpSessionTrackerModule.currentSession()
	
	return signalsModule.createComputed(function(p1)
		-- upvalues: p0 (ref), var2 (ref), httpSessionTrackerModule (copy)
		local var3 = p0(p1)
		
		return if var2 == httpSessionTrackerModule.currentSession() then var3 else {
			status = "Failed",
			cancelled = true,
			config = var3.config
		}
	end)
end