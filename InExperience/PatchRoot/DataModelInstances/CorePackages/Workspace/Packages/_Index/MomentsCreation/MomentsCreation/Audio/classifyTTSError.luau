local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Types.CreationFlowTypes)
local fFlagMomentsTTSTooManyDigitsErrorModule = require(momentsCreation.Flags.FFlagMomentsTTSTooManyDigitsError)
local t = {
	FilteredText = "moderated",
	FilteredAudio = "moderated",
	NotEnoughQuota = "quotaExceeded",
	["Rate limited by the client"] = "quotaExceeded",
	Timeout = "timeout"
}

return function(p1)
	-- upvalues: fFlagMomentsTTSTooManyDigitsErrorModule (ref), t (ref)
	return if p1 == nil then "failure" elseif fFlagMomentsTTSTooManyDigitsErrorModule and p1 == "TooManyDigits" then "tooManyDigits" else t[p1] or "failure"
end