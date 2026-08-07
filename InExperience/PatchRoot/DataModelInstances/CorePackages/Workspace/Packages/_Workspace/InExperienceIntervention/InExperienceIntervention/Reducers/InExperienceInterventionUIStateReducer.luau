local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local _ = require(inExperienceIntervention.Utils.Types)
local constants = require(inExperienceIntervention.Parent.InterventionShared).Utils.Constants
local UIStateActions = constants.UIStateActions
local chatInterventionUIRateLimitWindowSec = game:DefineFastInt("ChatInterventionUIRateLimitWindowSec", 5)
local rateLimitNudgeToast = game:DefineFastFlag("RateLimitNudgeToast", false)
local rateLimitTimeoutToast = game:DefineFastFlag("RateLimitTimeoutToast", false)
local rateLimitNudgeDialog = game:DefineFastFlag("RateLimitNudgeDialog", false)
local rateLimitTimeoutDialog = game:DefineFastFlag("RateLimitTimeoutDialog", false)

return function(p0, p1) --[[ line: 13 | named "InExperienceInterventionUIStateReducer" ]]
	-- upvalues: chatInterventionUIRateLimitWindowSec (ref), rateLimitTimeoutToast (ref), constants (ref), rateLimitNudgeToast (ref), rateLimitNudgeDialog (ref), rateLimitTimeoutDialog (ref), UIStateActions (ref)
	local cloned = table.clone(p0)
	local type = p1.type
	local _ = false
	local var7 = DateTime.now().UnixTimestamp - p0.dispatchTimestamp < chatInterventionUIRateLimitWindowSec
	local var8 = p1.treatmentType == p0.treatmentType
	local var9 = false
	
	if rateLimitTimeoutToast then
		var9 = if var8 then if p1.treatmentType ~= constants.TreatmentType.ChatTimeoutChatAttempt then p1.treatmentType == constants.TreatmentType.ChatTimeoutGameJoin else true else p1.treatmentType == constants.TreatmentType.ChatTimeoutChatAttempt or (p1.treatmentType == constants.TreatmentType.ChatTimeoutGameJoin and p0.treatmentType == constants.TreatmentType.ChatTimeoutChatAttempt)
	end
	local var7_1
	local var10 = if rateLimitTimeoutDialog then p1.treatmentType == constants.TreatmentType.ChatTimeoutDialog and var8 else false
	
	if not var9 and not (if rateLimitNudgeToast then p1.treatmentType == constants.TreatmentType.ChatNudgeToast and var8 else false) and not (if rateLimitNudgeDialog then p1.treatmentType == constants.TreatmentType.ChatNudgeDialog and var8 else false) then
		var7_1 = var10 and var7
	end
	if type == UIStateActions.ToggleNotificationDialog and not var7_1 then
		cloned.isShown = p1.isShown
		cloned.treatmentType = p1.treatmentType
		cloned.detail = p1.detail or {}
		cloned.endTime = p1.endTime or 0
		cloned.dispatchTimestamp = p1.dispatchTimestamp
		
		return cloned
	elseif var7_1 then
		print("Chat intervention UI treatment rate limited: ", p1.treatmentType)
	end
	return p0
end