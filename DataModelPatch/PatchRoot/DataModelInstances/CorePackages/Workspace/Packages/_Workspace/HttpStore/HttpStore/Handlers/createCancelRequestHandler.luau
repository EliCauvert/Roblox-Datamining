local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local HttpSessionTrackerModule = require(Parent.HttpSessionTracker)
local _ = require(Parent1.InternalHttpStore)

return function(p1)
	-- upvalues: SignalsModule (copy), HttpSessionTrackerModule (copy)
	return function(Callback)
		-- upvalues: SignalsModule (upval), p1 (copy), HttpSessionTrackerModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Callback (copy), p1 (upval), HttpSessionTrackerModule (upval)
			local CallbackResult = Callback(p2)
			
			return if p1 == HttpSessionTrackerModule.currentSession() then CallbackResult else {
				status = "Failed",
				cancelled = true,
				config = CallbackResult.config
			}
		end)
	end
end