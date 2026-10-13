local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.DataHydration.AdCampaigns)
local _ = require(parent.DataHydration.CampaignStats)
local getAdsManagerUrlModule = require(script.Parent.getAdsManagerUrl)
local _ = require(script.Parent.AdsManagerMenuButtonView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local useRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local fFlagBuildAdsManagerUniverseUrlModule = require(buildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useScaledValue = foundationModule.Hooks.useScaledValue
local buildAdsManagerMenuWidth = game:DefineFastInt("BuildAdsManagerMenuWidth", 162)

return function(p1)
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAdsManagerMenuWidth (ref), useLocalization (ref), localizationStringsModule (ref), useRefreshAdsDataModule (ref), fFlagBuildAdsManagerUniverseUrlModule (ref), getAdsManagerUrlModule (ref), useOpenWebViewWithResumeRefreshModule (ref), iconName (ref), inputSize (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = useScaledValue(buildAdsManagerMenuWidth)
	local adsManager = useLocalization({
		adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER
	}).adsManager
	local universeId = p1.universeId
	local var4 = useRefreshAdsDataModule(universeId, {
		adCampaignsStore = p1.adCampaignsStore,
		campaignStatsStore = p1.campaignStatsStore
	})
	local var5 = if fFlagBuildAdsManagerUniverseUrlModule then useOpenWebViewWithResumeRefreshModule(getAdsManagerUrlModule.getAdsManagerUrl(universeId), adsManager, var4, p1.appLifecycleObserverService) else useOpenWebViewWithResumeRefreshModule(getAdsManagerUrlModule.getDefaultAdsManagerUrl(), adsManager, var4, p1.appLifecycleObserverService)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var5 (write)
		var2(false)
		var5()
	end, { var5 })
	
	return {
		layoutOrder = p1.layoutOrder,
		testId = p1.testId or "AdsManagerMenuButton",
		buttonSize = inputSize.Large,
		isMenuOpen = var1,
		menuSize = inputSize.Large,
		menuWidth = var3,
		menuItems = reactModule.useMemo(function()
			-- upvalues: adsManager (ref), iconName (copy)
			return {
				{
					id = "ads-manager",
					text = adsManager,
					trailing = { iconName = iconName.ArrowUpRightFromSquare }
				}
			}
		end, { adsManager }),
		onToggleMenu = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(function(p2)
				return not p2
			end)
		end, {}),
		onCloseMenu = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(false)
		end, {}),
		onItemActivated = reactModule.useCallback(function(p2)
			-- upvalues: var6 (ref)
			if p2 == "ads-manager" then
				var6()
			end
		end, { var6 })
	}
end