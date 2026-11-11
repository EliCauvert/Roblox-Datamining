local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local _ = require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)
local EdpStoreAnalyticsModule = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalyticsModule.Constants
local GetFFlagEnableEdpStoreClickLoggingModule = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableDevSubsInRobuxModule = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(SubscriptionPurchaseProductInfo, ThumbnailString, IsSubScribed, CreatorName, CreatorVerified)
	-- upvalues: GetFFlagEnableEdpStoreClickLoggingModule (copy), EdpStoreAnalyticsModule (copy), Constants (copy), AppPageModule (copy), GetFFlagEnableDevSubsInRobuxModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	if GetFFlagEnableEdpStoreClickLoggingModule() then
		EdpStoreAnalyticsModule.EdpStoreAnalyticsLogger.logEvent(Constants.StoreEnums.ActionType.ItemClick, Constants.StoreEnums.ProductType.Subscriptions, Constants.StoreEnums.LocationType.Store, tonumber(SubscriptionPurchaseProductInfo.subscriptionProviderId), tonumber(SubscriptionPurchaseProductInfo.subscriptionTargetKey), (tostring(SubscriptionPurchaseProductInfo.subscriptionTargetKey)))
	end
	return function(p1)
		-- upvalues: AppPageModule (upval), SubscriptionPurchaseProductInfo (copy), ThumbnailString (copy), IsSubScribed (copy), GetFFlagEnableDevSubsInRobuxModule (upval), CreatorName (copy), CreatorVerified (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownModule (upval)
		local config = {
			detail = "",
			name = AppPageModule.SubscriptionPurchase,
			extraProps = {
				subscriptionPurchaseProductInfo = SubscriptionPurchaseProductInfo,
				thumbnailString = ThumbnailString,
				isSubScribed = IsSubScribed,
				isSubscribed = GetFFlagEnableDevSubsInRobuxModule() and IsSubScribed,
				creatorName = CreatorName,
				creatorVerified = CreatorVerified
			}
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownModule(config))
		end
	end
end