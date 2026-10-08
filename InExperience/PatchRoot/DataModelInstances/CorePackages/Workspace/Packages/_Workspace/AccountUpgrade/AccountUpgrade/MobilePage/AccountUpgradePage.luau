local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local reactModule = require(accountUpgrade.Parent.React)
local _ = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradeSurfaceModule = require(accountUpgrade.AccountUpgradeSurface)
local _ = require(accountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local useAccountUpgradeViewModelModule = require(accountUpgrade.Components.useAccountUpgradeViewModel)
local isAccountUpgradeErrorUnrecoverableModule = require(accountUpgrade.Utils.isAccountUpgradeErrorUnrecoverable)
local accountUpgradePageViewModule = require(script.Parent.AccountUpgradePageView)

return function(p1)
	-- upvalues: reactModule (ref), isAccountUpgradeErrorUnrecoverableModule (ref), useAccountUpgradeViewModelModule (ref), accountUpgradeSurfaceModule (ref), accountUpgradePageViewModule (ref)
	local onComplete = p1.onComplete
	local onUnrecoverableFailure = p1.onUnrecoverableFailure
	
	return reactModule.createElement(accountUpgradePageViewModule, useAccountUpgradeViewModelModule({
		flow = p1.flow,
		surface = accountUpgradeSurfaceModule.FullPage,
		currentUsername = p1.currentUsername,
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
		end, { onUnrecoverableFailure }),
		onSignOut = p1.onSignOut
	}))
end