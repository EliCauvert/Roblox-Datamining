local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local SignalsModule = require(Parent.Signals)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ChatTypesModule = require(BuildExperience.Chat.chatTypes)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local FFlagBuildAdUpsellPinnedModule = require(BuildExperience.Flags.FFlagBuildAdUpsellPinned)
local GetAdUpsellEligibilityModule = require(BuildExperience.Components.Ads.getAdUpsellEligibility)
local ObserveAdUpsellEligibilityModule = require(BuildExperience.Components.Ads.observeAdUpsellEligibility)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local BuildAppStorageKeyEngineFeature = game:GetEngineFeature("BuildAppStorageKey")
local BuildAppStorageModule = if BuildAppStorageKeyEngineFeature then require(BuildExperience.Storage.BuildAppStorage) else nil
local _ = require(BuildExperience.Storage.createAdCampaignCardStorage)

local function defaultDependencies()
	-- upvalues: BuildAppStorageKeyEngineFeature (copy), FFlagBuildAgentAdCampaignCardModule (copy), BuildAppStorageModule (copy), UniverseConfigurationModule (copy), GameConfigurationLabelsModule (copy), GetAdUpsellEligibilityModule (copy), ObserveAdUpsellEligibilityModule (copy)
	return if BuildAppStorageKeyEngineFeature then {
		getAdCampaignCardStorage = if FFlagBuildAgentAdCampaignCardModule then BuildAppStorageModule.getAdCampaignCardStorage else nil,
		recordCompletedTurn = BuildAppStorageModule.recordAdUpsellCompletedTurn,
		recordPublish = BuildAppStorageModule.recordAdUpsellPublish,
		attachPendingMilestones = BuildAppStorageModule.attachPendingAdUpsellMilestones,
		pruneAnchors = BuildAppStorageModule.pruneAdUpsellAnchors,
		markAnchorImpressed = BuildAppStorageModule.markAdUpsellAnchorImpressed,
		dismissPermanently = BuildAppStorageModule.markAdUpsellDismissedPermanently,
		isDismissedPermanently = function(UniverseId)
			-- upvalues: BuildAppStorageModule (upval)
			local AdUpsellState = BuildAppStorageModule.getAdUpsellState(UniverseId, nil)
			
			return AdUpsellState.isAvailable and AdUpsellState.dismissedPermanently
		end,
		retryStorageRead = BuildAppStorageModule.retryAdUpsellRead,
		refreshSummary = function(p1)
			-- upvalues: UniverseConfigurationModule (upval)
			return UniverseConfigurationModule.getUniverseConfigurationStore().refreshSummary(p1)
		end,
		getAudience = function(p1)
			-- upvalues: GameConfigurationLabelsModule (upval)
			return GameConfigurationLabelsModule.getAudience(p1)
		end,
		publicAudience = UniverseConfigurationModule.PrivacyType.Public,
		getEligibility = GetAdUpsellEligibilityModule,
		observeEligibility = ObserveAdUpsellEligibilityModule,
		scheduleRetry = function(Delay, p1)
			return task.delay(Delay, p1)
		end,
		cancelRetry = function(ScheduleRetryResult)
			task.cancel(ScheduleRetryResult)
		end
	} else nil
end

local function _(p1): boolean
	-- upvalues: CreatorAgentChatModule (copy)
	return CreatorAgentChatModule.PublishToolUtils.getLatestSuccessfulResult(p1, { parseDirectText = true }) ~= nil
end

return function(p1)
	-- upvalues: defaultDependencies (copy), SignalsModule (copy), FFlagBuildAdUpsellPinnedModule (copy), ChatTypesModule (copy), CreatorAgentChatModule (copy), FFlagBuildAgentAdCampaignCardModule (copy)
	local P6 = p1 or defaultDependencies()
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Tbl = {}
	local List = {}
	local AfterMessageKeys = {}
	local ScheduleRetryResult = nil
	local ObserveEligibilityResults = {}
	local Count = 0
	local Callback = nil
	local _ = nil
	
	local function _()
		-- upvalues: Signal2 (copy)
		Signal2(function(p2: number): number
			return p2 + 1
		end)
	end
	
	local _ = function()
		-- upvalues: P6 (copy)
		return if P6 == nil then nil else P6.getAdCampaignCardStorage()
	end
	
	local _ = function()
		-- upvalues: Signal2_1 (copy), Signal2 (copy)
		Signal2_1(function(p2: number): number
			return p2 + 1
		end)
		Signal2(function(p2: number): number
			return p2 + 1
		end)
	end
	
	local function recordCardMutation(p2, p3, HasPendingWrites)
		-- upvalues: Signal2_1 (copy), Signal2 (copy)
		if p3 or p2 and HasPendingWrites then
			Signal2_1(function(p4: number): number
				return p4 + 1
			end)
			Signal2(function(p4: number): number
				return p4 + 1
			end)
		end
		return p2, p3
	end
	
	local _ = function(Key)
		-- upvalues: ObserveEligibilityResults (copy)
		local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[Key]
		
		if ObserveEligibilityResult ~= nil then
			ObserveEligibilityResults[Key] = nil
			ObserveEligibilityResult()
			
			return
		end
	end
	
	local _ = function(Value)
		-- upvalues: Tbl (copy), ObserveEligibilityResults (copy), List (copy)
		if Tbl[Value] == nil then return end
		local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[Value]
		
		if ObserveEligibilityResult ~= nil then
			ObserveEligibilityResults[Value] = nil
			ObserveEligibilityResult()
		end
		Tbl[Value] = nil
		local FoundIndex: number? = table.find(List, Value)
		
		if FoundIndex ~= nil then
			table.remove(List, FoundIndex)
		end
	end
	
	local function retainPending(p2)
		-- upvalues: Tbl (copy), List (copy), ObserveEligibilityResults (copy)
		local Entry = Tbl[p2.id]
		
		if Entry ~= nil then
			return Entry
		end
		Tbl[p2.id] = p2
		table.insert(List, p2.id)
		while #List > 50 do
			local Removed = table.remove(List, 1)
			
			if Removed == nil then continue end
			local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[Removed]
			
			if ObserveEligibilityResult ~= nil then
				ObserveEligibilityResults[Removed] = nil
				ObserveEligibilityResult()
			end
			Tbl[Removed] = nil
		end
		return p2
	end
	
	local _ = function(p3): boolean
		return not p3.isAwaitingEligibility and (if p3.requiresAudienceVerification and p3.isEligiblePublish == nil then not p3.isVerifyingAudience and p3.audienceVerificationAttempts < 3 else p3.storagePersistenceAttempts < 3)
	end
	
	local _ = function(): boolean
		-- upvalues: List (copy), Tbl (copy)
		for _, value in List do
			local Entry = Tbl[value]
			
			if Entry ~= nil and (not Entry.isAwaitingEligibility and (if Entry.requiresAudienceVerification and Entry.isEligiblePublish == nil then not Entry.isVerifyingAudience and Entry.audienceVerificationAttempts < 3 else Entry.storagePersistenceAttempts < 3)) then
				return true
			end
		end
		return false
	end
	
	local function v38()
		-- upvalues: P6 (copy), ScheduleRetryResult (ref), List (copy), Tbl (copy), Count (ref), Callback (ref), v38 (ref)
		if P6 ~= nil and ScheduleRetryResult == nil then
			local Flag = false
			
			for _, value in List do
				local Entry = Tbl[value]
				
				if Entry ~= nil and (not Entry.isAwaitingEligibility and (if Entry.requiresAudienceVerification and Entry.isEligiblePublish == nil then not Entry.isVerifyingAudience and Entry.audienceVerificationAttempts < 3 else Entry.storagePersistenceAttempts < 3)) then
					Flag = true
					break
				end
			end
			if Flag then
				local Count1 = Count
				ScheduleRetryResult = P6.scheduleRetry(1, function()
					-- upvalues: ScheduleRetryResult (upval), Count (upval), Count1 (copy), List (upval), Tbl (upval), Callback (upval), v38 (upval)
					ScheduleRetryResult = nil
					
					if Count ~= Count1 then return end
					for _, value in table.clone(List) do
						local Entry = Tbl[value]
						
						if Entry ~= nil and (not Entry.isAwaitingEligibility and (if Entry.requiresAudienceVerification and Entry.isEligiblePublish == nil then not Entry.isVerifyingAudience and Entry.audienceVerificationAttempts < 3 else Entry.storagePersistenceAttempts < 3)) then
							Callback(Entry)
						end
					end
					local Flag = false
					
					for _, value1 in List do
						local Entry = Tbl[value1]
						
						if Entry ~= nil and (not Entry.isAwaitingEligibility and (if Entry.requiresAudienceVerification and Entry.isEligiblePublish == nil then not Entry.isVerifyingAudience and Entry.audienceVerificationAttempts < 3 else Entry.storagePersistenceAttempts < 3)) then
							Flag = true
							break
						end
					end
					if Flag then
						v38()
					end
				end)
				
				return
			end
		end
	end
	
	local function persistEvent(p3)
		-- upvalues: P6 (copy), FFlagBuildAdUpsellPinnedModule (upval), AfterMessageKeys (copy), Signal2 (copy), Tbl (copy), ObserveEligibilityResults (copy), List (copy), v38 (ref)
		if P6 == nil then return end
		local config = {
			universeId = p3.universeId,
			sessionId = p3.sessionId,
			eventId = p3.id,
			afterMessageKey = p3.afterMessageKey,
			isEligiblePublish = p3.isEligiblePublish == true
		}
		local RecordCompletedTurnResult = nil
		local RecordCompletedTurnResult2 = nil
		
		if p3.isCompletedTurn then
			RecordCompletedTurnResult, RecordCompletedTurnResult2 = P6.recordCompletedTurn(config)
		else
			RecordCompletedTurnResult, RecordCompletedTurnResult2 = P6.recordPublish(config)
		end
		if RecordCompletedTurnResult2 then
			if FFlagBuildAdUpsellPinnedModule and p3.afterMessageKey ~= nil then
				AfterMessageKeys[p3.id] = p3.afterMessageKey
			end
			Signal2(function(p4: number): number
				return p4 + 1
			end)
		end
		if RecordCompletedTurnResult or RecordCompletedTurnResult2 then
			local Id = p3.id
			
			if Tbl[Id] == nil then return end
			local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[Id]
			
			if ObserveEligibilityResult ~= nil then
				ObserveEligibilityResults[Id] = nil
				ObserveEligibilityResult()
			end
			Tbl[Id] = nil
			local FoundIndex: number? = table.find(List, Id)
			
			if FoundIndex ~= nil then
				table.remove(List, FoundIndex)
				
				return
			end
		else
			p3.storagePersistenceAttempts += 1
			
			if p3.storagePersistenceAttempts < 3 then
				v38()
			end
		end
	end
	
	local _ = function(p3)
		-- upvalues: v38 (ref)
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			v38()
		end
	end
	
	local function awaitEligibility(p3, p4)
		-- upvalues: P6 (copy), Count (ref), Tbl (copy), ObserveEligibilityResults (copy), persistEvent (copy)
		if P6 == nil then return end
		p3.isVerifyingAudience = false
		
		if p3.isAwaitingEligibility then return end
		p3.isAwaitingEligibility = true
		local Count1 = Count
		local v1 = nil
		local Flag = false
		local ObserveEligibilityResult: () -> () = P6.observeEligibility(p3.universeId, function()
			-- upvalues: Count (upval), Count1 (copy), Tbl (upval), p3 (copy), P6 (upval), v1 (ref), ObserveEligibilityResults (upval), Flag (ref), p4 (copy), persistEvent (upval)
			if Count ~= Count1 or Tbl[p3.id] ~= p3 then return end
			local Eligibility = P6.getEligibility(p3.universeId)
			
			if not Eligibility.isResolved then return end
			p3.isAwaitingEligibility = false
			
			if v1 == nil then
				Flag = true
			else
				local Id = p3.id
				local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[Id]
				
				if ObserveEligibilityResult ~= nil then
					ObserveEligibilityResults[Id] = nil
					ObserveEligibilityResult()
				end
			end
			p3.isEligiblePublish = P6.getAudience(p4) == P6.publicAudience and (Eligibility.isEligible and Eligibility.freePromotionsRemaining > 0)
			persistEvent(p3)
		end)
		v1 = ObserveEligibilityResult
		
		if Flag then
			ObserveEligibilityResult()
			
			return
		else
			ObserveEligibilityResults[p3.id] = ObserveEligibilityResult
		end
	end
	
	Callback = function(p3)
		-- upvalues: P6 (copy), Tbl (copy), persistEvent (copy), v38 (ref), Count (ref), awaitEligibility (copy)
		if P6 == nil or Tbl[p3.id] ~= p3 then return end
		if not p3.requiresAudienceVerification or p3.isEligiblePublish ~= nil then
			persistEvent(p3)
			
			return
		end
		if p3.isVerifyingAudience or p3.isAwaitingEligibility then return end
		p3.isVerifyingAudience = true
		local Success, Result = pcall(P6.refreshSummary, p3.universeId)
		
		if Success and Result ~= nil then
			local Count1 = Count
			Result:andThen(function(Result)
				-- upvalues: Count (upval), Count1 (copy), Tbl (upval), p3 (copy), P6 (upval), awaitEligibility (upval), persistEvent (upval)
				if Count ~= Count1 or Tbl[p3.id] ~= p3 then return end
				local Eligibility = P6.getEligibility(p3.universeId)
				
				if Eligibility.isResolved then
					p3.isVerifyingAudience = false
					p3.isEligiblePublish = P6.getAudience(Result) == P6.publicAudience and (Eligibility.isEligible and Eligibility.freePromotionsRemaining > 0)
					persistEvent(p3)
					
					return
				else
					awaitEligibility(p3, Result)
				end
			end, function()
				-- upvalues: Count (upval), Count1 (copy), Tbl (upval), p3 (copy), v38 (upval)
				if Count ~= Count1 or Tbl[p3.id] ~= p3 then return end
				p3.isVerifyingAudience = false
				p3.audienceVerificationAttempts += 1
				
				if p3.audienceVerificationAttempts < 3 then
					v38()
				end
			end)
			
			return
		end
		p3.isVerifyingAudience = false
		p3.audienceVerificationAttempts += 1
		
		if p3.audienceVerificationAttempts < 3 then
			v38()
		end
	end
	
	local function disposeAllEligibilitySubscriptions()
		-- upvalues: ObserveEligibilityResults (copy)
		local List = {}
		
		for observeEligibilityResult in ObserveEligibilityResults do
			table.insert(List, observeEligibilityResult)
		end
		for _, value in List do
			local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[value]
			
			if ObserveEligibilityResult ~= nil then
				ObserveEligibilityResults[value] = nil
				ObserveEligibilityResult()
			end
		end
	end
	
	return {
		recordAdCampaignAttempt = if FFlagBuildAgentAdCampaignCardModule then function(p3, p4): boolean
			-- upvalues: P6 (copy), Signal2_1 (copy), Signal2 (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			if AdCampaignCardStorage == nil or not AdCampaignCardStorage.saveAttempt(p3, p4) then
				return false
			else
				Signal2_1(function(p5: number): number
					return p5 + 1
				end)
				Signal2(function(p5: number): number
					return p5 + 1
				end)
				
				return true
			end
		end else nil,
		getAdCampaignCard = if FFlagBuildAgentAdCampaignCardModule then function(p3, p4)
			-- upvalues: P6 (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			return if AdCampaignCardStorage == nil then { isAvailable = false, isPersisted = false } else AdCampaignCardStorage.get(p3, p4)
		end else nil,
		listAdCampaignCards = if FFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: P6 (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			return if AdCampaignCardStorage == nil then { isAvailable = false, records = {} } else AdCampaignCardStorage.list(p3)
		end else nil,
		recordAdCampaignCreatedReceipt = if FFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: P6 (copy), recordCardMutation (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			if AdCampaignCardStorage == nil then
				return false, false
			else
				local HasPendingWrites = AdCampaignCardStorage.hasPendingWrites()
				local ConfirmResult, ConfirmResult2 = AdCampaignCardStorage.confirm(p3)
				
				return recordCardMutation(ConfirmResult, ConfirmResult2, HasPendingWrites)
			end
		end else nil,
		retryAdCampaignCardWrites = if FFlagBuildAgentAdCampaignCardModule then function(): boolean
			-- upvalues: P6 (copy), Signal2_1 (copy), Signal2 (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			if AdCampaignCardStorage == nil then
				return false
			end
			local HasPendingWrites = AdCampaignCardStorage.hasPendingWrites()
			
			if not AdCampaignCardStorage.retryWrites() then
				return false
			end
			if HasPendingWrites then
				Signal2_1(function(p3: number): number
					return p3 + 1
				end)
				Signal2(function(p3: number): number
					return p3 + 1
				end)
			end
			return true
		end else nil,
		pruneAdCampaignCards = if FFlagBuildAgentAdCampaignCardModule then function(p3)
			-- upvalues: P6 (copy), Signal2_1 (copy), Signal2 (copy)
			local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
			
			if AdCampaignCardStorage == nil then
				return false, false
			end
			local PruneResult, PruneResult2 = AdCampaignCardStorage.prune(p3)
			
			if PruneResult2 then
				Signal2_1(function(p4: number): number
					return p4 + 1
				end)
				Signal2(function(p4: number): number
					return p4 + 1
				end)
			end
			return PruneResult, PruneResult2
		end else nil,
		getRevision = Signal,
		getAdCampaignRevision = Signal1,
		reportAssistantTurnCompleted = function(p3)
			-- upvalues: P6 (copy), ChatTypesModule (upval), CreatorAgentChatModule (upval), retainPending (copy), Callback (ref)
			if P6 == nil or p3.universeId == 0 or P6.isDismissedPermanently(p3.universeId) then return end
			local AssistantTurnAnchorKey = ChatTypesModule.makeAssistantTurnAnchorKey(p3.sessionId, p3.latestSequenceId)
			
			if AssistantTurnAnchorKey ~= nil then
				local HasLatestSuccessfulResult = CreatorAgentChatModule.PublishToolUtils.getLatestSuccessfulResult(p3.turnState, { parseDirectText = true }) ~= nil
				Callback((retainPending({
					isCompletedTurn = true,
					isVerifyingAudience = false,
					isAwaitingEligibility = false,
					audienceVerificationAttempts = 0,
					storagePersistenceAttempts = 0,
					id = `chat:{p3.universeId}:{AssistantTurnAnchorKey}`,
					universeId = p3.universeId,
					sessionId = if p3.sessionId == "" then nil else p3.sessionId,
					afterMessageKey = AssistantTurnAnchorKey,
					isEligiblePublish = if HasLatestSuccessfulResult then nil else false,
					requiresAudienceVerification = HasLatestSuccessfulResult
				})))
				
				return
			end
		end,
		reportMenuPublish = function(UniverseId, p3, p4, p5)
			-- upvalues: P6 (copy), retainPending (copy), Callback (ref)
			if P6 ~= nil and UniverseId ~= 0 and p4 ~= "" and not P6.isDismissedPermanently(UniverseId) then
				local Eligibility = P6.getEligibility(UniverseId)
				local NoIsResolved: boolean = p5 and not Eligibility.isResolved
				Callback((retainPending({
					afterMessageKey = nil,
					isCompletedTurn = false,
					isVerifyingAudience = false,
					isAwaitingEligibility = false,
					audienceVerificationAttempts = 0,
					storagePersistenceAttempts = 0,
					id = `menu:{UniverseId}:{p4}`,
					universeId = UniverseId,
					sessionId = if p3 == "" then nil else p3,
					isEligiblePublish = if NoIsResolved then nil else p5 and (Eligibility.isEligible and Eligibility.freePromotionsRemaining > 0),
					requiresAudienceVerification = NoIsResolved
				})))
				
				return
			end
		end,
		retryStorageRead = function()
			-- upvalues: FFlagBuildAgentAdCampaignCardModule (upval), P6 (copy), Signal2_1 (copy), Signal2 (copy), List (copy), Tbl (copy), Callback (ref)
			if FFlagBuildAgentAdCampaignCardModule then
				local AdCampaignCardStorage = if P6 == nil then nil else P6.getAdCampaignCardStorage()
				
				if AdCampaignCardStorage ~= nil and AdCampaignCardStorage.hasPendingWrites() and AdCampaignCardStorage.retryWrites() then
					Signal2_1(function(p3: number): number
						return p3 + 1
					end)
					Signal2(function(p3: number): number
						return p3 + 1
					end)
				end
			end
			if P6 ~= nil and P6.retryStorageRead() then
				if FFlagBuildAgentAdCampaignCardModule then
					Signal2_1(function(p3: number): number
						return p3 + 1
					end)
					Signal2(function(p3: number): number
						return p3 + 1
					end)
				else
					Signal2(function(p3: number): number
						return p3 + 1
					end)
				end
				for _, value in table.clone(List) do
					local Entry = Tbl[value]
					
					if Entry ~= nil then
						Entry.storagePersistenceAttempts = 0
						Callback(Entry)
					end
				end
			end
		end,
		attachPendingMilestones = function(p3, p4, p5)
			-- upvalues: P6 (copy), Signal2 (copy)
			if P6 ~= nil then
				P6.attachPendingMilestones(p3, p4, p5)
				Signal2(function(p6: number): number
					return p6 + 1
				end)
			end
		end,
		pruneAnchors = function(p3, p4, p5)
			-- upvalues: FFlagBuildAdUpsellPinnedModule (upval), P6 (copy), Signal2 (copy)
			if FFlagBuildAdUpsellPinnedModule or P6 == nil then
				return false
			end
			local PruneAnchorsResult, PruneAnchorsResult2 = P6.pruneAnchors(p3, p4, p5)
			
			if PruneAnchorsResult2 then
				Signal2(function(p6: number): number
					return p6 + 1
				end)
			end
			return PruneAnchorsResult
		end,
		getTransientCongratsMessageKey = function(p3)
			-- upvalues: FFlagBuildAdUpsellPinnedModule (upval), AfterMessageKeys (copy)
			return if FFlagBuildAdUpsellPinnedModule then AfterMessageKeys[p3] else nil
		end,
		markAnchorImpressed = function(p3, p4, p5)
			-- upvalues: P6 (copy), Signal2 (copy)
			if P6 == nil then
				return false
			end
			local MarkAnchorImpressedResult = P6.markAnchorImpressed(p3, p4, p5)
			
			if MarkAnchorImpressedResult then
				Signal2(function(p6: number): number
					return p6 + 1
				end)
			end
			return MarkAnchorImpressedResult
		end,
		dismissPermanently = function(UniverseId)
			-- upvalues: P6 (copy), List (copy), Tbl (copy), ObserveEligibilityResults (copy), Signal2 (copy)
			if P6 ~= nil then
				for _, value in table.clone(List) do
					local Entry = Tbl[value]
					
					if Entry ~= nil and Entry.universeId == UniverseId and Tbl[value] ~= nil then
						local ObserveEligibilityResult: () -> () = ObserveEligibilityResults[value]
						
						if ObserveEligibilityResult ~= nil then
							ObserveEligibilityResults[value] = nil
							ObserveEligibilityResult()
						end
						Tbl[value] = nil
						local FoundIndex: number? = table.find(List, value)
						
						if FoundIndex ~= nil then
							table.remove(List, FoundIndex)
						end
					end
				end
				P6.dismissPermanently(UniverseId)
				Signal2(function(p3: number): number
					return p3 + 1
				end)
			end
		end,
		reset = function()
			-- upvalues: Count (ref), P6 (copy), ScheduleRetryResult (ref), disposeAllEligibilitySubscriptions (copy), Tbl (copy), List (copy), FFlagBuildAdUpsellPinnedModule (upval), AfterMessageKeys (copy), Signal2 (copy), Signal2_1 (copy)
			Count += 1
			
			if P6 ~= nil and ScheduleRetryResult ~= nil then
				P6.cancelRetry(ScheduleRetryResult)
			end
			ScheduleRetryResult = nil
			disposeAllEligibilitySubscriptions()
			table.clear(Tbl)
			table.clear(List)
			
			if FFlagBuildAdUpsellPinnedModule then
				table.clear(AfterMessageKeys)
			end
			Signal2(0)
			Signal2_1(0)
		end
	}
end