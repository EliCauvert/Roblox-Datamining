local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchIAPProductsModule = require(Modules.LuaApp.Thunks.ApiFetchIAPProducts)
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local RobuxPackageModule = require(script.Parent.RobuxPackage)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local GetFFlagLuaAppEnableNativeRobuxProductsModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppEnableNativeRobuxProducts)
local GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy

return function(p1, p2)
	-- upvalues: IsTenFootInterface (copy), IsVRAppBuildFunction (copy), GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (copy), RobuxPackageModule (copy), RetrievalStatusModule (copy), GetFFlagLuaAppEnableNativeRobuxProductsModule (copy), ApiFetchIAPProductsModule (copy)
	local LocalUserId = p1.LocalUserId
	local IsMembershipMatch: boolean = if GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction() then p2.enablePremiumUserFeatures ~= nil and (p2.enablePremiumUserFeatures and (p1.Users[LocalUserId] and p1.Users[LocalUserId].membership == Enum.MembershipType.Premium)) else not IsTenFootInterface and (not IsVRAppBuildFunction() and (p1.Users[LocalUserId] and p1.Users[LocalUserId].membership == Enum.MembershipType.Premium))
	local FormatIapProductsResult = RobuxPackageModule.formatIapProducts(if IsMembershipMatch then p1.IAPProducts.PremiumRobux else p1.IAPProducts.Robux)
	local Done = RetrievalStatusModule.Done
	
	if GetFFlagLuaAppEnableNativeRobuxProductsModule() then
		if p1.NativeRobuxProducts.Products ~= nil then
			FormatIapProductsResult = RobuxPackageModule.formatNativeRobuxProducts(p1.NativeRobuxProducts.Products)
		end
		Done = p1.NativeRobuxProducts.FetchingStatus
	end
	return {
		screenSize = p1.ScreenSize,
		iapPurchase = p1.NativePurchase,
		userId = LocalUserId,
		isPremium = IsMembershipMatch,
		robuxBalance = p1.UserRobux[LocalUserId],
		robuxPackages = FormatIapProductsResult,
		iapProductsFetchingStatus = ApiFetchIAPProductsModule.GetFetchingStatus(p1),
		nativeProductsFetchingStatus = Done
	}
end