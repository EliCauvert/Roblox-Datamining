local MockTeamsService = {}
MockTeamsService.__index = MockTeamsService

function MockTeamsService:new()
	-- upvalues: MockTeamsService (copy)
	local config = {
		mockTeams = {},
		mockChildAddedEvent = Instance.new("BindableEvent"),
		mockChildRemovedEvent = Instance.new("BindableEvent")
	}
	config.ChildAdded = config.mockChildAddedEvent.Event
	config.ChildRemoved = config.mockChildRemovedEvent.Event
	setmetatable(config, { __index = MockTeamsService })
	
	return config
end

function MockTeamsService:GetTeams()
	return self.mockTeams
end

function MockTeamsService.mockAddPlayerToTeam(p1, p2, Name)
	local Team = nil
	
	if typeof(Name) == "string" then
		for _, mockTeam in ipairs(p1.mockTeams) do
			if mockTeam.Name == Name then
				Team = mockTeam
				break
			end
		end
	else
		Team = Name
	end
	if Team then
		p2.Team = Team
	end
end

function MockTeamsService:mockRemovePlayerFromTeam(p3)
	p3.Team = nil
end

function MockTeamsService:mockCreateTeam(p3)
	table.insert(self.mockTeams, p3)
	self.mockChildAddedEvent:Fire(p3)
end

function MockTeamsService:mockRemoveTeam(p3)
	for i, mockTeam in ipairs(self.mockTeams) do
		if mockTeam == p3 then
			table.remove(self.mockTeams, i)
			self.mockChildRemovedEvent:Fire(p3)
			break
		end
	end
end

function MockTeamsService:mockCleanup()
	self.mockTeams = {}
end

return MockTeamsService