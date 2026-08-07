local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local useStyle = UIBloxModule.Core.Style.useStyle
local text = foundationModule.Text
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local fillBehavior = foundationModule.Enums.FillBehavior
local view = foundationModule.View
local images = UIBloxModule.App.ImageSet.Images
local useLocalization = require(parent.Localization).Hooks.useLocalization
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local accept = images["icons/actions/accept"]
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector

function getDynamicViewTagForTranslatedText(p0, p1, p2) --[[ line: 33 ]]
	-- upvalues: constants (ref)
	local var6 = "align-x-center align-y-center row"
	local var7 = string.len(p0) + string.len(p1)
	
	if constants.MAX_CHARACTERS_IN_SHORT_LINE <= var7 and p2 < constants.SMALL_SCREEN_THRESHOLD or constants.MAX_CHARACTERS_IN_LONG_LINE <= var7 then
		var6 = "align-x-center align-y-center col flex-fill"
	end
	return var6
end

function InterventionFeedbackFooter(p3) --[[ line: 45 ]]
	-- upvalues: useLocalization (ref), constants (ref), useLayerCollector (ref), useStyle (ref), notificationModalsManagerModule (ref), accept (ref), inExperienceInterventionAnalyticsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), buttonSize (ref), fillBehavior (ref)
	local var8 = useLocalization(constants.localizationKeys)
	local var9 = useStyle()
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		Wraps = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		tag = getDynamicViewTagForTranslatedText(var8.MistakeText, var8.LetUsKnowLinkText, useLayerCollector().absoluteSize.X)
	}, {
		MistakeTextLabelFrame = reactModule.createElement(view, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0, constants.TIMEOUT_INLINE_HEIGHT),
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			MistakeTextLabel = reactModule.createElement(text, {
				tag = "padding-small text-align-x-center size-1200-900",
				Text = var8.MistakeText,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.X
			})
		}),
		LinkFrame = reactModule.createElement(view, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0, constants.TIMEOUT_INLINE_HEIGHT),
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Button = reactModule.createElement(button, {
				text = var8.LetUsKnowLinkText,
				variant = buttonVariant.Text,
				onActivated = function() --[[ line: 55 ]]
					-- upvalues: p3 (ref), notificationModalsManagerModule (copy), accept (copy), var8 (ref), var9 (ref), inExperienceInterventionAnalyticsModule (copy)
					p3.onDismiss()
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = accept,
						toastTitle = var8.TakeALookText,
						toastSubtitle = var8.FeedbackHelpsText,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var9.Tokens.Color.System.Success.Color3
						}
					})
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.AppealClicked, p3.interventionType, p3.renderTimestamp, p3.eventId, p3.violatingChatLine, p3.duration)
				end,
				size = buttonSize.Small,
				fillBehavior = fillBehavior.Fill
			})
		})
	})
end

return InterventionFeedbackFooter