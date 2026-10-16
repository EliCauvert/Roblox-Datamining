local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.DataHydration.CreatorAgentChat)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)
local _ = require(buildExperience.Chat.chatTypes)
local getAdUpsellEventStoreModule = require(buildExperience.Stores.GetAdUpsellEventStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useCreateAdCampaignModule = require(buildExperience.Components.Ads.useCreateAdCampaign)
local useGetAdCampaignEligibilityModule = require(buildExperience.Components.Ads.useGetAdCampaignEligibility)
local useGetAdCampaignsModule = require(buildExperience.Components.Ads.useGetAdCampaigns)
local adUpsellPublishUtilsModule = require(script.Parent.adUpsellPublishUtils)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local fFlagBuildAdUpsellModule = require(buildExperience.Flags.FFlagBuildAdUpsell)
local useAdsCampaignDeepLinkModule = require(buildExperience.Components.Ads.useAdsCampaignDeepLink)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil

return function(p1)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), reactModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), useCreateAdCampaignModule (ref), fFlagEnablePaidAdsModule (ref), useGetAdCampaignsModule (ref), adCampaignScheduleUtilsModule (ref), fFlagBuildAdUpsellModule (ref), useAdsCampaignDeepLinkModule (ref), buildAppStorageKeyEngineFeature (ref), var1 (ref), adUpsellPublishUtilsModule (ref), sendBuildExperienceEventModule (ref)
	local var2 = getAdUpsellEventStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var2.getRevision)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = useGetAdCampaignEligibilityModule(p1.universeId, p1.eligibilityStore)
	local var7 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var5)
	local var8 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var5) and (adCampaignEligibilityUtilsModule.hasFreeCredit(var5) and adCampaignEligibilityUtilsModule.hasUsableOffer(var5))
	local var9 = useCreateAdCampaignModule(p1.universeId, p1.sessionId)
	local isCreatePending = var9.isCreatePending
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useRef(nil)
	local var17, var18 = reactModule.useState(false)
	local var19 = reactModule.useRef(nil)
	local var20 = if fFlagEnablePaidAdsModule then reactModule.useRef(nil) else nil
	local var21, var22 = useGetAdCampaignsModule()
	local var23 = var22 == "Ready" and adCampaignScheduleUtilsModule.hasActiveCampaign(var21, p1.universeId, reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.nowMs == nil then DateTime.now().UnixTimestampMillis else p1.nowMs
	end, { p1.nowMs or 0, var21 or false }))
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), fFlagEnablePaidAdsModule (copy), var9 (ref), var13 (ref), adCampaignEligibilityUtilsModule (copy), var11 (ref)
		var15(false)
		
		if not fFlagEnablePaidAdsModule then
			var9.clearCreateError()
		end
		var13(function(p3)
			-- upvalues: fFlagEnablePaidAdsModule (copy), var9 (copy), adCampaignEligibilityUtilsModule (copy), p2 (ref)
			return if fFlagEnablePaidAdsModule and var9.hasCreateError and p3 ~= nil then p3 else adCampaignEligibilityUtilsModule.campaignSheetTerms(p2, DateTime.now().UnixTimestampMillis)
		end)
		var11(true)
	end, { var9.clearCreateError, var9.hasCreateError })
	local var25 = if fFlagBuildAdUpsellModule then useAdsCampaignDeepLinkModule({
		universeId = p1.universeId,
		sessionId = p1.sessionId,
		isPageVisible = p1.isPageVisible,
		eligibilityStore = p1.eligibilityStore,
		onOpen = function(p2)
			-- upvalues: var10 (ref), isCreatePending (ref), var17 (ref), var24 (ref)
			if var10 or isCreatePending or var17 then
				return false
			end
			var24(p2)
			
			return true
		end
	}) else nil
	local useEffect = reactModule.useEffect
	
	local var26 = function()
		-- upvalues: var11 (ref), var13 (ref), var15 (ref), var19 (ref), fFlagEnablePaidAdsModule (copy), var20 (ref), var18 (ref)
		var11(false)
		var13(nil)
		var15(false)
		var19.current = nil
		
		if fFlagEnablePaidAdsModule then
			var20.current = nil
		end
		var18(false)
	end
	
	local t = {}
	local var27 = if var25 ~= nil then p1.universeId or 0 else var25.scopeRevision
	local var28 = var25 ~= nil and ((if var25 ~= nil then p1.sessionId else nil) or "")
	-- Unknown statement at pc 0: <SetList>
	useEffect(var26, t)
	reactModule.useEffect(function()
		-- upvalues: fFlagEnablePaidAdsModule (copy), var6 (ref), var5 (ref), var20 (ref), var17 (ref), var19 (ref), var18 (ref), var7 (ref)
		if fFlagEnablePaidAdsModule then
			if var17 and ((var6 == "Ready" and (var5 ~= nil and var5 ~= var20.current)) or var6 == "Failed") then
				var19.current = nil
				var20.current = nil
				var18(false)
			end
			return
		elseif var17 and var6 == "Ready" and (var5 ~= nil and var7 ~= var19.current) then
			var19.current = nil
			var18(false)
		end
	end, { var17, var6, var5, var7 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var15 (ref), isCreatePending (ref), var11 (ref)
		if not p1.isPageVisible then
			var15(false)
			
			if not isCreatePending then
				var11(false)
			end
		end
	end, { p1.isPageVisible, isCreatePending })
	local var29 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), isCreatePending (ref), var16 (ref), var25 (write), p1 (ref), var9 (ref), var2 (ref), var18 (ref), fFlagEnablePaidAdsModule (copy), var20 (ref), var19 (ref), var11 (ref), var15 (ref)
		local current = var29.current
		var29.current = isCreatePending
		
		if current and not isCreatePending then
			local current_1 = var16.current
			var16.current = nil
			
			if not var9.hasCreateError and (if var25 == nil then current_1 ~= nil and (current_1.universeId == p1.universeId and current_1.sessionId == p1.sessionId) else var25.finishCreate()) then
				local var30
				if p1.universeId ~= nil then
					var2.dismissPermanently(p1.universeId)
				end
				if fFlagEnablePaidAdsModule then
					var30 = var20.current ~= nil
					var30 = nil
				else
					var30 = var19.current ~= nil
				end
				var18(var30)
				
				if p1.isPageVisible then
					var11(false)
					var15(true)
				end
			end
		end
	end, {
		var2, isCreatePending, p1.isPageVisible, var9.hasCreateError, var25,
		p1.universeId ~= nil, p1.universeId or 0, p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local var30 = reactModule.useMemo(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), p1 (ref), var1 (copy)
		return if buildAppStorageKeyEngineFeature and p1.universeId ~= nil then var1.getAdUpsellState(p1.universeId, p1.sessionId) else nil
	end, {
		var3,
		p1.universeId ~= nil,
		p1.universeId or 0,
		p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local var31 = p1.isPublic and (var8 and (not (if var30 ~= nil then not var30.isAvailable or var30.dismissedPermanently else true) and (not var23 and not var17)))
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var2 (ref)
		if var30 ~= nil and not var30.isAvailable then
			var2.retryStorageRead()
		end
	end, { var2, var30 ~= nil, var30 ~= nil and var30.isAvailable })
	local var32 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getLastMessageKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var32 (ref), var30 (ref), var2 (ref)
		if p1.universeId == nil or p1.sessionId == nil or (var32 == nil or var30 == nil) or var30.pendingMilestoneCount == 0 then
			return
		end
		var2.attachPendingMilestones(p1.universeId, p1.sessionId, var32)
	end, {
		var2,
		p1.universeId,
		p1.sessionId,
		var32,
		if var30 ~= nil then var30.pendingMilestoneCount else 0
	})
	local var33 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getMessageIndexByKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var33 (ref), var2 (ref)
		local var34 = if p1.universeId == nil or p1.sessionId == nil then nil else `{p1.universeId}:{p1.sessionId}`
		
		if not p1.isHistoryExhausted then
			var4.current = nil
		end
		if not p1.isHistoryExhausted or var34 == nil or var4.current == var34 then return end
		local t = {}
		
		for i in var33 do
			t[i] = true
		end
		if var2.pruneAnchors(p1.universeId, p1.sessionId, t) then
			var4.current = var34
		end
	end, {
		var2, p1.isHistoryExhausted, p1.universeId, p1.sessionId, var33, var3
	})
	local t_1 = {}
	
	if var30 ~= nil and var30.isAvailable and var31 then
		for i, v in var30.anchors do
			local afterMessageKey = var33[v.afterMessageKey]
			
			if afterMessageKey ~= nil then
				table.insert(t_1, {
					id = v.id,
					order = v.order,
					anchorIndex = afterMessageKey,
					isImpressed = v.impressed
				})
			end
		end
	end
	return {
		adUpsellCards = t_1,
		adUpsellFreePromotionsRemaining = var7,
		isAdUpsellCreatePending = isCreatePending,
		isAdCampaignSheetOpen = var10,
		hasAdCampaignCreateError = var9.hasCreateError,
		adCampaignCreateErrorKind = var9.createErrorKind,
		adCampaignDurationDays = if var12 ~= nil then nil else var12.durationDays,
		adCampaignEstimatedPriceRobux = if var12 ~= nil then nil else var12.estimatedPriceRobux,
		adCampaignOffers = if var12 ~= nil then nil else var12.campaignOffers,
		adCampaignRunStartTimeMs = if var12 ~= nil then nil else var12.runStartMs,
		adCampaignRunEndTimeMs = if var12 == nil or var12.durationDays == nil then nil else adCampaignScheduleUtilsModule.campaignEndMs(var12.runStartMs, var12.durationDays),
		isAdCampaignCreatedToastVisible = var14,
		onAdCampaignCreatedToastDismiss = reactModule.useCallback(function()
			-- upvalues: var15 (ref)
			var15(false)
		end, {}),
		onAdUpsellCreate = reactModule.useCallback(function()
			-- upvalues: p1 (ref), fFlagBuildAdUpsellModule (copy), var9 (ref), var25 (write), sendBuildExperienceEventModule (copy), var24 (ref), var5 (ref)
			if not p1.isPageVisible then return end
			if fFlagBuildAdUpsellModule and not var9.hasCreateError then
				var25.clearPresentedRequest()
			end
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
			var24(var5)
		end, {
			p1.isPageVisible, p1.universeId or 0, p1.sessionId or "", var5, var24,
			var9.hasCreateError, var25
		}),
		onAdUpsellDismiss = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var2 (ref), sendBuildExperienceEventModule (copy)
			if p1.universeId == nil then
				return
			end
			var2.dismissPermanently(p1.universeId)
			sendBuildExperienceEventModule("AD_UPSELL_DISMISS_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
		end, { var2, p1.universeId or 0, p1.sessionId or "" }),
		onAdUpsellImpression = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var2 (ref), sendBuildExperienceEventModule (copy)
			if p1.universeId == nil or p1.sessionId == nil then return end
			if var2.markAnchorImpressed(p1.universeId, p1.sessionId, p2) then
				sendBuildExperienceEventModule("AD_UPSELL_IMPRESSION", {
					universeId = p1.universeId,
					conversationId = p1.sessionId
				})
			end
		end, { var2, p1.universeId or 0, p1.sessionId or "" }),
		onAdCampaignSheetClose = reactModule.useCallback(function()
			-- upvalues: var11 (ref), fFlagBuildAdUpsellModule (copy), var25 (write), fFlagEnablePaidAdsModule (copy), var9 (ref)
			var11(false)
			
			if fFlagBuildAdUpsellModule then
				var25.clearPresentedRequest()
			end
			if fFlagEnablePaidAdsModule then
				var9.clearCreateError()
			end
		end, { var9.clearCreateError, var25 }),
		onAdCampaignSheetCreate = reactModule.useCallback(function(p2)
			-- upvalues: fFlagBuildAdUpsellModule (copy), var25 (write), p1 (ref), sendBuildExperienceEventModule (copy), var16 (ref), var19 (ref), var7 (ref), fFlagEnablePaidAdsModule (copy), var20 (ref), var5 (ref), var9 (ref)
			local var35 = if fFlagBuildAdUpsellModule then var25.getPresentedRequestId() else nil
			local t = {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			}
			
			if var35 == nil then
				sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", t)
			else
				sendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_CONFIRM_CLICK", t, { requestId = var35 })
			end
			if var25 == nil then
				var16.current = { universeId = p1.universeId, sessionId = p1.sessionId }
			else
				var25.startCreate()
			end
			var19.current = var7
			
			if fFlagEnablePaidAdsModule then
				var20.current = var5
			end
			var9.createCampaign(if fFlagEnablePaidAdsModule then p2 else nil)
		end, {
			p1.universeId or 0, p1.sessionId or "", var7, var5, var9.createCampaign,
			var25
		})
	}
end