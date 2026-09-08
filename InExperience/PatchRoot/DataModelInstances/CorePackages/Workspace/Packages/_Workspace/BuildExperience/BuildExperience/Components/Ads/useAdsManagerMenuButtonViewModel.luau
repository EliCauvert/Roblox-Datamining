local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.DataHydration.AdCampaigns)
local _ = require(parent.DataHydration.CampaignStats)
local _ = require(script.Parent.AdsManagerMenuButtonView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local useRefreshAdsDataModule = require(script.Parent.useRefreshAdsData)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useScaledValue = foundationModule.Hooks.useScaledValue
local buildAdsManagerMenuWidth = game:DefineFastInt("BuildAdsManagerMenuWidth", 162)
local var1 = urlBuilder.fromString("create:advertise")

return function(p1)
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAdsManagerMenuWidth (ref), useLocalization (ref), localizationStringsModule (ref), useRefreshAdsDataModule (ref), useOpenWebViewWithResumeRefreshModule (ref), var1 (ref), iconName (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref)
	local var2, var3 = reactModule.useState(false)
	local var4 = useScaledValue(buildAdsManagerMenuWidth)
	local adsManager = useLocalization({
		adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER
	}).adsManager
	local var5 = useOpenWebViewWithResumeRefreshModule(var1(), adsManager, useRefreshAdsDataModule(p1.universeId, {
		adCampaignsStore = p1.adCampaignsStore,
		campaignStatsStore = p1.campaignStatsStore
	}), p1.appLifecycleObserverService)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref)
		var3(false)
		var5()
	end, { var5 })
	
	return {
		layoutOrder = p1.layoutOrder,
		testId = p1.testId or "AdsManagerMenuButton",
		buttonSize = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
		isMenuOpen = var2,
		menuSize = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
		menuWidth = var4,
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
			-- upvalues: var3 (ref)
			var3(function(p2)
				return not p2
			end)
		end, {}),
		onCloseMenu = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			var3(false)
		end, {}),
		onItemActivated = reactModule.useCallback(function(p2)
			-- upvalues: var6 (ref)
			if p2 == "ads-manager" then
				var6()
			end
		end, { var6 })
	}
end