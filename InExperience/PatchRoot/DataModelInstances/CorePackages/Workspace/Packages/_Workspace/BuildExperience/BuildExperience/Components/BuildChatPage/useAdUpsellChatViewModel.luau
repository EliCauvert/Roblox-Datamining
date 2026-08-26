local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Chat.chatTypes)
local getAdUpsellEligibilityModule = require(buildExperience.Components.Ads.getAdUpsellEligibility)
local getAdUpsellEventStoreModule = require(buildExperience.Stores.GetAdUpsellEventStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local adUpsellPublishUtilsModule = require(script.Parent.adUpsellPublishUtils)
local buildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local var1 = if buildAppStorageKeyEngineFeature then require(buildExperience.Storage.BuildAppStorage) else nil

return function(p1)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), reactModule (ref), getAdUpsellEligibilityModule (ref), buildAppStorageKeyEngineFeature (ref), var1 (ref), adUpsellPublishUtilsModule (ref), sendBuildExperienceEventModule (ref)
	local var2 = getAdUpsellEventStoreModule(false)
	local var3 = signalsReactModule.useSignalState(var2.getRevision)
	local var4 = reactModule.useRef(nil)
	local var5 = getAdUpsellEligibilityModule(p1.universeId)
	local var6 = var5.isEligible and var5.freePromotionsRemaining > 0
	local var7, var8 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		var8(false)
	end, { p1.universeId or 0, p1.sessionId or "" })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var8 (ref)
		if not p1.isPageVisible then
			var8(false)
		end
	end, { p1.isPageVisible })
	local var9 = reactModule.useMemo(function()
		-- upvalues: buildAppStorageKeyEngineFeature (copy), p1 (ref), var1 (copy)
		return if buildAppStorageKeyEngineFeature and p1.universeId ~= nil then var1.getAdUpsellState(p1.universeId, p1.sessionId) else nil
	end, {
		var3,
		p1.universeId ~= nil,
		p1.universeId or 0,
		p1.sessionId ~= nil,
		p1.sessionId or ""
	})
	local var10 = p1.isPublic and (var6 and not (if var9 ~= nil then not var9.isAvailable or var9.dismissedPermanently else true))
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var2 (ref)
		if var9 ~= nil and not var9.isAvailable then
			var2.retryStorageRead()
		end
	end, { var2, var9 ~= nil, var9 ~= nil and var9.isAvailable })
	local var11 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getLastMessageKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var11 (ref), var9 (ref), var2 (ref)
		if p1.universeId == nil or p1.sessionId == nil or (var11 == nil or var9 == nil) or var9.pendingMilestoneCount == 0 then
			return
		end
		var2.attachPendingMilestones(p1.universeId, p1.sessionId, var11)
	end, {
		var2,
		p1.universeId,
		p1.sessionId,
		var11,
		if var9 ~= nil then var9.pendingMilestoneCount else 0
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: adUpsellPublishUtilsModule (copy), p1 (ref)
		return adUpsellPublishUtilsModule.getMessageIndexByKey(p1.messages)
	end, { p1.messages })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), var12 (ref), var2 (ref)
		local var13 = if p1.universeId == nil or p1.sessionId == nil then nil else `{p1.universeId}:{p1.sessionId}`
		
		if not p1.isHistoryExhausted then
			var4.current = nil
		end
		if not p1.isHistoryExhausted or var13 == nil or var4.current == var13 then return end
		local t = {}
		
		for i in var12 do
			t[i] = true
		end
		if var2.pruneAnchors(p1.universeId, p1.sessionId, t) then
			var4.current = var13
		end
	end, {
		var2, p1.isHistoryExhausted, p1.universeId, p1.sessionId, var12, var3
	})
	local t = {}
	
	if var9 ~= nil and var9.isAvailable and var10 then
		for i, v in var9.anchors do
			local afterMessageKey = var12[v.afterMessageKey]
			
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
		isAdUpsellCreatePending = false,
		adUpsellCards = t,
		adUpsellFreePromotionsRemaining = var5.freePromotionsRemaining,
		isAdCampaignSheetOpen = var7,
		onAdUpsellCreate = reactModule.useCallback(function()
			-- upvalues: p1 (ref), sendBuildExperienceEventModule (copy), var8 (ref)
			if p1.isPageVisible then
				sendBuildExperienceEventModule("AD_UPSELL_CREATE_CLICK", {
					universeId = p1.universeId,
					conversationId = p1.sessionId
				})
				var8(true)
				
				return
			end
		end, { p1.isPageVisible, p1.universeId or 0, p1.sessionId or "" }),
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
			-- upvalues: var8 (ref)
			var8(false)
		end, {}),
		onAdCampaignSheetCreate = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), p1 (ref)
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = p1.universeId,
				conversationId = p1.sessionId
			})
		end, { p1.universeId or 0, p1.sessionId or "" })
	}
end