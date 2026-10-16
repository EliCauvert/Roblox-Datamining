local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local GoalLockedActionIdModule = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local GetAdsManagerUrlFunction = require(BuildExperience.Components.Ads.getAdsManagerUrl).getAdsManagerUrl
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseExperienceShareFlowModule = require(BuildExperience.utils.useExperienceShareFlow)
local DeveloperProducts = require(Parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products")

return function(UniverseId) --[[ Line: 29 | Named "useGoalLockedActions" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), NavigationModule (copy), BuildNavigationParamsModule (copy), UseExperienceShareFlowModule (copy), ReactModule (copy), GoalLockedActionIdModule (copy), GetAdsManagerUrlFunction (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), DeveloperProducts (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER,
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	})
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseNavigationResult = NavigationModule.useNavigation()
	local Target = if UseNavigationResult == nil then nil else BuildNavigationParamsModule.getTarget(UseNavigationResult)
	local UseExperienceShareFlowModuleResult = UseExperienceShareFlowModule(UniverseId, if Target == nil then nil else Target.placeId)
	local OnShareFunction = UseExperienceShareFlowModuleResult.onShare
	local AdsManager = UseLocalizationResult.adsManager
	local CreatorHub = UseLocalizationResult.creatorHub
	
	return {
		onLockedAction = ReactModule.useCallback(function(CreateAd) --[[ Line: 44 ]]
			-- upvalues: GoalLockedActionIdModule (upval), UseOpenWebViewResult (copy), GetAdsManagerUrlFunction (upval), UniverseId (copy), AdsManager (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), UseNavigationResult (copy), Target (copy), DeveloperProducts (upval), CreatorHub (copy), OnShareFunction (copy)
			if CreateAd == GoalLockedActionIdModule.CreateAd then
				UseOpenWebViewResult(GetAdsManagerUrlFunction(UniverseId), AdsManager)
				
				return
			end
			if CreateAd == GoalLockedActionIdModule.SellItems then
				if FFlagBuildExperienceMonetizationNativeUIModule and UseNavigationResult ~= nil and Target ~= nil then
					UseNavigationResult.navigate("BuildMonetization", { target = Target })
					
					return
				else
					UseOpenWebViewResult(DeveloperProducts({ universeId = UniverseId }), CreatorHub)
					
					return
				end
			elseif CreateAd == GoalLockedActionIdModule.ShareWithFriends then
				OnShareFunction()
			end
		end, {
			UniverseId, UseNavigationResult, Target, OnShareFunction, UseOpenWebViewResult,
			AdsManager, CreatorHub
		}),
		shareFlow = UseExperienceShareFlowModuleResult
	}
end