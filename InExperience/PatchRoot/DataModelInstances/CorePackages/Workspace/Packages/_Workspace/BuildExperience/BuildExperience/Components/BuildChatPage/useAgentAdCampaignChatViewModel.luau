local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local Players = game:GetService("Players")
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Chat.chatTypes)
local UseCreateAdCampaignModule = require(BuildExperience.Components.Ads.useCreateAdCampaign)
local GetAdUpsellEventStoreModule = require(BuildExperience.Stores.GetAdUpsellEventStore)
local GetAgentAdCampaignStoreModule = require(BuildExperience.Stores.GetAgentAdCampaignStore)
local _ = require(BuildExperience.Stores.GetAgentAdCampaignStore.createAgentAdCampaignStore)
local AdCampaignToolCallStatusModule = require(Parent.DataHydration.AdCampaignToolCallStatus)
local AdCampaignsModule = require(Parent.DataHydration.AdCampaigns)
local AdCampaignEligibilityModule = require(Parent.DataHydration.AdCampaignEligibility)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local _ = require(BuildExperience.Storage.createAdCampaignCardStorage)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local AdCampaignScheduleUtilsModule = require(BuildExperience.Components.Ads.adCampaignScheduleUtils)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)
local FFlagBuildAgentAdCampaignRefreshEligibilityModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)
local FFlagBuildAgentAdCampaignToolCallStatusFallbackModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignToolCallStatusFallback)

local function _(p1) --[[ Line: 40 | Named "persistenceFor" ]]
	return {
		get = p1.getAdCampaignCard,
		save = p1.recordAdCampaignAttempt
	}
end

local _ = function(p1, p2): boolean --[[ Line: 44 | Named "hasFailedBackendAttempt" ]]
	-- upvalues: AdCampaignToolCallStatusModule (copy)
	local DataResult = AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(p1, p2).data(false)
	
	return DataResult ~= nil and DataResult.status == "failed"
end

return function(Current, p1) --[[ Line: 51 | Named "useAgentAdCampaignChatViewModel" ]]
	-- upvalues: GetAdUpsellEventStoreModule (copy), SignalsReactModule (copy), GetAgentAdCampaignStoreModule (copy), AdCampaignsModule (copy), Players (copy), ReactModule (copy), UseCreateAdCampaignModule (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), AdCampaignScheduleUtilsModule (copy), LocalizationStringsModule (copy), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (copy), AdCampaignToolCallStatusModule (copy), SignalsModule (copy), AdCampaignEligibilityModule (copy), AdCampaignEligibilityUtilsModule (copy), SendBuildExperienceEventModule (copy)
	local AdUpsellEventStoreModule = GetAdUpsellEventStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AdUpsellEventStoreModule.getAdCampaignRevision)
	local AgentAdCampaignStoreModule = GetAgentAdCampaignStoreModule(false)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AgentAdCampaignStoreModule.getAttempts)
	local AdCampaignsStore = AdCampaignsModule.getAdCampaignsStore(false)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(AdCampaignsStore.getAdCampaigns().data)
	local LocalPlayer = Players.LocalPlayer
	local P4 = p1 or (if LocalPlayer == nil or LocalPlayer.UserId <= 0 then nil else LocalPlayer.UserId)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResultEntry = if UseStateResult == nil then nil else UseSignalStateResult1[UseStateResult.toolCallId]
	local UseCreateAdCampaignModuleResult = UseCreateAdCampaignModule(Current.universeId, Current.sessionId)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(DateTime.now().UnixTimestampMillis)
	local UseRefResult1 = ReactModule.useRef(true)
	local Current1 = {
		universeId = Current.universeId,
		sessionId = Current.sessionId,
		isPageVisible = Current.isPageVisible,
		userId = P4
	}
	local UseRefResult2 = ReactModule.useRef(Current1)
	UseRefResult2.current = Current1
	local UseRefResult3 = ReactModule.useRef(Current.isPageVisible)
	local UseRefResult4 = if FFlagBuildAgentAdCampaignRefreshEligibilityModule then ReactModule.useRef(nil) else nil
	local UseRefResult5 = if FFlagBuildAgentAdCampaignRefreshEligibilityModule then ReactModule.useRef(nil) else nil
	local v1 = nil
	local Callback = nil
	
	if FFlagBuildAgentAdCampaignRefreshEligibilityModule then
		v1, Callback = ReactModule.useState(nil)
		ReactModule.useEffect(function() --[[ Line: 88 ]]
			-- upvalues: Callback (ref), UseRefResult4 (copy)
			Callback(nil)
			
			return function() --[[ Line: 90 ]]
				-- upvalues: UseRefResult4 (upval)
				local Current = UseRefResult4.current
				UseRefResult4.current = nil
				
				if Current ~= nil and Current.timer ~= nil then
					task.cancel(Current.timer)
				end
			end
		end, {
			Current.universeId, Current.sessionId, Current.isPageVisible, P4,
			UseRefResult4, Callback
		})
	end
	ReactModule.useEffect(function() --[[ Line: 109 ]]
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
		
		return function() --[[ Line: 111 ]]
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 115 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current = nil
		UseStateResult2(nil)
	end, { Current.universeId, Current.sessionId, P4 })
	ReactModule.useEffect(function() --[[ Line: 119 ]]
		-- upvalues: Current (copy), AdUpsellEventStoreModule (copy)
		if Current.isPageVisible then
			AdUpsellEventStoreModule.retryAdCampaignCardWrites()
		end
	end, { Current.isPageVisible, AdUpsellEventStoreModule })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 125 ]]
		-- upvalues: Current (copy), AdUpsellEventStoreModule (copy), P4 (copy)
		local t = {}
		
		if Current.sessionId ~= nil then
			for _, record in AdUpsellEventStoreModule.listAdCampaignCards(Current.sessionId).records do
				if (record.userId == nil or record.userId == P4) and record.universeId == Current.universeId then
					t[record.toolCallId] = record
				end
			end
		end
		return t
	end, {
		Current.sessionId,
		Current.universeId,
		AdUpsellEventStoreModule,
		UseSignalStateResult,
		P4
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 139 ]]
		-- upvalues: UseMemoResult (copy)
		local t = {}
		
		for i, value in UseMemoResult do
			if value.campaignId ~= nil then
				t[i] = value
			end
		end
		return t
	end, { UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 148 ]]
		-- upvalues: Current (copy), UseMemoResult1 (copy), AdCampaignsStore (copy)
		if Current.isPageVisible and next(UseMemoResult1) ~= nil then
			AdCampaignsStore.getAndFetchAdCampaigns()
		end
	end, { UseMemoResult1, Current.isPageVisible, AdCampaignsStore })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 153 ]]
		-- upvalues: UseSignalStateResult2 (copy), Current (copy), UseMemoResult1 (copy), AdCampaignScheduleUtilsModule (upval)
		local t = {}
		local UseSignalStateResult2_1 = UseSignalStateResult2 or {}
		for _, value in UseSignalStateResult2_1 do
			if value.targetUniverseId == tostring(Current.universeId) then
				t[value.id] = value
			end
		end
		local t1 = {}
		
		for i, value1 in UseMemoResult1 do
			local Entry = t[value1.campaignId]
			
			if Entry ~= nil then
				local StartMs: number = AdCampaignScheduleUtilsModule.toStartMs(Entry.schedule.startTime)
				
				if StartMs > 0 and Entry.schedule.durationInDays > 0 then
					t1[i] = {
						startMs = StartMs,
						durationDays = Entry.schedule.durationInDays
					}
				end
			elseif (value1.userId == nil or value1.idempotencyKey ~= i) and value1.durationDays ~= nil then
				t1[i] = {
					startMs = value1.createdAtMs,
					durationDays = value1.durationDays
				}
			end
		end
		return t1
	end, {
		UseMemoResult1,
		UseSignalStateResult2,
		Current.universeId
	})
	ReactModule.useEffect(function() --[[ Line: 178 ]]
		-- upvalues: UseRefResult3 (copy), Current (copy), UseStateResult2_2 (copy)
		local Current1 = UseRefResult3.current
		UseRefResult3.current = Current.isPageVisible
		
		if Current.isPageVisible and not Current1 then
			UseStateResult2_2(DateTime.now().UnixTimestampMillis)
		end
	end, { Current.isPageVisible })
	ReactModule.useEffect(function() --[[ Line: 185 ]]
		-- upvalues: Current (copy), UseMemoResult2 (copy), AdCampaignScheduleUtilsModule (upval), UseStateResult3 (copy), UseStateResult2_2 (copy)
		if not Current.isPageVisible then return end
		local Smallest = 1e999
		
		for _, value in UseMemoResult2 do
			local CampaignEndExclusiveMsResult: number = AdCampaignScheduleUtilsModule.campaignEndExclusiveMs(value.startMs, value.durationDays)
			
			if UseStateResult3 < CampaignEndExclusiveMsResult then
				Smallest = math.min(Smallest, CampaignEndExclusiveMsResult)
			end
		end
		if Smallest == 1e999 then return end
		local DelayedThread = nil
		DelayedThread = task.delay(math.max(0, Smallest - DateTime.now().UnixTimestampMillis) / 1000, function() --[[ Line: 200 ]]
			-- upvalues: DelayedThread (ref), UseStateResult2_2 (upval)
			DelayedThread = nil
			UseStateResult2_2(DateTime.now().UnixTimestampMillis)
		end)
		
		return function() --[[ Line: 204 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
			end
		end
	end, { UseMemoResult2, Current.isPageVisible, UseStateResult3 })
	local UseResult = ReactModule.useCallback(function(ToolCallId) --[[ Line: 211 ]]
		-- upvalues: UseMemoResult1 (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), v1 (ref), UseMemoResult2 (copy), UseStateResult3 (copy), AdCampaignScheduleUtilsModule (upval), LocalizationStringsModule (upval)
		local UseMemoResultEntry = UseMemoResult1[ToolCallId]
		
		if UseMemoResultEntry == nil or UseMemoResultEntry.campaignId == nil then
			return if FFlagBuildAgentAdCampaignRefreshEligibilityModule and v1 ~= nil and v1.toolCallId == ToolCallId then { eligibilityStatus = v1.status } else nil
		else
			local UseMemoResultEntry1 = UseMemoResult2[ToolCallId]
			
			return {
				campaignId = UseMemoResultEntry.campaignId,
				variant = if UseMemoResultEntry1 == nil then nil elseif AdCampaignScheduleUtilsModule.campaignEndExclusiveMs(UseMemoResultEntry1.startMs, UseMemoResultEntry1.durationDays) <= UseStateResult3 then "complete" else "active",
				campaignStartDate = if UseMemoResultEntry1 == nil then nil else LocalizationStringsModule.formatAdCampaignSheetLocalDate(UseMemoResultEntry1.startMs),
				campaignEndDate = if UseMemoResultEntry1 == nil then nil else LocalizationStringsModule.formatAdCampaignSheetLocalDate(AdCampaignScheduleUtilsModule.campaignEndMs(UseMemoResultEntry1.startMs, UseMemoResultEntry1.durationDays))
			}
		end
	end, { UseMemoResult1, UseMemoResult2, UseStateResult3, v1 })
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 243 ]]
		-- upvalues: FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), v1 (ref), UseSignalStateResult1 (copy), Current (copy)
		if FFlagBuildAgentAdCampaignRefreshEligibilityModule and v1 ~= nil and v1.status == "loading" then
			return true
		else
			local UseSignalStateResultEntry = UseSignalStateResult1[p2]
			
			return not Current.isPageVisible or UseSignalStateResultEntry ~= nil and UseSignalStateResultEntry.isPending
		end
	end, { Current.isPageVisible, UseSignalStateResult1, v1 })
	local UseResult2 = ReactModule.useCallback(function(Tbl, CampaignId, IdempotencyKey) --[[ Line: 256 ]]
		-- upvalues: AdUpsellEventStoreModule (copy), AgentAdCampaignStoreModule (copy), UseRefResult (copy), UseRefResult2 (copy), UseRefResult1 (copy), UseStateResult2 (copy)
		if IdempotencyKey ~= nil and IdempotencyKey ~= Tbl.idempotencyKey then
			return false
		end
		local Copy = table.clone(Tbl)
		Copy.campaignId = CampaignId
		Copy.phase = "created"
		Copy.updatedAtMs = math.max(Tbl.updatedAtMs, DateTime.now().UnixTimestampMillis)
		local RecordAdCampaignCreatedReceiptResult, RecordAdCampaignCreatedReceiptResult2 = AdUpsellEventStoreModule.recordAdCampaignCreatedReceipt(Copy)
		
		if not RecordAdCampaignCreatedReceiptResult and not RecordAdCampaignCreatedReceiptResult2 then
			return false
		end
		AgentAdCampaignStoreModule.completeDurable(Tbl)
		local Current = UseRefResult.current
		local Current1 = UseRefResult2.current
		
		if UseRefResult1.current and Current ~= nil and Current.toolCallId == Tbl.toolCallId and Current.universeId == Tbl.universeId and Current.sessionId == Tbl.sessionId and Current1.universeId == Tbl.universeId and Current1.sessionId == Tbl.sessionId and Current1.userId == Tbl.userId then
			UseRefResult.current = nil
			UseStateResult2(nil)
		end
		return RecordAdCampaignCreatedReceiptResult2
	end, { AgentAdCampaignStoreModule, AdUpsellEventStoreModule })
	ReactModule.useEffect(function() --[[ Line: 289 ]]
		-- upvalues: FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (upval), P4 (copy), UseMemoResult (copy), UseSignalStateResult1 (copy), AdCampaignToolCallStatusModule (upval), SignalsModule (upval), UseResult2 (copy), UseCreateAdCampaignModuleResult (copy)
		if not FFlagBuildAgentAdCampaignToolCallStatusFallbackModule or P4 == nil then return end
		local Effects = {}
		
		for _, value in UseMemoResult do
			if value.userId == P4 and value.campaignId == nil then
				local UseSignalStateResultEntry = UseSignalStateResult1[value.toolCallId]
				
				if UseSignalStateResultEntry == nil or not UseSignalStateResultEntry.isPending then
					local AndFetchToolCallStatus = AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getAndFetchToolCallStatus(P4, value.toolCallId)
					table.insert(Effects, SignalsModule.createEffect(function(p2) --[[ Line: 306 ]]
						-- upvalues: AndFetchToolCallStatus (copy), UseResult2 (upval), value (copy), UseCreateAdCampaignModuleResult (upval)
						local DataResult = AndFetchToolCallStatus.data(p2)
						
						if AndFetchToolCallStatus.status(p2) == "Ready" and DataResult ~= nil and DataResult.campaignId ~= nil and UseResult2(value, DataResult.campaignId) then
							UseCreateAdCampaignModuleResult.refresh()
						end
					end))
				end
			end
		end
		return function() --[[ Line: 316 ]]
			-- upvalues: Effects (copy)
			for _, effect in Effects do
				effect()
			end
		end
	end, {
		UseMemoResult,
		UseSignalStateResult1,
		P4,
		UseResult2,
		UseCreateAdCampaignModuleResult.refresh
	})
	local UseResult3 = ReactModule.useCallback(function(ToolCallId, Offers): string --[[ Line: 324 ]]
		-- upvalues: P4 (copy), UseRefResult2 (copy), Current (copy), UseMemoResult1 (copy), UseRefResult (copy), AdUpsellEventStoreModule (copy), AgentAdCampaignStoreModule (copy), UseStateResult2_1 (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (upval), AdCampaignToolCallStatusModule (upval), UseRefResult5 (copy), UseStateResult2 (copy), UseCreateAdCampaignModuleResult (copy)
		if P4 == nil or UseRefResult2.current.userId ~= P4 then
			return "ignored"
		end
		if not Current.isPageVisible or Current.universeId == nil or Current.universeId == 0 or Current.sessionId == nil or ToolCallId == "" or UseMemoResult1[ToolCallId] ~= nil or UseRefResult2.current.universeId ~= Current.universeId or UseRefResult2.current.sessionId ~= Current.sessionId or not UseRefResult2.current.isPageVisible or UseRefResult.current ~= nil or Offers.feedback == nil and Offers.plays == nil then
			return "ignored"
		end
		local Record = AdUpsellEventStoreModule.getAdCampaignCard(Current.sessionId, ToolCallId).record
		
		if Record ~= nil and Record.universeId == Current.universeId and Record.campaignId ~= nil then
			return "ignored"
		end
		if not AgentAdCampaignStoreModule.restore({
			universeId = Current.universeId,
			sessionId = Current.sessionId,
			toolCallId = ToolCallId,
			offers = Offers,
			runStartTimeMs = DateTime.now().UnixTimestampMillis
		}, P4, {
			get = AdUpsellEventStoreModule.getAdCampaignCard,
			save = AdUpsellEventStoreModule.recordAdCampaignAttempt
		}) then
			UseStateResult2_1(true)
			
			return "failed"
		end
		UseStateResult2_1(false)
		local Attempt = AgentAdCampaignStoreModule.getAttempts(false)[ToolCallId]
		
		if FFlagBuildAgentAdCampaignRefreshEligibilityModule and FFlagBuildAgentAdCampaignToolCallStatusFallbackModule and Attempt == nil then
			local DataResult = AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(P4, ToolCallId).data(false)
			
			if DataResult ~= nil and DataResult.status == "failed" then
				return "failed"
			end
		end
		if Attempt ~= nil and (Attempt.isPending or Attempt.userId ~= P4 or Attempt.universeId ~= Current.universeId or Attempt.sessionId ~= Current.sessionId) then
			return "ignored"
		end
		local Config = if Attempt == nil then {
			universeId = Current.universeId,
			sessionId = Current.sessionId,
			toolCallId = ToolCallId,
			offers = {
				feedback = if Offers.feedback == nil then nil else table.clone(Offers.feedback),
				plays = if Offers.plays == nil then nil else table.clone(Offers.plays)
			},
			runStartTimeMs = DateTime.now().UnixTimestampMillis
		} else AgentAdCampaignStoreModule.getRetrySelection(Attempt, DateTime.now().UnixTimestampMillis)
		
		if FFlagBuildAgentAdCampaignRefreshEligibilityModule and Attempt ~= nil then
			local RetryOffers = AgentAdCampaignStoreModule.getRetryOffers(Attempt, Offers)
			
			if RetryOffers == nil then
				return "failed"
			end
			Config = table.clone(Config)
			Config.offers = RetryOffers
		end
		if FFlagBuildAgentAdCampaignRefreshEligibilityModule then
			UseRefResult5.current = if Attempt == nil or not AgentAdCampaignStoreModule.canReplaceRejectedAttempt(Attempt) then nil else Attempt
		end
		UseRefResult.current = Config
		UseStateResult2(Config)
		UseCreateAdCampaignModuleResult.clearCreateError()
		
		return "opened"
	end, {
		Current.isPageVisible, Current.universeId, Current.sessionId, UseMemoResult1,
		AdUpsellEventStoreModule, AgentAdCampaignStoreModule,
		UseCreateAdCampaignModuleResult.clearCreateError, P4, UseStateResult2_1,
		UseRefResult5
	})
	local UseResult4 = ReactModule.useCallback(function(ToolCallId, p2) --[[ Line: 427 ]]
		-- upvalues: FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), UseResult3 (copy), UseRefResult2 (copy), UseRefResult1 (copy), P4 (copy), Current (copy), UseRefResult (copy), UseRefResult4 (copy), AdUpsellEventStoreModule (copy), AgentAdCampaignStoreModule (copy), Callback (ref), AdCampaignEligibilityModule (upval), AdCampaignEligibilityUtilsModule (upval)
		if not FFlagBuildAgentAdCampaignRefreshEligibilityModule then
			UseResult3(ToolCallId, p2)
			
			return
		end
		local Current1 = UseRefResult2.current
		
		if not UseRefResult1.current or not Current1.isPageVisible or Current1.universeId == nil or Current1.universeId == 0 or Current1.sessionId == nil or P4 == nil or Current1.userId ~= P4 or Current1.universeId ~= Current.universeId or Current1.sessionId ~= Current.sessionId or ToolCallId == "" or UseRefResult.current ~= nil or UseRefResult4.current ~= nil then return end
		local Record = AdUpsellEventStoreModule.getAdCampaignCard(Current1.sessionId, ToolCallId).record
		local Attempt = AgentAdCampaignStoreModule.getAttempts(false)[ToolCallId]
		
		if (Record == nil or Record.campaignId == nil) and (Attempt == nil or not Attempt.isPending) then
			local Current2 = {}
			UseRefResult4.current = Current2
			Callback({ status = "loading", toolCallId = ToolCallId })
			
			local function _(): boolean --[[ Line: 457 | Named "isCurrent" ]]
				-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult4 (upval), Current2 (copy), Current1 (copy)
				local Current = UseRefResult2.current
				
				return UseRefResult1.current and (UseRefResult4.current == Current2 and (Current.isPageVisible and (Current.universeId == Current1.universeId and Current.sessionId == Current1.sessionId and Current.userId == Current1.userId)))
			end
			
			Current2.timer = task.delay(15, function() --[[ Line: 466 ]]
				-- upvalues: Current2 (copy), UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult4 (upval), Current1 (copy), Callback (upval), ToolCallId (copy)
				Current2.timer = nil
				local Current = UseRefResult2.current
				
				if UseRefResult1.current and (UseRefResult4.current == Current2 and (Current.isPageVisible and (Current.universeId == Current1.universeId and (Current.sessionId == Current1.sessionId and Current.userId == Current1.userId)))) then
					UseRefResult4.current = nil
					Callback({ status = "failed", toolCallId = ToolCallId })
				end
			end)
			AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false).fetchEligibility(Current1.universeId, function(p3) --[[ Line: 474 ]]
				-- upvalues: UseRefResult2 (upval), UseRefResult1 (upval), UseRefResult4 (upval), Current2 (copy), Current1 (copy), Callback (upval), ToolCallId (copy), AdCampaignEligibilityUtilsModule (upval), UseResult3 (upval)
				local Current = UseRefResult2.current
				
				if not UseRefResult1.current or (UseRefResult4.current ~= Current2 or (not Current.isPageVisible or (Current.universeId ~= Current1.universeId or (Current.sessionId ~= Current1.sessionId or Current.userId ~= Current1.userId)))) then return end
				if Current2.timer ~= nil then
					task.cancel(Current2.timer)
					Current2.timer = nil
				end
				if p3 == nil then
					UseRefResult4.current = nil
					Callback({ status = "failed", toolCallId = ToolCallId })
					
					return
				end
				local SelectableOffers = if p3.cardType == "none" or not AdCampaignEligibilityUtilsModule.canCreateCampaign(p3) then nil else AdCampaignEligibilityUtilsModule.getSelectableOffers(p3)
				
				if SelectableOffers == nil then
					UseRefResult4.current = nil
					Callback({ status = "unavailable", toolCallId = ToolCallId })
					
					return
				else
					UseRefResult4.current = nil
					Callback(if UseResult3(ToolCallId, SelectableOffers) == "failed" then { status = "failed", toolCallId = ToolCallId } else nil)
				end
			end)
			
			return
		end
	end, {
		UseResult3, Current.universeId, Current.sessionId, P4,
		AdUpsellEventStoreModule, AgentAdCampaignStoreModule, UseRefResult4, Callback
	})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 515 ]]
		-- upvalues: UseCreateAdCampaignModuleResult (copy), UseStateResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if not UseCreateAdCampaignModuleResult.isCreatePending and UseStateResult ~= nil and UseRefResult.current == UseStateResult then
			UseRefResult.current = nil
			UseStateResult2(nil)
		end
	end, {
		UseCreateAdCampaignModuleResult.isCreatePending,
		UseStateResult
	})
	local IsPageVisible = UseStateResult ~= nil and (UseStateResult.universeId == Current.universeId and UseStateResult.sessionId == Current.sessionId and Current.isPageVisible)
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 527 ]]
		-- upvalues: P4 (copy), UseRefResult2 (copy), UseStateResult (copy), UseRefResult (copy), IsPageVisible (copy), UseCreateAdCampaignModuleResult (copy), UseMemoResult1 (copy), AgentAdCampaignStoreModule (copy), AdUpsellEventStoreModule (copy), UseStateResult2_1 (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (upval), AdCampaignToolCallStatusModule (upval), UseStateResult2 (copy), Callback (ref), SendBuildExperienceEventModule (upval), UseResult2 (copy)
		if P4 == nil or UseRefResult2.current.userId ~= P4 then return end
		if UseStateResult == nil or UseRefResult.current ~= UseStateResult or p2 == nil or not IsPageVisible or not UseRefResult2.current.isPageVisible or UseRefResult2.current.universeId ~= UseStateResult.universeId or UseRefResult2.current.sessionId ~= UseStateResult.sessionId or UseCreateAdCampaignModuleResult.isCreatePending or UseMemoResult1[UseStateResult.toolCallId] ~= nil then return end
		local Feedback = if p2.campaignOption == "feedback" then UseStateResult.offers.feedback else UseStateResult.offers.plays
		
		if Feedback == nil or Feedback.fundingType ~= p2.paymentType then return end
		local Attempt = AgentAdCampaignStoreModule.getAttempts(false)[UseStateResult.toolCallId]
		
		if Attempt ~= nil and Attempt.isPending then return end
		if not AgentAdCampaignStoreModule.restore(UseStateResult, P4, {
			get = AdUpsellEventStoreModule.getAdCampaignCard,
			save = AdUpsellEventStoreModule.recordAdCampaignAttempt
		}) then
			UseStateResult2_1(true)
			
			return
		end
		local Attempt1 = AgentAdCampaignStoreModule.getAttempts(false)[UseStateResult.toolCallId]
		
		if FFlagBuildAgentAdCampaignRefreshEligibilityModule and FFlagBuildAgentAdCampaignToolCallStatusFallbackModule and Attempt1 == nil then
			local DataResult = AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).getToolCallStatus(P4, UseStateResult.toolCallId).data(false)
			
			if DataResult ~= nil and DataResult.status == "failed" then
				UseRefResult.current = nil
				UseStateResult2(nil)
				Callback({
					status = "failed",
					toolCallId = UseStateResult.toolCallId
				})
				
				return
			end
		end
		if Attempt1 ~= nil then
			local RetrySelection = AgentAdCampaignStoreModule.getRetrySelection(Attempt1, UseStateResult.runStartTimeMs)
			
			if FFlagBuildAgentAdCampaignRefreshEligibilityModule then
				local RetryOffers = AgentAdCampaignStoreModule.getRetryOffers(Attempt1, UseStateResult.offers)
				
				if RetryOffers == nil then
					UseRefResult.current = nil
					UseStateResult2(nil)
					Callback({
						status = "failed",
						toolCallId = UseStateResult.toolCallId
					})
					
					return
				end
				if RetryOffers[p2.campaignOption] == nil then return end
				RetrySelection = table.clone(RetrySelection)
				RetrySelection.offers = RetryOffers
			end
			local Feedback1 = if p2.campaignOption == "feedback" then RetrySelection.offers.feedback else RetrySelection.offers.plays
			
			if UseStateResult.runStartTimeMs ~= RetrySelection.runStartTimeMs or Feedback1 == nil or Feedback.fundingType ~= Feedback1.fundingType or Feedback.durationDays ~= Feedback1.durationDays or Feedback.priceRobux ~= Feedback1.priceRobux then
				UseRefResult.current = RetrySelection
				UseStateResult2(RetrySelection)
				UseStateResult2_1(false)
				
				return
			end
		end
		local StartDurableResult = AgentAdCampaignStoreModule.startDurable(UseStateResult, p2, P4, {
			get = AdUpsellEventStoreModule.getAdCampaignCard,
			save = AdUpsellEventStoreModule.recordAdCampaignAttempt
		})
		UseStateResult2_1(StartDurableResult == nil)
		
		if StartDurableResult ~= nil then
			SendBuildExperienceEventModule("AD_UPSELL_CREATE_CONFIRM_CLICK", {
				universeId = UseStateResult.universeId,
				conversationId = UseStateResult.sessionId
			}, {
				context = "agent_card",
				fundingType = p2.paymentType,
				campaignOption = p2.campaignOption
			})
			UseCreateAdCampaignModuleResult.createCampaign(p2, function(p3, p4, p5) --[[ Line: 621 ]]
				-- upvalues: UseResult2 (upval), AgentAdCampaignStoreModule (upval), StartDurableResult (copy)
				if p5 ~= nil then
					UseResult2(AgentAdCampaignStoreModule.toRecord(StartDurableResult), p3, p4)
				end
			end, if FFlagBuildAgentAdCampaignToolCallStatusFallbackModule then UseStateResult.toolCallId else nil, {
				idempotencyKey = StartDurableResult.idempotencyKey,
				onFailed = function(p3) --[[ Line: 629 ]]
					-- upvalues: AgentAdCampaignStoreModule (upval), StartDurableResult (copy), AdUpsellEventStoreModule (upval), FFlagBuildAgentAdCampaignToolCallStatusFallbackModule (upval), P4 (upval), AdCampaignToolCallStatusModule (upval)
					if AgentAdCampaignStoreModule.finishDurable(StartDurableResult, p3, {
						get = AdUpsellEventStoreModule.getAdCampaignCard,
						save = AdUpsellEventStoreModule.recordAdCampaignAttempt
					}) and FFlagBuildAgentAdCampaignToolCallStatusFallbackModule and P4 ~= nil then
						AdCampaignToolCallStatusModule.getAdCampaignToolCallStatusStore(false).fetchToolCallStatus(P4, StartDurableResult.toolCallId)
					end
				end
			})
			
			return
		end
	end, {
		UseStateResult, AgentAdCampaignStoreModule, UseResult2, P4, IsPageVisible,
		UseMemoResult1, UseCreateAdCampaignModuleResult.isCreatePending,
		UseCreateAdCampaignModuleResult.createCampaign, AdUpsellEventStoreModule,
		UseStateResult2_1, Callback
	})
	local Offers = if UseStateResult == nil then nil else UseStateResult.offers
	
	if FFlagBuildAgentAdCampaignRefreshEligibilityModule and UseSignalStateResultEntry ~= nil and Offers ~= nil and not UseSignalStateResultEntry.isPending then
		Offers = AgentAdCampaignStoreModule.getRetryOffers(UseSignalStateResultEntry, Offers) or Offers
	end
	local SelectedOption = if UseSignalStateResultEntry == nil then nil else UseSignalStateResultEntry.selectedOption
	local Current2 = UseSignalStateResultEntry
	
	if FFlagBuildAgentAdCampaignRefreshEligibilityModule and Current2 == UseRefResult5.current then
		Current2 = nil
	end
	if FFlagBuildAgentAdCampaignRefreshEligibilityModule and SelectedOption ~= nil and Offers ~= nil and Offers[SelectedOption.campaignOption] == nil then
		SelectedOption = nil
	end
	return {
		isSheetOpen = IsPageVisible,
		isCreatePending = UseCreateAdCampaignModuleResult.isCreatePending or UseSignalStateResultEntry ~= nil and UseSignalStateResultEntry.isPending,
		hasCreateError = if Current2 == nil then UseStateResult1 else not Current2.isPending or UseStateResult1,
		createErrorKind = if Current2 == nil then UseCreateAdCampaignModuleResult.createErrorKind else Current2.failureKind,
		campaignOffers = Offers,
		attemptedOption = SelectedOption,
		runStartTimeMs = if UseStateResult == nil then nil else UseStateResult.runStartTimeMs,
		onOfferSelected = UseResult4,
		isCreateDisabled = UseResult1,
		getCardState = UseResult,
		onSheetClose = UseResult5,
		onSheetCreate = UseResult6
	}
end