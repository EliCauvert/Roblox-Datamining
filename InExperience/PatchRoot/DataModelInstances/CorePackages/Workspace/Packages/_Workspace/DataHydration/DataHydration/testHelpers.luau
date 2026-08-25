local httpService = game:GetService("HttpService")
local dataStatus = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes).DataStatus

return {
	jsonOk = function(p0)
		-- upvalues: httpService (ref)
		return {
			statusCode = 200,
			responseBody = httpService:JSONEncode(p0)
		}
	end,
	awaitReady = function(p1, p2)
		-- upvalues: dataStatus (ref)
		local var1 = os.clock() + (p2 or 3)
		while p1.status(false) == dataStatus.NotReady and var1 >= os.clock() do
			task.wait()
		end
	end
}