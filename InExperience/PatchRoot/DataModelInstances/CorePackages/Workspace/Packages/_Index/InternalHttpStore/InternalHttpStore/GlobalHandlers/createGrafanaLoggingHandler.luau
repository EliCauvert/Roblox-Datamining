local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local greenlistedEndpointsForLogging = require(parent_1.Http).Logger.GreenlistedEndpointsForLogging
local _ = require(parent.HttpStoreTypes)

return function(p0) --[[ line: 13 | named "createGrafanaLoggingHandler" ]]
	-- upvalues: signalsModule (ref), greenlistedEndpointsForLogging (ref)
	return signalsModule.createEffect(function(p1) --[[ line: 14 ]]
		-- upvalues: p0 (ref), greenlistedEndpointsForLogging (copy)
		local var1 = p0(p1)
		
		if var1.status == "Success" then
			greenlistedEndpointsForLogging.sendStatusCodeCounter(var1.config.Url, var1.response.StatusCode)
		end
	end)
end