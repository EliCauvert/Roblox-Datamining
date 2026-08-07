local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local t = {}
local var4 = 0
local leaderstatsOrder = Instance.new("StringValue")
leaderstatsOrder.Name = "LeaderstatsOrder"
leaderstatsOrder.Parent = robloxReplicatedStorageService

function updateStats() --[[ line: 20 ]]
	-- upvalues: leaderstatsOrder (ref), httpService (ref), t (ref)
	leaderstatsOrder.Value = httpService:JSONEncode(t)
end

updateStats()

local function _(p0) --[[ line: 26 | named "addLeaderstat" ]]
	-- upvalues: t (ref), var4 (write)
	if t[p0] then
		return
	end
	t[p0] = var4
	var4 += 1
	updateStats()
end

local function isValidStat(p1) --[[ line: 35 ]]
	return p1:IsA("StringValue") or (p1:IsA("IntValue") or (p1:IsA("BoolValue") or (p1:IsA("NumberValue") or (p1:IsA("DoubleConstrainedValue") or p1:IsA("IntConstrainedValue")))))
end

local _ = function(p2) --[[ line: 44 | named "isValidContainer" ]]
	return p2:IsA("ValueBase") or (p2:IsA("Folder") or (p2:IsA("Configuration") or p2:IsA("Model")))
end

local t_1 = {}

local _ = function(p3, p4) --[[ line: 62 | named "getLeaderstatConnections" ]]
	-- upvalues: t_1 (ref)
	return if t_1[p3] then t_1[p3].leaderstats[p4] else nil
end

local function leaderstatChildAdded(p5, p6, p7) --[[ line: 70 ]]
	-- upvalues: isValidStat (ref), t_1 (ref), t (ref), var4 (write)
	if not isValidStat(p7) then return end
	local var13 = if not t_1[p5] then nil else t_1[p5].leaderstats[p6]
	
	if not var13 then return end
	assert(var13 ~= nil)
	var13.leaderStatNameChanged[p7] = p7:GetPropertyChangedSignal("Name"):Connect(function() --[[ line: 80 ]]
		-- upvalues: p7 (ref), t (copy), var4 (copy)
		local name = p7.Name
		
		if t[name] then
			return
		end
		t[name] = var4
		var4 += 1
		updateStats()
	end)
	local name = p7.Name
	
	if t[name] then
		return
	end
	t[name] = var4
	var4 += 1
	updateStats()
end

local _ = function(p8, p9, p10) --[[ line: 87 | named "leaderstatChildRemoved" ]]
	-- upvalues: t_1 (ref)
	local var14 = if not t_1[p8] then nil else t_1[p8].leaderstats[p9]
	
	if not var14 then return end
	assert(var14 ~= nil)
	
	if var14.leaderStatNameChanged[p10] then
		var14.leaderStatNameChanged[p10]:Disconnect()
		var14.leaderStatNameChanged[p10] = nil
		
		return
	end
end

local function leaderstatsAdded(p11, p12) --[[ line: 102 ]]
	-- upvalues: t_1 (ref), leaderstatChildAdded (ref)
	if not t_1[p11] then return end
	t_1[p11].leaderstats[p12] = {
		childAdded = p12.ChildAdded:Connect(function(p13) --[[ line: 107 ]]
			-- upvalues: leaderstatChildAdded (copy), p11 (ref), p12 (ref)
			leaderstatChildAdded(p11, p12, p13)
		end),
		childRemoved = p12.ChildRemoved:Connect(function(p14) --[[ line: 110 ]]
			-- upvalues: p11 (ref), p12 (ref), t_1 (copy)
			local var15 = if not t_1[p11] then nil else t_1[p11].leaderstats[p12]
			
			if not var15 then return end
			assert(var15 ~= nil)
			
			if var15.leaderStatNameChanged[p14] then
				var15.leaderStatNameChanged[p14]:Disconnect()
				var15.leaderStatNameChanged[p14] = nil
				
				return
			end
		end),
		leaderStatNameChanged = {}
	}
	
	for i, v in p12:GetChildren() do
		leaderstatChildAdded(p11, p12, v)
	end
end

local _ = function(p15) --[[ line: 125 | named "disconnectTableOfConnections" ]]
	for i, v in p15 do
		v:Disconnect()
	end
end

local _ = function(p16, p17) --[[ line: 131 | named "leaderstatsRemoved" ]]
	-- upvalues: t_1 (ref)
	if not t_1[p16] then return end
	local var16 = t_1[p16].leaderstats[p17]
	
	if not var16 then return end
	var16.childAdded:Disconnect()
	var16.childRemoved:Disconnect()
	
	for i, v in var16.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p16].leaderstats[p17] = nil
end

local _ = function(p18, p19) --[[ line: 147 | named "playerChildNameChanged" ]]
	-- upvalues: leaderstatsAdded (ref), t_1 (ref)
	if p19.Name == "leaderstats" then
		leaderstatsAdded(p18, p19)
		
		return
	elseif not t_1[p18] then return end
	local var17 = t_1[p18].leaderstats[p19]
	
	if not var17 then return end
	var17.childAdded:Disconnect()
	var17.childRemoved:Disconnect()
	
	for i, v in var17.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p18].leaderstats[p19] = nil
end

local function playerChildAdded(p20, p21) --[[ line: 155 ]]
	-- upvalues: t_1 (ref), leaderstatsAdded (ref)
	if not p21:IsA("ValueBase") and (not p21:IsA("Folder") and (not p21:IsA("Configuration") and not p21:IsA("Model"))) then return end
	if not t_1[p20] then return end
	t_1[p20].namedChanged[p21] = p21:GetPropertyChangedSignal("Name"):Connect(function() --[[ line: 163 ]]
		-- upvalues: p20 (ref), p21 (ref), leaderstatsAdded (copy), t_1 (copy)
		if p21.Name == "leaderstats" then
			leaderstatsAdded(p20, p21)
			
			return
		elseif not t_1[p20] then return end
		local var19 = t_1[p20].leaderstats[p21]
		
		if not var19 then return end
		var19.childAdded:Disconnect()
		var19.childRemoved:Disconnect()
		
		for i, v in var19.leaderStatNameChanged do
			v:Disconnect()
		end
		t_1[p20].leaderstats[p21] = nil
	end)
	
	if p21.Name == "leaderstats" then
		leaderstatsAdded(p20, p21)
		
		return
	elseif not t_1[p20] then return end
	local var18 = t_1[p20].leaderstats[p21]
	
	if not var18 then return end
	var18.childAdded:Disconnect()
	var18.childRemoved:Disconnect()
	
	for i, v in var18.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p20].leaderstats[p21] = nil
end

local _ = function(p22, p23) --[[ line: 171 | named "playerChildRemoved" ]]
	-- upvalues: t_1 (ref)
	if not t_1[p22] then return end
	if t_1[p22].namedChanged[p23] then
		t_1[p22].namedChanged[p23]:Disconnect()
		t_1[p22].namedChanged[p23] = nil
	end
	if p23.Name == "leaderstats" then
		if not t_1[p22] then return end
		local var20 = t_1[p22].leaderstats[p23]
		
		if not var20 then return end
		var20.childAdded:Disconnect()
		var20.childRemoved:Disconnect()
		
		for i, v in var20.leaderStatNameChanged do
			v:Disconnect()
		end
		t_1[p22].leaderstats[p23] = nil
	end
end

local function playerAdded(p24) --[[ line: 186 ]]
	-- upvalues: t_1 (ref), playerChildAdded (ref)
	t_1[p24] = {
		childAdded = p24.ChildAdded:Connect(function(p25) --[[ line: 190 ]]
			-- upvalues: playerChildAdded (copy), p24 (ref)
			playerChildAdded(p24, p25)
		end),
		childRemoved = p24.ChildRemoved:Connect(function(p26) --[[ line: 187 ]]
			-- upvalues: p24 (ref), t_1 (copy)
			if not t_1[p24] then return end
			if t_1[p24].namedChanged[p26] then
				t_1[p24].namedChanged[p26]:Disconnect()
				t_1[p24].namedChanged[p26] = nil
			end
			if p26.Name == "leaderstats" then
				if not t_1[p24] then return end
				local var21 = t_1[p24].leaderstats[p26]
				
				if not var21 then return end
				var21.childAdded:Disconnect()
				var21.childRemoved:Disconnect()
				
				for i, v in var21.leaderStatNameChanged do
					v:Disconnect()
				end
				t_1[p24].leaderstats[p26] = nil
			end
		end),
		namedChanged = {},
		leaderstats = {}
	}
	
	for i, v in p24:GetChildren() do
		playerChildAdded(p24, v)
	end
end

local function playerRemoving(p27) --[[ line: 205 ]]
	-- upvalues: t_1 (ref)
	if not t_1[p27] then return end
	t_1[p27].childAdded:Disconnect()
	t_1[p27].childRemoved:Disconnect()
	
	for i, v in t_1[p27].namedChanged do
		v:Disconnect()
	end
	for i_1, v_1 in t_1[p27].leaderstats do
		v_1.childAdded:Disconnect()
		v_1.childRemoved:Disconnect()
		
		for i_2, v_2 in v_1.leaderStatNameChanged do
			v_2:Disconnect()
		end
	end
	t_1[p27] = nil
end

playersService.PlayerAdded:Connect(playerAdded)
playersService.PlayerRemoving:Connect(playerRemoving)

for i, v in playersService:GetPlayers() do
	playerAdded(v)
end