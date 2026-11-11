local GetFFlagUADesktopPurchaseWarningsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings)
local GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy

return function(p1, p2)
	-- upvalues: GetFFlagUADesktopPurchaseWarningsModule (copy), GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (copy)
	local LocalUserId = p1.LocalUserId
	
	return {
		screenSize = p1.ScreenSize,
		iapPurchase = p1.NativePurchase,
		userId = LocalUserId,
		isPremium = if GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction() then if GetFFlagUADesktopPurchaseWarningsModule() then p2.enablePremiumUserFeatures and (p1.Users[LocalUserId] and p1.Users[LocalUserId].membership == Enum.MembershipType.Premium) else nil elseif GetFFlagUADesktopPurchaseWarningsModule() then p1.Users[LocalUserId] and p1.Users[LocalUserId].membership == Enum.MembershipType.Premium else nil
	}
end