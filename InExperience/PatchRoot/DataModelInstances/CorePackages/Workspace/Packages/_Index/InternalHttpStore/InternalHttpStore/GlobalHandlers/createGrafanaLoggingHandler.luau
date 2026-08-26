local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local greenlistedEndpointsForLogging = require(parent_1.Http).Logger.GreenlistedEndpointsForLogging
local _ = require(parent.HttpStoreTypes)

return function(p1)
	-- upvalues: signalsModule (ref), greenlistedEndpointsForLogging (ref)
	return signalsModule.createEffect(function(p2)
		-- upvalues: p1 (ref), greenlistedEndpointsForLogging (copy)
		local var1 = p1(p2)
		
		if var1.status == "Success" then
			greenlistedEndpointsForLogging.sendStatusCodeCounter(var1.config.Url, var1.response.StatusCode)
		end
	end)
end