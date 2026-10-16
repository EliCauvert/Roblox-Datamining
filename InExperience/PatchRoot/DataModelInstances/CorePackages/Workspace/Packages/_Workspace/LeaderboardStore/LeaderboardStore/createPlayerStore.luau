local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalMapFunction = require(Parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local CreateRBXEventSignalModule = require(script.Parent.createRBXEventSignal)
local IsValidStatModule = require(script.Parent.isValidStat)
local GetScoreValueModule = require(script.Parent.getScoreValue)
local _ = require(script.Parent.LeaderboardStoreTypes)
local FFlagPlayerListFixLeaderstatsStacking = require(Parent.SharedFlags).FFlagPlayerListFixLeaderstatsStacking

return function(Player: Player, Callback, Callback3, Callback2, Callback1, Callback4) --[[ Line: 54 | Named "createPlayerStore" ]]
	-- upvalues: SignalsModule (copy), CreateSignalMapFunction (copy), CreateRBXEventSignalModule (copy), GetScoreValueModule (copy), IsValidStatModule (copy), FFlagPlayerListFixLeaderstatsStacking (copy)
	local Connections = {}
	local t = {}
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local SignalMap = CreateSignalMapFunction()
	local Team = "Neutral"
	local config = { order = Signal, stats = SignalMap }
	
	local function _() --[[ Line: 75 | Named "getPlayerTeam" ]]
		-- upvalues: Player (copy)
		return Player.Team or "Neutral"
	end
	
	local _ = function(Key, p1, p2) --[[ Line: 80 | Named "addStatConnection" ]]
		-- upvalues: t (ref)
		if t[Key] == nil then
			t[Key] = {}
		end
		t[Key][p1] = p2
	end
	
	local _ = function(p1, Key) --[[ Line: 87 | Named "_removeStatConnection" ]]
		-- upvalues: t (ref)
		local Entry = t[p1]
		
		if Entry == nil then return end
		local Entry1 = Entry[Key]
		
		if Entry1 then
			if Entry1.Disconnect then
				Entry1:Disconnect()
			end
			Entry[Key] = nil
		end
	end
	
	local function onStatAdded(p1) --[[ Line: 102 ]]
		-- upvalues: CreateRBXEventSignalModule (upval), SignalsModule (upval), GetScoreValueModule (upval), Callback (copy), SignalMap (copy), Callback2 (copy), Team (ref), Callback1 (copy), t (ref)
		local RBXEventSignalModule, RBXEventSignalModule2 = CreateRBXEventSignalModule(p1.Changed, p1.Value)
		local Computed = SignalsModule.createComputed(function(p2) --[[ Line: 105 ]]
			-- upvalues: GetScoreValueModule (upval), RBXEventSignalModule (copy)
			return GetScoreValueModule(RBXEventSignalModule(p2))
		end)
		Callback(p1)
		SignalMap.setData(p1.Name, Computed, false)
		local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 114 ]]
			-- upvalues: Computed (copy), Callback2 (upval), Team (upval), p1 (copy), Callback1 (upval)
			Computed(p2)
			Callback2(Team, p1.Name)
			Callback1(Team, p1.Name)
		end)
		local Name = p1.Name
		local StatChanged = {
			Disconnect = function() --[[ Line: 121 ]]
				-- upvalues: Effect (copy), RBXEventSignalModule2 (copy)
				Effect()
				RBXEventSignalModule2:Disconnect()
			end
		}
		
		if t[Name] == nil then
			t[Name] = {}
		end
		t[Name].StatChanged = StatChanged
		local ChildAddedConnection = p1.ChildAdded:Connect(function() --[[ Line: 128 ]]
			-- upvalues: Callback (upval), p1 (copy)
			Callback(p1)
		end)
		local Name1 = p1.Name
		
		if t[Name1] == nil then
			t[Name1] = {}
		end
		t[Name1].StatChildAdded = ChildAddedConnection
		local ChildRemovedConnection = p1.ChildRemoved:Connect(function() --[[ Line: 133 ]]
			-- upvalues: Callback (upval), p1 (copy)
			Callback(p1)
		end)
		local Name2 = p1.Name
		
		if t[Name2] == nil then
			t[Name2] = {}
		end
		t[Name2].StatChildRemoved = ChildRemovedConnection
	end
	
	local function onStatRemoved(p1) --[[ Line: 139 ]]
		-- upvalues: t (ref), SignalMap (copy), Callback3 (copy)
		local Entry = t[p1.Name]
		
		if Entry == nil then return end
		for _, Connection in pairs(Entry) do
			if Connection.Disconnect then
				Connection:Disconnect()
			end
		end
		t[p1.Name] = nil
		SignalMap.removeData(p1.Name, false)
		Callback3(p1)
	end
	
	local function leaderstatsAdded(Leaderstats) --[[ Line: 155 ]]
		-- upvalues: IsValidStatModule (upval), onStatAdded (copy), Connections (ref), onStatRemoved (copy)
		Connections.leaderstatsChildAdded = Leaderstats.ChildAdded:Connect(function(Child) --[[ Line: 156 ]]
			-- upvalues: IsValidStatModule (upval), onStatAdded (upval)
			if IsValidStatModule(Child) then
				onStatAdded(Child)
			end
		end)
		Connections.leaderstatsChildRemoved = Leaderstats.ChildRemoved:Connect(function(Child) --[[ Line: 163 ]]
			-- upvalues: IsValidStatModule (upval), onStatRemoved (upval)
			if IsValidStatModule(Child) then
				onStatRemoved(Child)
			end
		end)
		
		for _, child in ipairs((Leaderstats:GetChildren())) do
			if IsValidStatModule(child) then
				onStatAdded(child)
			end
		end
	end
	
	local function onPlayerChildAdded(Object) --[[ Line: 179 ]]
		-- upvalues: leaderstatsAdded (copy), Connections (ref)
		local IsValueBase = Object:IsA("ValueBase") or (Object:IsA("Folder") or Object:IsA("Model"))
		
		if Object.Name ~= "leaderstats" and not IsValueBase then return end
		Connections.LeaderstatNameChanged = Object.Changed:Connect(function(p2) --[[ Line: 186 ]]
			-- upvalues: Object (copy), leaderstatsAdded (upval)
			if p2 == "Name" and Object.Name == "leaderstats" then
				leaderstatsAdded(Object)
			end
		end)
		
		if Object.Name == "leaderstats" then
			leaderstatsAdded(Object)
		end
	end
	
	local function onPlayerChildRemoved(Object) --[[ Line: 200 ]]
		-- upvalues: IsValidStatModule (upval), onStatRemoved (copy), FFlagPlayerListFixLeaderstatsStacking (upval), Callback4 (copy), Callback1 (copy), Team (ref)
		if Object.Name == "leaderstats" then
			for _, child in ipairs((Object:GetChildren())) do
				if IsValidStatModule(child) then
					onStatRemoved(child)
				end
			end
			if FFlagPlayerListFixLeaderstatsStacking then
				Callback4()
			end
		end
		Callback1(Team)
	end
	
	Team = Player.Team or "Neutral";
	(function() --[[ Line: 217 | Named "connectPlayerEvents" ]]
		-- upvalues: Player (copy), onPlayerChildAdded (copy), Connections (ref), onPlayerChildRemoved (copy), leaderstatsAdded (copy)
		Connections.PlayerChildAdded = Player.ChildAdded:Connect(function(Child) --[[ Line: 218 ]]
			-- upvalues: onPlayerChildAdded (upval)
			onPlayerChildAdded(Child)
		end)
		Connections.PlayerChildRemoved = Player.ChildRemoved:Connect(function(Child) --[[ Line: 223 ]]
			-- upvalues: onPlayerChildRemoved (upval)
			onPlayerChildRemoved(Child)
		end)
		local Leaderstats = Player:FindFirstChild("leaderstats")
		
		if Leaderstats then
			leaderstatsAdded(Leaderstats)
			
			return
		end
		for _, child in ipairs(Player:GetChildren()) do
			onPlayerChildAdded(child)
		end
	end)()
	
	return {
		getPlayer = function() --[[ Line: 281 ]]
			-- upvalues: Player (copy)
			return Player
		end,
		getPlayerEntry = function() --[[ Line: 284 ]]
			-- upvalues: config (copy)
			return config
		end,
		getStatValue = function(p2, p3) --[[ Line: 243 ]]
			-- upvalues: SignalMap (copy)
			local Data = SignalMap.getData(p2, false)
			
			return if Data then Data(p3) else nil
		end,
		getTeam = function() --[[ Line: 288 ]]
			-- upvalues: Team (ref)
			return Team
		end,
		setOrder = function(p2) --[[ Line: 251 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p2)
		end,
		setTeam = function(Value) --[[ Line: 255 ]]
			-- upvalues: Team (ref)
			Team = Value
		end,
		destroy = function() --[[ Line: 259 ]]
			-- upvalues: t (ref), Connections (ref)
			for _, value in pairs(t) do
				for _, Connection in pairs(value) do
					if Connection.Disconnect then
						Connection:Disconnect()
					end
				end
			end
			t = {}
			
			for _, connection in pairs(Connections) do
				if connection.Disconnect then
					connection:Disconnect()
				end
			end
			Connections = {}
		end
	}
end