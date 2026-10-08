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
local adCampaignsModule = require(parent.DataHydration.AdCampaigns)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(buildExperience.Storage.createAdCampaignCardStorage)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)

local function _(p1)
	return {
		get = p1.getAdCampaignCard,
		save = p1.recordAdCampaignAttempt
	}
end

return function(p1, p2)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), getAgentAdCampaignStoreModule (ref), adCampaignsModule (ref), playersService (ref), reactModule (ref), useCreateAdCampaignModule (ref), adCampaignScheduleUtilsModule (ref), localizationStringsModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), adCampaignToolCallStatusModule (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = getAdUpsellEventStoreModule(false)
	local var2 = signalsReactModule.useSignalState(var1.getAdCampaignRevision)
	local var3 = getAgentAdCampaignStoreModule(false)
	local var4 = signalsReactModule.useSignalState(var3.getAttempts)
	local adCampaignsStore = adCampaignsModule.getAdCampaignsStore(false)
	local var5 = signalsReactModule.useSignalState(adCampaignsStore.getAdCampaigns().data)
	local localPlayer = playersService.LocalPlayer
	local var6 = p2
	
	if not var6 then
		var6 = if localPlayer == nil or localPlayer.UserId <= 0 then nil else localPlayer.UserId
	end
	local var7, var8 = reactModule.useState(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = if var7 ~= nil then nil else var4[var7.toolCallId]
	local var11 = useCreateAdCampaignModule(p1.universeId, p1.sessionId)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(DateTime.now().UnixTimestampMillis)
	local var16 = reactModule.useRef(true)
	local t = {
		universeId = p1.universeId,
		sessionId = p1.sessionId,
		isPageVisible = p1.isPageVisible,
		userId = var6
	}
	local var17 = reactModule.useRef(t)
	var17.current = t
	local var18 = reactModule.useRef(p1.isPageVisible)
	reactModule.useEffect(function()
		-- upvalues: var16 (ref)
		var16.current = true
		
		return function()
			-- upvalues: var16 (copy)
			var16.current = false
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref)
		var9.current = nil
		var8(nil)
	end, { p1.universeId, p1.sessionId, var6 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.isPageVisible then
			var1.retryAdCampaignCardWrites()
		end
	end, { p1.isPageVisible, var1 })
	local var19 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (ref), var6 (ref)
		local t = {}
		
		if p1.sessionId ~= nil then
			for i, v in var1.listAdCampaignCards(p1.sessionId).records do
				if (v.userId == nil or v.userId == var6) and v.universeId == p1.universeId then
					t[v.toolCallId] = v
				end
			end
		end
		return t
	end, {
		p1.sessionId,
		p1.universeId,
		var1,
		var2,
		var6
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: var19 (ref)
		local t = {}
		
		for i, v in var19 do
			if v.campaignId ~= nil then
				t[i] = v
			end
		end
		return t
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var20 (ref), adCampaignsStore (ref)
		if p1.isPageVisible and next(var20) ~= nil then
			adCampaignsStore.getAndFetchAdCampaigns()
		end
	end, { var20, p1.isPageVisible, adCampaignsStore })
	local var21 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), p1 (ref), var20 (ref), adCampaignScheduleUtilsModule (copy)
		local t = {}
		
		for i, v in var5 or {} do
			if v.targetUniverseId == tostring(p1.universeId) then
				t[v.id] = v
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in var20 do
			local campaignId = t[v_1.campaignId]
			
			if campaignId ~= nil then
				local var22 = adCampaignScheduleUtilsModule.toStartMs(campaignId.schedule.startTime)
				
				if var22 > 0 and campaignId.schedule.durationInDays > 0 then
					t_1[i_1] = {
						startMs = var22,
						durationDays = campaignId.schedule.durationInDays
					}
				end
			elseif (v_1.userId == nil or v_1.idempotencyKey ~= i_1) and v_1.durationDays ~= nil then
				t_1[i_1] = {
					startMs = v_1.createdAtMs,
					durationDays = v_1.durationDays
				}
			end
		end
		return t_1
	end, { var20, var5, p1.universeId })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref), var15 (ref)
		local current = var18.current
		var18.current = p1.isPageVisible
		
		if p1.isPageVisible and not current then
			var15(DateTime.now().UnixTimestampMillis)
		end
	end, { p1.isPageVisible })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var21 (ref), adCampaignScheduleUtilsModule (copy), var14 (ref), var15 (ref)
		if not p1.isPageVisible then return end
		local var23 = 1e999
		
		for i, v in var21 do
			local var24 = adCampaignScheduleUtilsModule.campaignEndExclusiveMs(v.startMs, v.durationDays)
			
			if var14 < var24 then
				var23 = math.min(var23, var24)
			end
		end
		if var23 == 1e999 then
			return
		end
		local delayedThread = nil
		delayedThread = task.delay(math.max(0, var23 - DateTime.now().UnixTimestampMillis) / 1000, function()
			-- upvalues: delayedThread (write), var15 (copy)
			delayedThread = nil
			var15(DateTime.now().UnixTimestampMillis)
		end)
		
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread ~= nil then
				task.cancel(delayedThread)
			end
		end
	end, { var21, p1.isPageVisible, var14 })
	local var25 = reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var21 (ref), var14 (ref), adCampaignScheduleUtilsModule (copy), localizationStringsModule (copy)
		local var26 = var20[p3]
		
		if var26 == nil or var26.campaignId == nil then
			return nil
		end
		local var27 = var21[p3]
		
		return {
			campaignId = var26.campaignId,
			variant = if var27 == nil then nil elseif adCampaignScheduleUtilsModule.campaignEndExclusiveMs(var27.startMs, var27.durationDays) <= var14 then "complete" else "active",
			campaignStartDate = if var27 ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(var27.startMs),
			campaignEndDate = if var27 ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(adCampaignScheduleUtilsModule.campaignEndMs(var27.startMs, var27.durationDays))
		}
	end, { var20, var21, var14 })
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), p1 (ref)
		local var27 = var4[p3]
		
		return if p1.isPageVisible then var27 ~= nil and var27.isPending else not p1.isPageVisible
	end, { p1.isPageVisible, var4 })
	local var27 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var1 (ref), var3 (ref), var9 (ref), var17 (ref), var16 (ref), var8 (ref)
		if p5 ~= nil and p5 ~= p3.idempotencyKey then
			return false
		end
		local cloned = table.clone(p3)
		cloned.campaignId = p4
		cloned.phase = "created"
		cloned.updatedAtMs = math.max(p3.updatedAtMs, DateTime.now().UnixTimestampMillis)
		local var28, var29 = var1.recordAdCampaignCreatedReceipt(cloned)
		
		if not var28 and not var29 then
			return false
		end
		var3.completeDurable(p3)
		local current = var9.current
		local current_1 = var17.current
		
		if var16.current and current ~= nil and (current.toolCallId == p3.toolCallId and current.universeId == p3.universeId) and (current.sessionId == p3.sessionId and current_1.universeId == p3.universeId and (current_1.sessionId == p3.sessionId and current_1.userId == p3.userId)) then
			var9.current = nil
			var8(nil)
		end
		return var29
	end, { var3, var1 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var6 (ref), var19 (ref), var4 (ref), adCampaignToolCallStatusModule (copy), signalsModule (copy), var27 (ref), var11 (ref)
		if not fFlagBuildAgentAdCampaignToolCallStatusFallbackModule or var6 == nil then return end
		local t = {}
		
		for i, v in var19 do
			if v.userId == var6 and v.campaignId == nil then
				local toolCallId = var4[v.toolCallId]
				
				if toolCallId == nil or not toolCallId.isPending then
					local andFetchToolCallStatus = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getAndFetchToolCallStatus(var6, v.toolCallId)
					table.insert(t, signalsModule.createEffect(function(p3)
						-- upvalues: andFetchToolCallStatus (ref), var27 (copy), v (ref), var11 (copy)
						local var28 = andFetchToolCallStatus.data(p3)
						
						if andFetchToolCallStatus.status(p3) == "Ready" and var28 ~= nil and (var28.campaignId ~= nil and var27(v, var28.campaignId)) then
							var11.refresh()
						end
					end))
				end
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v()
			end
		end
	end, {
		var19,
		var4,
		var6,
		var27,
		var11.refresh
	})
	local var28 = var7 ~= nil and (var7.universeId == p1.universeId and (var7.sessionId == p1.sessionId and p1.isPageVisible))
	
	return {
		isSheetOpen = var28,
		isCreatePending = var11.isCreatePending or (var10 ~= nil and var10.isPending),
		hasCreateError = if var10 ~= nil then not var10.isPending else var12,
		createErrorKind = if var10 ~= nil then var11.createErrorKind else var10.failureKind,
		campaignOffers = if var7 ~= nil then nil else var7.offers,
		attemptedOption = if var10 ~= nil then nil else var10.selectedOption,
		runStartTimeMs = if var7 ~= nil then nil else var7.runStartTimeMs,
		onOfferSelected = reactModule.useCallback(function(p3, p4)
			-- upvalues: var6 (ref), var17 (ref), p1 (ref), var20 (ref), var9 (ref), var1 (ref), var3 (ref), var13 (ref), var8 (ref), var11 (ref)
			if var6 == nil or var17.current.userId ~= var6 then return end
			if not p1.isPageVisible or p1.universeId == nil or (p1.universeId == 0 or p1.sessionId == nil) or (p3 == "" or var20[p3] ~= nil or (var17.current.universeId ~= p1.universeId or var17.current.sessionId ~= p1.sessionId)) or (not var17.current.isPageVisible or var9.current ~= nil or p4.feedback == nil and p4.plays == nil) then return end
			local record = var1.getAdCampaignCard(p1.sessionId, p3).record
			
			if record ~= nil and record.universeId == p1.universeId and record.campaignId ~= nil then return end
			local var29 = var1
			
			if not var3.restore({
				universeId = p1.universeId,
				sessionId = p1.sessionId,
				toolCallId = p3,
				offers = p4,
				runStartTimeMs = DateTime.now().UnixTimestampMillis
			}, var6, {
				get = var29.getAdCampaignCard,
				save = var29.recordAdCampaignAttempt
			}) then
				var13(true)
				
				return
			end
			var13(false)
			local var30 = var3.getAttempts(false)[p3]
			
			if var30 == nil or not var30.isPending and var30.userId == var6 and (var30.universeId == p1.universeId and var30.sessionId == p1.sessionId) then
				local var31 = if var30 ~= nil then {
					universeId = p1.universeId,
					sessionId = p1.sessionId,
					toolCallId = p3,
					offers = {
						feedback = if p4.feedback ~= nil then nil else table.clone(p4.feedback),
						plays = if p4.plays ~= nil then nil else table.clone(p4.plays)
					},
					runStartTimeMs = DateTime.now().UnixTimestampMillis
				} else var3.getRetrySelection(var30, DateTime.now().UnixTimestampMillis)
				var9.current = var31
				var8(var31)
				var11.clearCreateError()
				
				return
			end
		end, {
			p1.isPageVisible, p1.universeId, p1.sessionId, var20, var1, var3,
			var11.clearCreateError, var6, var13
		}),
		isCreateDisabled = var26,
		getCardState = var25,
		onSheetClose = reactModule.useCallback(function()
			-- upvalues: var11 (ref), var7 (ref), var9 (ref), var8 (ref)
			if not var11.isCreatePending and var7 ~= nil and var9.current == var7 then
				var9.current = nil
				var8(nil)
			end
		end, { var11.isCreatePending, var7 }),
		onSheetCreate = reactModule.useCallback(function(p3)
			-- upvalues: var6 (ref), var17 (ref), var7 (ref), var9 (ref), var28 (ref), var11 (ref), var20 (ref), var3 (ref), var1 (ref), var13 (ref), var8 (ref), sendBuildExperienceEventModule (copy), var27 (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), adCampaignToolCallStatusModule (copy)
			if var6 == nil or var17.current.userId ~= var6 then return end
			if var7 == nil or var9.current ~= var7 or (p3 == nil or not var28) or (not var17.current.isPageVisible or var17.current.universeId ~= var7.universeId or (var17.current.sessionId ~= var7.sessionId or var11.isCreatePending)) or var20[var7.toolCallId] ~= nil then return end
			local var29 = if p3.campaignOption == "feedback" then var7.offers.feedback else var7.offers.plays
			
			if var29 == nil or var29.fundingType ~= p3.paymentType then return end
			local toolCallId = var3.getAttempts(false)[var7.toolCallId]
			
			if toolCallId ~= nil and toolCallId.isPending then return end
			local var30 = var1
			
			if not var3.restore(var7, var6, {
				get = var30.getAdCampaignCard,
				save = var30.recordAdCampaignAttempt
			}) then
				var13(true)
				
				return
			end
			local retrySelection
			local toolCallId_1 = var3.getAttempts(false)[var7.toolCallId]
			
			if toolCallId_1 ~= nil then
				retrySelection = var3.getRetrySelection(toolCallId_1, var7.runStartTimeMs)
				local var31 = if p3.campaignOption == "feedback" then retrySelection.offers.feedback else retrySelection.offers.plays
				
				if var7.runStartTimeMs ~= retrySelection.runStartTimeMs or var31 == nil or (var29.fundingType ~= var31.fundingType or var29.durationDays ~= var31.durationDays) or var29.priceRobux ~= var31.priceRobux then
					var9.current = retrySelection
					var8(retrySelection)
					var13(false)
					
					return
				end
			end
			retrySelection = var3.startDurable(var7, p3, var6, {
				get = var1.getAdCampaignCard,
				save = var1.recordAdCampaignAttempt
			})
			var13(retrySelection == nil)
			
			if retrySelection == nil then
				return
			end
			sendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = var7.universeId,
				conversationId = var7.sessionId
			}, {
				context = "agent_card",
				fundingType = p3.paymentType,
				campaignOption = p3.campaignOption
			})
			var11.createCampaign(p3, function(p4, p5, p6)
				-- upvalues: var27 (copy), var3 (copy), retrySelection (ref)
				if p6 ~= nil then
					var27(var3.toRecord(retrySelection), p4, p5)
				end
			end, if fFlagBuildAgentAdCampaignToolCallStatusFallbackModule then var7.toolCallId else nil, {
				idempotencyKey = retrySelection.idempotencyKey,
				onFailed = function(p4)
					-- upvalues: var3 (copy), retrySelection (ref), var1 (copy), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var6 (copy), adCampaignToolCallStatusModule (copy)
					if var3.finishDurable(retrySelection, p4, {
						get = var1.getAdCampaignCard,
						save = var1.recordAdCampaignAttempt
					}) and fFlagBuildAgentAdCampaignToolCallStatusFallbackModule and var6 ~= nil then
						adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).fetchToolCallStatus(var6, retrySelection.toolCallId)
					end
				end
			})
		end, {
			var7, var3, var27, var6, var28, var20, var11.isCreatePending,
			var11.createCampaign, var1, var13
		})
	}
end