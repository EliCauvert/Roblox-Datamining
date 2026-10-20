local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local ReactModule = require(AccountUpgrade.Parent.React)
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeContainerModule = require(AccountUpgrade.Components.AccountUpgradeContainer)
local _ = require(AccountUpgrade.Components.useAccountUpgradeViewModel)
local IsAccountUpgradeErrorUnrecoverableModule = require(AccountUpgrade.Utils.isAccountUpgradeErrorUnrecoverable)

return function(p1)
	-- upvalues: ReactModule (copy), IsAccountUpgradeErrorUnrecoverableModule (copy), AccountUpgradeContainerModule (copy)
	local OnCompleteFunction = p1.onComplete
	local OnUnrecoverableFailureFunction = p1.onUnrecoverableFailure
	
	return ReactModule.createElement(AccountUpgradeContainerModule, {
		flow = p1.flow,
		currentUsername = p1.currentUsername,
		hasBackdrop = p1.hasBackdrop,
		onClose = p1.onDismiss,
		onSignOut = p1.onSignOut,
		onLegalLinkSelected = p1.onLegalLinkSelected,
		onSignUpComplete = ReactModule.useCallback(function(p2)
			-- upvalues: OnCompleteFunction (copy)
			if p2.isSuccess then
				OnCompleteFunction(p2)
			end
		end, { OnCompleteFunction }),
		onSignUpFailed = ReactModule.useCallback(function(p2)
			-- upvalues: OnUnrecoverableFailureFunction (copy), IsAccountUpgradeErrorUnrecoverableModule (upval)
			if OnUnrecoverableFailureFunction and IsAccountUpgradeErrorUnrecoverableModule(p2) then
				OnUnrecoverableFailureFunction()
			end
		end, { OnUnrecoverableFailureFunction })
	})
end