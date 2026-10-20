local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local StyleModule = require(Parent.Style)
local UseIOSStatusBarStylerFunction = require(Parent.RoactUtils).Hooks.useIOSStatusBarStyler
local _ = require(AccountUpgrade.AccountUpgradeFlow)
local AccountUpgradeSurfaceModule = require(AccountUpgrade.AccountUpgradeSurface)
local _ = require(AccountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local UseAccountUpgradeViewModelModule = require(AccountUpgrade.Components.useAccountUpgradeViewModel)
local IsAccountUpgradeErrorUnrecoverableModule = require(AccountUpgrade.Utils.isAccountUpgradeErrorUnrecoverable)
local AccountUpgradePageViewModule = require(script.Parent.AccountUpgradePageView)
local View = FoundationModule.View
local Style = {
	themeName = FoundationModule.Enums.ColorMode.Dark,
	fontName = StyleModule.Constants.FontName.Gotham
}

return function(p1)
	-- upvalues: ReactModule (copy), IsAccountUpgradeErrorUnrecoverableModule (copy), UseAccountUpgradeViewModelModule (copy), AccountUpgradeSurfaceModule (copy), UseIOSStatusBarStylerFunction (copy), View (copy), StyleModule (copy), Style (copy), AccountUpgradePageViewModule (copy)
	local OnCompleteFunction = p1.onComplete
	local OnUnrecoverableFailureFunction = p1.onUnrecoverableFailure
	local UseAccountUpgradeViewModelModuleResult = UseAccountUpgradeViewModelModule({
		flow = p1.flow,
		surface = AccountUpgradeSurfaceModule.FullPage,
		currentUsername = p1.currentUsername,
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
		end, { OnUnrecoverableFailureFunction }),
		onSignOut = p1.onSignOut,
		onLegalLinkSelected = p1.onLegalLinkSelected
	})
	UseIOSStatusBarStylerFunction(true)
	
	return ReactModule.createElement(View, { tag = "size-full", testId = "AccountUpgradePageTheme" }, {
		Theme = ReactModule.createElement(StyleModule.UiModeStyleProvider, { style = Style }, {
			Page = ReactModule.createElement(AccountUpgradePageViewModule, UseAccountUpgradeViewModelModuleResult)
		})
	})
end