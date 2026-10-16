local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local Toast = UIBloxModule.App.Dialog.Toast
local InExperienceInterventionToastDuration = game:DefineFastInt("InExperienceInterventionToastDuration", 5)

function ChatNudgeToast(p1) --[[ Line: 25 ]]
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), InExperienceInterventionAnalyticsModule (copy), Toast (copy), Images (copy), InExperienceInterventionToastDuration (copy)
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		DisplayOrder = 7,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Toast = ReactModule.createElement(Toast, {
			toastContent = {
				toastTitle = p1.toastTitle,
				iconColorStyle = {
					Transparency = 0,
					Color = p1.iconColor or UseTokensResult.Color.System.Warning.Color3
				},
				iconImage = Images["icons/status/error_large"],
				iconSize = Vector2.new(36, 36),
				onAppeared = function() --[[ Line: 29 ]]
					-- upvalues: UseRefResult (copy), InExperienceInterventionAnalyticsModule (upval), p1 (copy)
					UseRefResult.current = DateTime.now().UnixTimestampMillis
					InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p1.toastAppearEventName, p1.interventionType, UseRefResult.current, p1.eventId, p1.violatingChatLine, p1.remainingDurationSec)
				end,
				toastSubtitle = p1.toastBody,
				sequenceNumber = DateTime.now().UnixTimestamp,
				onTouchSwipeUp = function() --[[ Line: 41 ]]
					-- upvalues: InExperienceInterventionAnalyticsModule (upval), p1 (copy), UseRefResult (copy)
					InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(p1.toastDismissEventName, p1.interventionType, UseRefResult.current, p1.eventId, p1.violatingChatLine, p1.remainingDurationSec)
				end
			},
			duration = InExperienceInterventionToastDuration
		})
	})
end

return ChatNudgeToast