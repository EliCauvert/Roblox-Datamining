local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Input = {}
local Count = 0
local LeaderstatsOrder = Instance.new("StringValue")
LeaderstatsOrder.Name = "LeaderstatsOrder"
LeaderstatsOrder.Parent = game:GetService("RobloxReplicatedStorage")

function updateStats() --[[ Line: 20 ]]
	-- upvalues: LeaderstatsOrder (copy), HttpService (copy), Input (copy)
	LeaderstatsOrder.Value = HttpService:JSONEncode(Input)
end

updateStats()

local function _(Key) --[[ Line: 26 | Named "addLeaderstat" ]]
	-- upvalues: Input (copy), Count (ref)
	if not Input[Key] then
		Input[Key] = Count
		Count += 1
		updateStats()
		
		return
	end
end

local function isValidStat(Object) --[[ Line: 35 ]]
	return Object:IsA("StringValue") or (Object:IsA("IntValue") or (Object:IsA("BoolValue") or (Object:IsA("NumberValue") or (Object:IsA("DoubleConstrainedValue") or Object:IsA("IntConstrainedValue")))))
end

local _ = function(Object) --[[ Line: 44 | Named "isValidContainer" ]]
	return Object:IsA("ValueBase") or (Object:IsA("Folder") or (Object:IsA("Configuration") or Object:IsA("Model")))
end

local t = {}

local _ = function(p1, p2) --[[ Line: 62 | Named "getLeaderstatConnections" ]]
	-- upvalues: t (copy)
	return if t[p1] then t[p1].leaderstats[p2] else nil
end

local function leaderstatChildAdded(p1, p2, Object) --[[ Line: 70 ]]
	-- upvalues: isValidStat (copy), t (copy), Input (copy), Count (ref)
	if not isValidStat(Object) then return end
	local Leaderstat = if t[p1] then t[p1].leaderstats[p2] else nil
	
	if not Leaderstat then return end
	assert(Leaderstat ~= nil)
	Leaderstat.leaderStatNameChanged[Object] = Object:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 80 ]]
		-- upvalues: Object (copy), Input (upval), Count (upval)
		local Name = Object.Name
		
		if not Input[Name] then
			Input[Name] = Count
			Count += 1
			updateStats()
			
			return
		end
	end)
	local Name = Object.Name
	
	if not Input[Name] then
		Input[Name] = Count
		Count += 1
		updateStats()
		
		return
	end
end

local _ = function(p1, p2, p3) --[[ Line: 87 | Named "leaderstatChildRemoved" ]]
	-- upvalues: t (copy)
	local Leaderstat = if t[p1] then t[p1].leaderstats[p2] else nil
	
	if not Leaderstat then return end
	assert(Leaderstat ~= nil)
	
	if Leaderstat.leaderStatNameChanged[p3] then
		Leaderstat.leaderStatNameChanged[p3]:Disconnect()
		Leaderstat.leaderStatNameChanged[p3] = nil
		
		return
	end
end

local function leaderstatsAdded(p1, Object) --[[ Line: 102 ]]
	-- upvalues: t (copy), leaderstatChildAdded (copy)
	if not t[p1] then return end
	t[p1].leaderstats[Object] = {
		childAdded = Object.ChildAdded:Connect(function(Child) --[[ Line: 107 ]]
			-- upvalues: leaderstatChildAdded (upval), p1 (copy), Object (copy)
			leaderstatChildAdded(p1, Object, Child)
		end),
		childRemoved = Object.ChildRemoved:Connect(function(Child) --[[ Line: 110 ]]
			-- upvalues: p1 (copy), Object (copy), t (upval)
			local Leaderstat = if t[p1] then t[p1].leaderstats[Object] else nil
			
			if not Leaderstat then return end
			assert(Leaderstat ~= nil)
			
			if Leaderstat.leaderStatNameChanged[Child] then
				Leaderstat.leaderStatNameChanged[Child]:Disconnect()
				Leaderstat.leaderStatNameChanged[Child] = nil
				
				return
			end
		end),
		leaderStatNameChanged = {}
	}
	
	for _, child in Object:GetChildren() do
		leaderstatChildAdded(p1, Object, child)
	end
end

local _ = function(Connections) --[[ Line: 125 | Named "disconnectTableOfConnections" ]]
	for _, connection in Connections do
		connection:Disconnect()
	end
end

local _ = function(p2, p3) --[[ Line: 131 | Named "leaderstatsRemoved" ]]
	-- upvalues: t (copy)
	if not t[p2] then return end
	local Leaderstat = t[p2].leaderstats[p3]
	
	if not Leaderstat then return end
	Leaderstat.childAdded:Disconnect()
	Leaderstat.childRemoved:Disconnect()
	
	for _, Connection in Leaderstat.leaderStatNameChanged do
		Connection:Disconnect()
	end
	t[p2].leaderstats[p3] = nil
end

local _ = function(p4, p5) --[[ Line: 147 | Named "playerChildNameChanged" ]]
	-- upvalues: leaderstatsAdded (copy), t (copy)
	if p5.Name == "leaderstats" then
		leaderstatsAdded(p4, p5)
		
		return
	end
	if not t[p4] then return end
	local Leaderstat = t[p4].leaderstats[p5]
	
	if not Leaderstat then return end
	Leaderstat.childAdded:Disconnect()
	Leaderstat.childRemoved:Disconnect()
	
	for _, Connection in Leaderstat.leaderStatNameChanged do
		Connection:Disconnect()
	end
	t[p4].leaderstats[p5] = nil
end

local function playerChildAdded(Key, Object) --[[ Line: 155 ]]
	-- upvalues: t (copy), leaderstatsAdded (copy)
	if not Object:IsA("ValueBase") and (not Object:IsA("Folder") and (not Object:IsA("Configuration") and not Object:IsA("Model"))) then return end
	if not t[Key] then return end
	t[Key].namedChanged[Object] = Object:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 163 ]]
		-- upvalues: Key (copy), Object (copy), leaderstatsAdded (upval), t (upval)
		if Object.Name == "leaderstats" then
			leaderstatsAdded(Key, Object)
			
			return
		end
		if not t[Key] then return end
		local Leaderstat = t[Key].leaderstats[Object]
		
		if not Leaderstat then return end
		Leaderstat.childAdded:Disconnect()
		Leaderstat.childRemoved:Disconnect()
		
		for _, Connection in Leaderstat.leaderStatNameChanged do
			Connection:Disconnect()
		end
		t[Key].leaderstats[Object] = nil
	end)
	
	if Object.Name == "leaderstats" then
		leaderstatsAdded(Key, Object)
		
		return
	end
	if not t[Key] then return end
	local Leaderstat = t[Key].leaderstats[Object]
	
	if not Leaderstat then return end
	Leaderstat.childAdded:Disconnect()
	Leaderstat.childRemoved:Disconnect()
	
	for _, Connection in Leaderstat.leaderStatNameChanged do
		Connection:Disconnect()
	end
	t[Key].leaderstats[Object] = nil
end

local _ = function(p6, p7) --[[ Line: 171 | Named "playerChildRemoved" ]]
	-- upvalues: t (copy)
	if not t[p6] then return end
	if t[p6].namedChanged[p7] then
		t[p6].namedChanged[p7]:Disconnect()
		t[p6].namedChanged[p7] = nil
	end
	if p7.Name == "leaderstats" then
		if not t[p6] then return end
		local Leaderstat = t[p6].leaderstats[p7]
		
		if not Leaderstat then return end
		Leaderstat.childAdded:Disconnect()
		Leaderstat.childRemoved:Disconnect()
		
		for _, Connection in Leaderstat.leaderStatNameChanged do
			Connection:Disconnect()
		end
		t[p6].leaderstats[p7] = nil
	end
end

local function playerAdded(Player) --[[ Line: 186 ]]
	-- upvalues: t (copy), playerChildAdded (copy)
	t[Player] = {
		childAdded = Player.ChildAdded:Connect(function(Child) --[[ Line: 190 ]]
			-- upvalues: playerChildAdded (upval), Player (copy)
			playerChildAdded(Player, Child)
		end),
		childRemoved = Player.ChildRemoved:Connect(function(Child) --[[ Line: 187 ]]
			-- upvalues: Player (copy), t (upval)
			if not t[Player] then return end
			if t[Player].namedChanged[Child] then
				t[Player].namedChanged[Child]:Disconnect()
				t[Player].namedChanged[Child] = nil
			end
			if Child.Name == "leaderstats" then
				if not t[Player] then return end
				local Leaderstat = t[Player].leaderstats[Child]
				
				if not Leaderstat then return end
				Leaderstat.childAdded:Disconnect()
				Leaderstat.childRemoved:Disconnect()
				
				for _, Connection in Leaderstat.leaderStatNameChanged do
					Connection:Disconnect()
				end
				t[Player].leaderstats[Child] = nil
			end
		end),
		namedChanged = {},
		leaderstats = {}
	}
	
	for _, child in Player:GetChildren() do
		playerChildAdded(Player, child)
	end
end

local function playerRemoving(Player) --[[ Line: 205 ]]
	-- upvalues: t (copy)
	if not t[Player] then return end
	t[Player].childAdded:Disconnect()
	t[Player].childRemoved:Disconnect()
	
	for _, Connection in t[Player].namedChanged do
		Connection:Disconnect()
	end
	for _, leaderstat in t[Player].leaderstats do
		leaderstat.childAdded:Disconnect()
		leaderstat.childRemoved:Disconnect()
		
		for _, Connection1 in leaderstat.leaderStatNameChanged do
			Connection1:Disconnect()
		end
	end
	t[Player] = nil
end

Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoving)

for _, player in Players:GetPlayers() do
	playerAdded(player)
end