local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)
local _ = require(parent_1.InternalHttpStore)

return function(p0)
	-- upvalues: signalsModule (ref), httpSessionTrackerModule (ref)
	return function(p1)
		-- upvalues: signalsModule (copy), p0 (ref), httpSessionTrackerModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: p1 (ref), p0 (copy), httpSessionTrackerModule (copy)
			local var2 = p1(p2)
			
			return if p0 == httpSessionTrackerModule.currentSession() then var2 else {
				status = "Failed",
				cancelled = true,
				config = var2.config
			}
		end)
	end
end