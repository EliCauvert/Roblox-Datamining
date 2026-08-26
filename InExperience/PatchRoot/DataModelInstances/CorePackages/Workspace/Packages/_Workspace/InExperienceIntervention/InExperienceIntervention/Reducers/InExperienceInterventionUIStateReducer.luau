local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local _ = require(inExperienceIntervention.Utils.Types)
local constants = require(inExperienceIntervention.Parent.InterventionShared).Utils.Constants
local UIStateActions = constants.UIStateActions
local chatInterventionUIRateLimitWindowSec = game:DefineFastInt("ChatInterventionUIRateLimitWindowSec", 5)
local rateLimitNudgeToast = game:DefineFastFlag("RateLimitNudgeToast", false)
local rateLimitTimeoutToast = game:DefineFastFlag("RateLimitTimeoutToast", false)
local rateLimitNudgeDialog = game:DefineFastFlag("RateLimitNudgeDialog", false)
local rateLimitTimeoutDialog = game:DefineFastFlag("RateLimitTimeoutDialog", false)

return function(p1, p2)
	-- upvalues: chatInterventionUIRateLimitWindowSec (ref), rateLimitTimeoutToast (ref), constants (ref), rateLimitNudgeToast (ref), rateLimitNudgeDialog (ref), rateLimitTimeoutDialog (ref), UIStateActions (ref)
	local cloned = table.clone(p1)
	local type = p2.type
	local _ = false
	local var1 = DateTime.now().UnixTimestamp - p1.dispatchTimestamp < chatInterventionUIRateLimitWindowSec
	local var2 = p2.treatmentType == p1.treatmentType
	local var3 = false
	
	if rateLimitTimeoutToast then
		var3 = if var2 then if p2.treatmentType ~= constants.TreatmentType.ChatTimeoutChatAttempt then p2.treatmentType == constants.TreatmentType.ChatTimeoutGameJoin else true else p2.treatmentType == constants.TreatmentType.ChatTimeoutChatAttempt or (p2.treatmentType == constants.TreatmentType.ChatTimeoutGameJoin and p1.treatmentType == constants.TreatmentType.ChatTimeoutChatAttempt)
	end
	local var4
	local var5 = if rateLimitTimeoutDialog then p2.treatmentType == constants.TreatmentType.ChatTimeoutDialog and var2 else false
	
	if not var3 and not (if rateLimitNudgeToast then p2.treatmentType == constants.TreatmentType.ChatNudgeToast and var2 else false) and not (if rateLimitNudgeDialog then p2.treatmentType == constants.TreatmentType.ChatNudgeDialog and var2 else false) then
		var4 = var5 and var1
	end
	if type == UIStateActions.ToggleNotificationDialog and not var4 then
		cloned.isShown = p2.isShown
		cloned.treatmentType = p2.treatmentType
		cloned.detail = p2.detail or {}
		cloned.endTime = p2.endTime or 0
		cloned.dispatchTimestamp = p2.dispatchTimestamp
		
		return cloned
	elseif var4 then
		print("Chat intervention UI treatment rate limited: ", p2.treatmentType)
	end
	return p1
end