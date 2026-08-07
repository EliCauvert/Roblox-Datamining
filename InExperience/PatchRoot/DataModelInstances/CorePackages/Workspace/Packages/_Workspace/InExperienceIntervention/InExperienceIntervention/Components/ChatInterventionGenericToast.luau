local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local useTokens = require(parent.Foundation).Hooks.useTokens
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local toast = UIBloxModule.App.Dialog.Toast
local inExperienceInterventionToastDuration = game:DefineFastInt("InExperienceInterventionToastDuration", 5)

function ChatNudgeToast(p0) --[[ line: 24 ]]
	-- upvalues: reactModule (ref), useTokens (ref), inExperienceInterventionAnalyticsModule (ref), toast (ref), images (ref), inExperienceInterventionToastDuration (ref)
	local var5 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		DisplayOrder = 7,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = reactModule.createElement(toast, {
			toastContent = {
				toastTitle = p0.toastTitle,
				iconColorStyle = {
					Transparency = 0,
					Color = useTokens().Color.System.Warning.Color3
				},
				iconImage = images["icons/status/error_large"],
				iconSize = Vector2.new(36, 36),
				onAppeared = function() --[[ line: 28 ]]
					-- upvalues: var5 (ref), inExperienceInterventionAnalyticsModule (copy), p0 (ref)
					var5.current = DateTime.now().UnixTimestampMillis
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p0.toastAppearEventName, p0.interventionType, var5.current, p0.eventId, p0.violatingChatLine, p0.remainingDurationSec)
				end,
				toastSubtitle = p0.toastBody,
				sequenceNumber = DateTime.now().UnixTimestamp,
				onTouchSwipeUp = function() --[[ line: 40 ]]
					-- upvalues: inExperienceInterventionAnalyticsModule (copy), p0 (ref), var5 (ref)
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p0.toastDismissEventName, p0.interventionType, var5.current, p0.eventId, p0.violatingChatLine, p0.remainingDurationSec)
				end
			},
			duration = inExperienceInterventionToastDuration
		})
	})
end

return ChatNudgeToast