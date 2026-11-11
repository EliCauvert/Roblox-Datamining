local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AppPageModule = require(Modules.LuaApp.AppPage)
local ClearNativePurchaseResultModule = require(Modules.LuaApp.Actions.ClearNativePurchaseResult)
local ApiFetchRobuxProductModule = require(Modules.LuaApp.Thunks.Economy.ApiFetchRobuxProduct)
local ApiFetchRobuxProductWithItemInfoModule = require(Modules.LuaApp.Thunks.Economy.ApiFetchRobuxProductWithItemInfo)
local ApiFetchIAPPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiFetchIAPPurchaseWarning)
local ApiPostAckPurchaseWarningModule = require(Modules.LuaApp.Thunks.ApiPostAckPurchaseWarning)
local OpenNativePurchaseModule = require(Modules.LuaApp.Thunks.Economy.OpenNativePurchase)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateDownToSecuritySettingsModule = require(Modules.LuaApp.Thunks.NavigateDownToSecuritySettings)
local RenderChallengeModule = require(Modules.LuaApp.Thunks.Challenge.RenderChallenge)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local ApiPostCheckUserPurchaseSettingsModule = require(Modules.LuaApp.Thunks.ApiPostCheckUserPurchaseSettings)
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local GetFStringVNGTosUrlFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringVNGTosUrl
local GetFFlagOpenVngTosForVngRobuxUpsellFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagOpenVngTosForVngRobuxUpsell
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(Callback)
	-- upvalues: ApiFetchRobuxProductWithItemInfoModule (copy), ApiFetchRobuxProductModule (copy), ApiFetchIAPPurchaseWarningModule (copy), ApiPostAckPurchaseWarningModule (copy), SetCentralOverlayModule (copy), ClearNativePurchaseResultModule (copy), OpenNativePurchaseModule (copy), GetFFlagOpenVngTosForVngRobuxUpsellFunction (copy), GetAppFeaturePoliciesFunction (copy), AppPageModule (copy), GetFStringVNGTosUrlFunction (copy), UrlBuilderModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), NavigateDownToSecuritySettingsModule (copy), OpenPurchaseRobuxPageModule (copy), RenderChallengeModule (copy), ApiPostCheckUserPurchaseSettingsModule (copy)
	return {
		dispatchFetchRobuxProduct = function(p1, p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), ApiFetchRobuxProductWithItemInfoModule (upval), ApiFetchRobuxProductModule (upval)
			return if p6 == nil or p4 == nil or p5 == nil then Callback(ApiFetchRobuxProductModule(p1, p2, p3)) else Callback(ApiFetchRobuxProductWithItemInfoModule(p1, p2, p3, p4, p5, p6))
		end,
		dispatchFetchIAPPurchaseWarning = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), ApiFetchIAPPurchaseWarningModule (upval)
			return Callback(ApiFetchIAPPurchaseWarningModule.Fetch(p1, p2, p3, p4))
		end,
		dispatchPostAckPurchaseWarning = function(p1, p2)
			-- upvalues: Callback (copy), ApiPostAckPurchaseWarningModule (upval)
			return Callback(ApiPostAckPurchaseWarningModule.Post(p1, p2))
		end,
		dispatchCentralOverlay = function(p1, p2)
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval)
			return Callback(SetCentralOverlayModule(p1, p2))
		end,
		endPurchase = function()
			-- upvalues: Callback (copy), ClearNativePurchaseResultModule (upval)
			Callback(ClearNativePurchaseResultModule())
		end,
		promptRobux = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), OpenNativePurchaseModule (upval)
			Callback(OpenNativePurchaseModule(p1, p2, p3, p4))
		end,
		openTermsOfUse = function()
			-- upvalues: GetFFlagOpenVngTosForVngRobuxUpsellFunction (upval), GetAppFeaturePoliciesFunction (upval), AppPageModule (upval), GetFStringVNGTosUrlFunction (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local ShowVNGTosForRobuxUpsell = GetFFlagOpenVngTosForVngRobuxUpsellFunction() and GetAppFeaturePoliciesFunction().getShowVNGTosForRobuxUpsell()
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = if ShowVNGTosForRobuxUpsell then GetFStringVNGTosUrlFunction() else UrlBuilderModule.static.about.terms(),
				extraProps = { title = "" }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		openSecuritySettings = function()
			-- upvalues: Callback (copy), NavigateDownToSecuritySettingsModule (upval)
			Callback(NavigateDownToSecuritySettingsModule())
		end,
		openBuyRobux = function(p1)
			-- upvalues: Callback (copy), OpenPurchaseRobuxPageModule (upval)
			return Callback(OpenPurchaseRobuxPageModule(nil, p1))
		end,
		renderChallenge = function(p1, p2)
			-- upvalues: Callback (copy), RenderChallengeModule (upval)
			return Callback(RenderChallengeModule(p1, p2))
		end,
		dispatchCheckUserPurchaseSettings = function(p1)
			-- upvalues: Callback (copy), ApiPostCheckUserPurchaseSettingsModule (upval)
			return Callback(ApiPostCheckUserPurchaseSettingsModule.Post(p1))
		end,
		openSettingsPage = function()
			-- upvalues: AppPageModule (upval), UrlBuilderModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.SettingsSubPage,
				detail = UrlBuilderModule.static.settings.billing(),
				extraProps = {
					titleKey = "Feature.AccountSettings.Heading.Tab.Spending"
				}
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else Callback(NavigateDownModule(config))
		end
	}
end