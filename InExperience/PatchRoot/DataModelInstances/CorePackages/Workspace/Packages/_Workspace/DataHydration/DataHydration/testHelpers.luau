local HttpService = game:GetService("HttpService")
local DataStatus = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes).DataStatus

return {
	jsonOk = function(Input) --[[ Line: 11 ]]
		-- upvalues: HttpService (copy)
		return {
			statusCode = 200,
			responseBody = HttpService:JSONEncode(Input)
		}
	end,
	awaitReady = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: DataStatus (copy)
		local NewClockTime = os.clock() + (p2 or 3)
		while p1.status(false) == DataStatus.NotReady and NewClockTime >= os.clock() do
			task.wait()
		end
	end
}