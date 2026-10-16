local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalizedStringsModule = require(GenericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local MODALPOSITIONOFFSETModule = require(GenericAbuseReporting.Common.MODAL_POSITION_OFFSET)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector

return function(p1) --[[ Line: 37 | Named "ReportFailedDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), UseLocalizedStringsModule (copy), UseLayerCollectorFunction (copy), ReactModule (copy), InteractiveAlert (copy), MODALPOSITIONOFFSETModule (copy), ButtonType (copy)
	local UseLocalizationResult = p1.localizationKeys and UseLocalizationFunction(p1.localizationKeys) or UseLocalizedStringsModule()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local AbsoluteSize = UseLayerCollectorResult.absoluteSize
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = Vector2.new(AbsoluteSize.X, AbsoluteSize.Y - UseLayerCollectorResult.insets.top),
		title = UseLocalizationResult.failedTitle,
		bodyText = UseLocalizationResult.failedDescription,
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, UseLayerCollectorResult.insets.top + MODALPOSITIONOFFSETModule),
		buttonStackInfo = p1.buttonStackInfo or {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = p1.onDismiss,
						text = UseLocalizationResult.failedClose
					}
				}
			}
		},
		middleContent = p1.middleContent
	})
end