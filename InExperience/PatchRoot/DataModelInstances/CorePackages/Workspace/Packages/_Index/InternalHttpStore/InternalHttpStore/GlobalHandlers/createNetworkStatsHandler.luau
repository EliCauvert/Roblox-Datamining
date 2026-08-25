local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local networkProfiler = require(parent_1.Http).NetworkProfiler
local _ = require(parent.HttpStoreTypes)

return function(p0)
	-- upvalues: signalsModule (ref), networkProfiler (ref)
	return signalsModule.createEffect(function(p1)
		-- upvalues: p0 (ref), networkProfiler (copy)
		local var1 = p0(p1)
		
		if var1.status == "Success" then
			local response = var1.response
			
			if response.Stats then
				local stats = response.Stats
				networkProfiler:track({
					queued = stats.DurationInQueue or 0,
					nameLookup = stats.DurationNameLookup or -1,
					connect = stats.DurationConnect or -1,
					sslHandshake = stats.DurationSSLHandshake or -1,
					makeRequest = stats.DurationMakeRequest or -1,
					receiveResponse = stats.DurationReceiveResponse or -1
				})
			end
		end
	end)
end