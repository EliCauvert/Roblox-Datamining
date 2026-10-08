local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local reactModule = require(accountUpgrade.Parent.React)
local _ = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradeContainerModule = require(accountUpgrade.Components.AccountUpgradeContainer)
local isAccountUpgradeErrorUnrecoverableModule = require(accountUpgrade.Utils.isAccountUpgradeErrorUnrecoverable)

return function(p1)
	-- upvalues: reactModule (ref), isAccountUpgradeErrorUnrecoverableModule (ref), accountUpgradeContainerModule (ref)
	local onComplete = p1.onComplete
	local onUnrecoverableFailure = p1.onUnrecoverableFailure
	
	return reactModule.createElement(accountUpgradeContainerModule, {
		flow = p1.flow,
		currentUsername = p1.currentUsername,
		hasBackdrop = p1.hasBackdrop,
		onClose = p1.onDismiss,
		onSignOut = p1.onSignOut,
		onSignUpComplete = reactModule.useCallback(function(p2)
			-- upvalues: onComplete (ref)
			if p2.isSuccess then
				onComplete(p2)
			end
		end, { onComplete }),
		onSignUpFailed = reactModule.useCallback(function(p2)
			-- upvalues: onUnrecoverableFailure (ref), isAccountUpgradeErrorUnrecoverableModule (copy)
			if onUnrecoverableFailure and isAccountUpgradeErrorUnrecoverableModule(p2) then
				onUnrecoverableFailure()
			end
		end, { onUnrecoverableFailure })
	})
end