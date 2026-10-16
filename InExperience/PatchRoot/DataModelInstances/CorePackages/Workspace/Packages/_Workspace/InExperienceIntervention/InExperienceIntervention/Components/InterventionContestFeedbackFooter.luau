local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local IconsActionsAccept = UIBloxModule.App.ImageSet.Images["icons/actions/accept"]
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector

function getDynamicViewTagForTranslatedText(Text: string, Text1: string, p1): string --[[ Line: 33 ]]
	-- upvalues: Constants (copy)
	local v1 = "align-x-center align-y-center row"
	local NewLength = string.len(Text) + string.len(Text1)
	
	if Constants.MAX_CHARACTERS_IN_SHORT_LINE <= NewLength and p1 < Constants.SMALL_SCREEN_THRESHOLD or Constants.MAX_CHARACTERS_IN_LONG_LINE <= NewLength then
		v1 = "align-x-center align-y-center col flex-fill"
	end
	return v1
end

function InterventionFeedbackFooter(p1) --[[ Line: 45 ]]
	-- upvalues: UseLocalizationFunction (copy), Constants (copy), UseLayerCollectorFunction (copy), UseStyleFunction (copy), NotificationModalsManagerModule (copy), IconsActionsAccept (copy), InExperienceInterventionAnalyticsModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy)
	local UseLocalizationResult = UseLocalizationFunction(Constants.localizationKeys)
	local DynamicViewTagForTranslatedText = getDynamicViewTagForTranslatedText(UseLocalizationResult.MistakeText, UseLocalizationResult.LetUsKnowLinkText, UseLayerCollectorFunction().absoluteSize.X)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		Wraps = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		tag = DynamicViewTagForTranslatedText
	}, {
		MistakeTextLabelFrame = ReactModule.createElement(View, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0, Constants.TIMEOUT_INLINE_HEIGHT),
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			MistakeTextLabel = ReactModule.createElement(Text, {
				tag = "padding-small text-align-x-center size-1200-900",
				Text = UseLocalizationResult.MistakeText,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = Enum.AutomaticSize.X
			})
		}),
		LinkFrame = ReactModule.createElement(View, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.5, 0, 0, Constants.TIMEOUT_INLINE_HEIGHT),
			AutomaticSize = Enum.AutomaticSize.X
		}, {
			Button = ReactModule.createElement(Button, {
				text = UseLocalizationResult.LetUsKnowLinkText,
				variant = ButtonVariant.Text,
				onActivated = function() --[[ Line: 55 ]]
					-- upvalues: p1 (copy), NotificationModalsManagerModule (upval), IconsActionsAccept (upval), UseLocalizationResult (copy), UseStyleResult (copy), InExperienceInterventionAnalyticsModule (upval)
					p1.onDismiss()
					NotificationModalsManagerModule.SetUIBloxToast({
						iconImage = IconsActionsAccept,
						toastTitle = UseLocalizationResult.TakeALookText,
						toastSubtitle = UseLocalizationResult.FeedbackHelpsText,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = UseStyleResult.Tokens.Color.System.Success.Color3
						}
					})
					InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.AppealClicked, p1.interventionType, p1.renderTimestamp, p1.eventId, p1.violatingChatLine, p1.duration)
				end,
				size = ButtonSize.Small,
				fillBehavior = FillBehavior.Fill
			})
		})
	})
end

return InterventionFeedbackFooter