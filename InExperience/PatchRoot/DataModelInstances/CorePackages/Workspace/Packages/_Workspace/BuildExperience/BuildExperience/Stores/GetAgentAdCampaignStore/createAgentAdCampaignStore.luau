local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local HttpService = game:GetService("HttpService")
local _ = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local _ = require(BuildExperience.Storage.createAdCampaignCardStorage)
local FFlagBuildAgentAdCampaignRefreshEligibilityModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignRefreshEligibility)

local function _(Record): boolean
	return Record.idempotencyKey == Record.toolCallId
end

local _ = function(p1): boolean
	local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - (p1.attemptStartedAtMs or 0)
	
	return UnixTimestampMillisDelta >= 0 and UnixTimestampMillisDelta < 82800000
end

local _ = function(p1): boolean
	return not p1.isPending and (p1.hasAmbiguousFailure == false and (p1.failureKind ~= nil and p1.failureKind ~= "unknown"))
end

local function canReplaceRejectedAttempt(p1): boolean
	return not p1.isPending and (p1.hasAmbiguousFailure == false and (p1.failureKind ~= nil and p1.failureKind ~= "unknown")) and p1.failureKind ~= "payment_required"
end

local function getRetrySelection(Tbl, RunStartTimeMs)
	if Tbl.idempotencyKey == Tbl.toolCallId then
		local _DateTime = DateTime.now()
		local LocalTime = _DateTime:ToLocalTime()
		local LocalTime1 = DateTime.fromUnixTimestampMillis(Tbl.runStartTimeMs):ToLocalTime()
		
		if LocalTime1.Year == LocalTime.Year and LocalTime1.Month == LocalTime.Month and LocalTime1.Day == LocalTime.Day then
			return Tbl
		else
			local LocalTime2 = DateTime.fromUnixTimestampMillis(RunStartTimeMs):ToLocalTime()
			local Copy = table.clone(Tbl)
			Copy.runStartTimeMs = if LocalTime2.Year == LocalTime.Year and LocalTime2.Month == LocalTime.Month and LocalTime2.Day == LocalTime.Day then RunStartTimeMs else _DateTime.UnixTimestampMillis
			
			return Copy
		end
	else
		local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - (Tbl.attemptStartedAtMs or 0)
		
		if UnixTimestampMillisDelta >= 0 and UnixTimestampMillisDelta < 82800000 or (Tbl.isPending or (Tbl.hasAmbiguousFailure ~= false or (Tbl.failureKind == nil or Tbl.failureKind == "unknown"))) then
			return Tbl
		else
			local Copy = table.clone(Tbl)
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local UnixTimestampMillisDelta1 = UnixTimestampMillis - RunStartTimeMs
			Copy.runStartTimeMs = if UnixTimestampMillisDelta1 >= 0 and UnixTimestampMillisDelta1 < 82800000 then RunStartTimeMs else UnixTimestampMillis
			
			return Copy
		end
	end
end

local function getRetryOffers(p1, p2)
	if not p1.isPending and (p1.hasAmbiguousFailure == false and (p1.failureKind ~= nil and p1.failureKind ~= "unknown")) and p1.failureKind ~= "payment_required" then
		return p2
	else
		local CampaignOption = p1.selectedOption.campaignOption
		local Offer = p1.offers[CampaignOption]
		local Record = p2[CampaignOption]
		
		return if Offer == nil or Record == nil or Record.fundingType ~= p1.selectedOption.paymentType or Record.durationDays ~= Offer.durationDays or Record.priceRobux ~= Offer.priceRobux then nil else { [CampaignOption] = Record }
	end
end

local function toRecord(Record)
	local SelectedOption = Record.selectedOption
	local Feedback = if SelectedOption.campaignOption == "feedback" then Record.offers.feedback else Record.offers.plays
	assert(Feedback ~= nil, "A submitted campaign must have an offer")
	
	return {
		sessionId = Record.sessionId,
		universeId = Record.universeId,
		toolCallId = Record.toolCallId,
		idempotencyKey = Record.idempotencyKey,
		userId = Record.userId,
		attemptStartedAtMs = Record.attemptStartedAtMs,
		hasAmbiguousFailure = Record.hasAmbiguousFailure,
		campaignOption = SelectedOption.campaignOption,
		fundingType = SelectedOption.paymentType,
		durationDays = Feedback.durationDays,
		displayAmountRobux = Feedback.priceRobux,
		phase = if Record.isPending then "creating" elseif Record.hasAmbiguousFailure or Record.failureKind == nil or Record.failureKind == "unknown" then "outcome_unknown" elseif Record.failureKind == "payment_required" then "payment_required" else "failed",
		lastErrorCode = Record.failureKind,
		createdAtMs = Record.runStartTimeMs,
		updatedAtMs = math.max(Record.runStartTimeMs, DateTime.now().UnixTimestampMillis)
	}
end

return function()
	-- upvalues: SignalsUtilsModule (copy), HttpService (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (copy), getRetrySelection (copy), toRecord (copy), getRetryOffers (copy), canReplaceRejectedAttempt (copy)
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal({})
	local SessionScopedSignal1, SessionScopedSignal2_1 = SignalsUtilsModule.createSessionScopedSignal({})
	
	local function start(Record, Tbl, UserId, p1)
		-- upvalues: SessionScopedSignal (copy), HttpService (upval), SessionScopedSignal2 (copy)
		local SessionScopedSignalResult = SessionScopedSignal(false)
		local SessionScopedSignalResultEntry = SessionScopedSignalResult[Record.toolCallId]
		local IsPaymentTypeMatch: boolean = not p1 and (SessionScopedSignalResultEntry ~= nil and (SessionScopedSignalResultEntry.selectedOption.campaignOption == Tbl.campaignOption and SessionScopedSignalResultEntry.selectedOption.paymentType == Tbl.paymentType))
		
		if SessionScopedSignalResultEntry == nil or not SessionScopedSignalResultEntry.isPending and SessionScopedSignalResultEntry.universeId == Record.universeId and SessionScopedSignalResultEntry.sessionId == Record.sessionId and SessionScopedSignalResultEntry.toolCallId == Record.toolCallId and (IsPaymentTypeMatch or SessionScopedSignalResultEntry.failureKind ~= nil and SessionScopedSignalResultEntry.failureKind ~= "unknown") then
			local Record1 = if SessionScopedSignalResultEntry == nil or not IsPaymentTypeMatch then Record else SessionScopedSignalResultEntry
			local config = {
				isPending = true,
				failureKind = nil,
				universeId = Record1.universeId,
				sessionId = Record1.sessionId,
				toolCallId = Record1.toolCallId,
				offers = {
					feedback = if Record1.offers.feedback == nil then nil else table.clone(Record1.offers.feedback),
					plays = if Record1.offers.plays == nil then nil else table.clone(Record1.offers.plays)
				},
				runStartTimeMs = Record1.runStartTimeMs,
				selectedOption = table.clone(Tbl),
				idempotencyKey = if SessionScopedSignalResultEntry == nil then if SessionScopedSignalResultEntry == nil and UserId ~= nil then Record.toolCallId else HttpService:GenerateGUID(false) elseif IsPaymentTypeMatch then SessionScopedSignalResultEntry.idempotencyKey elseif SessionScopedSignalResultEntry.idempotencyKey == SessionScopedSignalResultEntry.toolCallId then SessionScopedSignalResultEntry.idempotencyKey elseif SessionScopedSignalResultEntry == nil and UserId ~= nil then Record.toolCallId else HttpService:GenerateGUID(false),
				userId = UserId,
				attemptStartedAtMs = if UserId == nil then nil elseif SessionScopedSignalResultEntry == nil or not IsPaymentTypeMatch then DateTime.now().UnixTimestampMillis else SessionScopedSignalResultEntry.attemptStartedAtMs,
				hasAmbiguousFailure = if UserId == nil then nil else SessionScopedSignalResultEntry ~= nil and (IsPaymentTypeMatch and SessionScopedSignalResultEntry.hasAmbiguousFailure == true)
			}
			local Copy = table.clone(SessionScopedSignalResult)
			Copy[Record.toolCallId] = config
			SessionScopedSignal2(Copy)
			
			return config
		else
			return nil
		end
	end
	
	local function restore(Record, UserId, p1): boolean
		-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
		local GetResult = p1.get(Record.sessionId, Record.toolCallId)
		
		if not GetResult.isAvailable then
			return false
		end
		local SessionScopedSignalResultEntry = SessionScopedSignal(false)[Record.toolCallId]
		
		if SessionScopedSignalResultEntry ~= nil and (SessionScopedSignalResultEntry.userId ~= UserId or SessionScopedSignalResultEntry.sessionId ~= Record.sessionId or SessionScopedSignalResultEntry.universeId ~= Record.universeId) then
			return false
		end
		local Record1 = GetResult.record
		
		if Record1 == nil then
			return true
		end
		if Record1.campaignId ~= nil or Record1.userId ~= UserId or Record1.universeId ~= Record.universeId or type(Record1.attemptStartedAtMs) ~= "number" or type(Record1.hasAmbiguousFailure) ~= "boolean" or Record1.campaignOption ~= "feedback" and Record1.campaignOption ~= "plays" or (Record1.durationDays == nil or Record1.displayAmountRobux == nil) then
			return false
		end
		if SessionScopedSignalResultEntry ~= nil and SessionScopedSignalResultEntry.idempotencyKey == Record1.idempotencyKey then
			return true
		end
		if SessionScopedSignalResultEntry ~= nil and SessionScopedSignalResultEntry.isPending then
			return false
		end
		local Copy = table.clone(Record.offers)
		Copy[Record1.campaignOption] = {
			campaignOption = Record1.campaignOption,
			fundingType = Record1.fundingType,
			durationDays = Record1.durationDays,
			priceRobux = Record1.displayAmountRobux
		}
		local FailureKind = "unknown"
		
		if not Record1.hasAmbiguousFailure and (Record1.phase == "failed" or Record1.phase == "payment_required") then
			local LastErrorCode = Record1.lastErrorCode
			
			if LastErrorCode == "payment_required" or LastErrorCode == "ineligible" or LastErrorCode == "missing_thumbnail" or LastErrorCode == "invalid_offer" then
				FailureKind = LastErrorCode
			end
		end
		local config = {
			isPending = false,
			universeId = Record1.universeId,
			sessionId = Record1.sessionId,
			toolCallId = Record1.toolCallId,
			offers = Copy,
			runStartTimeMs = Record1.createdAtMs,
			selectedOption = {
				campaignOption = Record1.campaignOption,
				paymentType = Record1.fundingType
			},
			idempotencyKey = Record1.idempotencyKey,
			failureKind = FailureKind,
			userId = UserId,
			attemptStartedAtMs = Record1.attemptStartedAtMs,
			hasAmbiguousFailure = FailureKind == "unknown"
		}
		local Copy1 = table.clone(SessionScopedSignal(false))
		Copy1[Record.toolCallId] = config
		SessionScopedSignal2(Copy1)
		
		return true
	end
	
	return {
		getAttempts = SessionScopedSignal,
		getRetrySelection = getRetrySelection,
		getRetryOffers = getRetryOffers,
		canReplaceRejectedAttempt = canReplaceRejectedAttempt,
		start = start,
		finish = function(Tbl, p1, FailureKind, HasAmbiguousFailure): boolean
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult[Tbl.toolCallId] ~= Tbl then
				return false
			end
			local Copy = table.clone(SessionScopedSignalResult)
			
			if p1 then
				Copy[Tbl.toolCallId] = nil
			else
				local Copy1 = table.clone(Tbl)
				Copy1.isPending = false
				Copy1.failureKind = FailureKind
				
				if HasAmbiguousFailure ~= nil then
					Copy1.hasAmbiguousFailure = HasAmbiguousFailure
				end
				Copy[Tbl.toolCallId] = Copy1
			end
			SessionScopedSignal2(Copy)
			
			return true
		end,
		restore = restore,
		startDurable = function(p1, p2, UserId, p3)
			-- upvalues: restore (copy), SessionScopedSignal (copy), FFlagBuildAgentAdCampaignRefreshEligibilityModule (upval), getRetrySelection (upval), start (copy), toRecord (upval), SessionScopedSignal2 (copy)
			if not restore(p1, UserId, p3) then
				return nil
			end
			local SessionScopedSignalResultEntry = SessionScopedSignal(false)[p1.toolCallId]
			local Flag = false
			
			if SessionScopedSignalResultEntry ~= nil then
				local IsNotPaymentRequired = false
				local HasAmbiguousFailure = SessionScopedSignalResultEntry.hasAmbiguousFailure
				
				if FFlagBuildAgentAdCampaignRefreshEligibilityModule then
					IsNotPaymentRequired = if not SessionScopedSignalResultEntry.isPending then SessionScopedSignalResultEntry.hasAmbiguousFailure == false and (SessionScopedSignalResultEntry.failureKind ~= nil and SessionScopedSignalResultEntry.failureKind ~= "unknown") and SessionScopedSignalResultEntry.failureKind ~= "payment_required" else not SessionScopedSignalResultEntry.isPending and SessionScopedSignalResultEntry.failureKind ~= "payment_required"
					HasAmbiguousFailure = not IsNotPaymentRequired
				end
				if SessionScopedSignalResultEntry.idempotencyKey ~= SessionScopedSignalResultEntry.toolCallId then
					local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - (SessionScopedSignalResultEntry.attemptStartedAtMs or 0)
					
					if UnixTimestampMillisDelta < 0 or UnixTimestampMillisDelta >= 82800000 then
						if SessionScopedSignalResultEntry.isPending or (SessionScopedSignalResultEntry.hasAmbiguousFailure ~= false or (SessionScopedSignalResultEntry.failureKind == nil or SessionScopedSignalResultEntry.failureKind == "unknown")) then
							return nil
						end
						if p1.runStartTimeMs ~= getRetrySelection(SessionScopedSignalResultEntry, p1.runStartTimeMs).runStartTimeMs then
							return nil
						end
						Flag = true
					end
				end
				if HasAmbiguousFailure and (SessionScopedSignalResultEntry.selectedOption.campaignOption ~= p2.campaignOption or SessionScopedSignalResultEntry.selectedOption.paymentType ~= p2.paymentType) then
					return nil
				end
				if IsNotPaymentRequired then
					Flag = true
				end
			end
			local StartResult = start(p1, p2, UserId, Flag)
			
			if StartResult == nil then
				return nil
			end
			if p3.save(toRecord(StartResult), if SessionScopedSignalResultEntry == nil then nil else SessionScopedSignalResultEntry.idempotencyKey) then
				if SessionScopedSignal(false)[StartResult.toolCallId] ~= StartResult then
					return nil
				end
				if StartResult.idempotencyKey ~= StartResult.toolCallId then
					local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - (StartResult.attemptStartedAtMs or 0)
					
					if UnixTimestampMillisDelta < 0 or UnixTimestampMillisDelta >= 82800000 then
						local SessionScopedSignalResult = SessionScopedSignal(false)
						
						if SessionScopedSignalResult[StartResult.toolCallId] == StartResult then
							local Copy = table.clone(SessionScopedSignalResult)
							local Copy1 = table.clone(StartResult)
							Copy1.isPending = false
							Copy1.failureKind = "unknown"
							Copy1.hasAmbiguousFailure = true
							Copy[StartResult.toolCallId] = Copy1
							SessionScopedSignal2(Copy)
						end
						return nil
					end
				end
				return StartResult
			else
				if SessionScopedSignal(false)[StartResult.toolCallId] == StartResult then
					local Copy = table.clone(SessionScopedSignal(false))
					Copy[StartResult.toolCallId] = SessionScopedSignalResultEntry
					SessionScopedSignal2(Copy)
				end
				return nil
			end
		end,
		finishDurable = function(Tbl, FailureKind, p1): boolean
			-- upvalues: SessionScopedSignal (copy), toRecord (upval), SessionScopedSignal2 (copy)
			if SessionScopedSignal(false)[Tbl.toolCallId] ~= Tbl then
				return false
			end
			local Copy = table.clone(Tbl)
			Copy.isPending = false
			Copy.failureKind = FailureKind
			Copy.hasAmbiguousFailure = Tbl.hasAmbiguousFailure == true or (FailureKind == nil or FailureKind == "unknown")
			p1.save(toRecord(Copy), Tbl.idempotencyKey)
			local HasAmbiguousFailure = Copy.hasAmbiguousFailure
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult[Tbl.toolCallId] ~= Tbl then
				return false
			end
			local Copy1 = table.clone(SessionScopedSignalResult)
			local Copy11 = table.clone(Tbl)
			Copy11.isPending = false
			Copy11.failureKind = FailureKind
			
			if HasAmbiguousFailure ~= nil then
				Copy11.hasAmbiguousFailure = HasAmbiguousFailure
			end
			Copy1[Tbl.toolCallId] = Copy11
			SessionScopedSignal2(Copy1)
			
			return true
		end,
		completeDurable = function(Record)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResultEntry = SessionScopedSignal(false)[Record.toolCallId]
			
			if SessionScopedSignalResultEntry ~= nil and SessionScopedSignalResultEntry.userId == Record.userId and SessionScopedSignalResultEntry.sessionId == Record.sessionId and SessionScopedSignalResultEntry.universeId == Record.universeId and SessionScopedSignalResultEntry.idempotencyKey == Record.idempotencyKey then
				local SessionScopedSignalResult = SessionScopedSignal(false)
				
				if SessionScopedSignalResult[SessionScopedSignalResultEntry.toolCallId] ~= SessionScopedSignalResultEntry then return end
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[SessionScopedSignalResultEntry.toolCallId] = nil
				SessionScopedSignal2(Copy)
			end
		end,
		toRecord = toRecord,
		markImpressed = function(Key, p1): boolean
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
			local SessionScopedSignalResult = SessionScopedSignal1(false)
			
			if SessionScopedSignalResult[Key] == nil or not SessionScopedSignalResult[Key][p1] then
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[Key] = table.clone(SessionScopedSignalResult[Key] or {})
				Copy[Key][p1] = true
				SessionScopedSignal2_1(Copy)
				
				return true
			else
				return false
			end
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SessionScopedSignal2({})
			SessionScopedSignal2_1({})
		end
	}
end