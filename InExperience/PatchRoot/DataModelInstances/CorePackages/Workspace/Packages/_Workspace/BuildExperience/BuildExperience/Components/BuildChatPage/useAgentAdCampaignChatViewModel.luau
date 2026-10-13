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
local adCampaignEligibilityModule = require(parent.DataHydration.AdCampaignEligibility)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(buildExperience.Storage.createAdCampaignCardStorage)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local adCampaignScheduleUtilsModule = require(buildExperience.Components.Ads.adCampaignScheduleUtils)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local fFlagBuildAgentAdCampaignRefreshEligibilityModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)
local fFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(buildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)

local function _(p1)
	return {
		get = p1.getAdCampaignCard,
		save = p1.recordAdCampaignAttempt
	}
end

local _ = function(p1, p2)
	-- upvalues: adCampaignToolCallStatusModule (ref)
	local var1 = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(p1, p2).data(false)
	
	return var1 ~= nil and var1.status == "failed"
end

return function(p1, p2)
	-- upvalues: getAdUpsellEventStoreModule (ref), signalsReactModule (ref), getAgentAdCampaignStoreModule (ref), adCampaignsModule (ref), playersService (ref), reactModule (ref), useCreateAdCampaignModule (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (ref), adCampaignScheduleUtilsModule (ref), localizationStringsModule (ref), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (ref), adCampaignToolCallStatusModule (ref), signalsModule (ref), adCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), sendBuildExperienceEventModule (ref)
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
	local var19 = if fFlagBuildAgentAdCampaignRefreshEligibilityModule then reactModule.useRef(nil) else nil
	local var20 = if fFlagBuildAgentAdCampaignRefreshEligibilityModule then reactModule.useRef(nil) else nil
	local var21 = nil
	local var22 = nil
	
	if fFlagBuildAgentAdCampaignRefreshEligibilityModule then
		local var23, var24 = reactModule.useState(nil)
		var21 = var23
		var22 = var24
		reactModule.useEffect(function()
			-- upvalues: var22 (write), var19 (ref)
			var22(nil)
			
			return function()
				-- upvalues: var19 (copy)
				local current = var19.current
				var19.current = nil
				
				if current ~= nil and current.timer ~= nil then
					task.cancel(current.timer)
				end
			end
		end, {
			p1.universeId, p1.sessionId, p1.isPageVisible, var6, var19, var22
		})
	end
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
	local var25 = reactModule.useMemo(function()
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
	local var26 = reactModule.useMemo(function()
		-- upvalues: var25 (ref)
		local t = {}
		
		for i, v in var25 do
			if v.campaignId ~= nil then
				t[i] = v
			end
		end
		return t
	end, { var25 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var26 (ref), adCampaignsStore (ref)
		if p1.isPageVisible and next(var26) ~= nil then
			adCampaignsStore.getAndFetchAdCampaigns()
		end
	end, { var26, p1.isPageVisible, adCampaignsStore })
	local var27 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), p1 (ref), var26 (ref), adCampaignScheduleUtilsModule (copy)
		local t = {}
		
		for i, v in var5 or {} do
			if v.targetUniverseId == tostring(p1.universeId) then
				t[v.id] = v
			end
		end
		local t_1 = {}
		
		for i_1, v_1 in var26 do
			local campaignId = t[v_1.campaignId]
			
			if campaignId ~= nil then
				local var28 = adCampaignScheduleUtilsModule.toStartMs(campaignId.schedule.startTime)
				
				if var28 > 0 and campaignId.schedule.durationInDays > 0 then
					t_1[i_1] = {
						startMs = var28,
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
	end, { var26, var5, p1.universeId })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref), var15 (ref)
		local current = var18.current
		var18.current = p1.isPageVisible
		
		if p1.isPageVisible and not current then
			var15(DateTime.now().UnixTimestampMillis)
		end
	end, { p1.isPageVisible })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var27 (ref), adCampaignScheduleUtilsModule (copy), var14 (ref), var15 (ref)
		if not p1.isPageVisible then return end
		local var29 = 1e999
		
		for i, v in var27 do
			local var30 = adCampaignScheduleUtilsModule.campaignEndExclusiveMs(v.startMs, v.durationDays)
			
			if var14 < var30 then
				var29 = math.min(var29, var30)
			end
		end
		if var29 == 1e999 then
			return
		end
		local delayedThread = nil
		delayedThread = task.delay(math.max(0, var29 - DateTime.now().UnixTimestampMillis) / 1000, function()
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
	end, { var27, p1.isPageVisible, var14 })
	local var31 = reactModule.useCallback(function(p3)
		-- upvalues: var26 (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), var21 (write), var27 (ref), var14 (ref), adCampaignScheduleUtilsModule (copy), localizationStringsModule (copy)
		local var32 = var26[p3]
		
		if var32 ~= nil and var32.campaignId ~= nil then
			local var33 = var27[p3]
			
			return {
				campaignId = var32.campaignId,
				variant = if var33 == nil then nil elseif adCampaignScheduleUtilsModule.campaignEndExclusiveMs(var33.startMs, var33.durationDays) <= var14 then "complete" else "active",
				campaignStartDate = if var33 ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(var33.startMs),
				campaignEndDate = if var33 ~= nil then nil else localizationStringsModule.formatAdCampaignSheetLocalDate(adCampaignScheduleUtilsModule.campaignEndMs(var33.startMs, var33.durationDays))
			}
		end
		return if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var21 ~= nil and var21.toolCallId == p3 then { eligibilityStatus = var21.status } else nil
	end, { var26, var27, var14, var21 })
	local var32 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), var21 (write), var4 (ref), p1 (ref)
		if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var21 ~= nil and var21.status == "loading" then
			return true
		end
		local var33 = var4[p3]
		
		return if p1.isPageVisible then var33 ~= nil and var33.isPending else not p1.isPageVisible
	end, { p1.isPageVisible, var4, var21 })
	local var33 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: var1 (ref), var3 (ref), var9 (ref), var17 (ref), var16 (ref), var8 (ref)
		if p5 ~= nil and p5 ~= p3.idempotencyKey then
			return false
		end
		local cloned = table.clone(p3)
		cloned.campaignId = p4
		cloned.phase = "created"
		cloned.updatedAtMs = math.max(p3.updatedAtMs, DateTime.now().UnixTimestampMillis)
		local var34, var35 = var1.recordAdCampaignCreatedReceipt(cloned)
		
		if not var34 and not var35 then
			return false
		end
		var3.completeDurable(p3)
		local current = var9.current
		local current_1 = var17.current
		
		if var16.current and current ~= nil and (current.toolCallId == p3.toolCallId and current.universeId == p3.universeId) and (current.sessionId == p3.sessionId and current_1.universeId == p3.universeId and (current_1.sessionId == p3.sessionId and current_1.userId == p3.userId)) then
			var9.current = nil
			var8(nil)
		end
		return var35
	end, { var3, var1 })
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), var6 (ref), var25 (ref), var4 (ref), adCampaignToolCallStatusModule (copy), signalsModule (copy), var33 (ref), var11 (ref)
		if not fFlagBuildAgentAdCampaignToolCallStatusFallbackModule or var6 == nil then return end
		local t = {}
		
		for i, v in var25 do
			if v.userId == var6 and v.campaignId == nil then
				local toolCallId = var4[v.toolCallId]
				
				if toolCallId == nil or not toolCallId.isPending then
					local andFetchToolCallStatus = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getAndFetchToolCallStatus(var6, v.toolCallId)
					table.insert(t, signalsModule.createEffect(function(p3)
						-- upvalues: andFetchToolCallStatus (ref), var33 (copy), v (ref), var11 (copy)
						local var34 = andFetchToolCallStatus.data(p3)
						
						if andFetchToolCallStatus.status(p3) == "Ready" and var34 ~= nil and (var34.campaignId ~= nil and var33(v, var34.campaignId)) then
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
		var25,
		var4,
		var6,
		var33,
		var11.refresh
	})
	local var34 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var6 (ref), var17 (ref), p1 (ref), var26 (ref), var9 (ref), var1 (ref), var3 (ref), var13 (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), adCampaignToolCallStatusModule (copy), var20 (ref), var8 (ref), var11 (ref)
		if var6 == nil or var17.current.userId ~= var6 then
			return "ignored"
		elseif not p1.isPageVisible or p1.universeId == nil or (p1.universeId == 0 or p1.sessionId == nil) or (p3 == "" or var26[p3] ~= nil or (var17.current.universeId ~= p1.universeId or var17.current.sessionId ~= p1.sessionId)) or (not var17.current.isPageVisible or var9.current ~= nil or p4.feedback == nil and p4.plays == nil) then
			return "ignored"
		end
		local record = var1.getAdCampaignCard(p1.sessionId, p3).record
		
		if record ~= nil and record.universeId == p1.universeId and record.campaignId ~= nil then
			return "ignored"
		end
		local var35 = var1
		
		if not var3.restore({
			universeId = p1.universeId,
			sessionId = p1.sessionId,
			toolCallId = p3,
			offers = p4,
			runStartTimeMs = DateTime.now().UnixTimestampMillis
		}, var6, {
			get = var35.getAdCampaignCard,
			save = var35.recordAdCampaignAttempt
		}) then
			var13(true)
			
			return "failed"
		end
		var13(false)
		local var36 = var3.getAttempts(false)[p3]
		
		if fFlagBuildAgentAdCampaignRefreshEligibilityModule and fFlagBuildAgentAdCampaignToolCallStatusFallbackModule and var36 == nil then
			local var37 = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(var6, p3).data(false)
			
			if var37 ~= nil and var37.status == "failed" then
				return "failed"
			elseif var36 ~= nil and (var36.isPending or var36.userId ~= var6 or (var36.universeId ~= p1.universeId or var36.sessionId ~= p1.sessionId)) then
				return "ignored"
			end
			local var38 = if var36 ~= nil then {
				universeId = p1.universeId,
				sessionId = p1.sessionId,
				toolCallId = p3,
				offers = {
					feedback = if p4.feedback ~= nil then nil else table.clone(p4.feedback),
					plays = if p4.plays ~= nil then nil else table.clone(p4.plays)
				},
				runStartTimeMs = DateTime.now().UnixTimestampMillis
			} else var3.getRetrySelection(var36, DateTime.now().UnixTimestampMillis)
			
			if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var36 ~= nil then
				local retryOffers = var3.getRetryOffers(var36, p4)
				
				if retryOffers == nil then
					return "failed"
				end
				var38 = table.clone(var38)
				var38.offers = retryOffers
			end
			if fFlagBuildAgentAdCampaignRefreshEligibilityModule then
				var20.current = if var36 == nil or not var3.canReplaceRejectedAttempt(var36) then nil else var36
			end
			var9.current = var38
			var8(var38)
			var11.clearCreateError()
			
			return "opened"
		end
	end, {
		p1.isPageVisible, p1.universeId, p1.sessionId, var26, var1, var3,
		var11.clearCreateError, var6, var13, var20
	})
	local var35 = reactModule.useCallback(function(p3, p4)
		-- upvalues: fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), var34 (ref), var17 (ref), var16 (ref), var6 (ref), p1 (ref), var9 (ref), var19 (ref), var1 (ref), var3 (ref), var22 (write), adCampaignEligibilityModule (copy), adCampaignEligibilityUtilsModule (copy)
		if not fFlagBuildAgentAdCampaignRefreshEligibilityModule then
			var34(p3, p4)
			
			return
		end
		local current = var17.current
		
		if not var16.current or not current.isPageVisible or (current.universeId == nil or current.universeId == 0) or (current.sessionId == nil or var6 == nil or (current.userId ~= var6 or current.universeId ~= p1.universeId)) or (current.sessionId ~= p1.sessionId or p3 == "" or (var9.current ~= nil or var19.current ~= nil)) then return end
		local record = var1.getAdCampaignCard(current.sessionId, p3).record
		local var36 = var3.getAttempts(false)[p3]
		
		if (record == nil or record.campaignId == nil) and (var36 == nil or not var36.isPending) then
			local t = {}
			var19.current = t
			var22({ status = "loading", toolCallId = p3 })
			
			local function _()
				-- upvalues: var17 (copy), var16 (copy), var19 (copy), t (ref), current (ref)
				local current_1 = var17.current
				
				return var16.current and (var19.current == t and (current_1.isPageVisible and (current_1.universeId == current.universeId and (current_1.sessionId == current.sessionId and current_1.userId == current.userId))))
			end
			
			t.timer = task.delay(15, function()
				-- upvalues: t (ref), var17 (copy), var16 (copy), var19 (copy), current (ref), var22 (copy), p3 (ref)
				t.timer = nil
				local current_1 = var17.current
				
				if var16.current and (var19.current == t and (current_1.isPageVisible and (current_1.universeId == current.universeId and (current_1.sessionId == current.sessionId and current_1.userId == current.userId)))) then
					var19.current = nil
					var22({ status = "failed", toolCallId = p3 })
				end
			end)
			adCampaignEligibilityModule.getAdCampaignEligibilityStore(false).fetchEligibility(current.universeId, function(p5)
				-- upvalues: var17 (copy), var16 (copy), var19 (copy), t (ref), current (ref), var22 (copy), p3 (ref), adCampaignEligibilityUtilsModule (copy), var34 (copy)
				local current_1 = var17.current
				
				if not var16.current or not (var19.current == t and (current_1.isPageVisible and (current_1.universeId == current.universeId and (current_1.sessionId == current.sessionId and current_1.userId == current.userId)))) then return end
				if t.timer ~= nil then
					task.cancel(t.timer)
					t.timer = nil
				end
				if p5 == nil then
					var19.current = nil
					var22({ status = "failed", toolCallId = p3 })
					
					return
				end
				local var37 = if p5.cardType == "none" or not adCampaignEligibilityUtilsModule.canCreateCampaign(p5) then nil else adCampaignEligibilityUtilsModule.getSelectableOffers(p5)
				
				if var37 == nil then
					var19.current = nil
					var22({ status = "unavailable", toolCallId = p3 })
					
					return
				end
				local var38 = var34(p3, var37)
				var19.current = nil
				var22(if var38 == "failed" then { status = "failed", toolCallId = p3 } else nil)
			end)
			
			return
		end
	end, {
		var34, p1.universeId, p1.sessionId, var6, var1, var3, var19, var22
	})
	local var36 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var7 (ref), var9 (ref), var8 (ref)
		if not var11.isCreatePending and var7 ~= nil and var9.current == var7 then
			var9.current = nil
			var8(nil)
		end
	end, { var11.isCreatePending, var7 })
	local var37 = var7 ~= nil and (var7.universeId == p1.universeId and (var7.sessionId == p1.sessionId and p1.isPageVisible))
	local var38 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), var17 (ref), var7 (ref), var9 (ref), var37 (ref), var11 (ref), var26 (ref), var3 (ref), var1 (ref), var13 (ref), fFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), fFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), adCampaignToolCallStatusModule (copy), var8 (ref), var22 (write), sendBuildExperienceEventModule (copy), var33 (ref)
		if var6 == nil or var17.current.userId ~= var6 then return end
		if var7 == nil or var9.current ~= var7 or (p3 == nil or not var37) or (not var17.current.isPageVisible or var17.current.universeId ~= var7.universeId or (var17.current.sessionId ~= var7.sessionId or var11.isCreatePending)) or var26[var7.toolCallId] ~= nil then return end
		local var39 = if p3.campaignOption == "feedback" then var7.offers.feedback else var7.offers.plays
		
		if var39 == nil or var39.fundingType ~= p3.paymentType then return end
		local toolCallId = var3.getAttempts(false)[var7.toolCallId]
		
		if toolCallId ~= nil and toolCallId.isPending then return end
		local var40 = var1
		
		if not var3.restore(var7, var6, {
			get = var40.getAdCampaignCard,
			save = var40.recordAdCampaignAttempt
		}) then
			var13(true)
			
			return
		end
		local toolCallId_1 = var3.getAttempts(false)[var7.toolCallId]
		
		if fFlagBuildAgentAdCampaignRefreshEligibilityModule and fFlagBuildAgentAdCampaignToolCallStatusFallbackModule and toolCallId_1 == nil then
			local retrySelection
			local var41 = adCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(var6, var7.toolCallId).data(false)
			
			if var41 ~= nil and var41.status == "failed" then
				var9.current = nil
				var8(nil)
				var22({ status = "failed", toolCallId = var7.toolCallId })
				
				return
			elseif toolCallId_1 ~= nil then
				retrySelection = var3.getRetrySelection(toolCallId_1, var7.runStartTimeMs)
				
				if fFlagBuildAgentAdCampaignRefreshEligibilityModule then
					local retryOffers = var3.getRetryOffers(toolCallId_1, var7.offers)
					
					if retryOffers == nil then
						var9.current = nil
						var8(nil)
						var22({ status = "failed", toolCallId = var7.toolCallId })
						
						return
					elseif retryOffers[p3.campaignOption] == nil then return end
					retrySelection = table.clone(retrySelection)
					retrySelection.offers = retryOffers
				end
				local var42 = if p3.campaignOption == "feedback" then retrySelection.offers.feedback else retrySelection.offers.plays
				
				if var7.runStartTimeMs ~= retrySelection.runStartTimeMs or var42 == nil or (var39.fundingType ~= var42.fundingType or var39.durationDays ~= var42.durationDays) or var39.priceRobux ~= var42.priceRobux then
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
				-- upvalues: var33 (copy), var3 (copy), retrySelection (ref)
				if p6 ~= nil then
					var33(var3.toRecord(retrySelection), p4, p5)
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
		end
	end, {
		var7, var3, var33, var6, var37, var26, var11.isCreatePending,
		var11.createCampaign, var1, var13, var22
	})
	local var39 = if var7 ~= nil then nil else var7.offers
	
	if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var10 ~= nil and (var39 ~= nil and not var10.isPending) then
		var39 = var3.getRetryOffers(var10, var39) or var39
	end
	local var40 = if var10 ~= nil then nil else var10.selectedOption
	local var41 = var10
	
	if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var41 == var20.current then
		var41 = nil
	end
	if fFlagBuildAgentAdCampaignRefreshEligibilityModule and var40 ~= nil and (var39 ~= nil and var39[var40.campaignOption] == nil) then
		var40 = nil
	end
	return {
		isSheetOpen = var37,
		isCreatePending = var11.isCreatePending or (var10 ~= nil and var10.isPending),
		hasCreateError = if var41 ~= nil then not var41.isPending else var12,
		createErrorKind = if var41 ~= nil then var11.createErrorKind else var41.failureKind,
		campaignOffers = var39,
		attemptedOption = var40,
		runStartTimeMs = if var7 ~= nil then nil else var7.runStartTimeMs,
		onOfferSelected = var35,
		isCreateDisabled = var32,
		getCardState = var31,
		onSheetClose = var36,
		onSheetCreate = var38
	}
end