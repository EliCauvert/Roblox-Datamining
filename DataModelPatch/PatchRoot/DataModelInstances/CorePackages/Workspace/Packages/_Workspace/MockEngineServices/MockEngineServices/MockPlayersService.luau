local MockPlayersService = {}
MockPlayersService.__index = MockPlayersService

function MockPlayersService:new()
	-- upvalues: MockPlayersService (copy)
	local config = {
		CharacterAutoLoads = true,
		mockPlayers = {},
		mockPlayerAdded = Instance.new("BindableEvent"),
		mockPlayerRemoving = Instance.new("BindableEvent")
	}
	config.PlayerAdded = config.mockPlayerAdded.Event
	config.PlayerRemoving = config.mockPlayerRemoving.Event
	setmetatable(config, { __index = MockPlayersService })
	
	return config
end

function MockPlayersService:GetPlayers()
	return self.mockPlayers
end

function MockPlayersService:mockAddPlayer(p1)
	table.insert(self.mockPlayers, p1)
	self.mockPlayerAdded:Fire(p1)
end

function MockPlayersService:mockRemovePlayer(Value)
	local FoundIndex: number? = table.find(self.mockPlayers, Value)
	
	if FoundIndex ~= nil then
		table.remove(self.mockPlayers, FoundIndex)
		self.mockPlayerRemoving:Fire(Value)
	end
end

function MockPlayersService:mockCleanup()
	self.mockPlayers = {}
	self._playersByName = {}
end

function MockPlayersService:createMockPlayerWithStats(DisplayName, Team, List)
	local config = {
		Name = DisplayName,
		DisplayName = DisplayName,
		UserId = math.random(1, 1234567890),
		Team = Team,
		_childAdded = Instance.new("BindableEvent"),
		_childRemoved = Instance.new("BindableEvent"),
		_changed = Instance.new("BindableEvent")
	}
	
	if List then
		local leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		
		for Name, value in pairs(List) do
			local ValueType = value.valueType
			local NewInstance = nil
			
			if ValueType then
				NewInstance = Instance.new(ValueType)
			else
				local ValueType1 = typeof(value.value)
				NewInstance = if ValueType1 == "string" then Instance.new("StringValue") elseif ValueType1 == "number" then if value.value % 1 == 0 then Instance.new("IntValue") else Instance.new("NumberValue") elseif ValueType1 == "boolean" then Instance.new("BoolValue") else Instance.new("IntValue")
			end
			NewInstance.Name = Name
			NewInstance.Value = value.value
			NewInstance.Parent = leaderstats
			
			if value.isPrimary == true then
				local IsPrimary = Instance.new("BoolValue")
				IsPrimary.Name = "IsPrimary"
				IsPrimary.Value = true
				IsPrimary.Parent = NewInstance
			end
			if value.priority then
				local Priority = Instance.new("IntValue")
				Priority.Name = "Priority"
				Priority.Value = value.priority
				Priority.Parent = NewInstance
			end
		end
		config.leaderstats = leaderstats
	end
	config.ChildAdded = config._childAdded.Event
	config.ChildRemoved = config._childRemoved.Event
	config.Changed = config._changed.Event
	
	function config.FindFirstChild(p1, p2)
		return p1[p2]
	end
	
	function config.GetChildren(Player)
		return { Player.leaderstats }
	end
	
	return config
end

return MockPlayersService