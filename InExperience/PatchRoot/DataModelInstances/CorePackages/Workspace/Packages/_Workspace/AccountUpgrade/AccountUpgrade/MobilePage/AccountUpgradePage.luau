local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local ReactModule = require(AccountUpgrade.Parent.React)
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeSurfaceModule = require(AccountUpgrade.AccountUpgradeSurface)
local _ = require(AccountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local UseAccountUpgradeViewModelModule = require(AccountUpgrade.Components.useAccountUpgradeViewModel)
local IsAccountUpgradeErrorUnrecoverableModule = require(AccountUpgrade.Utils.isAccountUpgradeErrorUnrecoverable)
local AccountUpgradePageViewModule = require(script.Parent.AccountUpgradePageView)

return function(p1) --[[ Line: 35 | Named "AccountUpgradePage" ]]
	-- upvalues: ReactModule (copy), IsAccountUpgradeErrorUnrecoverableModule (copy), UseAccountUpgradeViewModelModule (copy), AccountUpgradeSurfaceModule (copy), AccountUpgradePageViewModule (copy)
	local OnCompleteFunction = p1.onComplete
	local OnUnrecoverableFailureFunction = p1.onUnrecoverableFailure
	
	return ReactModule.createElement(AccountUpgradePageViewModule, (UseAccountUpgradeViewModelModule({
		flow = p1.flow,
		surface = AccountUpgradeSurfaceModule.FullPage,
		currentUsername = p1.currentUsername,
		onSignUpComplete = ReactModule.useCallback(function(p2) --[[ Line: 37 ]]
			-- upvalues: OnCompleteFunction (copy)
			if p2.isSuccess then
				OnCompleteFunction(p2)
			end
		end, { OnCompleteFunction }),
		onSignUpFailed = ReactModule.useCallback(function(p2) --[[ Line: 44 ]]
			-- upvalues: OnUnrecoverableFailureFunction (copy), IsAccountUpgradeErrorUnrecoverableModule (upval)
			if OnUnrecoverableFailureFunction and IsAccountUpgradeErrorUnrecoverableModule(p2) then
				OnUnrecoverableFailureFunction()
			end
		end, { OnUnrecoverableFailureFunction }),
		onSignOut = p1.onSignOut,
		onLegalLinkSelected = p1.onLegalLinkSelected
	})))
end