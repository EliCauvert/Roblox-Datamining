local HttpService = game:GetService("HttpService")
local FFlagDebugSquadLogsEnabled = require(script:FindFirstAncestor("SquadsCore").Parent.SharedFlags).FFlagDebugSquadLogsEnabled

return function(Input) --[[ Line: 8 ]]
	-- upvalues: FFlagDebugSquadLogsEnabled (copy), HttpService (copy)
	return if FFlagDebugSquadLogsEnabled then HttpService:JSONEncode(Input) else Input
end