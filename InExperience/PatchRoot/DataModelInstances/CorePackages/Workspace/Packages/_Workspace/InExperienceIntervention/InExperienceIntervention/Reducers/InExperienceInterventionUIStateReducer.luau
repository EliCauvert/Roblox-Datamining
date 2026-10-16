local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local _ = require(InExperienceIntervention.Utils.Types)
local Constants = require(InExperienceIntervention.Parent.InterventionShared).Utils.Constants
local UIStateActions = Constants.UIStateActions
local ChatInterventionUIRateLimitWindowSec = game:DefineFastInt("ChatInterventionUIRateLimitWindowSec", 5)
local RateLimitNudgeToast = game:DefineFastFlag("RateLimitNudgeToast", false)
local RateLimitTimeoutToast = game:DefineFastFlag("RateLimitTimeoutToast", false)
local RateLimitNudgeDialog = game:DefineFastFlag("RateLimitNudgeDialog", false)
local RateLimitTimeoutDialog = game:DefineFastFlag("RateLimitTimeoutDialog", false)

return function(Tbl, p1) --[[ Line: 13 | Named "InExperienceInterventionUIStateReducer" ]]
	-- upvalues: ChatInterventionUIRateLimitWindowSec (copy), RateLimitTimeoutToast (copy), Constants (copy), RateLimitNudgeToast (copy), RateLimitNudgeDialog (copy), RateLimitTimeoutDialog (copy), UIStateActions (copy)
	local Copy = table.clone(Tbl)
	local Type = p1.type
	local IsUnixTimestampBelow = DateTime.now().UnixTimestamp - Tbl.dispatchTimestamp < ChatInterventionUIRateLimitWindowSec
	local IsTreatmentTypeMatch = p1.treatmentType == Tbl.treatmentType
	local v1 = false
	
	if RateLimitTimeoutToast then
		local IsTreatmentTypeMatch1: boolean = p1.treatmentType == Constants.TreatmentType.ChatTimeoutChatAttempt and Tbl.treatmentType == Constants.TreatmentType.ChatTimeoutGameJoin or p1.treatmentType == Constants.TreatmentType.ChatTimeoutGameJoin and Tbl.treatmentType == Constants.TreatmentType.ChatTimeoutChatAttempt
		local IsTreatmentTypeMatch2: boolean = p1.treatmentType == Constants.TreatmentType.ChatTimeoutChatAttempt or p1.treatmentType == Constants.TreatmentType.ChatTimeoutGameJoin
		v1 = IsTreatmentTypeMatch and IsTreatmentTypeMatch2 or IsTreatmentTypeMatch1
	end
	local IsTreatmentTypeMatch3: boolean = if RateLimitNudgeToast then p1.treatmentType == Constants.TreatmentType.ChatNudgeToast and IsTreatmentTypeMatch else false
	local IsTreatmentTypeMatch4: boolean = if RateLimitNudgeDialog then p1.treatmentType == Constants.TreatmentType.ChatNudgeDialog and IsTreatmentTypeMatch else false
	local IsTreatmentTypeMatch5: boolean = if RateLimitTimeoutDialog then p1.treatmentType == Constants.TreatmentType.ChatTimeoutDialog and IsTreatmentTypeMatch else false
	local IsUnixTimestampBelow1: boolean = if v1 or IsTreatmentTypeMatch3 or IsTreatmentTypeMatch4 then IsUnixTimestampBelow else IsTreatmentTypeMatch5 and IsUnixTimestampBelow
	
	if Type == UIStateActions.ToggleNotificationDialog and not IsUnixTimestampBelow1 then
		Copy.isShown = p1.isShown
		Copy.treatmentType = p1.treatmentType
		Copy.detail = p1.detail or {}
		Copy.endTime = p1.endTime or 0
		Copy.dispatchTimestamp = p1.dispatchTimestamp
		
		return Copy
	else
		if IsUnixTimestampBelow1 then
			print("Chat intervention UI treatment rate limited: ", p1.treatmentType)
		end
		return Tbl
	end
end