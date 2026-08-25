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

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: signalsModule (ref), createSignalMap (ref), createRBXEventSignalModule (ref), getScoreValueModule (ref), isValidStatModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref)
	local t = {}
	local t_1 = {}
	local var6, var7 = signalsModule.createSignal(0)
	local var8 = createSignalMap()
	local var9 = "Neutral"
	local t_2 = { order = var6, stats = var8 }
	
	local function _()
		-- upvalues: p0 (ref)
		return p0.Team or "Neutral"
	end
	
	local _ = function(p6, p7, p8)
		-- upvalues: t_1 (write)
		if t_1[p6] == nil then
			t_1[p6] = {}
		end
		t_1[p6][p7] = p8
	end
	
	local _ = function(p9, p10)
		-- upvalues: t_1 (write)
		local var16 = t_1[p9]
		
		if var16 == nil then return end
		local var17 = var16[p10]
		
		if var17 then
			if var17.Disconnect then
				var17:Disconnect()
			end
			var16[p10] = nil
		end
	end
	
	local function onStatAdded(p11)
		-- upvalues: createRBXEventSignalModule (copy), signalsModule (copy), getScoreValueModule (copy), p1 (ref), var8 (ref), p3 (ref), var9 (write), p4 (ref), t_1 (write)
		local var18, var19 = createRBXEventSignalModule(p11.Changed, p11.Value)
		local var20 = signalsModule.createComputed(function(p12)
			-- upvalues: getScoreValueModule (copy), var18 (ref)
			return getScoreValueModule(var18(p12))
		end)
		p1(p11)
		var8.setData(p11.Name, var20, false)
		local var21 = signalsModule.createEffect(function(p13)
			-- upvalues: var20 (ref), p3 (copy), var9 (copy), p11 (ref), p4 (copy)
			var20(p13)
			p3(var9, p11.Name)
			p4(var9, p11.Name)
		end)
		local name = p11.Name
		local t = {
			Disconnect = function()
				-- upvalues: var21 (ref), var19 (ref)
				var21()
				var19:Disconnect()
			end
		}
		
		if t_1[name] == nil then
			t_1[name] = {}
		end
		t_1[name].StatChanged = t
		local childAddedConnection = p11.ChildAdded:Connect(function()
			-- upvalues: p1 (copy), p11 (ref)
			p1(p11)
		end)
		local name_1 = p11.Name
		
		if t_1[name_1] == nil then
			t_1[name_1] = {}
		end
		t_1[name_1].StatChildAdded = childAddedConnection
		local childRemovedConnection = p11.ChildRemoved:Connect(function()
			-- upvalues: p1 (copy), p11 (ref)
			p1(p11)
		end)
		local name_2 = p11.Name
		
		if t_1[name_2] == nil then
			t_1[name_2] = {}
		end
		t_1[name_2].StatChildRemoved = childRemovedConnection
	end
	
	local function onStatRemoved(p14)
		-- upvalues: t_1 (write), var8 (ref), p2 (ref)
		local name = t_1[p14.Name]
		
		if name == nil then return end
		for i, v in pairs(name) do
			if v.Disconnect then
				v:Disconnect()
			end
		end
		t_1[p14.Name] = nil
		var8.removeData(p14.Name, false)
		p2(p14)
	end
	
	local function leaderstatsAdded(p15)
		-- upvalues: isValidStatModule (copy), onStatAdded (ref), t (write), onStatRemoved (ref)
		t.leaderstatsChildAdded = p15.ChildAdded:Connect(function(p16)
			-- upvalues: isValidStatModule (copy), onStatAdded (copy)
			if isValidStatModule(p16) then
				onStatAdded(p16)
			end
		end)
		t.leaderstatsChildRemoved = p15.ChildRemoved:Connect(function(p17)
			-- upvalues: isValidStatModule (copy), onStatRemoved (copy)
			if isValidStatModule(p17) then
				onStatRemoved(p17)
			end
		end)
		
		for i, v in ipairs(p15:GetChildren()) do
			if isValidStatModule(v) then
				onStatAdded(v)
			end
		end
	end
	
	local function onPlayerChildAdded(p18)
		-- upvalues: leaderstatsAdded (ref), t (write)
		if p18.Name ~= "leaderstats" and not (p18:IsA("ValueBase") or (p18:IsA("Folder") or p18:IsA("Model"))) then return end
		t.LeaderstatNameChanged = p18.Changed:Connect(function(p19)
			-- upvalues: p18 (ref), leaderstatsAdded (copy)
			if p19 == "Name" and p18.Name == "leaderstats" then
				leaderstatsAdded(p18)
			end
		end)
		
		if p18.Name == "leaderstats" then
			leaderstatsAdded(p18)
		end
	end
	
	local function onPlayerChildRemoved(p20)
		-- upvalues: isValidStatModule (copy), onStatRemoved (ref), fFlagPlayerListFixLeaderstatsStacking (copy), p5 (ref), p4 (ref), var9 (write)
		if p20.Name == "leaderstats" then
			for i, v in ipairs(p20:GetChildren()) do
				if isValidStatModule(v) then
					onStatRemoved(v)
				end
			end
			if fFlagPlayerListFixLeaderstatsStacking then
				p5()
			end
		end
		p4(var9)
	end
	
	var9 = p0.Team or "Neutral";
	(function()
		-- upvalues: p0 (ref), onPlayerChildAdded (ref), t (write), onPlayerChildRemoved (ref), leaderstatsAdded (ref)
		t.PlayerChildAdded = p0.ChildAdded:Connect(function(p21)
			-- upvalues: onPlayerChildAdded (copy)
			onPlayerChildAdded(p21)
		end)
		t.PlayerChildRemoved = p0.ChildRemoved:Connect(function(p22)
			-- upvalues: onPlayerChildRemoved (copy)
			onPlayerChildRemoved(p22)
		end)
		local leaderstats = p0:FindFirstChild("leaderstats")
		
		if leaderstats then
			leaderstatsAdded(leaderstats)
			
			return
		end
		for i, v in ipairs(p0:GetChildren()) do
			onPlayerChildAdded(v)
		end
	end)()
	
	return {
		getPlayer = function()
			-- upvalues: p0 (ref)
			return p0
		end,
		getPlayerEntry = function()
			-- upvalues: t_2 (ref)
			return t_2
		end,
		getStatValue = function(p23, p24)
			-- upvalues: var8 (ref)
			local data = var8.getData(p23, false)
			
			return if data then data(p24) else nil
		end,
		getTeam = function()
			-- upvalues: var9 (write)
			return var9
		end,
		setOrder = function(value)
			-- upvalues: var7 (ref)
			var7(value)
		end,
		setTeam = function(value)
			-- upvalues: var9 (write)
			var9 = value
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