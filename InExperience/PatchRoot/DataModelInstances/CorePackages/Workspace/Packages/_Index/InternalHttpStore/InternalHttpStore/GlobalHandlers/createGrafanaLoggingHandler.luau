local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local GreenlistedEndpointsForLogging = require(Parent1.Http).Logger.GreenlistedEndpointsForLogging
local _ = require(Parent.HttpStoreTypes)

return function(Callback) --[[ Line: 13 | Named "createGrafanaLoggingHandler" ]]
	-- upvalues: SignalsModule (copy), GreenlistedEndpointsForLogging (copy)
	return SignalsModule.createEffect(function(p1) --[[ Line: 14 ]]
		-- upvalues: Callback (copy), GreenlistedEndpointsForLogging (upval)
		local CallbackResult = Callback(p1)
		
		if CallbackResult.status == "Success" then
			GreenlistedEndpointsForLogging.sendStatusCodeCounter(CallbackResult.config.Url, CallbackResult.response.StatusCode)
		end
	end)
end