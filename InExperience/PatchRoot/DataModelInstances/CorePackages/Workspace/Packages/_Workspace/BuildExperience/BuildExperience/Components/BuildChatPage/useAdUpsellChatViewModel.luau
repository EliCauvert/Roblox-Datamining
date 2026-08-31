local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)
local _ = require(buildExperience.Chat.chatTypes)
local getAdUpsellEventStoreModule = require(buildExperience.Stores.GetAdUpsellEventStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local useCreateAdCampaignModule = require(buildExperience.Components.Ads.useCreateAdCampaign)
local useGetAdCampaignEligibilityModule = require(buildExperience.Components.Ads.useGetAdCampaignEligibility)
local useGetAdCampaignsModule = require(buildExperience.Components.Ads.useGetAdCampaigns)
local adUpsellPublishUtilsModule = require(script.Parent.adUpsellPublishUtils)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil

return function(p1)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), reactModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), useCreateAdCampaignModule (ref), useGetAdCampaignsModule (ref), adCampaignScheduleUtilsModule (ref), buildAppStorageKeyEngineFeature (ref), var1 (ref), adUpsellPublishUtilsModule (ref), sendBuildExperienceEventModule (ref)
	local var2 = getAdUpsellEventStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var2.getRevision)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = useGetAdCampaignEligibilityModule(p1.universeId)
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
	local var20, var21 = useGetAdCampaignsModule()
	local var22 = var21 == "Ready" and adCampaignScheduleUtilsModule.hasActiveCampaign(var20, p1.universeId, reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.nowMs == nil then DateTime.now().UnixTimestampMillis else p1.nowMs
	end, { p1.nowMs or 0, var20 or false }))
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var13 (ref), var15 (ref), var19 (ref), var18 (ref)
		var11(false)
		var13(nil)
		var15(false)
		var19.current = nil
		var18(false)
	end, { p1.universeId or 0, p1.sessionId or "" })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var6 (ref), var5 (ref), var7 (ref), var19 (ref), var18 (ref)
		if var17 and var6 == "Ready" and (var5 ~= nil and var7 ~= var19.current) then
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
	local var23 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), isCreatePending (ref), var16 (ref), var9 (ref), p1 (ref), var18 (ref), var19 (ref), var11 (ref), var15 (ref)
		local current = var23.current
		var23.current = isCreatePending
		
		if current and not isCreatePending then
			local current_1 = var16.current
			var16.current = nil
			
			if not var9.hasCreateError and (current_1 ~= nil and (current_1.universeId == p1.universeId and current_1.sessionId == p1.sessionId)) then
				var18(var19.current ~= nil)
				
				if p1.isPageVisible then
					var11(false)
					var15(true)
				end
			end
		end
	end, {
		isCreatePending, p1.isPageVisible, var9.hasCreateError, p1.universeId ~= nil,
		p1.universeId or 0, p1.sessionId ~= nil, p1.sessionId or ""
	})
	local var24 = reactModule.useMemo(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), p1 (ref), var1 (copy)
		return if buildAppStorageKeyEngineFeature and p1.universeId ~= nil then var1.getAdUpsellState(p1.universeId, p1.sessionId) else nil
	end, {
		var3,
		p1.universeId ~= nil,
		p1.universeId or 0,
		p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local var25 = p1.isPublic and (var8 and (not (if var24 ~= nil then not var24.isAvailable or var24.dismissedPermanently else true) and (not var22 and not var17)))
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var2 (ref)
		if var24 ~= nil and not var24.isAvailable then
			var2.retryStorageRead()
		end
	end, { var2, var24 ~= nil, var24 ~= nil and var24.isAvailable })
	local var26 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getLastMessageKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var26 (ref), var24 (ref), var2 (ref)
		if p1.universeId == nil or p1.sessionId == nil or (var26 == nil or var24 == nil) or var24.pendingMilestoneCount == 0 then
			return
		end
		var2.attachPendingMilestones(p1.universeId, p1.sessionId, var26)
	end, {
		var2,
		p1.universeId,
		p1.sessionId,
		var26,
		if var24 ~= nil then var24.pendingMilestoneCount else 0
	})
	local var27 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getMessageIndexByKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var27 (ref), var2 (ref)
		local var28 = if p1.universeId == nil or p1.sessionId == nil then nil else `{p1.universeId}:{p1.sessionId}`
		
		if not p1.isHistoryExhausted then
			var4.current = nil
		end
		if not p1.isHistoryExhausted or var28 == nil or var4.current == var28 then return end
		local t = {}
		
		for i in var27 do
			t[i] = true
		end
		if var2.pruneAnchors(p1.universeId, p1.sessionId, t) then
			var4.current = var28
		end
	end, {
		var2, p1.isHistoryExhausted, p1.universeId, p1.sessionId, var27, var3
	})
	local t = {}
	
	if var24 ~= nil and var24.isAvailable and var25 then
		for i, v in var24.anchors do
			local afterMessageKey = var27[v.afterMessageKey]
			
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
		isAdCampaignSheetOpen = var10,
		hasAdCampaignCreateError = var9.hasCreateError,
		adCampaignDurationDays = if var12 ~= nil then nil else var12.durationDays,
		adCampaignEstimatedPriceRobux = if var12 ~= nil then nil else var12.estimatedPriceRobux,
		adCampaignRunStartTimeMs = if var12 ~= nil then nil else var12.runStartMs,
		adCampaignRunEndTimeMs = if var12 == nil or var12.durationDays == nil then nil else adCampaignScheduleUtilsModule.campaignEndMs(var12.runStartMs, var12.durationDays),
		isAdCampaignCreatedToastVisible = var14,
		onAdCampaignCreatedToastDismiss = reactModule.useCallback(function()
			-- upvalues: var15 (ref)
			var15(false)
		end, {}),
		onAdUpsellCreate = reactModule.useCallback(function()
			-- upvalues: p1 (ref), sendBuildExperienceEventModule (copy), var15 (ref), var9 (ref), var5 (ref), var13 (ref), var11 (ref)
			if p1.isPageVisible then
				sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
					universeId = p1.universeId,
					conversationId = p1.sessionId
				})
				var15(false)
				var9.clearCreateError()
				local var29 = if var5 ~= nil then nil else var5.offer
				var13({
					runStartMs = DateTime.now().UnixTimestampMillis,
					durationDays = if var29 ~= nil then nil else var29.durationDays,
					estimatedPriceRobux = if var29 ~= nil then nil else var29.displayAmountRobux
				})
				var11(true)
				
				return
			end
		end, {
			p1.isPageVisible,
			p1.universeId or 0,
			p1.sessionId or "",
			var5,
			var9.clearCreateError
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
			-- upvalues: var11 (ref)
			var11(false)
		end, {}),
		onAdCampaignSheetCreate = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), p1 (ref), var16 (ref), var19 (ref), var7 (ref), var9 (ref)
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
			var16.current = { universeId = p1.universeId, sessionId = p1.sessionId }
			var19.current = var7
			var9.createCampaign()
		end, {
			p1.universeId or 0,
			p1.sessionId or "",
			var7,
			var9.createCampaign
		})
	}
end