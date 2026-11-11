local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("MomentsCommon").Analytics.FunnelEventNames)
local Guids = {}

return {
	startSession = function(Key)
		-- upvalues: HttpService (copy), Guids (copy)
		local Guid = HttpService:GenerateGUID()
		Guids[Key] = Guid
		
		return Guid
	end,
	getSessionId = function(p1)
		-- upvalues: Guids (copy)
		return Guids[p1]
	end,
	endSession = function(Key): boolean
		-- upvalues: Guids (copy)
		if Guids[Key] then
			Guids[Key] = nil
			
			return true
		else
			return false
		end
	end
}