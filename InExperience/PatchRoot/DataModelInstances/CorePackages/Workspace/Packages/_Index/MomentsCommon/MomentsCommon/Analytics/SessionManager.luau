local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("MomentsCommon").Analytics.FunnelEventNames)
local t = {}

return {
	startSession = function(p0)
		-- upvalues: httpService (ref), t (ref)
		local var2 = httpService:GenerateGUID()
		t[p0] = var2
		
		return var2
	end,
	getSessionId = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	endSession = function(p2)
		-- upvalues: t (ref)
		if t[p2] then
			t[p2] = nil
			
			return true
		end
		return false
	end
}