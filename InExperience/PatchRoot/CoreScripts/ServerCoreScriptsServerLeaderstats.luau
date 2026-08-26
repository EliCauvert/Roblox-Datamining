local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local t = {}
local var1 = 0
local leaderstatsOrder = Instance.new("StringValue")
leaderstatsOrder.Name = "LeaderstatsOrder"
leaderstatsOrder.Parent = robloxReplicatedStorageService

function updateStats()
	-- upvalues: leaderstatsOrder (ref), httpService (ref), t (ref)
	leaderstatsOrder.Value = httpService:JSONEncode(t)
end

updateStats()

local function _(p1)
	-- upvalues: t (ref), var1 (write)
	if t[p1] then
		return
	end
	t[p1] = var1
	var1 += 1
	updateStats()
end

local function isValidStat(p1)
	return p1:IsA("StringValue") or (p1:IsA("IntValue") or (p1:IsA("BoolValue") or (p1:IsA("NumberValue") or (p1:IsA("DoubleConstrainedValue") or p1:IsA("IntConstrainedValue")))))
end

local _ = function(p1)
	return p1:IsA("ValueBase") or (p1:IsA("Folder") or (p1:IsA("Configuration") or p1:IsA("Model")))
end

local t_1 = {}

local _ = function(p1, p2)
	-- upvalues: t_1 (ref)
	return if t_1[p1] then t_1[p1].leaderstats[p2] else nil
end

local function leaderstatChildAdded(p1, p2, p3)
	-- upvalues: isValidStat (ref), t_1 (ref), t (ref), var1 (write)
	if not isValidStat(p3) then return end
	local var2 = if not t_1[p1] then nil else t_1[p1].leaderstats[p2]
	
	if not var2 then return end
	assert(var2 ~= nil)
	var2.leaderStatNameChanged[p3] = p3:GetPropertyChangedSignal("Name"):Connect(function()
		-- upvalues: p3 (ref), t (copy), var1 (copy)
		local name = p3.Name
		
		if t[name] then
			return
		end
		t[name] = var1
		var1 += 1
		updateStats()
	end)
	local name = p3.Name
	
	if t[name] then
		return
	end
	t[name] = var1
	var1 += 1
	updateStats()
end

local _ = function(p1, p2, p3)
	-- upvalues: t_1 (ref)
	local var2 = if not t_1[p1] then nil else t_1[p1].leaderstats[p2]
	
	if not var2 then return end
	assert(var2 ~= nil)
	
	if var2.leaderStatNameChanged[p3] then
		var2.leaderStatNameChanged[p3]:Disconnect()
		var2.leaderStatNameChanged[p3] = nil
		
		return
	end
end

local function leaderstatsAdded(p1, p2)
	-- upvalues: t_1 (ref), leaderstatChildAdded (ref)
	if not t_1[p1] then return end
	t_1[p1].leaderstats[p2] = {
		childAdded = p2.ChildAdded:Connect(function(p3)
			-- upvalues: leaderstatChildAdded (copy), p1 (ref), p2 (ref)
			leaderstatChildAdded(p1, p2, p3)
		end),
		childRemoved = p2.ChildRemoved:Connect(function(p3)
			-- upvalues: p1 (ref), p2 (ref), t_1 (copy)
			local var2 = if not t_1[p1] then nil else t_1[p1].leaderstats[p2]
			
			if not var2 then return end
			assert(var2 ~= nil)
			
			if var2.leaderStatNameChanged[p3] then
				var2.leaderStatNameChanged[p3]:Disconnect()
				var2.leaderStatNameChanged[p3] = nil
				
				return
			end
		end),
		leaderStatNameChanged = {}
	}
	
	for i, v in p2:GetChildren() do
		leaderstatChildAdded(p1, p2, v)
	end
end

local _ = function(p3)
	for i, v in p3 do
		v:Disconnect()
	end
end

local _ = function(p4, p5)
	-- upvalues: t_1 (ref)
	if not t_1[p4] then return end
	local var2 = t_1[p4].leaderstats[p5]
	
	if not var2 then return end
	var2.childAdded:Disconnect()
	var2.childRemoved:Disconnect()
	
	for i, v in var2.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p4].leaderstats[p5] = nil
end

local _ = function(p6, p7)
	-- upvalues: leaderstatsAdded (ref), t_1 (ref)
	if p7.Name == "leaderstats" then
		leaderstatsAdded(p6, p7)
		
		return
	elseif not t_1[p6] then return end
	local var3 = t_1[p6].leaderstats[p7]
	
	if not var3 then return end
	var3.childAdded:Disconnect()
	var3.childRemoved:Disconnect()
	
	for i, v in var3.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p6].leaderstats[p7] = nil
end

local function playerChildAdded(p8, p9)
	-- upvalues: t_1 (ref), leaderstatsAdded (ref)
	if not p9:IsA("ValueBase") and (not p9:IsA("Folder") and (not p9:IsA("Configuration") and not p9:IsA("Model"))) then return end
	if not t_1[p8] then return end
	t_1[p8].namedChanged[p9] = p9:GetPropertyChangedSignal("Name"):Connect(function()
		-- upvalues: p8 (ref), p9 (ref), leaderstatsAdded (copy), t_1 (copy)
		if p9.Name == "leaderstats" then
			leaderstatsAdded(p8, p9)
			
			return
		elseif not t_1[p8] then return end
		local var4 = t_1[p8].leaderstats[p9]
		
		if not var4 then return end
		var4.childAdded:Disconnect()
		var4.childRemoved:Disconnect()
		
		for i, v in var4.leaderStatNameChanged do
			v:Disconnect()
		end
		t_1[p8].leaderstats[p9] = nil
	end)
	
	if p9.Name == "leaderstats" then
		leaderstatsAdded(p8, p9)
		
		return
	elseif not t_1[p8] then return end
	local var5 = t_1[p8].leaderstats[p9]
	
	if not var5 then return end
	var5.childAdded:Disconnect()
	var5.childRemoved:Disconnect()
	
	for i, v in var5.leaderStatNameChanged do
		v:Disconnect()
	end
	t_1[p8].leaderstats[p9] = nil
end

local _ = function(p10, p11)
	-- upvalues: t_1 (ref)
	if not t_1[p10] then return end
	if t_1[p10].namedChanged[p11] then
		t_1[p10].namedChanged[p11]:Disconnect()
		t_1[p10].namedChanged[p11] = nil
	end
	if p11.Name == "leaderstats" then
		if not t_1[p10] then return end
		local var6 = t_1[p10].leaderstats[p11]
		
		if not var6 then return end
		var6.childAdded:Disconnect()
		var6.childRemoved:Disconnect()
		
		for i, v in var6.leaderStatNameChanged do
			v:Disconnect()
		end
		t_1[p10].leaderstats[p11] = nil
	end
end

local function playerAdded(p12)
	-- upvalues: t_1 (ref), playerChildAdded (ref)
	t_1[p12] = {
		childAdded = p12.ChildAdded:Connect(function(p13)
			-- upvalues: playerChildAdded (copy), p12 (ref)
			playerChildAdded(p12, p13)
		end),
		childRemoved = p12.ChildRemoved:Connect(function(p13)
			-- upvalues: p12 (ref), t_1 (copy)
			if not t_1[p12] then return end
			if t_1[p12].namedChanged[p13] then
				t_1[p12].namedChanged[p13]:Disconnect()
				t_1[p12].namedChanged[p13] = nil
			end
			if p13.Name == "leaderstats" then
				if not t_1[p12] then return end
				local var7 = t_1[p12].leaderstats[p13]
				
				if not var7 then return end
				var7.childAdded:Disconnect()
				var7.childRemoved:Disconnect()
				
				for i, v in var7.leaderStatNameChanged do
					v:Disconnect()
				end
				t_1[p12].leaderstats[p13] = nil
			end
		end),
		namedChanged = {},
		leaderstats = {}
	}
	
	for i, v in p12:GetChildren() do
		playerChildAdded(p12, v)
	end
end

local function playerRemoving(p14)
	-- upvalues: t_1 (ref)
	if not t_1[p14] then return end
	t_1[p14].childAdded:Disconnect()
	t_1[p14].childRemoved:Disconnect()
	
	for i, v in t_1[p14].namedChanged do
		v:Disconnect()
	end
	for i_1, v_1 in t_1[p14].leaderstats do
		v_1.childAdded:Disconnect()
		v_1.childRemoved:Disconnect()
		
		for i_2, v_2 in v_1.leaderStatNameChanged do
			v_2:Disconnect()
		end
	end
	t_1[p14] = nil
end

playersService.PlayerAdded:Connect(playerAdded)
playersService.PlayerRemoving:Connect(playerRemoving)

for i, v in playersService:GetPlayers() do
	playerAdded(v)
end