local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Parent.DataHydration.AdCampaigns)
local _ = require(Parent.DataHydration.CampaignStats)
local GetAdsManagerUrlModule = require(script.Parent.getAdsManagerUrl)
local _ = require(script.Parent.AdsManagerMenuButtonView)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseOpenWebViewWithResumeRefreshModule = require(BuildExperience.utils.useOpenWebViewWithResumeRefresh)
local UseRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local BuildAdsManagerMenuWidth = game:DefineFastInt("BuildAdsManagerMenuWidth", 162)

return function(p1)
	-- upvalues: ReactModule (copy), UseScaledValueFunction (copy), BuildAdsManagerMenuWidth (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseRefreshAdsDataModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), GetAdsManagerUrlModule (copy), UseOpenWebViewWithResumeRefreshModule (copy), IconName (copy), InputSize (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseScaledValueResult = UseScaledValueFunction(BuildAdsManagerMenuWidth)
	local AdsManager = UseLocalizationFunction({
		adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER
	}).adsManager
	local UniverseId = p1.universeId
	local UseRefreshAdsDataModuleResult = UseRefreshAdsDataModule(UniverseId, {
		adCampaignsStore = p1.adCampaignsStore,
		campaignStatsStore = p1.campaignStatsStore
	})
	local UseOpenWebViewWithResumeRefreshModuleResult = nil
	UseOpenWebViewWithResumeRefreshModuleResult = if FFlagBuildAdsManagerUniverseUrlModule then UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getAdsManagerUrl(UniverseId), AdsManager, UseRefreshAdsDataModuleResult, p1.appLifecycleObserverService) else UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getDefaultAdsManagerUrl(), AdsManager, UseRefreshAdsDataModuleResult, p1.appLifecycleObserverService)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseOpenWebViewWithResumeRefreshModuleResult (ref)
		UseStateResult2(false)
		UseOpenWebViewWithResumeRefreshModuleResult()
	end, { UseOpenWebViewWithResumeRefreshModuleResult })
	
	return {
		layoutOrder = p1.layoutOrder,
		testId = p1.testId or "AdsManagerMenuButton",
		buttonSize = InputSize.Large,
		isMenuOpen = UseStateResult,
		menuSize = InputSize.Large,
		menuWidth = UseScaledValueResult,
		menuItems = ReactModule.useMemo(function()
			-- upvalues: AdsManager (copy), IconName (upval)
			return {
				{
					id = "ads-manager",
					text = AdsManager,
					trailing = { iconName = IconName.ArrowUpRightFromSquare }
				}
			}
		end, { AdsManager }),
		onToggleMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(function(p2): boolean
				return not p2
			end)
		end, {}),
		onCloseMenu = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {}),
		onItemActivated = ReactModule.useCallback(function(p2)
			-- upvalues: UseResult (copy)
			if p2 == "ads-manager" then
				UseResult()
			end
		end, { UseResult })
	}
end