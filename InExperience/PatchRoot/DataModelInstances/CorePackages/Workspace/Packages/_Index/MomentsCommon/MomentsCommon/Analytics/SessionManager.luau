local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("MomentsCommon").Analytics.FunnelEventNames)
local t = {}

return {
	startSession = function(p1)
		-- upvalues: httpService (ref), t (ref)
		local var1 = httpService:GenerateGUID()
		t[p1] = var1
		
		return var1
	end,
	getSessionId = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	endSession = function(p1)
		-- upvalues: t (ref)
		if t[p1] then
			t[p1] = nil
			
			return true
		end
		return false
	end
}