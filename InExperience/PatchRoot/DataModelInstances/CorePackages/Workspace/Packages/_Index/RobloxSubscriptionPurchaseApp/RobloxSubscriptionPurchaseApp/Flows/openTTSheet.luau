local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxPlusSheetKindModule = require(RobloxSubscriptionPurchaseApp.Enums.RobloxPlusSheetKind)
local RobloxSubscriptionFlowCompleteReasonModule = require(RobloxSubscriptionPurchaseApp.Enums.RobloxSubscriptionFlowCompleteReason)
local SurfaceContextModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local InitiateRobloxSubscriptionPurchaseModule = require(RobloxSubscriptionPurchaseApp.Flows.initiateRobloxSubscriptionPurchase)

return function(Callback, p1, p2)
	-- upvalues: InitiateRobloxSubscriptionPurchaseModule (copy), RobloxPlusSheetKindModule (copy), RobloxSubscriptionFlowCompleteReasonModule (copy), SurfaceNameModule (copy), SurfaceContextModule (copy)
	return InitiateRobloxSubscriptionPurchaseModule({ sheetKind = RobloxPlusSheetKindModule.TT }, {
		onFlowComplete = function(UpsellPurchaseSucceeded)
			-- upvalues: Callback (copy), RobloxSubscriptionFlowCompleteReasonModule (upval)
			if Callback and UpsellPurchaseSucceeded == RobloxSubscriptionFlowCompleteReasonModule.UpsellPurchaseSucceeded then
				Callback()
			end
		end
	}, nil, p1 or SurfaceNameModule.TTGrantSheet, p2 or SurfaceContextModule.InApp)
end