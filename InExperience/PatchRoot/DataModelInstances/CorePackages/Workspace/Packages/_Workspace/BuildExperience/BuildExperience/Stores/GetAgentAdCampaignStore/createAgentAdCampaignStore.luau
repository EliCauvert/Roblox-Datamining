local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.Signals)
local signalsUtilsModule = require(parent.SignalsUtils)
local _ = require(parent.DataHydration.CreatorAgentChat)
local _ = require(buildExperience.Storage.createAdCampaignCardStorage)

local function _(p1)
	return p1.idempotencyKey == p1.toolCallId
end

local _ = function(p1)
	local var1 = DateTime.now().UnixTimestampMillis - (p1.attemptStartedAtMs or 0)
	
	return var1 >= 0 and var1 < 82800000
end

local _ = function(p1)
	return not p1.isPending and (p1.hasAmbiguousFailure == false and (p1.failureKind ~= nil and p1.failureKind ~= "unknown"))
end

local function getRetrySelection(p1, p2)
	local var1, var2
	if p1.idempotencyKey == p1.toolCallId then
		local currentDateTime = DateTime.now()
		var1 = currentDateTime:ToLocalTime()
		local var3 = DateTime.fromUnixTimestampMillis(p1.runStartTimeMs):ToLocalTime()
		
		if var3.Year == var1.Year and var3.Month == var1.Month and var3.Day == var1.Day then
			return p1
		end
		var2 = DateTime.fromUnixTimestampMillis(p2):ToLocalTime()
		local cloned = table.clone(p1)
		cloned.runStartTimeMs = if var2.Year == var1.Year and var2.Month == var1.Month and var2.Day == var1.Day then p2 else currentDateTime.UnixTimestampMillis
		
		return cloned
	else
		var1 = DateTime.now().UnixTimestampMillis - (p1.attemptStartedAtMs or 0)
		
		if not (var1 >= 0 and var1 < 82800000) then
			if not (not p1.isPending and (p1.hasAmbiguousFailure == false and (p1.failureKind ~= nil and p1.failureKind ~= "unknown"))) then
				return p1
			end
			local cloned = table.clone(p1)
			var1 = DateTime.now().UnixTimestampMillis
			local var4 = var1 - p2
			var2 = if var4 >= 0 and var4 < 82800000 then p2 else var1
			cloned.runStartTimeMs = var2
			
			return cloned
		end
	end
end

local function toRecord(p1)
	local selectedOption = p1.selectedOption
	local var1 = if selectedOption.campaignOption == "feedback" then p1.offers.feedback else p1.offers.plays
	assert(var1 ~= nil, "A submitted campaign must have an offer")
	
	return {
		sessionId = p1.sessionId,
		universeId = p1.universeId,
		toolCallId = p1.toolCallId,
		idempotencyKey = p1.idempotencyKey,
		userId = p1.userId,
		attemptStartedAtMs = p1.attemptStartedAtMs,
		hasAmbiguousFailure = p1.hasAmbiguousFailure,
		campaignOption = selectedOption.campaignOption,
		fundingType = selectedOption.paymentType,
		durationDays = var1.durationDays,
		displayAmountRobux = var1.priceRobux,
		phase = if p1.isPending then "creating" elseif p1.hasAmbiguousFailure or p1.failureKind == nil or p1.failureKind == "unknown" then "outcome_unknown" elseif p1.failureKind == "payment_required" then "payment_required" else "failed",
		lastErrorCode = p1.failureKind,
		createdAtMs = p1.runStartTimeMs,
		updatedAtMs = math.max(p1.runStartTimeMs, DateTime.now().UnixTimestampMillis)
	}
end

return function()
	-- upvalues: signalsUtilsModule (ref), httpService (ref), getRetrySelection (ref), toRecord (ref)
	local var1, var2 = signalsUtilsModule.createSessionScopedSignal({})
	local var3, var4 = signalsUtilsModule.createSessionScopedSignal({})
	
	local function start(p1, p2, p3, p4)
		-- upvalues: var1 (ref), httpService (copy), var2 (ref)
		local var5 = var1(false)
		local toolCallId = var5[p1.toolCallId]
		local var6 = not p4 and (toolCallId ~= nil and (toolCallId.selectedOption.campaignOption == p2.campaignOption and toolCallId.selectedOption.paymentType == p2.paymentType))
		
		if toolCallId ~= nil and (toolCallId.isPending or toolCallId.universeId ~= p1.universeId or (toolCallId.sessionId ~= p1.sessionId or toolCallId.toolCallId ~= p1.toolCallId) or not var6 and (toolCallId.failureKind == nil or toolCallId.failureKind == "unknown")) then
			return nil
		end
		local var7
		local var8 = if toolCallId == nil or not var6 then p1 else toolCallId
		local t = {
			isPending = true,
			failureKind = nil,
			universeId = var8.universeId,
			sessionId = var8.sessionId,
			toolCallId = var8.toolCallId,
			offers = {
				feedback = if var8.offers.feedback ~= nil then nil else table.clone(var8.offers.feedback),
				plays = if var8.offers.plays ~= nil then nil else table.clone(var8.offers.plays)
			},
			runStartTimeMs = var8.runStartTimeMs,
			selectedOption = table.clone(p2),
			idempotencyKey = if toolCallId ~= nil and (var6 or toolCallId.idempotencyKey == toolCallId.toolCallId) then if toolCallId == nil and p3 ~= nil then p1.toolCallId else httpService:GenerateGUID(false) else toolCallId.idempotencyKey,
			userId = p3,
			attemptStartedAtMs = if p3 == nil then nil elseif toolCallId == nil or not var6 then DateTime.now().UnixTimestampMillis else toolCallId.attemptStartedAtMs
		}
		
		if p3 == nil then
			var7 = nil
		else
			var7 = false
			
			if toolCallId ~= nil then
				var7 = var6
				
				if var7 then
					var7 = toolCallId.hasAmbiguousFailure == true
					var7 = nil
				end
			end
		end
		t.hasAmbiguousFailure = var7
		local cloned = table.clone(var5)
		cloned[p1.toolCallId] = t
		var2(cloned)
		
		return t
	end
	
	local function restore(p1, p2, p3)
		-- upvalues: var1 (ref), var2 (ref)
		local var5 = p3.get(p1.sessionId, p1.toolCallId)
		
		if not var5.isAvailable then
			return false
		end
		local toolCallId = var1(false)[p1.toolCallId]
		
		if toolCallId ~= nil and (toolCallId.userId ~= p2 or toolCallId.sessionId ~= p1.sessionId or toolCallId.universeId ~= p1.universeId) then
			return false
		end
		local record = var5.record
		
		if record == nil then
			return true
		elseif record.campaignId ~= nil or record.userId ~= p2 or (record.universeId ~= p1.universeId or type(record.attemptStartedAtMs) ~= "number") or (type(record.hasAmbiguousFailure) ~= "boolean" or record.campaignOption ~= "feedback" and record.campaignOption ~= "plays") or (record.durationDays == nil or record.displayAmountRobux == nil) then
			return false
		elseif toolCallId ~= nil and toolCallId.idempotencyKey == record.idempotencyKey then
			return true
		elseif toolCallId ~= nil and toolCallId.isPending then
			return false
		end
		local cloned = table.clone(p1.offers)
		cloned[record.campaignOption] = {
			campaignOption = record.campaignOption,
			fundingType = record.fundingType,
			durationDays = record.durationDays,
			priceRobux = record.displayAmountRobux
		}
		local var6 = "unknown"
		
		if not record.hasAmbiguousFailure and (record.phase == "failed" or record.phase == "payment_required") then
			local lastErrorCode = record.lastErrorCode
			
			if lastErrorCode == "payment_required" or lastErrorCode == "ineligible" or (lastErrorCode == "missing_thumbnail" or lastErrorCode == "invalid_offer") then
				var6 = lastErrorCode
			end
		end
		local cloned_1 = table.clone(var1(false))
		cloned_1[p1.toolCallId] = {
			isPending = false,
			universeId = record.universeId,
			sessionId = record.sessionId,
			toolCallId = record.toolCallId,
			offers = cloned,
			runStartTimeMs = record.createdAtMs,
			selectedOption = {
				campaignOption = record.campaignOption,
				paymentType = record.fundingType
			},
			idempotencyKey = record.idempotencyKey,
			failureKind = var6,
			userId = p2,
			attemptStartedAtMs = record.attemptStartedAtMs,
			hasAmbiguousFailure = var6 == "unknown"
		}
		var2(cloned_1)
		
		return true
	end
	
	return {
		getAttempts = var1,
		getRetrySelection = getRetrySelection,
		start = start,
		finish = function(p1, p2, p3, p4)
			-- upvalues: var1 (ref), var2 (ref)
			local var5 = var1(false)
			
			if var5[p1.toolCallId] ~= p1 then
				return false
			end
			local cloned = table.clone(var5)
			
			if p2 then
				cloned[p1.toolCallId] = nil
			else
				local cloned_1 = table.clone(p1)
				cloned_1.isPending = false
				cloned_1.failureKind = p3
				
				if p4 ~= nil then
					cloned_1.hasAmbiguousFailure = p4
				end
				cloned[p1.toolCallId] = cloned_1
			end
			var2(cloned)
			
			return true
		end,
		restore = restore,
		startDurable = function(p1, p2, p3, p4)
			-- upvalues: restore (ref), var1 (ref), getRetrySelection (copy), start (ref), toRecord (copy), var2 (ref)
			if not restore(p1, p3, p4) then
				return nil
			end
			local toolCallId = var1(false)[p1.toolCallId]
			local var5 = false
			
			if toolCallId ~= nil then
				if toolCallId.idempotencyKey ~= toolCallId.toolCallId then
					local var6 = DateTime.now().UnixTimestampMillis - (toolCallId.attemptStartedAtMs or 0)
					
					if not (var6 >= 0 and var6 < 82800000) then
						if not (not toolCallId.isPending and (toolCallId.hasAmbiguousFailure == false and (toolCallId.failureKind ~= nil and toolCallId.failureKind ~= "unknown"))) then
							return nil
						elseif p1.runStartTimeMs ~= getRetrySelection(toolCallId, p1.runStartTimeMs).runStartTimeMs then
							return nil
						end
						var5 = true
					end
				end
				if toolCallId.hasAmbiguousFailure and (toolCallId.selectedOption.campaignOption ~= p2.campaignOption or toolCallId.selectedOption.paymentType ~= p2.paymentType) then
					return nil
				end
			end
			local var7 = start(p1, p2, p3, var5)
			
			if var7 == nil then
				return nil
			elseif p4.save(toRecord(var7), if toolCallId ~= nil then nil else toolCallId.idempotencyKey) then
				if var1(false)[var7.toolCallId] ~= var7 then
					return nil
				elseif var7.idempotencyKey ~= var7.toolCallId then
					local var8 = DateTime.now().UnixTimestampMillis - (var7.attemptStartedAtMs or 0)
					
					if var8 >= 0 and var8 < 82800000 then
						return var7
					end
					local var9 = var1(false)
					
					if var9[var7.toolCallId] == var7 then
						local cloned = table.clone(var9)
						local cloned_1 = table.clone(var7)
						cloned_1.isPending = false
						cloned_1.failureKind = "unknown"
						cloned_1.hasAmbiguousFailure = true
						cloned[var7.toolCallId] = cloned_1
						var2(cloned)
					end
					return nil
				end
			elseif var1(false)[var7.toolCallId] == var7 then
				local cloned = table.clone(var1(false))
				cloned[var7.toolCallId] = toolCallId
				var2(cloned)
			end
			return nil
		end,
		finishDurable = function(p1, p2, p3)
			-- upvalues: var1 (ref), toRecord (copy), var2 (ref)
			if var1(false)[p1.toolCallId] ~= p1 then
				return false
			end
			local cloned = table.clone(p1)
			cloned.isPending = false
			cloned.failureKind = p2
			cloned.hasAmbiguousFailure = if p1.hasAmbiguousFailure ~= true then if p2 ~= nil then p2 == "unknown" else true else true
			p3.save(toRecord(cloned), p1.idempotencyKey)
			local hasAmbiguousFailure = cloned.hasAmbiguousFailure
			local var5 = var1(false)
			
			if var5[p1.toolCallId] ~= p1 then
				return false
			end
			local cloned_1 = table.clone(var5)
			local cloned_2 = table.clone(p1)
			cloned_2.isPending = false
			cloned_2.failureKind = p2
			
			if hasAmbiguousFailure ~= nil then
				cloned_2.hasAmbiguousFailure = hasAmbiguousFailure
			end
			cloned_1[p1.toolCallId] = cloned_2
			var2(cloned_1)
			
			return true
		end,
		completeDurable = function(p1)
			-- upvalues: var1 (ref), var2 (ref)
			local toolCallId = var1(false)[p1.toolCallId]
			
			if toolCallId ~= nil and toolCallId.userId == p1.userId and (toolCallId.sessionId == p1.sessionId and toolCallId.universeId == p1.universeId) and toolCallId.idempotencyKey == p1.idempotencyKey then
				local var5 = var1(false)
				
				if var5[toolCallId.toolCallId] ~= toolCallId then return end
				local cloned = table.clone(var5)
				cloned[toolCallId.toolCallId] = nil
				var2(cloned)
			end
		end,
		toRecord = toRecord,
		markImpressed = function(p1, p2)
			-- upvalues: var3 (ref), var4 (ref)
			local var5 = var3(false)
			
			if var5[p1] == nil or not var5[p1][p2] then
				local cloned = table.clone(var5)
				cloned[p1] = table.clone(var5[p1] or {})
				cloned[p1][p2] = true
				var4(cloned)
				
				return true
			end
			return false
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref)
			var2({})
			var4({})
		end
	}
end