local httpService = game:GetService("HttpService")
local fFlagDebugSquadLogsEnabled = require(script:FindFirstAncestor("SquadsCore").Parent.SharedFlags).FFlagDebugSquadLogsEnabled

return function(p1)
	-- upvalues: fFlagDebugSquadLogsEnabled (ref), httpService (ref)
	return if fFlagDebugSquadLogsEnabled then httpService:JSONEncode(p1) else p1
end