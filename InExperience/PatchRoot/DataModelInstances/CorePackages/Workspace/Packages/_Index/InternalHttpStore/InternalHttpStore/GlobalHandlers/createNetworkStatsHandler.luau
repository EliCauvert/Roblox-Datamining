local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local NetworkProfiler = require(Parent1.Http).NetworkProfiler
local _ = require(Parent.HttpStoreTypes)

return function(Callback) --[[ Line: 13 | Named "createNetworkStatsHandler" ]]
	-- upvalues: SignalsModule (copy), NetworkProfiler (copy)
	return SignalsModule.createEffect(function(p1) --[[ Line: 14 ]]
		-- upvalues: Callback (copy), NetworkProfiler (upval)
		local CallbackResult = Callback(p1)
		
		if CallbackResult.status == "Success" then
			local Response = CallbackResult.response
			
			if Response.Stats then
				local Stats = Response.Stats
				NetworkProfiler:track({
					queued = Stats.DurationInQueue or 0,
					nameLookup = Stats.DurationNameLookup or -1,
					connect = Stats.DurationConnect or -1,
					sslHandshake = Stats.DurationSSLHandshake or -1,
					makeRequest = Stats.DurationMakeRequest or -1,
					receiveResponse = Stats.DurationReceiveResponse or -1
				})
			end
		end
	end)
end