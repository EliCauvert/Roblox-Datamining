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

function getDynamicViewTagForTranslatedText(p1, p2, p3)
	-- upvalues: constants (ref)
	local var1 = "align-x-center align-y-center row"
	local var2 = string.len(p1) + string.len(p2)
	
	if constants.MAX_CHARACTERS_IN_SHORT_LINE <= var2 and p3 < constants.SMALL_SCREEN_THRESHOLD or constants.MAX_CHARACTERS_IN_LONG_LINE <= var2 then
		var1 = "align-x-center align-y-center col flex-fill"
	end
	return var1
end

function InterventionFeedbackFooter(p1)
	-- upvalues: useLocalization (ref), constants (ref), useLayerCollector (ref), useStyle (ref), notificationModalsManagerModule (ref), accept (ref), inExperienceInterventionAnalyticsModule (ref), reactModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), buttonSize (ref), fillBehavior (ref)
	local var1 = useLocalization(constants.localizationKeys)
	local var2 = useStyle()
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		Wraps = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		tag = getDynamicViewTagForTranslatedText(var1.MistakeText, var1.LetUsKnowLinkText, useLayerCollector().absoluteSize.X)
	}, {
		MistakeTextLabelFrame = reactModule.createElement(view, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0, constants.TIMEOUT_INLINE_HEIGHT),
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			MistakeTextLabel = reactModule.createElement(text, {
				tag = "padding-small text-align-x-center size-1200-900",
				Text = var1.MistakeText,
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
				text = var1.LetUsKnowLinkText,
				variant = buttonVariant.Text,
				onActivated = function()
					-- upvalues: p1 (ref), notificationModalsManagerModule (copy), accept (copy), var1 (ref), var2 (ref), inExperienceInterventionAnalyticsModule (copy)
					p1.onDismiss()
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = accept,
						toastTitle = var1.TakeALookText,
						toastSubtitle = var1.FeedbackHelpsText,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var2.Tokens.Color.System.Success.Color3
						}
					})
					inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.AppealClicked, p1.interventionType, p1.renderTimestamp, p1.eventId, p1.violatingChatLine, p1.duration)
				end,
				size = buttonSize.Small,
				fillBehavior = fillBehavior.Fill
			})
		})
	})
end

return InterventionFeedbackFooter