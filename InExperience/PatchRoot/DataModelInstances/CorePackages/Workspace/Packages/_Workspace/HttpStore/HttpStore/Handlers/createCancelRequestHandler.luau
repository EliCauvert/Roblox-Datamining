local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local httpSessionTrackerModule = require(parent.HttpSessionTracker)
local _ = require(parent_1.InternalHttpStore)

return function(p1)
	-- upvalues: signalsModule (ref), httpSessionTrackerModule (ref)
	return function(p2)
		-- upvalues: signalsModule (copy), p1 (ref), httpSessionTrackerModule (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: p2 (ref), p1 (copy), httpSessionTrackerModule (copy)
			local var1 = p2(p3)
			
			return if p1 == httpSessionTrackerModule.currentSession() then var1 else {
				status = "Failed",
				cancelled = true,
				config = var1.config
			}
		end)
	end
end