local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore

return function(p1)
	-- upvalues: LocalUserIdStore (copy), SignalsUtilsModule (copy), SignalsModule (copy)
	local function createAccount()
		-- upvalues: p1 (copy), LocalUserIdStore (upval)
		return {
			userId = if p1 == nil then LocalUserIdStore.getCurrentUserId(false) else tostring(p1),
			entries = {}
		}
	end
	
	local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal(createAccount)
	local Count = 0
	
	local function _(p2): boolean
		return (tonumber(p2.userId) or 0) > 0
	end
	
	local function createEntry(p2, Identity)
		-- upvalues: SignalsModule (upval), SessionScopedSignal (copy)
		local Signal, Signal2 = SignalsModule.createSignal({ intendedTier = "default" })
		local Computed = SignalsModule.createComputed(function(p3)
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p3)
			
			return table.freeze({
				intendedTier = SignalResult.intendedTier,
				isBusy = SignalResult.lock ~= nil
			})
		end, function(p3, p4): boolean
			return p3.intendedTier == p4.intendedTier and p3.isBusy == p4.isBusy
		end)
		local Flag = false
		local Signal1, Signal2_1 = SignalsModule.createSignal(true)
		
		local function _(p3)
			-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy)
			return SessionScopedSignal(p3) == p2 and Signal1(p3)
		end
		
		return {
			retainers = 0,
			discardRequested = false,
			identity = Identity,
			invalidate = function()
				-- upvalues: Signal2_1 (copy)
				Signal2_1(false)
			end,
			entry = {
				getSelection = function(p3)
					-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy), Computed (copy)
					local SignalResult = SessionScopedSignal(p3) == p2 and Signal1(p3)
					
					return if SignalResult then Computed(p3) else nil
				end,
				selectTier = function(IntendedTier): boolean
					-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy), Signal (copy), Signal2 (copy), Flag (ref)
					if SessionScopedSignal(nil) == p2 and Signal1(nil) and Signal(false).lock == nil and (IntendedTier == "default" or IntendedTier == "advanced") then
						Signal2({ intendedTier = IntendedTier })
						Flag = true
						
						return true
					else
						return false
					end
				end,
				restoreTier = function(IntendedTier): boolean
					-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy), Flag (ref), Signal (copy), Signal2 (copy)
					if SessionScopedSignal(nil) == p2 and Signal1(nil) and not Flag and (IntendedTier == "default" or IntendedTier == "advanced") then
						Flag = true
						local Copy = table.clone(Signal(false))
						Copy.intendedTier = IntendedTier
						Signal2(Copy)
						
						return true
					else
						return false
					end
				end,
				acquireLock = function()
					-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy), Signal (copy), Signal2 (copy)
					if SessionScopedSignal(nil) == p2 and Signal1(nil) and Signal(false).lock == nil then
						local Frozen = table.freeze({})
						local Copy = table.clone(Signal(false))
						Copy.lock = Frozen
						Signal2(Copy)
						
						return Frozen
					else
						return nil
					end
				end,
				releaseLock = function(Lock): boolean
					-- upvalues: SessionScopedSignal (upval), p2 (copy), Signal1 (copy), Signal (copy), Signal2 (copy)
					if SessionScopedSignal(nil) == p2 and Signal1(nil) and Signal(false).lock ~= nil and Signal(false).lock == Lock then
						local Copy = table.clone(Signal(false))
						Copy.lock = nil
						Signal2(Copy)
						
						return true
					else
						return false
					end
				end
			}
		}
	end
	
	local function discardDraft(Identity): boolean
		-- upvalues: SessionScopedSignal (copy)
		local SessionScopedSignalResult = SessionScopedSignal(false)
		local Entry = SessionScopedSignalResult.entries[Identity]
		
		if Entry == nil then
			return false
		end
		if Entry.retainers > 0 then
			Entry.discardRequested = true
			
			return true
		end
		if Entry.identity == Identity and Entry.createdUniverseId ~= nil then
			local CreatedUniverseId: number = Entry.createdUniverseId
			local SessionScopedSignalResult1 = SessionScopedSignal(false)
			local Entry1 = SessionScopedSignalResult1.entries[Identity]
			
			if Entry1 ~= nil and CreatedUniverseId > 0 then
				local UniverseName: string = `universe:{CreatedUniverseId}`
				
				if (Entry1.identity == Identity or Entry1.identity == UniverseName and false) and SessionScopedSignalResult1.entries[UniverseName] == nil then
					Entry1.identity = UniverseName
					SessionScopedSignalResult1.entries[UniverseName] = Entry1
				end
			end
		end
		SessionScopedSignalResult.entries[Identity] = nil
		
		if Entry.identity == Identity then
			Entry.invalidate()
		end
		return true
	end
	
	return {
		getUniverse = function(p2: number, p3)
			-- upvalues: SessionScopedSignal (copy), createEntry (copy)
			local SessionScopedSignalResult = SessionScopedSignal(p3)
			
			if (tonumber(SessionScopedSignalResult.userId) or 0) <= 0 or p2 <= 0 then
				return nil
			end
			local UniverseName: string = `universe:{p2}`
			
			if SessionScopedSignalResult.entries[UniverseName] == nil then
				SessionScopedSignalResult.entries[UniverseName] = createEntry(SessionScopedSignalResult, UniverseName)
			end
			return SessionScopedSignalResult.entries[UniverseName].entry
		end,
		getDraft = function(p2, p3)
			-- upvalues: SessionScopedSignal (copy)
			local Entry = SessionScopedSignal(p3).entries[p2]
			
			return if Entry == nil then nil else Entry.entry
		end,
		createDraft = function(): string?
			-- upvalues: SessionScopedSignal (copy), Count (ref), createEntry (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if (tonumber(SessionScopedSignalResult.userId) or 0) > 0 then
				Count += 1
				local DraftName: string = `draft:{Count}`
				SessionScopedSignalResult.entries[DraftName] = createEntry(SessionScopedSignalResult, DraftName)
				
				return DraftName
			else
				return nil
			end
		end,
		retainDraftForCreation = function(Identity)
			-- upvalues: SessionScopedSignal (copy), discardDraft (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			local Entry = SessionScopedSignalResult.entries[Identity]
			
			if Entry == nil then
				return nil
			else
				Entry.retainers += 1
				local Flag = false
				
				return function(CreatedUniverseId)
					-- upvalues: Flag (ref), Entry (copy), SessionScopedSignal (upval), SessionScopedSignalResult (copy), discardDraft (upval), Identity (copy)
					if Flag then return end
					Flag = true
					Entry.retainers -= 1
					
					if SessionScopedSignal(false) == SessionScopedSignalResult then
						if CreatedUniverseId ~= nil then
							Entry.createdUniverseId = CreatedUniverseId
						end
						if Entry.retainers == 0 and Entry.discardRequested then
							discardDraft(Identity)
						end
					end
				end
			end
		end,
		promoteDraft = function(Identity, p2: number): boolean
			-- upvalues: SessionScopedSignal (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			local Entry = SessionScopedSignalResult.entries[Identity]
			
			if Entry == nil or p2 <= 0 then
				return false
			end
			local UniverseName: string = `universe:{p2}`
			
			if Entry.identity ~= Identity then
				return Entry.identity == UniverseName
			elseif SessionScopedSignalResult.entries[UniverseName] == nil then
				Entry.identity = UniverseName
				SessionScopedSignalResult.entries[UniverseName] = Entry
				
				return true
			else
				return false
			end
		end,
		discardDraft = discardDraft,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), createAccount (copy)
			SessionScopedSignal2((createAccount()))
		end
	}
end