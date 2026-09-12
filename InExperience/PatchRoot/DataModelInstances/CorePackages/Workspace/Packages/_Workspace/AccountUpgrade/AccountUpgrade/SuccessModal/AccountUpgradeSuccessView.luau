local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local accountUpgradeDialogModule = require(script.Parent.AccountUpgradeDialog)
local accountUpgradeIdentityHeaderModule = require(script.Parent.AccountUpgradeIdentityHeader)
local accountUpgradeDialogActionsModule = require(script.Parent.AccountUpgradeDialogActions)
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), buttonVariant (ref), reactModule (ref), view (ref), accountUpgradeIdentityHeaderModule (ref), text (ref), accountUpgradeDialogActionsModule (ref), accountUpgradeDialogModule (ref)
	local var1 = useLocalization({
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
	
	return reactModule.createElement(accountUpgradeDialogModule, {
		testId = "account-upgrade-success-dialog",
		hasBackdrop = p1.hasBackdrop,
		children = {
			Content = reactModule.createElement(view, {
				tag = "col align-x-center gap-xxlarge size-full-0 auto-y"
			}, {
				IdentityHeader = reactModule.createElement(accountUpgradeIdentityHeaderModule, {
					LayoutOrder = 1,
					userId = p1.userId,
					displayName = p1.displayName,
					username = p1.username
				}),
				BodyAndActions = reactModule.createElement(view, {
					tag = "col align-x-center gap-xlarge size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					Body = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-left content-default",
						LayoutOrder = 1,
						testId = "account-upgrade-success-body",
						Text = if p1.didUsernameChange then var1.usernameChangedBody else var1.usernameUnchangedBody
					}),
					Actions = reactModule.createElement(accountUpgradeDialogActionsModule, {
						LayoutOrder = 2,
						buttons = if p1.didUsernameChange then {
							{
								text = var1.respawnNowText,
								variant = buttonVariant.Emphasis,
								onActivated = p1.onRespawnNow
							},
							{
								text = var1.applyLaterText,
								variant = buttonVariant.Standard,
								onActivated = p1.onApplyLater
							}
						} else {
							{
								text = var1.confirmText,
								variant = buttonVariant.Emphasis,
								onActivated = p1.onConfirm
							}
						}
					})
				})
			})
		}
	})
end