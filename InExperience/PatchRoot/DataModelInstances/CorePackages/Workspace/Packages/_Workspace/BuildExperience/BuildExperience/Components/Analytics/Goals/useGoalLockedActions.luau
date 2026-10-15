local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local goalLockedActionIdModule = require(buildExperience.Analytics.Goals.GoalLockedActionId)
local buildNavigationParamsModule = require(buildExperience.utils.BuildNavigationParams)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local getAdsManagerUrl = require(buildExperience.Components.Ads.getAdsManagerUrl).getAdsManagerUrl
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local var1 = urlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products")

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useOpenWebView (ref), navigationModule (ref), buildNavigationParamsModule (ref), useExperienceShareFlowModule (ref), reactModule (ref), goalLockedActionIdModule (ref), getAdsManagerUrl (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var1 (ref)
	local var2 = useLocalization({
		adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER,
		creatorHub = localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	})
	local var3 = useOpenWebView()
	local var4 = navigationModule.useNavigation()
	local var5 = if var4 ~= nil then nil else buildNavigationParamsModule.getTarget(var4)
	local var6 = useExperienceShareFlowModule(p1, if var5 ~= nil then nil else var5.placeId)
	local onShare = var6.onShare
	local adsManager = var2.adsManager
	local creatorHub = var2.creatorHub
	
	return {
		onLockedAction = reactModule.useCallback(function(p2)
			-- upvalues: goalLockedActionIdModule (copy), var3 (ref), getAdsManagerUrl (copy), p1 (ref), adsManager (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var4 (ref), var5 (ref), var1 (copy), creatorHub (ref), onShare (ref)
			if p2 == goalLockedActionIdModule.CreateAd then
				var3(getAdsManagerUrl(p1), adsManager)
				
				return
			elseif p2 == goalLockedActionIdModule.SellItems then
				if fFlagBuildExperienceMonetizationNativeUIModule and var4 ~= nil and var5 ~= nil then
					var4.navigate("BuildMonetization", { target = var5 })
					
					return
				end
				var3(var1({ universeId = p1 }), creatorHub)
				
				return
			elseif p2 == goalLockedActionIdModule.ShareWithFriends then
				onShare()
			end
		end, {
			p1, var4, var5, onShare, var3, adsManager, creatorHub
		}),
		shareFlow = var6
	}
end