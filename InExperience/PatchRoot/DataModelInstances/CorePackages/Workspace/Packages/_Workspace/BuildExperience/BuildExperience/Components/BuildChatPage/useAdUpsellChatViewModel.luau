local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)
local AdCampaignScheduleUtilsModule = require(BuildExperience.Components.Ads.adCampaignScheduleUtils)
local _ = require(BuildExperience.Chat.chatTypes)
local GetAdUpsellEventStoreModule = require(BuildExperience.Stores.GetAdUpsellEventStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local UseCreateAdCampaignModule = require(BuildExperience.Components.Ads.useCreateAdCampaign)
local UseGetAdCampaignEligibilityModule = require(BuildExperience.Components.Ads.useGetAdCampaignEligibility)
local UseGetAdCampaignsModule = require(BuildExperience.Components.Ads.useGetAdCampaigns)
local AdUpsellPublishUtilsModule = require(script.Parent.adUpsellPublishUtils)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local FFlagBuildAdUpsellModule = require(BuildExperience.Flags.FFlagBuildAdUpsell)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)
local FFlagBuildAdsNotificationRouting = require(Parent.SharedFlags).FFlagBuildAdsNotificationRouting
local UseAdsCampaignDeepLinkModule = require(BuildExperience.Components.Ads.useAdsCampaignDeepLink)
local BuildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local BuildAppStorageModule = if BuildAppStorageKeyEngineFeature then require(BuildExperience.Storage.BuildAppStorage) else nil

return function(p1) --[[ Line: 80 | Named "useAdUpsellChatViewModel" ]]
	-- upvalues: GetAdUpsellEventStoreModule (copy), SignalsReactModule (copy), ReactModule (copy), UseGetAdCampaignEligibilityModule (copy), AdCampaignEligibilityUtilsModule (copy), UseCreateAdCampaignModule (copy), FFlagEnablePaidAdsModule (copy), UseGetAdCampaignsModule (copy), AdCampaignScheduleUtilsModule (copy), FFlagBuildAdUpsellModule (copy), UseAdsCampaignDeepLinkModule (copy), FFlagBuildAdsNotificationRouting (copy), AdUpsellPublishUtilsModule (copy), BuildAppStorageKeyEngineFeature (copy), BuildAppStorageModule (copy), FFlagBuildAdUpsellPinnedModule (copy), SendBuildExperienceEventModule (copy)
	local AdUpsellEventStoreModule = GetAdUpsellEventStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AdUpsellEventStoreModule.getRevision)
	local UseRefResult = ReactModule.useRef(nil)
	local UseGetAdCampaignEligibilityModuleResult, UseGetAdCampaignEligibilityModuleResult2 = UseGetAdCampaignEligibilityModule(p1.universeId, p1.eligibilityStore)
	local FreeCreditsRemainingResult = AdCampaignEligibilityUtilsModule.freeCreditsRemaining(UseGetAdCampaignEligibilityModuleResult)
	local HasUsableOffer = AdCampaignEligibilityUtilsModule.isEligibleForFreePromotion(UseGetAdCampaignEligibilityModuleResult) and (AdCampaignEligibilityUtilsModule.hasFreeCredit(UseGetAdCampaignEligibilityModuleResult) and AdCampaignEligibilityUtilsModule.hasUsableOffer(UseGetAdCampaignEligibilityModuleResult))
	local UseCreateAdCampaignModuleResult = UseCreateAdCampaignModule(p1.universeId, p1.sessionId)
	local IsCreatePending = UseCreateAdCampaignModuleResult.isCreatePending
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = if FFlagEnablePaidAdsModule then ReactModule.useRef(nil) else nil
	local UseGetAdCampaignsModuleResult, UseGetAdCampaignsModuleResult2 = UseGetAdCampaignsModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 120 ]]
		-- upvalues: p1 (copy)
		return if p1.nowMs == nil then DateTime.now().UnixTimestampMillis else p1.nowMs
	end, { p1.nowMs or 0, UseGetAdCampaignsModuleResult or false })
	local HasActiveCampaign = UseGetAdCampaignsModuleResult2 == "Ready" and AdCampaignScheduleUtilsModule.hasActiveCampaign(UseGetAdCampaignsModuleResult, p1.universeId, UseMemoResult)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 131 ]]
		-- upvalues: UseStateResult2_2 (copy), FFlagEnablePaidAdsModule (upval), UseCreateAdCampaignModuleResult (copy), UseStateResult2_1 (copy), AdCampaignEligibilityUtilsModule (upval), UseStateResult2 (copy)
		UseStateResult2_2(false)
		
		if not FFlagEnablePaidAdsModule then
			UseCreateAdCampaignModuleResult.clearCreateError()
		end
		UseStateResult2_1(function(p3) --[[ Line: 138 ]]
			-- upvalues: FFlagEnablePaidAdsModule (upval), UseCreateAdCampaignModuleResult (upval), AdCampaignEligibilityUtilsModule (upval), p2 (copy)
			return if FFlagEnablePaidAdsModule and UseCreateAdCampaignModuleResult.hasCreateError and p3 ~= nil then p3 else AdCampaignEligibilityUtilsModule.campaignSheetTerms(p2, DateTime.now().UnixTimestampMillis)
		end)
		UseStateResult2(true)
	end, {
		UseCreateAdCampaignModuleResult.clearCreateError,
		UseCreateAdCampaignModuleResult.hasCreateError
	})
	local UseAdsCampaignDeepLinkModuleResult = if FFlagBuildAdUpsellModule then UseAdsCampaignDeepLinkModule({
		universeId = p1.universeId,
		sessionId = p1.sessionId,
		isPageVisible = p1.isPageVisible,
		eligibilityStore = p1.eligibilityStore,
		canPresent = if FFlagBuildAdsNotificationRouting then not IsCreatePending and not UseStateResult4 else nil,
		onOpen = function(p2): boolean --[[ Line: 165 ]]
			-- upvalues: UseStateResult (copy), IsCreatePending (copy), UseStateResult4 (copy), UseResult (copy)
			if UseStateResult or IsCreatePending or UseStateResult4 then
				return false
			else
				UseResult(p2)
				
				return true
			end
		end
	}) else nil
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 175 ]]
		-- upvalues: AdUpsellPublishUtilsModule (upval), p1 (copy)
		return AdUpsellPublishUtilsModule.getLastMessageKey(p1.messages)
	end, { p1.messages })
	ReactModule.useEffect(function() --[[ Line: 179 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult2 (copy), FFlagEnablePaidAdsModule (upval), UseRefResult3 (copy), UseStateResult2_3 (copy)
		UseStateResult2(false)
		UseStateResult2_1(nil)
		UseStateResult2_2(false)
		UseRefResult2.current = nil
		
		if FFlagEnablePaidAdsModule then
			UseRefResult3.current = nil
		end
		UseStateResult2_3(false)
	end, {
		if UseAdsCampaignDeepLinkModuleResult == nil then p1.universeId or 0 else UseAdsCampaignDeepLinkModuleResult.scopeRevision,
		UseAdsCampaignDeepLinkModuleResult == nil and p1.sessionId or ""
	})
	ReactModule.useEffect(function() --[[ Line: 200 ]]
		-- upvalues: FFlagEnablePaidAdsModule (upval), UseGetAdCampaignEligibilityModuleResult2 (copy), UseGetAdCampaignEligibilityModuleResult (copy), UseRefResult3 (copy), UseStateResult4 (copy), UseRefResult2 (copy), UseStateResult2_3 (copy), FreeCreditsRemainingResult (copy)
		if FFlagEnablePaidAdsModule then
			local IsNotUseGetAdCampaignEligibilityModuleResultMatch: boolean = UseGetAdCampaignEligibilityModuleResult2 == "Ready" and (UseGetAdCampaignEligibilityModuleResult ~= nil and UseGetAdCampaignEligibilityModuleResult ~= UseRefResult3.current)
			
			if UseStateResult4 and (IsNotUseGetAdCampaignEligibilityModuleResultMatch or UseGetAdCampaignEligibilityModuleResult2 == "Failed") then
				UseRefResult2.current = nil
				UseRefResult3.current = nil
				UseStateResult2_3(false)
			end
			return
		elseif UseStateResult4 and UseGetAdCampaignEligibilityModuleResult2 == "Ready" and UseGetAdCampaignEligibilityModuleResult ~= nil and FreeCreditsRemainingResult ~= UseRefResult2.current then
			UseRefResult2.current = nil
			UseStateResult2_3(false)
		end
	end, {
		UseStateResult4,
		UseGetAdCampaignEligibilityModuleResult2,
		UseGetAdCampaignEligibilityModuleResult,
		FreeCreditsRemainingResult
	})
	ReactModule.useEffect(function() --[[ Line: 234 ]]
		-- upvalues: p1 (copy), UseStateResult2_2 (copy), IsCreatePending (copy), UseStateResult2 (copy)
		if not p1.isPageVisible then
			UseStateResult2_2(false)
			
			if not IsCreatePending then
				UseStateResult2(false)
			end
		end
	end, { p1.isPageVisible, IsCreatePending })
	local UseRefResult4 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 260 ]]
		-- upvalues: UseRefResult4 (copy), IsCreatePending (copy), UseRefResult1 (copy), UseAdsCampaignDeepLinkModuleResult (ref), p1 (copy), UseCreateAdCampaignModuleResult (copy), AdUpsellEventStoreModule (copy), UseStateResult2_3 (copy), FFlagEnablePaidAdsModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult2 (copy), UseStateResult2_2 (copy)
		UseRefResult4.current = IsCreatePending
		
		if UseRefResult4.current and not IsCreatePending then
			local Current = UseRefResult1.current
			UseRefResult1.current = nil
			local IsSessionIdMatch = if UseAdsCampaignDeepLinkModuleResult == nil then Current ~= nil and (Current.universeId == p1.universeId and Current.sessionId == p1.sessionId) else UseAdsCampaignDeepLinkModuleResult.finishCreate()
			
			if not UseCreateAdCampaignModuleResult.hasCreateError and IsSessionIdMatch then
				if p1.universeId ~= nil then
					AdUpsellEventStoreModule.dismissPermanently(p1.universeId)
				end
				UseStateResult2_3(if FFlagEnablePaidAdsModule then UseRefResult3.current ~= nil else UseRefResult2.current ~= nil)
				
				if p1.isPageVisible then
					UseStateResult2(false)
					UseStateResult2_2(true)
				end
			end
		end
	end, {
		AdUpsellEventStoreModule, IsCreatePending, p1.isPageVisible,
		UseCreateAdCampaignModuleResult.hasCreateError,
		UseAdsCampaignDeepLinkModuleResult, p1.universeId ~= nil, p1.universeId or 0,
		p1.sessionId ~= nil, p1.sessionId or ""
	})
	local UseMemoResult11 = ReactModule.useMemo(function() --[[ Line: 304 ]]
		-- upvalues: BuildAppStorageKeyEngineFeature (upval), p1 (copy), BuildAppStorageModule (upval)
		return if BuildAppStorageKeyEngineFeature and p1.universeId ~= nil then BuildAppStorageModule.getAdUpsellState(p1.universeId, p1.sessionId) else nil
	end, {
		UseSignalStateResult,
		p1.universeId ~= nil,
		p1.universeId or 0,
		p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local NoUseMemoResult = UseMemoResult11 == nil or (not UseMemoResult11.isAvailable or UseMemoResult11.dismissedPermanently)
	local NoUseStateResult4: boolean = p1.isPublic and (HasUsableOffer and (not NoUseMemoResult and (not HasActiveCampaign and not UseStateResult4)))
	ReactModule.useEffect(function() --[[ Line: 327 ]]
		-- upvalues: UseMemoResult11 (copy), AdUpsellEventStoreModule (copy)
		if UseMemoResult11 ~= nil and not UseMemoResult11.isAvailable then
			AdUpsellEventStoreModule.retryStorageRead()
		end
	end, {
		AdUpsellEventStoreModule,
		UseMemoResult11 ~= nil,
		UseMemoResult11 ~= nil and (UseMemoResult11.isAvailable or false)
	})
	ReactModule.useEffect(function() --[[ Line: 340 ]]
		-- upvalues: p1 (copy), FFlagBuildAdUpsellPinnedModule (upval), UseMemoResult1 (copy), UseMemoResult11 (copy), AdUpsellEventStoreModule (copy)
		if p1.universeId ~= nil and p1.sessionId ~= nil and (FFlagBuildAdUpsellPinnedModule or UseMemoResult1 ~= nil) and (UseMemoResult11 ~= nil and UseMemoResult11.pendingMilestoneCount ~= 0) then
			AdUpsellEventStoreModule.attachPendingMilestones(p1.universeId, p1.sessionId, if FFlagBuildAdUpsellPinnedModule then nil else UseMemoResult1)
			
			return
		end
	end, {
		AdUpsellEventStoreModule,
		p1.universeId,
		p1.sessionId,
		UseMemoResult1,
		if UseMemoResult11 == nil then 0 else UseMemoResult11.pendingMilestoneCount or 0
	})
	local List = {}
	local AdUpsellCongratsAnchorIndex = nil
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 367 ]]
		-- upvalues: AdUpsellPublishUtilsModule (upval), p1 (copy)
		return AdUpsellPublishUtilsModule.getMessageIndexByKey(p1.messages)
	end, { p1.messages })
	ReactModule.useEffect(function() --[[ Line: 371 ]]
		-- upvalues: FFlagBuildAdUpsellPinnedModule (upval), p1 (copy), UseRefResult (copy), UseMemoResult2 (copy), AdUpsellEventStoreModule (copy)
		if FFlagBuildAdUpsellPinnedModule then return end
		local Text = if p1.universeId == nil or p1.sessionId == nil then nil else `{p1.universeId}:{p1.sessionId}`
		
		if not p1.isHistoryExhausted then
			UseRefResult.current = nil
		end
		if not p1.isHistoryExhausted or Text == nil or UseRefResult.current == Text then return end
		local t = {}
		
		for i in UseMemoResult2 do
			t[i] = true
		end
		if AdUpsellEventStoreModule.pruneAnchors(p1.universeId, p1.sessionId, t) then
			UseRefResult.current = Text
		end
	end, {
		AdUpsellEventStoreModule, p1.isHistoryExhausted, p1.universeId, p1.sessionId,
		UseMemoResult2, UseSignalStateResult
	})
	
	if UseMemoResult11 ~= nil and UseMemoResult11.isAvailable and NoUseStateResult4 then
		for _, anchor in UseMemoResult11.anchors do
			if FFlagBuildAdUpsellPinnedModule then
				table.insert(List, {
					id = anchor.id,
					order = anchor.order,
					isImpressed = anchor.impressed
				})
				local TransientCongratsMessageKey = AdUpsellEventStoreModule.getTransientCongratsMessageKey(anchor.id)
				
				if TransientCongratsMessageKey ~= nil then
					AdUpsellCongratsAnchorIndex = UseMemoResult2[TransientCongratsMessageKey]
				end
			else
				local AfterMessageKey = anchor.afterMessageKey
				local NoAfterMessageKey = AfterMessageKey == nil
				local UseMemoResultEntry = nil
				
				if not NoAfterMessageKey then
					UseMemoResultEntry = UseMemoResult2[AfterMessageKey]
					NoAfterMessageKey = UseMemoResultEntry == nil
				end
				if not NoAfterMessageKey then
					table.insert(List, {
						id = anchor.id,
						order = anchor.order,
						anchorIndex = UseMemoResultEntry,
						isImpressed = anchor.impressed
					})
				end
			end
		end
	end
	return {
		adUpsellCards = List,
		adUpsellCongratsAnchorIndex = AdUpsellCongratsAnchorIndex,
		adUpsellFreePromotionsRemaining = FreeCreditsRemainingResult,
		isAdUpsellCreatePending = IsCreatePending,
		isAdCampaignSheetOpen = UseStateResult,
		hasAdCampaignCreateError = UseCreateAdCampaignModuleResult.hasCreateError,
		adCampaignCreateErrorKind = UseCreateAdCampaignModuleResult.createErrorKind,
		adCampaignDurationDays = if UseStateResult1 == nil then nil else UseStateResult1.durationDays,
		adCampaignEstimatedPriceRobux = if UseStateResult1 == nil then nil else UseStateResult1.estimatedPriceRobux,
		adCampaignOffers = if UseStateResult1 == nil then nil else UseStateResult1.campaignOffers,
		adCampaignRunStartTimeMs = if UseStateResult1 == nil then nil else UseStateResult1.runStartMs,
		adCampaignRunEndTimeMs = if UseStateResult1 == nil or UseStateResult1.durationDays == nil then nil else AdCampaignScheduleUtilsModule.campaignEndMs(UseStateResult1.runStartMs, UseStateResult1.durationDays),
		isAdCampaignCreatedToastVisible = UseStateResult3,
		onAdCampaignCreatedToastDismiss = ReactModule.useCallback(function() --[[ Line: 514 ]]
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(false)
		end, {}),
		onAdUpsellCreate = ReactModule.useCallback(function() --[[ Line: 443 ]]
			-- upvalues: p1 (copy), FFlagBuildAdUpsellModule (upval), UseCreateAdCampaignModuleResult (copy), UseAdsCampaignDeepLinkModuleResult (ref), SendBuildExperienceEventModule (upval), UseResult (copy), UseGetAdCampaignEligibilityModuleResult (copy)
			if not p1.isPageVisible then return end
			if FFlagBuildAdUpsellModule and not UseCreateAdCampaignModuleResult.hasCreateError then
				UseAdsCampaignDeepLinkModuleResult.clearPresentedRequest()
			end
			SendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
			UseResult(UseGetAdCampaignEligibilityModuleResult)
		end, {
			p1.isPageVisible, p1.universeId or 0, p1.sessionId or "",
			UseGetAdCampaignEligibilityModuleResult, UseResult,
			UseCreateAdCampaignModuleResult.hasCreateError,
			UseAdsCampaignDeepLinkModuleResult
		}),
		onAdUpsellDismiss = ReactModule.useCallback(function() --[[ Line: 518 ]]
			-- upvalues: p1 (copy), AdUpsellEventStoreModule (copy), SendBuildExperienceEventModule (upval)
			if p1.universeId ~= nil then
				AdUpsellEventStoreModule.dismissPermanently(p1.universeId)
				SendBuildExperienceEventModule("AD_UPSELL_DISMISS_CLICK", {
					universeId = p1.universeId,
					conversationId = p1.sessionId
				})
				
				return
			end
		end, {
			AdUpsellEventStoreModule,
			p1.universeId or 0,
			p1.sessionId or ""
		}),
		onAdUpsellImpression = ReactModule.useCallback(function(p2) --[[ Line: 430 ]]
			-- upvalues: p1 (copy), AdUpsellEventStoreModule (copy), SendBuildExperienceEventModule (upval)
			if p1.universeId == nil or p1.sessionId == nil then return end
			if AdUpsellEventStoreModule.markAnchorImpressed(p1.universeId, p1.sessionId, p2) then
				SendBuildExperienceEventModule("AD_UPSELL_IMPRESSION", {
					universeId = p1.universeId,
					conversationId = p1.sessionId
				})
			end
		end, {
			AdUpsellEventStoreModule,
			p1.universeId or 0,
			p1.sessionId or ""
		}),
		onAdCampaignSheetClose = ReactModule.useCallback(function() --[[ Line: 467 ]]
			-- upvalues: UseStateResult2 (copy), FFlagBuildAdUpsellModule (upval), UseAdsCampaignDeepLinkModuleResult (ref), FFlagEnablePaidAdsModule (upval), UseCreateAdCampaignModuleResult (copy)
			UseStateResult2(false)
			
			if FFlagBuildAdUpsellModule then
				UseAdsCampaignDeepLinkModuleResult.clearPresentedRequest()
			end
			if FFlagEnablePaidAdsModule then
				UseCreateAdCampaignModuleResult.clearCreateError()
			end
		end, {
			UseCreateAdCampaignModuleResult.clearCreateError,
			UseAdsCampaignDeepLinkModuleResult
		}),
		onAdCampaignSheetCreate = ReactModule.useCallback(function(p2) --[[ Line: 478 ]]
			-- upvalues: FFlagBuildAdUpsellModule (upval), UseAdsCampaignDeepLinkModuleResult (ref), p1 (copy), SendBuildExperienceEventModule (upval), UseRefResult1 (copy), UseRefResult2 (copy), FreeCreditsRemainingResult (copy), FFlagEnablePaidAdsModule (upval), UseRefResult3 (copy), UseGetAdCampaignEligibilityModuleResult (copy), UseCreateAdCampaignModuleResult (copy)
			local PresentedRequestId = if FFlagBuildAdUpsellModule then UseAdsCampaignDeepLinkModuleResult.getPresentedRequestId() else nil
			local config = {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			}
			
			if PresentedRequestId == nil then
				SendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", config)
			else
				SendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_CONFIRM_CLICK", config, { requestId = PresentedRequestId })
			end
			if UseAdsCampaignDeepLinkModuleResult == nil then
				UseRefResult1.current = { universeId = p1.universeId, sessionId = p1.sessionId }
			else
				UseAdsCampaignDeepLinkModuleResult.startCreate()
			end
			UseRefResult2.current = FreeCreditsRemainingResult
			
			if FFlagEnablePaidAdsModule then
				UseRefResult3.current = UseGetAdCampaignEligibilityModuleResult
			end
			UseCreateAdCampaignModuleResult.createCampaign(if FFlagEnablePaidAdsModule then p2 else nil)
		end, {
			p1.universeId or 0, p1.sessionId or "", FreeCreditsRemainingResult,
			UseGetAdCampaignEligibilityModuleResult,
			UseCreateAdCampaignModuleResult.createCampaign,
			UseAdsCampaignDeepLinkModuleResult
		})
	}
end