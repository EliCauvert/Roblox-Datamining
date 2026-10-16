local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local useTokens = require(parent.Foundation).Hooks.useTokens
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local toast = UIBloxModule.App.Dialog.Toast
local inExperienceInterventionToastDuration = game:DefineFastInt("InExperienceInterventionToastDuration", 5)

function ChatNudgeToast(p1)
	-- upvalues: reactModule (ref), useTokens (ref), inExperienceInterventionAnalyticsModule (ref), toast (ref), images (ref), inExperienceInterventionToastDuration (ref)
	local var1 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		DisplayOrder = 7,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = reactModule.createElement(toast, {
			toastContent = {
				toastTitle = p1.toastTitle,
				iconColorStyle = {
					Transparency = 0,
					Color = useTokens().Color.System.Warning.Color3
				},
				iconImage = images["icons/status/error_large"],
				iconSize = Vector2.new(36, 36),
				onAppeared = function()
					-- upvalues: var1 (ref), inExperienceInterventionAnalyticsModule (copy), p1 (ref)
					var1.current = DateTime.now().UnixTimestampMillis
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p1.toastAppearEventName, p1.interventionType, var1.current, p1.eventId, p1.violatingChatLine, p1.remainingDurationSec)
				end,
				toastSubtitle = p1.toastBody,
				sequenceNumber = DateTime.now().UnixTimestamp,
				onTouchSwipeUp = function()
					-- upvalues: inExperienceInterventionAnalyticsModule (copy), p1 (ref), var1 (ref)
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p1.toastDismissEventName, p1.interventionType, var1.current, p1.eventId, p1.violatingChatLine, p1.remainingDurationSec)
				end
			},
			duration = inExperienceInterventionToastDuration
		})
	})
end

return ChatNudgeToast