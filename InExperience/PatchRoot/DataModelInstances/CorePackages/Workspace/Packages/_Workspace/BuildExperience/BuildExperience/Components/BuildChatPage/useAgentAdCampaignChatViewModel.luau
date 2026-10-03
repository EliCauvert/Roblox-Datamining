local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local playersService = game:GetService("Players")
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(buildExperience.Chat.chatTypes)
local useCreateAdCampaignModule = require(buildExperience.Components.Ads.useCreateAdCampaign)
local getAdUpsellEventStoreModule = require(buildExperience.Stores.GetAdUpsellEventStore)
local getAgentAdCampaignStoreModule = require(buildExperience.Stores.GetAgentAdCampaignStore)
local _ = require(buildExperience.Stores.GetAgentAdCampaignStore.createAgentAdCampaignStore)
local adCampaignToolCallStatusModule = require(parent.DataHydration.AdCampaignToolCallStatus)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(buildExperience.Storage.createAdCampaignCardStorage)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)

return function(p1, p2)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), getAgentAdCampaignStoreModule (ref), playersService (ref), reactModule (ref), useCreateAdCampaignModule (ref), adCampaignScheduleUtilsModule (ref), localizationStringsModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), adCampaignToolCallStatusModule (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = getAdUpsellEventStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getAdCampaignRevision)
	local var3 = getAgentAdCampaignStoreModule(false)
	local var4 = signalsReactModule.useSignalState(var3.getAttempts)
	local localPlayer = playersService.LocalPlayer
	local var5 = p2
	
	if not var5 then
		var5 = if localPlayer == nil or localPlayer.UserId <= 0 then nil else localPlayer.UserId
	end
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = if var6 ~= nil then nil else var4[var6.toolCallId]
	local var10 = useCreateAdCampaignModule(p1.universeId, p1.sessionId)
	local var11, var12 = reactModule.useState(DateTime.now().UnixTimestampMillis)
	local var13 = reactModule.useRef(true)
	local var14 = reactModule.useRef(p1)
	var14.current = p1
	local var15 = reactModule.useRef(p1.isPageVisible)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref)
		var13.current = true
		
		return function()
			-- upvalues: var13 (copy)
			var13.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var7 (ref)
		var8.current = nil
		var7(nil)
	end, { p1.universeId, p1.sessionId })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.isPageVisible then
			var1.retryAdCampaignCardWrites()
		end
	end, { p1.isPageVisible, var1 })
	local var16 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref)
		local t = {}
		
		if p1.sessionId ~= nil then
			for i, v in var1.listAdCampaignCards(p1.sessionId).records do
				if v.universeId == p1.universeId and v.campaignId ~= nil then
					t[v.toolCallId] = v
				end
			end
		end
		return t
	end, { p1.sessionId, p1.universeId, var1, var2 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), p1 (ref), var12 (ref)
		local current = var15.current
		var15.current = p1.isPageVisible
		
		if p1.isPageVisible and not current then
			var12(DateTime.now().UnixTimestampMillis)
		end
	end, { p1.isPageVisible })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var16 (ref), adCampaignScheduleUtilsModule (copy), var11 (ref), var12 (ref)
		if not p1.isPageVisible then return end
		local var17 = 1e999
		
		for i, v in var16 do
			if v.durationDays ~= nil then
				local var18 = adCampaignScheduleUtilsModule.campaignEndExclusiveMs(v.createdAtMs, v.durationDays)
				
				if var11 < var18 then
					var17 = math.min(var17, var18)
				end
			end
		end
		if var17 == 1e999 then
			return
		end
		local delayedThread = nil
		delayedThread = task.delay(math.max(0, var17 - DateTime.now().UnixTimestampMillis) / 1000, function()
			-- upvalues: delayedThread (write), var12 (copy)
			delayedThread = nil
			var12(DateTime.now().UnixTimestampMillis)
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { var16, p1.isPageVisible, var11 })
	local var19 = reactModule.useCallback(function(p3)
		-- upvalues: var16 (ref), var11 (ref), adCampaignScheduleUtilsModule (copy), localizationStringsModule (copy)
		local var20 = var16[p3]
		
		if var20 == nil or var20.campaignId == nil then
			return nil
		end
		local durationDays = var20.durationDays
		
		return {
			campaignId = var20.campaignId,
			variant = if durationDays == nil then nil elseif adCampaignScheduleUtilsModule.campaignEndExclusiveMs(var20.createdAtMs, durationDays) <= var11 then "complete" else "active",
			campaignStartDate = if durationDays ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(var20.createdAtMs),
			campaignEndDate = if durationDays ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(adCampaignScheduleUtilsModule.campaignEndMs(var20.createdAtMs, durationDays))
		}
	end, { var16, var11 })
	local var20 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), p1 (ref)
		local var21 = var4[p3]
		
		return if p1.isPageVisible then var21 ~= nil and var21.isPending else not p1.isPageVisible
	end, { p1.isPageVisible, var4 })
	local var21 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var3 (ref), var1 (ref), var8 (ref), var14 (ref), var13 (ref), var7 (ref)
		if not var3.finish(p3, true) then return end
		local selectedOption = p3.selectedOption
		local var22 = if selectedOption.campaignOption == "feedback" then p3.offers.feedback else p3.offers.plays
		assert(var22 ~= nil, "A submitted campaign must have an offer")
		var1.recordAdCampaignCreatedReceipt({
			phase = "created",
			sessionId = p3.sessionId,
			universeId = p3.universeId,
			toolCallId = p3.toolCallId,
			campaignId = p4,
			idempotencyKey = p5 or p3.idempotencyKey,
			campaignOption = selectedOption.campaignOption,
			fundingType = selectedOption.paymentType,
			durationDays = var22.durationDays,
			displayAmountRobux = var22.priceRobux,
			createdAtMs = p3.runStartTimeMs,
			updatedAtMs = DateTime.now().UnixTimestampMillis
		})
		local current = var8.current
		local current_1 = var14.current
		
		if var13.current and current ~= nil and (current.toolCallId == p3.toolCallId and current.universeId == p3.universeId) and (current.sessionId == p3.sessionId and current_1.universeId == p3.universeId and current_1.sessionId == p3.sessionId) then
			var8.current = nil
			var7(nil)
		end
	end, { var3, var1 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var5 (ref), var4 (ref), adCampaignToolCallStatusModule (copy), signalsModule (copy), var21 (ref)
		if not fFlagBuildAgentAdCampaignToolCallStatusFallbackModule or var5 == nil then return end
		local t = {}
		
		for i, v in var4 do
			if not v.isPending then
				local var22 = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).fetchToolCallStatus(var5, v.toolCallId)
				table.insert(t, signalsModule.createEffect(function(p3)
					-- upvalues: var22 (ref), var21 (copy), v (ref)
					local var23 = var22.data(p3)
					
					if var22.status(p3) == "Ready" and var23 ~= nil and var23.campaignId ~= nil then
						var21(v, var23.campaignId)
					end
				end))
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end
	end, { var4, var5, var21 })
	local var23 = var6 ~= nil and (var6.universeId == p1.universeId and (var6.sessionId == p1.sessionId and p1.isPageVisible))
	
	return {
		isSheetOpen = var23,
		isCreatePending = var10.isCreatePending or (var9 ~= nil and var9.isPending),
		hasCreateError = var9 ~= nil and not var9.isPending,
		createErrorKind = var10.createErrorKind,
		campaignOffers = if var6 ~= nil then nil else var6.offers,
		attemptedOption = if var9 ~= nil then nil else var9.selectedOption,
		runStartTimeMs = if var6 ~= nil then nil else var6.runStartTimeMs,
		onOfferSelected = reactModule.useCallback(function(p3, p4)
			-- upvalues: p1 (ref), var16 (ref), var14 (ref), var8 (ref), var1 (ref), var3 (ref), var7 (ref), var10 (ref)
			if not p1.isPageVisible or p1.universeId == nil or (p1.universeId == 0 or p1.sessionId == nil) or (p3 == "" or var16[p3] ~= nil or (var14.current.universeId ~= p1.universeId or var14.current.sessionId ~= p1.sessionId)) or (not var14.current.isPageVisible or var8.current ~= nil or p4.feedback == nil and p4.plays == nil) then return end
			local record = var1.getAdCampaignCard(p1.sessionId, p3).record
			
			if record ~= nil and record.universeId == p1.universeId and record.campaignId ~= nil then return end
			local var24 = var3.getAttempts(false)[p3]
			
			if var24 == nil or not var24.isPending and var24.universeId == p1.universeId and var24.sessionId == p1.sessionId then
				local var25 = var24 or {
					universeId = p1.universeId,
					sessionId = p1.sessionId,
					toolCallId = p3,
					offers = {
						feedback = if p4.feedback ~= nil then nil else table.clone(p4.feedback),
						plays = if p4.plays ~= nil then nil else table.clone(p4.plays)
					},
					runStartTimeMs = DateTime.now().UnixTimestampMillis
				}
				var8.current = var25
				var7(var25)
				var10.clearCreateError()
				
				return
			end
		end, {
			p1.isPageVisible, p1.universeId, p1.sessionId, var16, var1, var3,
			var10.clearCreateError
		}),
		isCreateDisabled = var20,
		getCardState = var19,
		onSheetClose = reactModule.useCallback(function()
			-- upvalues: var10 (ref), var6 (ref), var8 (ref), var7 (ref)
			if not var10.isCreatePending and var6 ~= nil and var8.current == var6 then
				var8.current = nil
				var7(nil)
			end
		end, { var10.isCreatePending, var6 }),
		onSheetCreate = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), var8 (ref), var23 (ref), var14 (ref), var10 (ref), var16 (ref), var3 (ref), sendBuildExperienceEventModule (copy), var21 (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var5 (ref), adCampaignToolCallStatusModule (copy)
			if var6 == nil or var8.current ~= var6 or (p3 == nil or not var23) or (not var14.current.isPageVisible or var14.current.universeId ~= var6.universeId or (var14.current.sessionId ~= var6.sessionId or var10.isCreatePending)) or var16[var6.toolCallId] ~= nil then return end
			local var24 = if p3.campaignOption == "feedback" then var6.offers.feedback else var6.offers.plays
			
			if var24 == nil or var24.fundingType ~= p3.paymentType then return end
			local var25 = var3.start(var6, p3)
			
			if var25 == nil then
				return
			end
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = var6.universeId,
				conversationId = var6.sessionId
			}, {
				context = "agent_card",
				fundingType = p3.paymentType,
				campaignOption = p3.campaignOption
			})
			var10.createCampaign(p3, function(p4, p5, p6)
				-- upvalues: var21 (copy), var25 (ref)
				if p6 ~= nil then
					var21(var25, p4, p5)
				end
			end, if fFlagBuildAgentAdCampaignToolCallStatusFallbackModule then var6.toolCallId else nil, {
				idempotencyKey = var25.idempotencyKey,
				onFailed = function(p4)
					-- upvalues: var3 (copy), var25 (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var5 (copy), adCampaignToolCallStatusModule (copy)
					if var3.finish(var25, false, p4) and fFlagBuildAgentAdCampaignToolCallStatusFallbackModule and var5 ~= nil then
						adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).fetchToolCallStatus(var5, var25.toolCallId)
					end
				end
			})
		end, {
			var6, var3, var21, var5, var23, var16, var10.isCreatePending,
			var10.createCampaign
		})
	}
end