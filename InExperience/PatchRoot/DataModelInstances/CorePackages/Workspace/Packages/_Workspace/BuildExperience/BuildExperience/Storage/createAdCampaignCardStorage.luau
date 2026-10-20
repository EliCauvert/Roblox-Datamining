local FFlagBuildAgentAdCampaignCardModule = require(script:FindFirstAncestor("BuildExperience").Flags.FFlagBuildAgentAdCampaignCard)
local config = {
	creating = true,
	processing = true,
	created = true,
	active = true,
	retryable_error = true,
	outcome_unknown = true,
	payment_required = true,
	failed = true
}

local function _(p1): boolean
	return type(p1) == "string" and p1 ~= ""
end

local _ = function(p1: number): boolean
	return type(p1) == "number" and (p1 >= 0 and p1 < 1e999) and p1 % 1 == 0
end

local function isRecord(p1, SessionId, ToolCallId): boolean
	-- upvalues: config (copy)
	if type(p1) ~= "table" then
		return false
	end
	local Flag = false
	repeat
		if p1.sessionId ~= SessionId then break end
		Flag = false
		
		if p1.toolCallId ~= ToolCallId then break end
		Flag = type(SessionId) == "string" and SessionId ~= ""
		
		if not Flag then break end
		Flag = type(ToolCallId) == "string" and ToolCallId ~= ""
		
		if not Flag then break end
		local UniverseId: number = p1.universeId
		Flag = type(UniverseId) == "number" and (UniverseId >= 0 and (UniverseId < 1e999 and UniverseId % 1 == 0))
		
		if not Flag then break end
		Flag = false
		
		if p1.universeId <= 0 then break end
		local IdempotencyKey = p1.idempotencyKey
		Flag = type(IdempotencyKey) == "string" and IdempotencyKey ~= ""
		
		if not Flag then break end
		local NoCampaignOption = p1.campaignOption == nil
		
		if not NoCampaignOption then
			local CampaignOption = p1.campaignOption
			Flag = type(CampaignOption) == "string" and CampaignOption ~= ""
			NoCampaignOption = Flag
		end
		if not NoCampaignOption then break end
		local IsFree = p1.fundingType == "free"
		
		if not IsFree then
			Flag = false
			IsFree = p1.fundingType == "paid"
		end
		if not IsFree then break end
		if p1.durationDays ~= nil or p1.displayAmountRobux ~= nil then
			local DurationDays: number = p1.durationDays
			Flag = type(DurationDays) == "number" and (DurationDays >= 0 and (DurationDays < 1e999 and DurationDays % 1 == 0))
			
			if not Flag then break end
			Flag = false
			
			if p1.durationDays <= 0 then break end
			local DisplayAmountRobux: number = p1.displayAmountRobux
			Flag = type(DisplayAmountRobux) == "number" and (DisplayAmountRobux >= 0 and (DisplayAmountRobux < 1e999 and DisplayAmountRobux % 1 == 0))
			
			if not Flag then break end
		end
		Flag = false
		
		if type(p1.phase) ~= "string" then break end
		Flag = false
		
		if config[p1.phase] ~= true then break end
		if p1.phase == "active" or p1.phase == "created" then
			local CampaignId = p1.campaignId
			Flag = type(CampaignId) == "string" and CampaignId ~= ""
		else
			Flag = p1.campaignId == nil
		end
		if not Flag then break end
		local NoCampaignStatus = p1.campaignStatus == nil
		
		if not NoCampaignStatus then
			local CampaignStatus = p1.campaignStatus
			Flag = type(CampaignStatus) == "string" and CampaignStatus ~= ""
			NoCampaignStatus = Flag
		end
		if not NoCampaignStatus then break end
		if p1.lastErrorCode ~= nil and type(p1.lastErrorCode) ~= "string" then
			Flag = false
			
			if type(p1.lastErrorCode) ~= "number" then break end
			Flag = false
			
			if math.abs(p1.lastErrorCode) >= 1e999 then break end
		end
		local NoLastErrorMessage = p1.lastErrorMessage == nil
		
		if not NoLastErrorMessage then
			Flag = false
			NoLastErrorMessage = type(p1.lastErrorMessage) == "string"
		end
		if not NoLastErrorMessage then break end
		local CreatedAtMs: number = p1.createdAtMs
		Flag = type(CreatedAtMs) == "number" and (CreatedAtMs >= 0 and (CreatedAtMs < 1e999 and CreatedAtMs % 1 == 0))
		
		if not Flag then break end
		local UpdatedAtMs: number = p1.updatedAtMs
		Flag = type(UpdatedAtMs) == "number" and (UpdatedAtMs >= 0 and (UpdatedAtMs < 1e999 and UpdatedAtMs % 1 == 0) and p1.createdAtMs <= p1.updatedAtMs)
	until true
	return Flag
end

local _ = function(Tbl)
	local Copy = table.clone(Tbl)
	
	if Copy.phase == "active" then
		Copy.phase = "created"
	end
	return Copy
end

local function isDurableAttempt(p1): boolean
	local UserId: number = p1.userId
	local IsUserIdMatch: boolean = type(UserId) == "number" and (UserId >= 0 and (UserId < 1e999 and UserId % 1 == 0))
	
	if IsUserIdMatch then
		IsUserIdMatch = false
		
		if p1.userId > 0 then
			local AttemptStartedAtMs: number = p1.attemptStartedAtMs
			IsUserIdMatch = type(AttemptStartedAtMs) == "number" and (AttemptStartedAtMs >= 0 and (AttemptStartedAtMs < 1e999 and AttemptStartedAtMs % 1 == 0) and (type(p1.hasAmbiguousFailure) == "boolean" and (if p1.campaignOption == "feedback" then p1.durationDays ~= nil and p1.displayAmountRobux ~= nil else p1.campaignOption == "plays" and (p1.durationDays ~= nil and p1.displayAmountRobux ~= nil))))
		end
	end
	return IsUserIdMatch
end

local function sameAttempt(Record, p1): boolean
	return Record.userId == p1.userId and (Record.universeId == p1.universeId and (Record.idempotencyKey == p1.idempotencyKey and (Record.campaignOption == p1.campaignOption and (Record.fundingType == p1.fundingType and (Record.durationDays == p1.durationDays and (Record.displayAmountRobux == p1.displayAmountRobux and Record.createdAtMs == p1.createdAtMs)))))) and Record.attemptStartedAtMs == p1.attemptStartedAtMs
end

local function readNamespace(p1)
	local AdCampaignCards = p1.adCampaignCards
	
	if AdCampaignCards == nil then
		return { sessions = {} }, nil
	elseif type(AdCampaignCards) == "table" and type(AdCampaignCards.sessions) == "table" then
		return AdCampaignCards, nil
	else
		return nil, "malformed_storage"
	end
end

return function(p1)
	-- upvalues: sameAttempt (copy), readNamespace (copy), isRecord (copy), FFlagBuildAgentAdCampaignCardModule (copy), isDurableAttempt (copy)
	local function _()
		-- upvalues: p1 (copy)
		local Success, Result, Result3 = pcall(p1.readData)
		
		if Success then
			Success = Result == true
		end
		return Success, Result3
	end
	
	local _ = function(p2): boolean
		-- upvalues: p1 (copy)
		local Success, Result = pcall(p1.writeData, p2)
		
		return Success and Result == true
	end
	
	local v1 = nil
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	
	local function beforeUnsentPreflight(SessionId, ToolCallId, p2)
		-- upvalues: Tbl2 (copy), sameAttempt (upval)
		local Entry = if Tbl2[SessionId] == nil then nil else Tbl2[SessionId][ToolCallId]
		
		if Entry ~= nil and p2 ~= nil then
			local Staged = Entry.staged
			
			if sameAttempt(Staged, p2) and p2.phase == Staged.phase and p2.updatedAtMs == Staged.updatedAtMs and p2.hasAmbiguousFailure == Staged.hasAmbiguousFailure and p2.lastErrorCode == Staged.lastErrorCode then
				return Entry.previous, true
			end
		end
		return p2, false
	end
	
	local _ = function()
		-- upvalues: v1 (ref), p1 (copy), readNamespace (upval)
		if v1 ~= nil then
			return v1, nil
		end
		local Success, Result, Result3 = pcall(p1.readData)
		
		if Success then
			Success = Result == true
		end
		if Success then
			local Namespace, Namespace2 = readNamespace(Result3)
			v1 = Namespace
			
			return Namespace, Namespace2
		else
			return nil, "storage_unavailable"
		end
	end
	
	local function get(SessionId, ToolCallId)
		-- upvalues: Tbl (copy), Tbl1 (copy), v1 (ref), p1 (copy), readNamespace (upval), isRecord (upval), FFlagBuildAgentAdCampaignCardModule (upval), isDurableAttempt (upval), beforeUnsentPreflight (copy)
		local Entry = if Tbl[SessionId] == nil then nil else Tbl[SessionId][ToolCallId]
		
		if Entry == nil then
			local Entry1 = if Tbl1[SessionId] == nil then nil else Tbl1[SessionId][ToolCallId]
			
			if Entry1 == nil then
				local v2 = nil
				local v3 = nil
				if v1 == nil then
					local Success, Result, Result3 = pcall(p1.readData)
					
					if Success then
						Success = Result == true
					end
					if Success then
						local Namespace, Namespace2 = readNamespace(Result3)
						v1 = Namespace
						v3 = Namespace
						v2 = Namespace2
					else
						v3 = nil
						v2 = "storage_unavailable"
					end
				else
					v3 = v1
					v2 = nil
				end
				if v3 == nil or (type(SessionId) ~= "string" or SessionId == "") or (type(ToolCallId) ~= "string" or ToolCallId == "") then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = v2 or "invalid_identity"
					}
				end
				local Session = v3.sessions[SessionId]
				
				if Session ~= nil and type(Session) ~= "table" then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = "malformed_session"
					}
				end
				local Tbl2 = if Session == nil then nil else Session[ToolCallId]
				
				if Tbl2 ~= nil and (not isRecord(Tbl2, SessionId, ToolCallId) or FFlagBuildAgentAdCampaignCardModule and Tbl2.userId ~= nil and not isDurableAttempt(Tbl2)) then
					return {
						isAvailable = false,
						isPersisted = false,
						errorCode = "malformed_record"
					}
				end
				local v4 = false
				
				if FFlagBuildAgentAdCampaignCardModule then
					Tbl2, v65 = beforeUnsentPreflight(SessionId, ToolCallId, Tbl2)
				end
				local config = { isAvailable = true, isPersisted = not v4 }
				local Record = nil
				
				if Tbl2 == nil then
					Record = nil
				else
					local Copy = table.clone(Tbl2)
					
					if Copy.phase == "active" then
						Copy.phase = "created"
					end
					Record = Copy
				end
				config.record = Record
				
				return config
			else
				local config = { isAvailable = true, isPersisted = false }
				local Copy = table.clone(Entry1)
				
				if Copy.phase == "active" then
					Copy.phase = "created"
				end
				config.record = Copy
				
				return config
			end
		else
			local config = { isAvailable = true, isPersisted = false }
			local Copy = table.clone(Entry)
			
			if Copy.phase == "active" then
				Copy.phase = "created"
			end
			config.record = Copy
			
			return config
		end
	end
	
	local function retryWrites(): boolean
		-- upvalues: Tbl (copy), p1 (copy), readNamespace (upval), isRecord (upval), FFlagBuildAgentAdCampaignCardModule (upval), sameAttempt (upval), Tbl1 (copy), v1 (ref)
		if next(Tbl) == nil then
			return true
		end
		local Success, Result, Result3 = pcall(p1.readData)
		
		if Success then
			Success = Result == true
		end
		if not Success then
			return false
		end
		local Namespace = readNamespace(Result3)
		
		if Namespace == nil then
			return false
		end
		local Copy = table.clone(Namespace)
		Copy.sessions = table.clone(Namespace.sessions)
		local t = {}
		local Flag = false
		
		for i, value in Tbl do
			local Session = Copy.sessions[i]
			
			if Session == nil or type(Session) == "table" then
				local T = if Session == nil then {} else table.clone(Session)
				for i2, value1 in value do
					local Entry = T[i2]
					
					if Entry ~= nil and not isRecord(Entry, i, i2) then
						t[i] = t[i] or {}
						t[i][i2] = true
						continue
					end
					if Entry == nil or Entry.universeId == value1.universeId and value1.updatedAtMs >= Entry.updatedAtMs and (Entry.campaignId == nil or Entry.campaignId == value1.campaignId) and (not FFlagBuildAgentAdCampaignCardModule or value1.userId == nil or sameAttempt(Entry, value1)) then
						T[i2] = table.clone(value1)
						Flag = true
					else
						t[i] = t[i] or {}
						t[i][i2] = true
					end
				end
				Copy.sessions[i] = T
			else
				t[i] = {}
				
				for i1 in value do
					t[i][i1] = true
				end
			end
		end
		for i3, value2 in t do
			for i4 in value2 do
				local Entry = Tbl1[i3] or {}
				Entry[i4] = table.clone(Tbl[i3][i4])
				Tbl1[i3] = Entry
				Tbl[i3][i4] = nil
			end
			if next(Tbl[i3]) == nil then
				Tbl[i3] = nil
			end
		end
		if not Flag then
			return next(t) == nil
		end
		local Copy1 = table.clone(Result3)
		Copy1.adCampaignCards = Copy
		local Success1, Result1 = pcall(p1.writeData, Copy1)
		
		if Success1 then
			Success1 = Result1 == true
		end
		if Success1 then
			v1 = Copy
			table.clear(Tbl)
			
			return next(t) == nil
		else
			return false
		end
	end
	
	local function retain(Tbl1)
		-- upvalues: isRecord (upval), Tbl (copy), retryWrites (copy)
		if isRecord(Tbl1, Tbl1.sessionId, Tbl1.toolCallId) then
			local Entry = Tbl[Tbl1.sessionId] or {}
			Entry[Tbl1.toolCallId] = table.clone(Tbl1)
			Tbl[Tbl1.sessionId] = Entry
			
			return retryWrites(), true
		else
			return false, false
		end
	end
	
	return {
		get = get,
		list = function(p2)
			-- upvalues: v1 (ref), p1 (copy), readNamespace (upval), Tbl1 (copy), Tbl (copy), isRecord (upval), FFlagBuildAgentAdCampaignCardModule (upval), isDurableAttempt (upval), beforeUnsentPreflight (copy)
			if type(p2) ~= "string" or p2 == "" then
				return {
					isAvailable = false,
					errorCode = "invalid_identity",
					records = {}
				}
			end
			local v2 = nil
			local ErrorCode = nil
			if v1 == nil then
				local Success, Result, Result3 = pcall(p1.readData)
				
				if Success then
					Success = Result == true
				end
				if Success then
					local Namespace, Namespace2 = readNamespace(Result3)
					v1 = Namespace
					v2 = Namespace
					ErrorCode = Namespace2
				else
					v2 = nil
					ErrorCode = "storage_unavailable"
				end
			else
				v2 = v1
				ErrorCode = nil
			end
			local Session = if v2 == nil then nil else v2.sessions[p2]
			
			if Session ~= nil and type(Session) ~= "table" then
				ErrorCode = "malformed_session"
				Session = nil
			end
			local T = if Session == nil then {} else table.clone(Session)
			local Entry = Tbl1[p2] or {}
			for i, value in Entry do
				T[i] = value
			end
			local Entry1 = Tbl[p2] or {}
			for i1, value1 in Entry1 do
				T[i1] = value1
			end
			local List = {}
			
			for i2, value2 in T do
				if isRecord(value2, p2, i2) and (not FFlagBuildAgentAdCampaignCardModule or value2.userId == nil or isDurableAttempt(value2)) then
					local BeforeUnsentPreflightResult = if FFlagBuildAgentAdCampaignCardModule then beforeUnsentPreflight(p2, i2, value2) else value2
					
					if BeforeUnsentPreflightResult ~= nil then
						local Copy = table.clone(BeforeUnsentPreflightResult)
						
						if Copy.phase == "active" then
							Copy.phase = "created"
						end
						table.insert(List, Copy)
					end
				end
			end
			table.sort(List, function(A, B): boolean
				return if A.createdAtMs == B.createdAtMs then A.toolCallId < B.toolCallId else A.createdAtMs < B.createdAtMs
			end)
			
			return {
				isAvailable = ErrorCode == nil,
				records = List,
				errorCode = ErrorCode
			}
		end,
		confirm = function(p3)
			-- upvalues: isRecord (upval), get (copy), FFlagBuildAgentAdCampaignCardModule (upval), isDurableAttempt (upval), retain (copy), sameAttempt (upval), retryWrites (copy)
			if not isRecord(p3, p3.sessionId, p3.toolCallId) or p3.phase ~= "created" then
				return false, false
			end
			local GetResult = get(p3.sessionId, p3.toolCallId)
			local Record = GetResult.record
			
			if FFlagBuildAgentAdCampaignCardModule and p3.userId ~= nil then
				if not isDurableAttempt(p3) then
					return false, false
				elseif Record == nil and not GetResult.isAvailable then
					return retain(p3)
				elseif Record == nil or not sameAttempt(Record, p3) then
					return false, false
				end
			end
			if Record == nil or Record.campaignId == nil then
				return retain(p3)
			elseif Record.campaignId == p3.campaignId then
				return retryWrites() and get(p3.sessionId, p3.toolCallId).isPersisted, false
			else
				return false, false
			end
		end,
		saveAttempt = function(Tbl, IdempotencyKey): boolean
			-- upvalues: isRecord (upval), isDurableAttempt (upval), get (copy), p1 (copy), readNamespace (upval), beforeUnsentPreflight (copy), sameAttempt (upval), v1 (ref), Tbl2 (copy)
			if not isRecord(Tbl, Tbl.sessionId, Tbl.toolCallId) or not isDurableAttempt(Tbl) or Tbl.campaignId ~= nil then
				return false
			end
			local GetResult = get(Tbl.sessionId, Tbl.toolCallId)
			
			if GetResult.record ~= nil and GetResult.record.campaignId ~= nil then
				return false
			end
			local Success, Result, Result3 = pcall(p1.readData)
			
			if Success then
				Success = Result == true
			end
			local Namespace = if Success then readNamespace(Result3) else nil
			
			if Namespace == nil then
				return false
			end
			local Session = Namespace.sessions[Tbl.sessionId]
			
			if Session ~= nil and type(Session) ~= "table" then
				return false
			end
			local SessionEntry = if Session == nil then nil else Session[Tbl.toolCallId]
			
			if SessionEntry ~= nil and (not isRecord(SessionEntry, Tbl.sessionId, Tbl.toolCallId) or not isDurableAttempt(SessionEntry) or SessionEntry.campaignId ~= nil or SessionEntry.userId ~= Tbl.userId or SessionEntry.universeId ~= Tbl.universeId) then
				return false
			end
			local BeforeUnsentPreflightResult = beforeUnsentPreflight(Tbl.sessionId, Tbl.toolCallId, SessionEntry)
			
			if BeforeUnsentPreflightResult ~= nil then
				if BeforeUnsentPreflightResult.idempotencyKey == Tbl.idempotencyKey then
					local IsCreating: boolean = Tbl.idempotencyKey == Tbl.toolCallId and (IdempotencyKey == BeforeUnsentPreflightResult.idempotencyKey and (not BeforeUnsentPreflightResult.hasAmbiguousFailure and (if BeforeUnsentPreflightResult.phase == "failed" then Tbl.phase == "creating" else BeforeUnsentPreflightResult.phase == "payment_required" and Tbl.phase == "creating")))
					
					if not sameAttempt(BeforeUnsentPreflightResult, Tbl) and not IsCreating or BeforeUnsentPreflightResult.hasAmbiguousFailure and not Tbl.hasAmbiguousFailure then
						return false
					end
				elseif BeforeUnsentPreflightResult.idempotencyKey ~= IdempotencyKey or BeforeUnsentPreflightResult.hasAmbiguousFailure or BeforeUnsentPreflightResult.phase ~= "failed" and BeforeUnsentPreflightResult.phase ~= "payment_required" then
					return false
				end
			elseif IdempotencyKey ~= nil and IdempotencyKey ~= Tbl.idempotencyKey then
				return false
			end
			local Copy = table.clone(Namespace)
			Copy.sessions = table.clone(Namespace.sessions)
			local Copy1 = table.clone(Session or {})
			Copy1[Tbl.toolCallId] = table.clone(Tbl)
			Copy.sessions[Tbl.sessionId] = Copy1
			local Copy2 = table.clone(Result3)
			Copy2.adCampaignCards = Copy
			v1 = nil
			local Success1, Result1 = pcall(p1.writeData, Copy2)
			
			if Success1 then
				Success1 = Result1 == true
			end
			if Success1 then
				if Tbl2[Tbl.sessionId] ~= nil then
					Tbl2[Tbl.sessionId][Tbl.toolCallId] = nil
				end
				v1 = Copy
				
				return true
			else
				if Tbl.phase == "creating" then
					local Entry = Tbl2[Tbl.sessionId] or {}
					Entry[Tbl.toolCallId] = {
						staged = table.clone(Tbl),
						previous = if BeforeUnsentPreflightResult == nil then nil else table.clone(BeforeUnsentPreflightResult)
					}
					Tbl2[Tbl.sessionId] = Entry
				end
				return false
			end
		end,
		hasPendingWrites = function(): boolean
			-- upvalues: Tbl (copy)
			return next(Tbl) ~= nil
		end,
		retryWrites = retryWrites,
		prune = function(p3)
			-- upvalues: Tbl (copy), p1 (copy), readNamespace (upval), isRecord (upval), v1 (ref)
			if next(Tbl) == nil then
				local NowMs: number = p3.nowMs
				
				if type(NowMs) == "number" and (NowMs >= 0 and (NowMs < 1e999 and NowMs % 1 == 0)) then
					local RetentionMs: number = p3.retentionMs
					
					if type(RetentionMs) == "number" and (RetentionMs >= 0 and (RetentionMs < 1e999 and RetentionMs % 1 == 0)) then
						local MaxRecords: number = p3.maxRecords
						
						if type(MaxRecords) == "number" and (MaxRecords >= 0 and (MaxRecords < 1e999 and MaxRecords % 1 == 0)) then
							local Success, Result, Result3 = pcall(p1.readData)
							
							if Success then
								Success = Result == true
							end
							if not Success then
								return false, false
							end
							local Namespace = readNamespace(Result3)
							
							if Namespace == nil then
								return false, false
							end
							local List = {}
							local Count = 0
							
							for i, session in Namespace.sessions do
								if type(session) == "table" then
									local LoadedToolCallIdsBySessionEntry = p3.loadedToolCallIdsBySession[i]
									
									for i1, value in session do
										if isRecord(value, i, i1) and value.universeId == p3.universeId then
											Count += 1
											local Inverted: boolean = value.campaignId ~= nil and (p3.settledCampaignIds[value.campaignId] == true and (LoadedToolCallIdsBySessionEntry ~= nil and not LoadedToolCallIdsBySessionEntry[i1]))
											
											if p3.retentionMs < p3.nowMs - value.updatedAtMs and Inverted then
												table.insert(List, value)
											end
										end
									end
								end
							end
							if Count <= p3.maxRecords or #List == 0 then
								return true, false
							end
							table.sort(List, function(A, B): boolean
								return if A.updatedAtMs == B.updatedAtMs then if A.sessionId == B.sessionId then A.toolCallId < B.toolCallId else A.sessionId < B.sessionId else A.updatedAtMs < B.updatedAtMs
							end)
							local Copy = table.clone(Namespace)
							Copy.sessions = table.clone(Namespace.sessions)
							
							for i2 = 1, math.min(Count - p3.maxRecords, #List) do
								local Entry = List[i2]
								local Copy1 = table.clone(Copy.sessions[Entry.sessionId])
								Copy1[Entry.toolCallId] = nil
								Copy.sessions[Entry.sessionId] = Copy1
							end
							local Copy2 = table.clone(Result3)
							Copy2.adCampaignCards = Copy
							local Success1, Result1 = pcall(p1.writeData, Copy2)
							
							if Success1 then
								Success1 = Result1 == true
							end
							if Success1 then
								v1 = Copy
								
								return true, true
							else
								return false, false
							end
						end
					end
				end
			end
			return false, false
		end,
		reset = function()
			-- upvalues: v1 (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy)
			v1 = nil
			table.clear(Tbl)
			table.clear(Tbl1)
			table.clear(Tbl2)
		end
	}
end