local _ = require(script:FindFirstAncestor("MomentsCreation").Types.CreationFlowTypes)
local t = {
	FilteredText = "moderated",
	FilteredAudio = "moderated",
	NotEnoughQuota = "quotaExceeded",
	["Rate limited by the client"] = "quotaExceeded",
	Timeout = "timeout"
}

return function(p1)
	-- upvalues: t (ref)
	return if p1 == nil then "failure" else t[p1] or "failure"
end