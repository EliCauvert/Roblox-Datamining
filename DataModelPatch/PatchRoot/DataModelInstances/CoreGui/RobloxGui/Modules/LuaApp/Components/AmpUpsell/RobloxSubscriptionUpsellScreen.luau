local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local FFlagRobloxPlusFAEFreeTrial = RobloxSubscriptionPurchaseAppModule.FFlagRobloxPlusFAEFreeTrial
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation

return function(p1)
	-- upvalues: FFlagRobloxPlusFAEFreeTrial (copy), UseNavigationFunction (copy), ReactModule (copy), RobloxSubscriptionPurchaseAppModule (copy), RobloxSubscriptionFlowCompleteReason (copy), SurfaceName (copy), SurfaceContext (copy)
	local UseNavigationResult = if FFlagRobloxPlusFAEFreeTrial then UseNavigationFunction() else nil
	ReactModule.useEffect(function()
		-- upvalues: RobloxSubscriptionPurchaseAppModule (upval), p1 (copy), FFlagRobloxPlusFAEFreeTrial (upval), RobloxSubscriptionFlowCompleteReason (upval), UseNavigationResult (copy), SurfaceName (upval), SurfaceContext (upval)
		local InitiateRobloxSubscriptionPurchaseResult = RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(p1.purchaseUIOptions, {
			onCtaOverride = if FFlagRobloxPlusFAEFreeTrial then p1.onCtaOverride else nil,
			onFlowComplete = function(UpsellPurchaseFailed)
				-- upvalues: RobloxSubscriptionFlowCompleteReason (upval), p1 (upval), FFlagRobloxPlusFAEFreeTrial (upval), UseNavigationResult (upval)
				if UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
					if p1.onSuccess then
						p1.onSuccess()
						
						return
					end
					if FFlagRobloxPlusFAEFreeTrial then
						UseNavigationResult.goBack()
						
						return
					end
				elseif UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
					if p1.onFailure then
						p1.onFailure()
						
						return
					end
					if p1.onCancel then
						p1.onCancel()
						
						return
					end
					if FFlagRobloxPlusFAEFreeTrial then
						UseNavigationResult.goBack()
						
						return
					end
				elseif p1.onCancel then
					p1.onCancel()
					
					return
				else
					if FFlagRobloxPlusFAEFreeTrial then
						UseNavigationResult.goBack()
					end
				end
			end
		}, nil, p1.surfaceName or SurfaceName.Unspecified, p1.surfaceContext or SurfaceContext.Unspecified)
		
		return function()
			-- upvalues: InitiateRobloxSubscriptionPurchaseResult (copy)
			if InitiateRobloxSubscriptionPurchaseResult then
				InitiateRobloxSubscriptionPurchaseResult()
			end
		end
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, {})
end