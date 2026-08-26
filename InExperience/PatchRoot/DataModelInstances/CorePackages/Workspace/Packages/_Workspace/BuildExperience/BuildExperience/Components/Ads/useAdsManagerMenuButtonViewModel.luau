local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useLocalization = require(parent.Localization).Hooks.useLocalization
local adCampaignsModule = require(parent.DataHydration.AdCampaigns)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local _ = require(script.Parent.AdsManagerMenuButtonView)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useScaledValue = foundationModule.Hooks.useScaledValue
local useSignalState = signalsReactModule.useSignalState
local buildAdsManagerMenuWidth = game:DefineFastInt("BuildAdsManagerMenuWidth", 162)
local var1 = signalsModule.createComputed(function()
	return "NotReady"
end)
local var2 = signalsModule.createComputed(function()
	return nil
end)
local var3 = urlBuilder.fromString("create:advertise")

return function(p1)
	-- upvalues: reactModule (ref), useScaledValue (ref), buildAdsManagerMenuWidth (ref), useLocalization (ref), localizationStringsModule (ref), adCampaignsModule (ref), campaignStatsModule (ref), useSignalState (ref), var1 (ref), var2 (ref), useOpenWebViewWithResumeRefreshModule (ref), var3 (ref), iconName (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useRef(nil)
	local var8 = useScaledValue(buildAdsManagerMenuWidth)
	local adsManager = useLocalization({
		adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER
	}).adsManager
	local universeId = p1.universeId
	local adCampaignsStore = p1.adCampaignsStore or adCampaignsModule.getAdCampaignsStore(false)
	local campaignStatsStore = p1.campaignStatsStore or campaignStatsModule.getCampaignStatsStore(false)
	local adCampaigns = adCampaignsStore.getAdCampaigns()
	local var9 = universeId ~= nil and universeId ~= 0
	local var10 = if var9 then campaignStatsStore.getCampaignStats(universeId) else nil
	local var11 = useSignalState(adCampaigns.status)
	local var12 = useSignalState(adCampaigns.data)
	local var13 = useSignalState(if var10 ~= nil then var1 else var10.status)
	local var14 = useSignalState(if var10 ~= nil then var2 else var10.data)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), adCampaignsStore (ref), var9 (ref), var10 (ref), var7 (ref), campaignStatsStore (ref), universeId (ref)
		var6.current = adCampaignsStore.isAdCampaignsRequestInQueueOrInFlight()
		adCampaignsStore.fetchAdCampaigns()
		
		if var9 and var10 ~= nil then
			var7.current = if campaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(universeId) then universeId else nil
			campaignStatsStore.fetchCampaignStats(universeId)
			
			return
		end
		var7.current = nil
	end, {
		universeId, var9, adCampaignsStore, campaignStatsStore, adCampaigns, var10
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), adCampaignsStore (ref)
		if var6.current and not adCampaignsStore.isAdCampaignsRequestInQueueOrInFlight() then
			var6.current = false
			adCampaignsStore.fetchAdCampaigns()
		end
	end, { var12, var11, adCampaignsStore })
	reactModule.useEffect(function()
		-- upvalues: universeId (ref), var7 (ref), campaignStatsStore (ref)
		if universeId ~= nil and var7.current == universeId and not campaignStatsStore.isCampaignStatsRequestInQueueOrInFlight(universeId) then
			var7.current = nil
			campaignStatsStore.fetchCampaignStats(universeId)
		end
	end, { universeId, var14, var13, campaignStatsStore })
	local var16 = useOpenWebViewWithResumeRefreshModule(var3(), adsManager, var15, p1.appLifecycleObserverService)
	local var17 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var16 (ref)
		var5(false)
		var16()
	end, { var16 })
	
	return {
		layoutOrder = p1.layoutOrder,
		testId = p1.testId or "AdsManagerMenuButton",
		buttonSize = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
		isMenuOpen = var4,
		menuSize = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
		menuWidth = var8,
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
			-- upvalues: var5 (ref)
			var5(function(p2)
				return not p2
			end)
		end, {}),
		onCloseMenu = reactModule.useCallback(function()
			-- upvalues: var5 (ref)
			var5(false)
		end, {}),
		onItemActivated = reactModule.useCallback(function(p2)
			-- upvalues: var17 (ref)
			if p2 == "ads-manager" then
				var17()
			end
		end, { var17 })
	}
end