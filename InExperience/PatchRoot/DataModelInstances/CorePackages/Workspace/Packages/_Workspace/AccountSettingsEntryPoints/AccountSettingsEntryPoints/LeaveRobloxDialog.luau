local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent1.ReactFocusNavigation)
local TranslateModule = require(Parent.translate)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior

return function(p1)
	-- upvalues: UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseDefaultFocusBehaviorFunction (copy), TranslateModule (copy), ButtonVariant (copy), ReactModule (copy), Dialog (copy)
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	})))
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		testId = "--account-settings-leave-roblox-dialog",
		ref = UseDefaultFocusBehaviorResult2,
		onClose = p1.onCancel
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			text = TranslateModule("Feature.GameDetails.Message.LeavingRobloxTitle")
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			DialogText = ReactModule.createElement(Dialog.Text, {
				Text = TranslateModule("Feature.GameDetails.Message.ExternalLinkWarning")
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = TranslateModule("Feature.GamePage.LabelCancelField"),
					variant = ButtonVariant.Standard,
					onActivated = p1.onCancel
				},
				{
					text = TranslateModule("Feature.GameDetails.Action.Continue"),
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onContinue,
					ref = UseDefaultFocusBehaviorResult
				}
			}
		})
	})
end