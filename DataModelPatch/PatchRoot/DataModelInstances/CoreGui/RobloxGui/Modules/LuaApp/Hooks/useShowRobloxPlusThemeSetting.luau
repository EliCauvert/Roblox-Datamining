local CorePackages = game:GetService("CorePackages")
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)

return function()
	-- upvalues: UseAppPolicyFunction (copy), RobloxSubscriptionPurchaseAppModule (copy), UseSignalStateFunction (copy)
	return {
		isRobloxPlusUpsellEligible = UseAppPolicyFunction(function(p1)
			local GetAccountTypeFunction = p1.getAccountType
			
			return if GetAccountTypeFunction then GetAccountTypeFunction() else nil
		end) ~= "Kids",
		hasRobloxPlusSubscription = UseSignalStateFunction(RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals.get().getHasRobloxSubscription) == true
	}
end