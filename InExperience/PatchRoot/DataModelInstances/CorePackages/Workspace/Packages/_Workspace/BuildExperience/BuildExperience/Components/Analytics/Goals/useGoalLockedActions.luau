local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local _ = require(Parent.DataHydration.CreatorAgentChat)
local GoalLockedActionIdModule = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local _ = require(BuildExperience.Chat.chatTypes)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)
local AdCampaignScheduleUtilsModule = require(BuildExperience.Components.Ads.adCampaignScheduleUtils)
local AdCampaignCreatedToastModule = require(BuildExperience.Components.Ads.AdCampaignCreatedToast)
local CreateAdCampaignSheetContainerModule = require(BuildExperience.Components.Ads.CreateAdCampaignSheet.CreateAdCampaignSheetContainer)
local GetAdsManagerUrlFunction = require(BuildExperience.Components.Ads.getAdsManagerUrl).getAdsManagerUrl
local UseCreateAdCampaignModule = require(BuildExperience.Components.Ads.useCreateAdCampaign)
local UseGetAdCampaignEligibilityModule = require(BuildExperience.Components.Ads.useGetAdCampaignEligibility)
local ExperienceShareOverlaysModule = require(BuildExperience.Components.ShareAudience.ExperienceShareOverlays)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local BuildNavigationParamsModule = require(BuildExperience.utils.BuildNavigationParams)
local UseExperienceShareFlowModule = require(BuildExperience.utils.useExperienceShareFlow)
local DeveloperProducts = require(Parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products")

local function useCreateAdAction(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), UseGetAdCampaignEligibilityModule (copy), FFlagEnablePaidAdsModule (copy), UseCreateAdCampaignModule (copy), ReactModule (copy), AdCampaignEligibilityUtilsModule (copy), GetAdsManagerUrlFunction (copy), CreateAdCampaignSheetContainerModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), AdCampaignScheduleUtilsModule (copy), AdCampaignCreatedToastModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER,
		createSuccess = LocalizationStringsModule.ADS_STATS_CREATE_SUCCESS
	})
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local AdsManager = UseLocalizationResult.adsManager
	local UseGetAdCampaignEligibilityModuleResult, UseGetAdCampaignEligibilityModuleResult2 = UseGetAdCampaignEligibilityModule(if FFlagEnablePaidAdsModule then p1 else nil)
	local UseCreateAdCampaignModuleResult = UseCreateAdCampaignModule(p1)
	local ClearCreateErrorFunction = UseCreateAdCampaignModuleResult.clearCreateError
	local CreateCampaignFunction = UseCreateAdCampaignModuleResult.createCampaign
	local IsCreatePending = UseCreateAdCampaignModuleResult.isCreatePending
	local HasCreateError = UseCreateAdCampaignModuleResult.hasCreateError
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local CanCreateCampaign = AdCampaignEligibilityUtilsModule.canCreateCampaign(UseGetAdCampaignEligibilityModuleResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult4 (copy), FFlagEnablePaidAdsModule (upval), CanCreateCampaign (copy), UseOpenWebViewResult (copy), GetAdsManagerUrlFunction (upval), p1 (copy), AdsManager (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), HasCreateError (copy), AdCampaignEligibilityUtilsModule (upval), UseGetAdCampaignEligibilityModuleResult (copy), UseStateResult2 (copy)
		if UseStateResult4 then return end
		if FFlagEnablePaidAdsModule and CanCreateCampaign then
			UseStateResult2_1(false)
			UseStateResult2_2(function(p2)
				-- upvalues: HasCreateError (upval), AdCampaignEligibilityUtilsModule (upval), UseGetAdCampaignEligibilityModuleResult (upval)
				return if HasCreateError and p2 ~= nil then p2 else AdCampaignEligibilityUtilsModule.campaignSheetTerms(UseGetAdCampaignEligibilityModuleResult, DateTime.now().UnixTimestampMillis)
			end)
			UseStateResult2(true)
			
			return
		else
			UseOpenWebViewResult(GetAdsManagerUrlFunction(p1), AdsManager)
		end
	end, {
		UseStateResult4, CanCreateCampaign, UseOpenWebViewResult, p1, AdsManager,
		ClearCreateErrorFunction, HasCreateError,
		UseGetAdCampaignEligibilityModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), ClearCreateErrorFunction (copy)
		UseStateResult2(false)
		ClearCreateErrorFunction()
	end, { ClearCreateErrorFunction })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseGetAdCampaignEligibilityModuleResult (copy), CreateCampaignFunction (copy)
		UseRefResult.current = UseGetAdCampaignEligibilityModuleResult
		CreateCampaignFunction(p2)
	end, {
		UseGetAdCampaignEligibilityModuleResult,
		CreateCampaignFunction
	})
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), IsCreatePending (copy), HasCreateError (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_3 (copy), UseRefResult (copy)
		UseRefResult1.current = IsCreatePending
		
		if UseRefResult1.current and not IsCreatePending and not HasCreateError then
			UseStateResult2(false)
			UseStateResult2_1(true)
			UseStateResult2_3(UseRefResult.current ~= nil)
		end
	end, { IsCreatePending, HasCreateError })
	ReactModule.useEffect(function()
		-- upvalues: UseGetAdCampaignEligibilityModuleResult2 (copy), UseGetAdCampaignEligibilityModuleResult (copy), UseRefResult (copy), UseStateResult4 (copy), UseStateResult2_3 (copy)
		local IsNotUseGetAdCampaignEligibilityModuleResultMatch: boolean = UseGetAdCampaignEligibilityModuleResult2 == "Ready" and (UseGetAdCampaignEligibilityModuleResult ~= nil and UseGetAdCampaignEligibilityModuleResult ~= UseRefResult.current)
		
		if UseStateResult4 and (IsNotUseGetAdCampaignEligibilityModuleResultMatch or UseGetAdCampaignEligibilityModuleResult2 == "Failed") then
			UseRefResult.current = nil
			UseStateResult2_3(false)
		end
	end, {
		UseStateResult4,
		UseGetAdCampaignEligibilityModuleResult2,
		UseGetAdCampaignEligibilityModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_3 (copy), UseStateResult2_2 (copy)
		UseRefResult.current = nil
		UseStateResult2_3(false)
		UseStateResult2_2(nil)
	end, { p1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local RunStartMs = if UseStateResult3 == nil then nil else UseStateResult3.runStartMs
	local DurationDays = if UseStateResult3 == nil then nil else UseStateResult3.durationDays
	local Element = if FFlagEnablePaidAdsModule then ReactModule.createElement(ReactModule.Fragment, nil, {
		Sheet = ReactModule.createElement(CreateAdCampaignSheetContainerModule, {
			waitForCreateResult = true,
			useLocalRunDates = true,
			universeId = if FFlagBuildAdsManagerUniverseUrlModule then p1 else nil,
			isOpen = UseStateResult,
			onClose = UseResult1,
			onCreate = UseResult2,
			isCreatePending = IsCreatePending or UseStateResult4,
			hasCreateError = HasCreateError,
			createErrorKind = UseCreateAdCampaignModuleResult.createErrorKind,
			campaignDurationDays = DurationDays,
			estimatedPriceRobux = if UseStateResult3 == nil then nil else UseStateResult3.estimatedPriceRobux,
			campaignOffers = if UseStateResult3 == nil then nil else UseStateResult3.campaignOffers,
			runStartTimeMs = RunStartMs,
			runEndTimeMs = if RunStartMs == nil or DurationDays == nil then nil else AdCampaignScheduleUtilsModule.campaignEndMs(RunStartMs, DurationDays)
		}),
		Toast = if UseStateResult1 then ReactModule.createElement(AdCampaignCreatedToastModule, {
			testId = "GoalAdCampaignCreatedToast",
			onClose = UseResult3,
			title = UseLocalizationResult.createSuccess
		}) else nil
	}) else nil
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), Element (copy)
		return {
			isEligible = true,
			onActivate = UseResult,
			overlay = Element
		}
	end, { UseResult, Element })
end

local function useSellItemsAction(UniverseId, UseNavigationResult, Target)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseOpenWebViewFunction (copy), ReactModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), DeveloperProducts (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		creatorHub = LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB
	})
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local CreatorHub = UseLocalizationResult.creatorHub
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagBuildExperienceMonetizationNativeUIModule (upval), UseNavigationResult (copy), Target (copy), UseOpenWebViewResult (copy), DeveloperProducts (upval), UniverseId (copy), CreatorHub (copy)
		if FFlagBuildExperienceMonetizationNativeUIModule and UseNavigationResult ~= nil and Target ~= nil then
			UseNavigationResult.navigate("BuildMonetization", { target = Target })
			
			return
		else
			UseOpenWebViewResult(DeveloperProducts({ universeId = UniverseId }), CreatorHub)
		end
	end, {
		UniverseId,
		UseNavigationResult,
		Target,
		UseOpenWebViewResult,
		CreatorHub
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult (copy)
		return { isEligible = true, onActivate = UseResult }
	end, { UseResult })
end

local function useShareWithFriendsAction(UniverseId, PlaceId)
	-- upvalues: UseExperienceShareFlowModule (copy), ReactModule (copy), ExperienceShareOverlaysModule (copy)
	local UseExperienceShareFlowModuleResult = UseExperienceShareFlowModule(UniverseId, PlaceId)
	local OnShare = UseExperienceShareFlowModuleResult.onShare
	local Element = ReactModule.createElement(ExperienceShareOverlaysModule, {
		activeDialog = UseExperienceShareFlowModuleResult.activeDialog,
		hasShareError = UseExperienceShareFlowModuleResult.hasShareError,
		onCancel = UseExperienceShareFlowModuleResult.onCancelDialog,
		onConfirmFriends = UseExperienceShareFlowModuleResult.onConfirmFriends,
		onConfirmPlaytesters = UseExperienceShareFlowModuleResult.onConfirmPlaytesters
	})
	
	return ReactModule.useMemo(function()
		-- upvalues: OnShare (copy), Element (copy)
		return {
			isEligible = true,
			onActivate = OnShare,
			overlay = Element
		}
	end, { OnShare, Element })
end

return function(UniverseId)
	-- upvalues: NavigationModule (copy), BuildNavigationParamsModule (copy), useCreateAdAction (copy), useSellItemsAction (copy), useShareWithFriendsAction (copy), ReactModule (copy), GoalLockedActionIdModule (copy)
	local UseNavigationResult = NavigationModule.useNavigation()
	local Target = if UseNavigationResult == nil then nil else BuildNavigationParamsModule.getTarget(UseNavigationResult)
	local UseCreateAdActionResult = useCreateAdAction(UniverseId)
	local UseSellItemsActionResult = useSellItemsAction(UniverseId, UseNavigationResult, Target)
	local UseShareWithFriendsActionResult = useShareWithFriendsAction(UniverseId, if Target == nil then nil else Target.placeId)
	
	return {
		actions = ReactModule.useMemo(function()
			-- upvalues: GoalLockedActionIdModule (upval), UseCreateAdActionResult (copy), UseSellItemsActionResult (copy), UseShareWithFriendsActionResult (copy)
			return {
				[GoalLockedActionIdModule.CreateAd] = UseCreateAdActionResult,
				[GoalLockedActionIdModule.SellItems] = UseSellItemsActionResult,
				[GoalLockedActionIdModule.ShareWithFriends] = UseShareWithFriendsActionResult
			}
		end, {
			UseCreateAdActionResult,
			UseSellItemsActionResult,
			UseShareWithFriendsActionResult
		})
	}
end