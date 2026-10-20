local Parent = script:FindFirstAncestor("AccountUpgrade").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AccountUpgradeDialogModule = require(script.Parent.AccountUpgradeDialog)
local AccountUpgradeIdentityHeaderModule = require(script.Parent.AccountUpgradeIdentityHeader)
local AccountUpgradeDialogActionsModule = require(script.Parent.AccountUpgradeDialogActions)
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ButtonVariant (copy), ReactModule (copy), View (copy), AccountUpgradeIdentityHeaderModule (copy), Text (copy), AccountUpgradeDialogActionsModule (copy), AccountUpgradeDialogModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		respawnNowText = "Authentication.SignUp.Action.RespawnNow",
		applyLaterText = "Authentication.SignUp.Action.ApplyOnNextRespawn",
		confirmText = "CommonUI.Controls.Action.OK",
		usernameChangedBody = {
			"Authentication.SignUp.Description.UsernameChanged",
			platform = p1.linkedAccountType
		},
		usernameUnchangedBody = {
			"Authentication.SignUp.Description.UsernameUnchanged",
			platform = p1.linkedAccountType
		}
	})
	local IsCanRespawn: boolean = p1.didUsernameChange and p1.canRespawn ~= false
	
	return ReactModule.createElement(AccountUpgradeDialogModule, {
		testId = "account-upgrade-success-dialog",
		hasBackdrop = p1.hasBackdrop,
		children = {
			Content = ReactModule.createElement(View, {
				tag = "col align-x-center gap-xxlarge size-full-0 auto-y"
			}, {
				IdentityHeader = ReactModule.createElement(AccountUpgradeIdentityHeaderModule, {
					LayoutOrder = 1,
					userId = p1.userId,
					displayName = p1.displayName,
					username = p1.username
				}),
				BodyAndActions = ReactModule.createElement(View, {
					tag = "col align-x-center gap-xlarge size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Body = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
						LayoutOrder = 1,
						testId = "account-upgrade-success-body",
						Text = if IsCanRespawn then UseLocalizationResult.usernameChangedBody else UseLocalizationResult.usernameUnchangedBody
					}),
					Actions = ReactModule.createElement(AccountUpgradeDialogActionsModule, {
						LayoutOrder = 2,
						buttons = if IsCanRespawn then {
							{
								text = UseLocalizationResult.respawnNowText,
								variant = ButtonVariant.Emphasis,
								onActivated = p1.onRespawnNow
							},
							{
								text = UseLocalizationResult.applyLaterText,
								variant = ButtonVariant.Standard,
								onActivated = p1.onApplyLater
							}
						} else {
							{
								text = UseLocalizationResult.confirmText,
								variant = ButtonVariant.Emphasis,
								onActivated = p1.onConfirm
							}
						}
					})
				})
			})
		}
	})
end