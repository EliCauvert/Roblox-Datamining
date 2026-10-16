local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Parent.Signals)
local HttpSessionTrackerModule = require(Parent.HttpSessionTracker)
local _ = require(Parent.HttpStoreTypes)

return function(Callback) --[[ Line: 11 | Named "createCancelRequestHandler" ]]
	-- upvalues: HttpSessionTrackerModule (copy), SignalsModule (copy)
	local CurrentSessionResult = HttpSessionTrackerModule.currentSession()
	
	return SignalsModule.createComputed(function(p1) --[[ Line: 13 ]]
		-- upvalues: Callback (copy), CurrentSessionResult (copy), HttpSessionTrackerModule (upval)
		local CallbackResult = Callback(p1)
		
		return if CurrentSessionResult == HttpSessionTrackerModule.currentSession() then CallbackResult else {
			status = "Failed",
			cancelled = true,
			config = CallbackResult.config
		}
	end)
end