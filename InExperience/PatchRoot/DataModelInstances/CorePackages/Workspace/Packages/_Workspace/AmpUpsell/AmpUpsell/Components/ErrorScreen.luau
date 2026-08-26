local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local analyticsServiceModule = require(ampUpsell.Analytics.AnalyticsService)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local sendButtonClickEventModule = require(ampUpsell.Analytics.sendButtonClickEvent)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useLocalization (ref), analyticsServiceModule (ref), useSelector (ref), selectScreenSize (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref), sendButtonClickEventModule (ref)
	local onRetry = p1.onRetry
	local onCancel = p1.onCancel
	local featureName = p1.featureName
	local var1 = useLocalization({
		title = "Amp.ErrorScreen.Title",
		bodyText = "Amp.ErrorScreen.BodyText",
		buttonRetry = "Amp.ErrorScreen.Retry",
		buttonCancel = "Amp.ErrorScreen.Cancel"
	})
	local var2 = if p1.analyticsService then p1.analyticsService else analyticsServiceModule.EventStream
	
	return reactModule.createElement(interactiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = useSelector(selectScreenSize),
		title = var1.title,
		bodyText = var1.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = function()
							-- upvalues: sendButtonClickEventModule (copy), var2 (ref), featureName (ref), onCancel (ref)
							sendButtonClickEventModule(var2, "AmpErrorScreen", featureName, "Cancel")
							onCancel()
						end,
						text = var1.buttonCancel
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function()
							-- upvalues: sendButtonClickEventModule (copy), var2 (ref), featureName (ref), onRetry (ref)
							sendButtonClickEventModule(var2, "AmpErrorScreen", featureName, "Retry")
							onRetry()
						end,
						text = var1.buttonRetry
					}
				}
			}
		}
	})
end