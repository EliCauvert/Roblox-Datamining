local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalizedStringsModule = require(genericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local MODAL_POSITION_OFFSETModule = require(genericAbuseReporting.Common.MODAL_POSITION_OFFSET)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector

return function(p0) --[[ line: 37 | named "ReportFailedDialog" ]]
	-- upvalues: useLocalization (ref), useLocalizedStringsModule (ref), useLayerCollector (ref), reactModule (ref), interactiveAlert (ref), MODAL_POSITION_OFFSETModule (ref), buttonType (ref)
	local localizationKeys = p0.localizationKeys and useLocalization(p0.localizationKeys) or useLocalizedStringsModule()
	local var6 = useLayerCollector()
	local absoluteSize = var6.absoluteSize
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y - var6.insets.top),
		title = localizationKeys.failedTitle,
		bodyText = localizationKeys.failedDescription,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, var6.insets.top + MODAL_POSITION_OFFSETModule),
		buttonStackInfo = p0.buttonStackInfo or {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p0.onDismiss,
						text = localizationKeys.failedClose
					}
				}
			}
		},
		middleContent = p0.middleContent
	})
end