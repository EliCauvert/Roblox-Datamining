local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), Loading (copy), IconSize (copy), InteractiveAlert (copy), ButtonType (copy)
	local OnCancel = p1.onCancel
	local UseScreenSizeResult = UseScreenSizeFunction()
	local AmpFAEUpsellModalLoadingTitle = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.Loading.Title",
		bodyText = "Amp.FAEUpsell.Modal.Loading.Text",
		cancelBtn = "Amp.FAEUpsell.Modal.Loading.ButtonCancel"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = AmpFAEUpsellModalLoadingTitle.title,
		bodyText = AmpFAEUpsellModalLoadingTitle.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = OnCancel,
						text = AmpFAEUpsellModalLoadingTitle.cancelBtn
					}
				}
			}
		},
		middleContent = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), Loading (upval), IconSize (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80)
			}, {
				Spinner = ReactModule.createElement(Loading, {
					size = IconSize.Medium,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end, {})
	})
end