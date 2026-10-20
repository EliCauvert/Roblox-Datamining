local Parent = script:FindFirstAncestor("BuildExperience").Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), PromiseModule (copy)
	local Count = 0
	local t = {}
	local Config = nil
	local v1 = nil
	
	local function _(Key)
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { getIsPending = Signal, setIsPending = Signal2 }
			t[Key] = Entry
		end
		return Entry
	end
	
	local _ = function(p1): boolean
		-- upvalues: Config (ref)
		return Config ~= nil and (Config.target.placeId == p1.placeId and (p1.universeId == nil or Config.target.universeId == p1.universeId))
	end
	
	local _ = function(p1, p2)
		-- upvalues: v1 (ref), t (copy), SignalsModule (upval)
		if v1 ~= p1 then return end
		v1 = nil
		local PlaceId = p1.target.placeId
		local Entry = t[PlaceId]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { getIsPending = Signal, setIsPending = Signal2 }
			t[PlaceId] = Entry
		end
		Entry.setIsPending(false)
		
		if p2 == nil then
			p1.resolve()
			
			return
		else
			p1.reject(p2)
		end
	end
	
	local function beginRequest(p1)
		-- upvalues: v1 (ref), PromiseModule (upval), Config (ref), Count (ref), t (copy), SignalsModule (upval)
		if v1 ~= nil then
			return nil, PromiseModule.reject("agent_rollback_busy")
		elseif Config ~= nil and (Config.target.placeId == p1.placeId and (p1.universeId == nil or Config.target.universeId == p1.universeId)) then
			Count += 1
			local Id: number = Count
			local Config1 = Config
			
			return Id, (PromiseModule.new(function(Resolve, Reject)
				-- upvalues: v1 (upval), Id (copy), p1 (copy), Config1 (copy), t (upval), SignalsModule (upval)
				v1 = {
					id = Id,
					target = {
						universeId = if p1.universeId == nil then Config1.target.universeId else p1.universeId,
						placeId = p1.placeId
					},
					resolve = Resolve,
					reject = Reject
				}
				local PlaceId = p1.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(true)
			end))
		else
			return nil, PromiseModule.reject("agent_rollback_no_turn_starter")
		end
	end
	
	local function setRequestData(Id, p1)
		-- upvalues: v1 (ref), Config (ref), t (copy), SignalsModule (upval)
		local v2 = v1
		
		if v2 == nil or v2.id ~= Id then
			return false
		end
		local Target = v2.target
		
		if Config ~= nil and (Config.target.placeId == Target.placeId and (Target.universeId == nil or Config.target.universeId == Target.universeId)) then
			local Config1 = Config
			
			if Config1 == nil then
				if v1 == v2 then
					v1 = nil
					local PlaceId = v2.target.placeId
					local Entry = t[PlaceId]
					
					if Entry == nil then
						local Signal1, Signal2_1 = SignalsModule.createSignal(false)
						Entry = { getIsPending = Signal1, setIsPending = Signal2_1 }
						t[PlaceId] = Entry
					end
					Entry.setIsPending(false)
					v2.reject("agent_rollback_start_failed")
				end
				return false
			else
				local Success, Result = pcall(Config1.startTurn, {
					id = Id,
					universeId = v2.target.universeId,
					placeId = v2.target.placeId,
					versionNumber = p1.versionNumber,
					noteTitle = p1.noteTitle,
					noteDescription = p1.noteDescription
				}, function()
					-- upvalues: v2 (copy), v1 (upval), t (upval), SignalsModule (upval)
					if v1 ~= v2 then return end
					v1 = nil
					local PlaceId = v2.target.placeId
					local Entry = t[PlaceId]
					
					if Entry == nil then
						local Signal, Signal2 = SignalsModule.createSignal(false)
						Entry = { getIsPending = Signal, setIsPending = Signal2 }
						t[PlaceId] = Entry
					end
					Entry.setIsPending(false)
					v2.resolve()
				end, function()
					-- upvalues: v2 (copy), v1 (upval), t (upval), SignalsModule (upval)
					if v1 ~= v2 then return end
					v1 = nil
					local PlaceId = v2.target.placeId
					local Entry = t[PlaceId]
					
					if Entry == nil then
						local Signal, Signal2 = SignalsModule.createSignal(false)
						Entry = { getIsPending = Signal, setIsPending = Signal2 }
						t[PlaceId] = Entry
					end
					Entry.setIsPending(false)
					v2.reject("agent_rollback_start_failed")
				end)
				
				if (not Success or not Result) and v1 == v2 then
					v1 = nil
					local PlaceId = v2.target.placeId
					local Entry = t[PlaceId]
					
					if Entry == nil then
						local Signal3, Signal2_2 = SignalsModule.createSignal(false)
						Entry = { getIsPending = Signal3, setIsPending = Signal2_2 }
						t[PlaceId] = Entry
					end
					Entry.setIsPending(false)
					v2.reject("agent_rollback_start_failed")
				end
				return Success and Result
			end
		else
			if v1 == v2 then
				v1 = nil
				local PlaceId = v2.target.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_start_failed")
			end
			return false
		end
	end
	
	return {
		getIsPendingForPlaceId = function(Key)
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(false)
				Entry = { getIsPending = Signal, setIsPending = Signal2 }
				t[Key] = Entry
			end
			return Entry.getIsPending
		end,
		registerTurnStarter = function(Target, Registration, StartTurn): boolean
			-- upvalues: Config (ref), v1 (ref), t (copy), SignalsModule (upval)
			if Config ~= nil and Config.registration ~= Registration then
				return false
			end
			local v2 = v1
			
			if v2 ~= nil and (v2.target.placeId ~= Target.placeId or v2.target.universeId ~= Target.universeId) and v1 == v2 then
				v1 = nil
				local PlaceId = v2.target.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_start_failed")
			end
			Config = {
				target = Target,
				registration = Registration,
				startTurn = StartTurn
			}
			
			return true
		end,
		unregisterTurnStarter = function(Registration)
			-- upvalues: Config (ref), v1 (ref), t (copy), SignalsModule (upval)
			if Config == nil or Config.registration ~= Registration then return end
			Config = nil
			local v2 = v1
			
			if v2 ~= nil then
				if v1 ~= v2 then return end
				v1 = nil
				local PlaceId = v2.target.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_start_failed")
			end
		end,
		beginRequest = beginRequest,
		setRequestData = setRequestData,
		failRequest = function(Id): boolean
			-- upvalues: v1 (ref), t (copy), SignalsModule (upval)
			local v2 = v1
			
			if v2 == nil or v2.id ~= Id then
				return false
			end
			if v1 == v2 then
				v1 = nil
				local PlaceId = v2.target.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_start_failed")
			end
			return true
		end,
		cancelRequestForPlaceId = function(PlaceId): boolean
			-- upvalues: v1 (ref), t (copy), SignalsModule (upval)
			local v2 = v1
			
			if v2 == nil or v2.target.placeId ~= PlaceId then
				return false
			end
			if v1 == v2 then
				v1 = nil
				local PlaceId1 = v2.target.placeId
				local Entry = t[PlaceId1]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId1] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_cancelled")
			end
			return true
		end,
		request = function(p1, p2)
			-- upvalues: beginRequest (copy), setRequestData (copy)
			local BeginRequestResult, BeginRequestResult2 = beginRequest(p1)
			
			if BeginRequestResult ~= nil then
				setRequestData(BeginRequestResult, p2)
			end
			return BeginRequestResult2
		end,
		reset = function()
			-- upvalues: v1 (ref), t (copy), SignalsModule (upval), Config (ref)
			local v2 = v1
			
			if v2 ~= nil and v1 == v2 then
				v1 = nil
				local PlaceId = v2.target.placeId
				local Entry = t[PlaceId]
				
				if Entry == nil then
					local Signal, Signal2 = SignalsModule.createSignal(false)
					Entry = { getIsPending = Signal, setIsPending = Signal2 }
					t[PlaceId] = Entry
				end
				Entry.setIsPending(false)
				v2.reject("agent_rollback_start_failed")
			end
			Config = nil
		end
	}
end