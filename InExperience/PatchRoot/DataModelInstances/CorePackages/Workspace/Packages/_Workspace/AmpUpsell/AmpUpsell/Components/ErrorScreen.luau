local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AnalyticsServiceModule = require(AmpUpsell.Analytics.AnalyticsService)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local SendButtonClickEventModule = require(AmpUpsell.Analytics.sendButtonClickEvent)

local function selectScreenSize(p1) --[[ Line: 19 ]]
	return p1.ScreenSize
end

return function(p1) --[[ Line: 23 | Named "ErrorScreen" ]]
	-- upvalues: UseLocalizationFunction (copy), AnalyticsServiceModule (copy), UseSelectorFunction (copy), selectScreenSize (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy), SendButtonClickEventModule (copy)
	local OnRetryFunction = p1.onRetry
	local OnCancelFunction = p1.onCancel
	local FeatureName = p1.featureName
	local AmpErrorScreenTitle = UseLocalizationFunction({
		title = "Amp.ErrorScreen.Title",
		bodyText = "Amp.ErrorScreen.BodyText",
		buttonRetry = "Amp.ErrorScreen.Retry",
		buttonCancel = "Amp.ErrorScreen.Cancel"
	})
	local AnalyticsService = if p1.analyticsService then p1.analyticsService else AnalyticsServiceModule.EventStream
	
	return ReactModule.createElement(InteractiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = UseSelectorFunction(selectScreenSize),
		title = AmpErrorScreenTitle.title,
		bodyText = AmpErrorScreenTitle.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = function() --[[ Line: 48 ]]
							-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), FeatureName (copy), OnCancelFunction (copy)
							SendButtonClickEventModule(AnalyticsService, "AmpErrorScreen", FeatureName, "Cancel")
							OnCancelFunction()
						end,
						text = AmpErrorScreenTitle.buttonCancel
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function() --[[ Line: 59 ]]
							-- upvalues: SendButtonClickEventModule (upval), AnalyticsService (copy), FeatureName (copy), OnRetryFunction (copy)
							SendButtonClickEventModule(AnalyticsService, "AmpErrorScreen", FeatureName, "Retry")
							OnRetryFunction()
						end,
						text = AmpErrorScreenTitle.buttonRetry
					}
				}
			}
		}
	})
end