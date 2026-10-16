local Parent = script.Parent.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalMapFunction = require(Parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(script.Parent.LeaderboardStoreTypes)

return function(p1, _) --[[ Line: 40 | Named "createTeamStore" ]]
	-- upvalues: CreateSignalMapFunction (copy), SignalsModule (copy)
	local Connections = {}
	local Signal2 = nil
	local Signal2_1 = nil
	local Signal2_2 = nil
	local SignalMap = CreateSignalMapFunction()
	local SignalMap1 = CreateSignalMapFunction()
	local t = {}
	local Signal1 = nil
	local Signal = nil
	local Neutral = nil
	
	if p1 == "Neutral" then
		local _
		Neutral, _ = SignalsModule.createSignal("Neutral")
		local _
		Signal, _ = SignalsModule.createSignal(BrickColor.White().Color)
		local _
		Signal1, _ = SignalsModule.createSignal(1000)
	else
		Neutral, Signal2 = SignalsModule.createSignal(p1.Name)
		Signal, Signal2_1 = SignalsModule.createSignal(p1.TeamColor.Color)
		Signal1, Signal2_2 = SignalsModule.createSignal(p1.ChildOrder)
		Connections.teamPropChanged = p1.Changed:Connect(function(p2) --[[ Line: 72 ]]
			-- upvalues: Signal2 (ref), p1 (copy), Signal2_1 (ref), Signal2_2 (ref)
			if p2 == "Name" then
				Signal2(p1.Name)
				
				return
			end
			if p2 == "TeamColor" then
				Signal2_1(p1.TeamColor.Color)
				
				return
			end
			if p2 == "ChildOrder" then
				Signal2_2(p1.ChildOrder)
			end
		end)
	end
	local function _() --[[ Line: 108 | Named "updateAllStats" ]]
		-- upvalues: t (ref), SignalsModule (upval), SignalMap1 (copy), SignalMap (copy)
		for i, value in pairs(t) do
			SignalMap.setData(i, SignalsModule.createComputed(function(p2) --[[ Line: 85 ]]
				-- upvalues: SignalMap1 (upval), value (copy), i (copy)
				local Total = nil
				local AllData = SignalMap1.getAllData(p2)
				
				if typeof(AllData) == "table" then
					for i, _ in pairs(AllData) do
						local Amount = value(i, i, p2)
						
						if Amount and type(Amount) == "number" then
							if Total then
								Total += Amount
							else
								Total = Amount
							end
						end
					end
				end
				return Total
			end), false)
			t[i] = value
		end
	end
	
	return {
		getName = Neutral,
		getColor = Signal,
		getOrder = Signal1,
		getStats = SignalMap,
		getPlayers = SignalMap1,
		updateStat = function(Key, p2) --[[ Line: 84 ]]
			-- upvalues: SignalsModule (upval), SignalMap1 (copy), SignalMap (copy), t (ref)
			SignalMap.setData(Key, SignalsModule.createComputed(function(p3) --[[ Line: 85 ]]
				-- upvalues: SignalMap1 (upval), p2 (copy), Key (copy)
				local Total = nil
				local AllData = SignalMap1.getAllData(p3)
				
				if typeof(AllData) == "table" then
					for i, _ in pairs(AllData) do
						local Amount = p2(i, Key, p3)
						
						if Amount and type(Amount) == "number" then
							if Total then
								Total += Amount
							else
								Total = Amount
							end
						end
					end
				end
				return Total
			end), false)
			t[Key] = p2
		end,
		removeStat = function(Key) --[[ Line: 115 ]]
			-- upvalues: SignalMap (copy), t (ref)
			SignalMap.removeData(Key, false)
			t[Key] = nil
		end,
		addPlayer = function(Player) --[[ Line: 122 ]]
			-- upvalues: SignalMap1 (copy), t (ref), SignalsModule (upval), SignalMap (copy)
			SignalMap1.setData(Player, Player.UserId, false)
			
			for i, value in pairs(t) do
				SignalMap.setData(i, SignalsModule.createComputed(function(p3) --[[ Line: 85 ]]
					-- upvalues: SignalMap1 (upval), value (copy), i (copy)
					local Total = nil
					local AllData = SignalMap1.getAllData(p3)
					
					if typeof(AllData) == "table" then
						for i, _ in pairs(AllData) do
							local Amount = value(i, i, p3)
							
							if Amount and type(Amount) == "number" then
								if Total then
									Total += Amount
								else
									Total = Amount
								end
							end
						end
					end
					return Total
				end), false)
				t[i] = value
			end
		end,
		removePlayer = function(p3) --[[ Line: 128 ]]
			-- upvalues: SignalMap1 (copy), t (ref), SignalsModule (upval), SignalMap (copy)
			SignalMap1.removeData(p3, false)
			
			for i, value in pairs(t) do
				SignalMap.setData(i, SignalsModule.createComputed(function(p4) --[[ Line: 85 ]]
					-- upvalues: SignalMap1 (upval), value (copy), i (copy)
					local Total = nil
					local AllData = SignalMap1.getAllData(p4)
					
					if typeof(AllData) == "table" then
						for i, _ in pairs(AllData) do
							local Amount = value(i, i, p4)
							
							if Amount and type(Amount) == "number" then
								if Total then
									Total += Amount
								else
									Total = Amount
								end
							end
						end
					end
					return Total
				end), false)
				t[i] = value
			end
		end,
		destroy = function() --[[ Line: 134 ]]
			-- upvalues: Connections (ref), t (ref)
			for _, connection in pairs(Connections) do
				if connection.Disconnect then
					connection:Disconnect()
				end
			end
			Connections = {}
			t = {}
		end
	}
end