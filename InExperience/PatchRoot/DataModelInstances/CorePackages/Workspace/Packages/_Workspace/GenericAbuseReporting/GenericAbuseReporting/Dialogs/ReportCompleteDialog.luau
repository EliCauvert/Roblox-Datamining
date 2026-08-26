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

return function(p1)
	-- upvalues: useLocalization (ref), useLocalizedStringsModule (ref), useLayerCollector (ref), reactModule (ref), interactiveAlert (ref), MODAL_POSITION_OFFSETModule (ref), buttonType (ref)
	local localizationKeys = p1.localizationKeys and useLocalization(p1.localizationKeys) or useLocalizedStringsModule()
	local var1 = useLayerCollector()
	local absoluteSize = var1.absoluteSize
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y - var1.insets.top),
		title = localizationKeys.completeTitle,
		bodyText = localizationKeys.completeDescription,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, var1.insets.top + MODAL_POSITION_OFFSETModule),
		buttonStackInfo = p1.buttonStackInfo or {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = p1.onDismiss,
						text = localizationKeys.completeClose
					}
				}
			}
		},
		middleContent = p1.middleContent
	})
end