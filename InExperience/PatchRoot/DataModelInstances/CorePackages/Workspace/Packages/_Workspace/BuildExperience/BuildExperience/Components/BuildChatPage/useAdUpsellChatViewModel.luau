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
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil

return function(p1)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), reactModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), fFlagEnablePaidAdsModule (ref), useCreateAdCampaignModule (ref), useGetAdCampaignsModule (ref), adCampaignScheduleUtilsModule (ref), buildAppStorageKeyEngineFeature (ref), var1 (ref), adUpsellPublishUtilsModule (ref), sendBuildExperienceEventModule (ref)
	local var2 = getAdUpsellEventStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var2.getRevision)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = useGetAdCampaignEligibilityModule(p1.universeId)
	local var7 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var5)
	local var8 = if fFlagEnablePaidAdsModule then adCampaignEligibilityUtilsModule.getSelectableOffers(var5) else nil
	local var9 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var5) and (adCampaignEligibilityUtilsModule.hasFreeCredit(var5) and adCampaignEligibilityUtilsModule.hasUsableOffer(var5))
	local var10 = useCreateAdCampaignModule(p1.universeId, p1.sessionId)
	local isCreatePending = var10.isCreatePending
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(false)
	local var17 = reactModule.useRef(nil)
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(nil)
	local var21 = if fFlagEnablePaidAdsModule then reactModule.useRef(nil) else nil
	local var22, var23 = useGetAdCampaignsModule()
	local var24 = var23 == "Ready" and adCampaignScheduleUtilsModule.hasActiveCampaign(var22, p1.universeId, reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.nowMs == nil then DateTime.now().UnixTimestampMillis else p1.nowMs
	end, { p1.nowMs or 0, var22 or false }))
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var14 (ref), var16 (ref), var20 (ref), fFlagEnablePaidAdsModule (copy), var21 (ref), var19 (ref)
		var12(false)
		var14(nil)
		var16(false)
		var20.current = nil
		
		if fFlagEnablePaidAdsModule then
			var21.current = nil
		end
		var19(false)
	end, { p1.universeId or 0, p1.sessionId or "" })
	reactModule.useEffect(function()
		-- upvalues: fFlagEnablePaidAdsModule (copy), var6 (ref), var5 (ref), var21 (ref), var18 (ref), var20 (ref), var19 (ref), var7 (ref)
		if fFlagEnablePaidAdsModule then
			if var18 and ((var6 == "Ready" and (var5 ~= nil and var5 ~= var21.current)) or var6 == "Failed") then
				var20.current = nil
				var21.current = nil
				var19(false)
			end
			return
		elseif var18 and var6 == "Ready" and (var5 ~= nil and var7 ~= var20.current) then
			var20.current = nil
			var19(false)
		end
	end, { var18, var6, var5, var7 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var16 (ref), isCreatePending (ref), var12 (ref)
		if not p1.isPageVisible then
			var16(false)
			
			if not isCreatePending then
				var12(false)
			end
		end
	end, { p1.isPageVisible, isCreatePending })
	local var25 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), isCreatePending (ref), var17 (ref), var10 (ref), p1 (ref), var19 (ref), fFlagEnablePaidAdsModule (copy), var21 (ref), var20 (ref), var12 (ref), var16 (ref)
		local current = var25.current
		var25.current = isCreatePending
		
		if current and not isCreatePending then
			local current_1 = var17.current
			var17.current = nil
			
			if not var10.hasCreateError and (current_1 ~= nil and (current_1.universeId == p1.universeId and current_1.sessionId == p1.sessionId)) then
				local var26
				if fFlagEnablePaidAdsModule then
					var26 = var21.current ~= nil
					var26 = nil
				else
					var26 = var20.current ~= nil
				end
				var19(var26)
				
				if p1.isPageVisible then
					var12(false)
					var16(true)
				end
			end
		end
	end, {
		isCreatePending, p1.isPageVisible, var10.hasCreateError, p1.universeId ~= nil,
		p1.universeId or 0, p1.sessionId ~= nil, p1.sessionId or ""
	})
	local var26 = reactModule.useMemo(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), p1 (ref), var1 (copy)
		return if buildAppStorageKeyEngineFeature and p1.universeId ~= nil then var1.getAdUpsellState(p1.universeId, p1.sessionId) else nil
	end, {
		var3,
		p1.universeId ~= nil,
		p1.universeId or 0,
		p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local var27 = p1.isPublic and (var9 and (not (if var26 ~= nil then not var26.isAvailable or var26.dismissedPermanently else true) and (not var24 and not var18)))
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var2 (ref)
		if var26 ~= nil and not var26.isAvailable then
			var2.retryStorageRead()
		end
	end, { var2, var26 ~= nil, var26 ~= nil and var26.isAvailable })
	local var28 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getLastMessageKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var28 (ref), var26 (ref), var2 (ref)
		if p1.universeId == nil or p1.sessionId == nil or (var28 == nil or var26 == nil) or var26.pendingMilestoneCount == 0 then
			return
		end
		var2.attachPendingMilestones(p1.universeId, p1.sessionId, var28)
	end, {
		var2,
		p1.universeId,
		p1.sessionId,
		var28,
		if var26 ~= nil then var26.pendingMilestoneCount else 0
	})
	local var29 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getMessageIndexByKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var29 (ref), var2 (ref)
		local var30 = if p1.universeId == nil or p1.sessionId == nil then nil else `{p1.universeId}:{p1.sessionId}`
		
		if not p1.isHistoryExhausted then
			var4.current = nil
		end
		if not p1.isHistoryExhausted or var30 == nil or var4.current == var30 then return end
		local t = {}
		
		for i in var29 do
			t[i] = true
		end
		if var2.pruneAnchors(p1.universeId, p1.sessionId, t) then
			var4.current = var30
		end
	end, {
		var2, p1.isHistoryExhausted, p1.universeId, p1.sessionId, var29, var3
	})
	local t = {}
	
	if var26 ~= nil and var26.isAvailable and var27 then
		for i, v in var26.anchors do
			local afterMessageKey = var29[v.afterMessageKey]
			
			if afterMessageKey ~= nil then
				table.insert(t, {
					id = v.id,
					order = v.order,
					anchorIndex = afterMessageKey,
					isImpressed = v.impressed
				})
			end
		end
	end
	return {
		adUpsellCards = t,
		adUpsellFreePromotionsRemaining = var7,
		isAdUpsellCreatePending = isCreatePending,
		isAdCampaignSheetOpen = var11,
		hasAdCampaignCreateError = var10.hasCreateError,
		adCampaignCreateErrorKind = var10.createErrorKind,
		adCampaignDurationDays = if var13 ~= nil then nil else var13.durationDays,
		adCampaignEstimatedPriceRobux = if var13 ~= nil then nil else var13.estimatedPriceRobux,
		adCampaignOffers = if var13 ~= nil then nil else var13.campaignOffers,
		adCampaignRunStartTimeMs = if var13 ~= nil then nil else var13.runStartMs,
		adCampaignRunEndTimeMs = if var13 == nil or var13.durationDays == nil then nil else adCampaignScheduleUtilsModule.campaignEndMs(var13.runStartMs, var13.durationDays),
		isAdCampaignCreatedToastVisible = var15,
		onAdCampaignCreatedToastDismiss = reactModule.useCallback(function()
			-- upvalues: var16 (ref)
			var16(false)
		end, {}),
		onAdUpsellCreate = reactModule.useCallback(function()
			-- upvalues: p1 (ref), sendBuildExperienceEventModule (copy), var16 (ref), fFlagEnablePaidAdsModule (copy), var10 (ref), var5 (ref), var14 (ref), var8 (ref), var12 (ref)
			if not p1.isPageVisible then return end
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
			var16(false)
			
			if not fFlagEnablePaidAdsModule then
				var10.clearCreateError()
			end
			local var31 = if var5 ~= nil then nil else var5.offer
			var14(function(p2)
				-- upvalues: fFlagEnablePaidAdsModule (copy), var10 (copy), var31 (ref), var8 (copy)
				return if fFlagEnablePaidAdsModule and var10.hasCreateError and p2 ~= nil then p2 else {
					runStartMs = DateTime.now().UnixTimestampMillis,
					durationDays = if var31 ~= nil then nil else var31.durationDays,
					estimatedPriceRobux = if var31 ~= nil then nil else var31.displayAmountRobux,
					campaignOffers = var8
				}
			end)
			var12(true)
		end, {
			p1.isPageVisible, p1.universeId or 0, p1.sessionId or "", var5, var8,
			var10.clearCreateError, var10.hasCreateError
		}),
		onAdUpsellDismiss = reactModule.useCallback(function()
			-- upvalues: var2 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
			var2.dismissPermanently()
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
			-- upvalues: var12 (ref), fFlagEnablePaidAdsModule (copy), var10 (ref)
			var12(false)
			
			if fFlagEnablePaidAdsModule then
				var10.clearCreateError()
			end
		end, { var10.clearCreateError }),
		onAdCampaignSheetCreate = reactModule.useCallback(function(p2)
			-- upvalues: sendBuildExperienceEventModule (copy), p1 (ref), var17 (ref), var20 (ref), var7 (ref), fFlagEnablePaidAdsModule (copy), var21 (ref), var5 (ref), var10 (ref)
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
			var17.current = { universeId = p1.universeId, sessionId = p1.sessionId }
			var20.current = var7
			
			if fFlagEnablePaidAdsModule then
				var21.current = var5
			end
			var10.createCampaign(if fFlagEnablePaidAdsModule then p2 else nil)
		end, {
			p1.universeId or 0,
			p1.sessionId or "",
			var7,
			var5,
			var10.createCampaign
		})
	}
end