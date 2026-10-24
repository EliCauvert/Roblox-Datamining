local function createFakeSignal()
	local Tbl = {}
	local Count = 0
	
	return {
		Connect = function(_, p1)
			-- upvalues: Count (ref), Tbl (copy)
			Count += 1
			local Count1: number = Count
			Tbl[Count1] = p1
			
			return {
				Disconnect = function()
					-- upvalues: Tbl (upval), Count1 (copy)
					Tbl[Count1] = nil
				end
			}
		end,
		fire = function(...)
			-- upvalues: Tbl (copy)
			for _, value in table.clone(Tbl) do
				value(...)
			end
		end
	}
end

local function createFakeInstance(ClassName, Tbl)
	-- upvalues: createFakeSignal (copy)
	local List = {}
	local FakeSignal = createFakeSignal()
	local FakeSignal1 = createFakeSignal()
	local FakeSignal2 = createFakeSignal()
	local Copy = table.clone(Tbl)
	Copy.ClassName = ClassName
	Copy.Changed = FakeSignal
	Copy.ChildAdded = FakeSignal1
	Copy.ChildRemoved = FakeSignal2
	
	function Copy:GetChildren()
		-- upvalues: List (copy)
		return table.clone(List)
	end
	
	function Copy.addChild(p1)
		-- upvalues: List (copy), FakeSignal1 (copy)
		table.insert(List, p1)
		FakeSignal1.fire(p1)
	end
	
	function Copy.removeChild(Value)
		-- upvalues: List (copy), FakeSignal2 (copy)
		local FoundIndex: number? = table.find(List, Value)
		
		if FoundIndex then
			table.remove(List, FoundIndex)
			FakeSignal2.fire(Value)
		end
	end
	
	function Copy.setProperty(Key, p1)
		-- upvalues: Copy (copy), FakeSignal (copy)
		Copy[Key] = p1
		FakeSignal.fire(Key)
	end
	
	return Copy
end

return {
	createFakeCall = function(List)
		-- upvalues: createFakeInstance (copy)
		local config = {
			CallId = "call-1",
			InitiatorUserId = 1,
			Volume = 1,
			IsDeafened = false,
			ConversationId = 0,
			Phase = { Name = "Active" },
			EndReason = { Name = "None" }
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return (createFakeInstance("FriendsCallingInstance", config))
	end,
	createFakeInstance = createFakeInstance,
	createFakeParticipant = function(UserId, List)
		-- upvalues: createFakeInstance (copy)
		local config = {
			Volume = 1,
			IsLocalMuted = false,
			IsSpeaking = false,
			UserId = UserId,
			Status = { Name = "Joined" },
			LeaveReason = { Name = "None" },
			Error = { Name = "None" }
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return (createFakeInstance("FriendsCallingParticipant", config))
	end,
	enumItem = function(Name)
		return { Name = Name }
	end
}