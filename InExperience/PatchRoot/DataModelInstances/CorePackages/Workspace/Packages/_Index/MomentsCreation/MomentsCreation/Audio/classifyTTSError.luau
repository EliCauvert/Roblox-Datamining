local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local FFlagMomentsTTSTooManyDigitsErrorModule = require(MomentsCreation.Flags.FFlagMomentsTTSTooManyDigitsError)
local config = {
	FilteredText = "moderated",
	FilteredAudio = "moderated",
	NotEnoughQuota = "quotaExceeded",
	["Rate limited by the client"] = "quotaExceeded",
	Timeout = "timeout"
}

return function(p1)
	-- upvalues: FFlagMomentsTTSTooManyDigitsErrorModule (copy), config (copy)
	return if p1 == nil then "failure" elseif FFlagMomentsTTSTooManyDigitsErrorModule and p1 == "TooManyDigits" then "tooManyDigits" else config[p1] or "failure"
end