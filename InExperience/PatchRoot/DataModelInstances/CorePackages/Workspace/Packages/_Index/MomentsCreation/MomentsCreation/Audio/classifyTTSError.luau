local _ = require(script:FindFirstAncestor("MomentsCreation").Types.CreationFlowTypes)
local t = {
	FilteredText = "moderated",
	FilteredAudio = "moderated",
	NotEnoughQuota = "quotaExceeded",
	["Rate limited by the client"] = "quotaExceeded",
	Timeout = "timeout"
}

return function(p0) --[[ line: 33 | named "classifyTTSError" ]]
	-- upvalues: t (ref)
	return if p0 == nil then "failure" else t[p0] or "failure"
end