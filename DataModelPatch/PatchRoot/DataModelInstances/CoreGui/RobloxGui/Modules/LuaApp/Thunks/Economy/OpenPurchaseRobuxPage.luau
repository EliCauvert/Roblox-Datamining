local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateDownToExternalVngShopModule = require(Modules.LuaApp.Thunks.Economy.NavigateDownToExternalVngShop)
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local GetPaymentPlatformModule = require(Modules.LuaApp.Util.getPaymentPlatform)
local PaymentPlatformModule = require(Modules.LuaApp.Enum.PaymentPlatform)
local PurchasingPerformanceModule = require(CorePackages.Workspace.Packages.PurchasingPerformance)
local BuyRobuxPageTTIManager = PurchasingPerformanceModule.BuyRobuxPageTTIManager
local FFlagEnableBuyRobuxPageTTI = PurchasingPerformanceModule.Flags.FFlagEnableBuyRobuxPageTTI
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, AnalyticId)
	-- upvalues: GetPaymentPlatformModule (copy), GetAppFeaturePoliciesFunction (copy), PaymentPlatformModule (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), NavigateDownToExternalVngShopModule (copy), FFlagEnableBuyRobuxPageTTI (copy), BuyRobuxPageTTIManager (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return function(p3)
		-- upvalues: GetPaymentPlatformModule (upval), GetAppFeaturePoliciesFunction (upval), PaymentPlatformModule (upval), OpenCentralOverlayForLeaveRobloxAlertModule (upval), NavigateDownToExternalVngShopModule (upval), p1 (copy), p2 (copy), FFlagEnableBuyRobuxPageTTI (upval), BuyRobuxPageTTIManager (upval), AppPageModule (upval), AnalyticId (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local PaymentPlatformModule1 = GetPaymentPlatformModule()
		
		if GetAppFeaturePoliciesFunction().getRedirectBuyRobuxToVNG() and PaymentPlatformModule1 == PaymentPlatformModule.Web then
			p3:dispatch(OpenCentralOverlayForLeaveRobloxAlertModule(function()
				-- upvalues: p3 (copy), NavigateDownToExternalVngShopModule (upval), p1 (upval), p2 (upval)
				p3:dispatch(NavigateDownToExternalVngShopModule(p1, p2))
			end))
			
			return
		end
		if FFlagEnableBuyRobuxPageTTI then
			BuyRobuxPageTTIManager.startTracking()
		end
		local config = {
			name = AppPageModule.PurchaseRobux,
			extraProps = { analyticId = AnalyticId }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p3:dispatch(NavigateDownModule(config))
		end
	end
end