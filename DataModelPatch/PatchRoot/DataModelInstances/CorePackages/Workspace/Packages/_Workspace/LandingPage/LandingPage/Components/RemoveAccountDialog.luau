local Parent = script:FindFirstAncestor("LandingPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetFFlagEnableManageAccountsRedesignFunction = require(Parent.SharedFlags).GetFFlagEnableManageAccountsRedesign
local GetFFlagEnableAccountSwitcherSignedOutAccountsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountSwitcherSignedOutAccounts

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagEnableAccountSwitcherSignedOutAccountsFunction (copy), GetFFlagEnableManageAccountsRedesignFunction (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), FoundationModule (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		removeAccount = "Authentication.AccountPicker.Label.RemoveAccount",
		removeAllAccounts = "Authentication.AccountSwitch.Action.RemoveAllAccounts",
		cancel = "Authentication.AccountPicker.Label.RemoveAccountCancel",
		remove = "Authentication.AccountPicker.Label.RemoveAccountRemove",
		["continue"] = "Authentication.AccountSwitch.Action.Continue",
		removeAccountDescription = "Authentication.AccountPicker.Label.RemoveAccountDescription",
		removeAllAccountsDescription = "Authentication.AccountSwitch.Description.RemoveAllAccounts",
		removeCurrentAccountHeader = "Authentication.AccountSwitch.Header.RemoveCurrentAccount",
		removeCurrentAccountDescription = "Authentication.AccountSwitch.Description.RemoveCurrentAccount"
	})
	
	if not GetFFlagEnableAccountSwitcherSignedOutAccountsFunction() then
		p1.hideAllAccounts = false
	end
	local RemoveAllAccounts = nil
	local RemoveAllAccountsDescription = nil
	local Continue = nil
	if p1.hideAllAccounts and GetFFlagEnableManageAccountsRedesignFunction() then
		RemoveAllAccounts = UseLocalizationResult.removeAllAccounts
		RemoveAllAccountsDescription = UseLocalizationResult.removeAllAccountsDescription
		Continue = UseLocalizationResult["continue"]
	elseif p1.isCurrentUser and GetFFlagEnableManageAccountsRedesignFunction() then
		RemoveAllAccounts = UseLocalizationResult.removeCurrentAccountHeader
		RemoveAllAccountsDescription = UseLocalizationResult.removeCurrentAccountDescription
		Continue = UseLocalizationResult.remove
	else
		RemoveAllAccounts = UseLocalizationResult.removeAccount
		RemoveAllAccountsDescription = UseLocalizationResult.removeAccountDescription
		Continue = UseLocalizationResult.remove
	end
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = DialogSize.Small,
		disablePortal = not GetFFlagEnableManageAccountsRedesignFunction(),
		onClose = if GetFFlagEnableManageAccountsRedesignFunction() then nil else function(_)
			-- upvalues: p1 (copy)
			p1.onClose()
		end or nil
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = RemoveAllAccounts }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogView = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-xy items-start gap-medium" }, {
				DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = RemoveAllAccountsDescription })
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = Orientation.Vertical,
			actions = {
				{
					text = Continue,
					variant = ButtonVariant.Alert,
					onActivated = p1.onRemove
				},
				{
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					onActivated = p1.onClose
				}
			}
		})
	})
end