local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local createSignalMap = require(parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local createRBXEventSignalModule = require(script.Parent.createRBXEventSignal)
local isValidStatModule = require(script.Parent.isValidStat)
local getScoreValueModule = require(script.Parent.getScoreValue)
local _ = require(script.Parent.LeaderboardStoreTypes)
local fFlagPlayerListFixLeaderstatsStacking = require(parent.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local _ = {
	PlayerChildAdded = "PlayerChildAdded",
	PlayerChildRemoved = "PlayerChildRemoved",
	LeaderstatNameChanged = "LeaderstatNameChanged",
	StatChanged = "StatChanged",
	StatChildAdded = "StatChildAdded",
	StatChildRemoved = "StatChildRemoved"
}

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: signalsModule (ref), createSignalMap (ref), createRBXEventSignalModule (ref), getScoreValueModule (ref), isValidStatModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref)
	local t = {}
	local t_1 = {}
	local var1, var2 = signalsModule.createSignal(0)
	local var3 = createSignalMap()
	local var4 = "Neutral"
	local t_2 = { order = var1, stats = var3 }
	
	local function _()
		-- upvalues: p1 (ref)
		return p1.Team or "Neutral"
	end
	
	local _ = function(p7, p8, p9)
		-- upvalues: t_1 (write)
		if t_1[p7] == nil then
			t_1[p7] = {}
		end
		t_1[p7][p8] = p9
	end
	
	local _ = function(p7, p8)
		-- upvalues: t_1 (write)
		local var5 = t_1[p7]
		
		if var5 == nil then return end
		local var6 = var5[p8]
		
		if var6 then
			if var6.Disconnect then
				var6:Disconnect()
			end
			var5[p8] = nil
		end
	end
	
	local function onStatAdded(p7)
		-- upvalues: createRBXEventSignalModule (copy), signalsModule (copy), getScoreValueModule (copy), p2 (ref), var3 (ref), p4 (ref), var4 (write), p5 (ref), t_1 (write)
		local var5, var6 = createRBXEventSignalModule(p7.Changed, p7.Value)
		local var7 = signalsModule.createComputed(function(p8)
			-- upvalues: getScoreValueModule (copy), var5 (ref)
			return getScoreValueModule(var5(p8))
		end)
		p2(p7)
		var3.setData(p7.Name, var7, false)
		local var8 = signalsModule.createEffect(function(p8)
			-- upvalues: var7 (ref), p4 (copy), var4 (copy), p7 (ref), p5 (copy)
			var7(p8)
			p4(var4, p7.Name)
			p5(var4, p7.Name)
		end)
		local name = p7.Name
		local t = {
			Disconnect = function()
				-- upvalues: var8 (ref), var6 (ref)
				var8()
				var6:Disconnect()
			end
		}
		
		if t_1[name] == nil then
			t_1[name] = {}
		end
		t_1[name].StatChanged = t
		local childAddedConnection = p7.ChildAdded:Connect(function()
			-- upvalues: p2 (copy), p7 (ref)
			p2(p7)
		end)
		local name_1 = p7.Name
		
		if t_1[name_1] == nil then
			t_1[name_1] = {}
		end
		t_1[name_1].StatChildAdded = childAddedConnection
		local childRemovedConnection = p7.ChildRemoved:Connect(function()
			-- upvalues: p2 (copy), p7 (ref)
			p2(p7)
		end)
		local name_2 = p7.Name
		
		if t_1[name_2] == nil then
			t_1[name_2] = {}
		end
		t_1[name_2].StatChildRemoved = childRemovedConnection
	end
	
	local function onStatRemoved(p7)
		-- upvalues: t_1 (write), var3 (ref), p3 (ref)
		local name = t_1[p7.Name]
		
		if name == nil then return end
		for i, v in pairs(name) do
			if v.Disconnect then
				v:Disconnect()
			end
		end
		t_1[p7.Name] = nil
		var3.removeData(p7.Name, false)
		p3(p7)
	end
	
	local function leaderstatsAdded(p8)
		-- upvalues: isValidStatModule (copy), onStatAdded (ref), t (write), onStatRemoved (ref)
		t.leaderstatsChildAdded = p8.ChildAdded:Connect(function(p9)
			-- upvalues: isValidStatModule (copy), onStatAdded (copy)
			if isValidStatModule(p9) then
				onStatAdded(p9)
			end
		end)
		t.leaderstatsChildRemoved = p8.ChildRemoved:Connect(function(p9)
			-- upvalues: isValidStatModule (copy), onStatRemoved (copy)
			if isValidStatModule(p9) then
				onStatRemoved(p9)
			end
		end)
		
		for i, v in ipairs(p8:GetChildren()) do
			if isValidStatModule(v) then
				onStatAdded(v)
			end
		end
	end
	
	local function onPlayerChildAdded(p9)
		-- upvalues: leaderstatsAdded (ref), t (write)
		if p9.Name ~= "leaderstats" and not (p9:IsA("ValueBase") or (p9:IsA("Folder") or p9:IsA("Model"))) then return end
		t.LeaderstatNameChanged = p9.Changed:Connect(function(p10)
			-- upvalues: p9 (ref), leaderstatsAdded (copy)
			if p10 == "Name" and p9.Name == "leaderstats" then
				leaderstatsAdded(p9)
			end
		end)
		
		if p9.Name == "leaderstats" then
			leaderstatsAdded(p9)
		end
	end
	
	local function onPlayerChildRemoved(p9)
		-- upvalues: isValidStatModule (copy), onStatRemoved (ref), fFlagPlayerListFixLeaderstatsStacking (copy), p6 (ref), p5 (ref), var4 (write)
		if p9.Name == "leaderstats" then
			for i, v in ipairs(p9:GetChildren()) do
				if isValidStatModule(v) then
					onStatRemoved(v)
				end
			end
			if fFlagPlayerListFixLeaderstatsStacking then
				p6()
			end
		end
		p5(var4)
	end
	
	var4 = p1.Team or "Neutral";
	(function()
		-- upvalues: p1 (ref), onPlayerChildAdded (ref), t (write), onPlayerChildRemoved (ref), leaderstatsAdded (ref)
		t.PlayerChildAdded = p1.ChildAdded:Connect(function(p10)
			-- upvalues: onPlayerChildAdded (copy)
			onPlayerChildAdded(p10)
		end)
		t.PlayerChildRemoved = p1.ChildRemoved:Connect(function(p10)
			-- upvalues: onPlayerChildRemoved (copy)
			onPlayerChildRemoved(p10)
		end)
		local leaderstats = p1:FindFirstChild("leaderstats")
		
		if leaderstats then
			leaderstatsAdded(leaderstats)
			
			return
		end
		for i, v in ipairs(p1:GetChildren()) do
			onPlayerChildAdded(v)
		end
	end)()
	
	return {
		getPlayer = function()
			-- upvalues: p1 (ref)
			return p1
		end,
		getPlayerEntry = function()
			-- upvalues: t_2 (ref)
			return t_2
		end,
		getStatValue = function(p10, p11)
			-- upvalues: var3 (ref)
			local data = var3.getData(p10, false)
			
			return if data then data(p11) else nil
		end,
		getTeam = function()
			-- upvalues: var4 (write)
			return var4
		end,
		setOrder = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		setTeam = function(value)
			-- upvalues: var4 (write)
			var4 = value
		end,
		destroy = function()
			-- upvalues: t_1 (write), t (write)
			for i, v in pairs(t_1) do
				for i_2, v_1 in pairs(v) do
					if v_1.Disconnect then
						v_1:Disconnect()
					end
				end
			end
			t_1 = {}
			
			for i, v_1 in pairs(t) do
				if v_1.Disconnect then
					v_1:Disconnect()
				end
			end
			t = {}
		end
	}
end