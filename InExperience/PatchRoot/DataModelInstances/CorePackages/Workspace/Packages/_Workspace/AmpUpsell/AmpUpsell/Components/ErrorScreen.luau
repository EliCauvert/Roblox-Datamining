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

local function selectScreenSize(p0) --[[ line: 19 ]]
	return p0.ScreenSize
end

return function(p1) --[[ line: 23 | named "ErrorScreen" ]]
	-- upvalues: useLocalization (ref), analyticsServiceModule (ref), useSelector (ref), selectScreenSize (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref), sendButtonClickEventModule (ref)
	local onRetry = p1.onRetry
	local onCancel = p1.onCancel
	local featureName = p1.featureName
	local var6 = useLocalization({
		title = "Amp.ErrorScreen.Title",
		bodyText = "Amp.ErrorScreen.BodyText",
		buttonRetry = "Amp.ErrorScreen.Retry",
		buttonCancel = "Amp.ErrorScreen.Cancel"
	})
	local var7 = if p1.analyticsService then p1.analyticsService else analyticsServiceModule.EventStream
	
	return reactModule.createElement(interactiveAlert, {
		anchorPoint = Vector2.new(0.5, 0.5),
		position = UDim2.new(0.5, 0, 0.5, 0),
		screenSize = useSelector(selectScreenSize),
		title = var6.title,
		bodyText = var6.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						isDisabled = false,
						onActivated = function() --[[ line: 48 ]]
							-- upvalues: sendButtonClickEventModule (copy), var7 (ref), featureName (ref), onCancel (ref)
							sendButtonClickEventModule(var7, "AmpErrorScreen", featureName, "Cancel")
							onCancel()
						end,
						text = var6.buttonCancel
					}
				},
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = false,
						onActivated = function() --[[ line: 59 ]]
							-- upvalues: sendButtonClickEventModule (copy), var7 (ref), featureName (ref), onRetry (ref)
							sendButtonClickEventModule(var7, "AmpErrorScreen", featureName, "Retry")
							onRetry()
						end,
						text = var6.buttonRetry
					}
				}
			}
		}
	})
end