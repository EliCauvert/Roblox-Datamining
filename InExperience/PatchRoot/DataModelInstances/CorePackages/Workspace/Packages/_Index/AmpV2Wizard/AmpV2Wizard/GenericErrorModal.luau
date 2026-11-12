local Parent = script:FindFirstAncestor("AmpV2Wizard").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Parents.Title.SomethingWentWrong",
		close = "Common.VerifiedParentalConsent.Action.Close"
	})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small, onClose = p1.onClose }, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			orientation = Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.close,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onClose
				}
			}
		})
	})
end