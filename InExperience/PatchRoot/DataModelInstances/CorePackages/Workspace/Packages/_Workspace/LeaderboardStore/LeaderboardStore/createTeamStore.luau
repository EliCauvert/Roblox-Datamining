local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local createSignalMap = require(parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(script.Parent.LeaderboardStoreTypes)

return function(p0, _)
	-- upvalues: createSignalMap (ref), signalsModule (ref)
	local var7, var10, var13
	local t = {}
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2 = createSignalMap()
	local var3 = createSignalMap()
	local t_1 = {}
	
	if p0 == "Neutral" then
		local neutral, neutral_1 = signalsModule.createSignal("Neutral")
		var7 = neutral
		local _ = neutral_1
		local var8, var9 = signalsModule.createSignal(BrickColor.White().Color)
		var10 = var8
		local _ = var9
		local var11, var12 = signalsModule.createSignal(1000)
		var13 = var11
		local _ = var12
	else
		local var14, var15 = signalsModule.createSignal(p0.Name)
		var7 = var14
		local var16 = var15
		local var17, var18 = signalsModule.createSignal(p0.TeamColor.Color)
		var10 = var17
		local var19 = var18
		local var20, var21 = signalsModule.createSignal(p0.ChildOrder)
		var13 = var20
		local var22 = var21
		t.teamPropChanged = p0.Changed:Connect(function(p1)
			-- upvalues: var16 (write), p0 (ref), var19 (write), var22 (write)
			if p1 == "Name" then
				var16(p0.Name)
				
				return
			elseif p1 == "TeamColor" then
				var19(p0.TeamColor.Color)
				
				return
			elseif p1 == "ChildOrder" then
				var22(p0.ChildOrder)
			end
		end)
	end
	local function _()
		-- upvalues: t_1 (write), signalsModule (copy), var3 (ref), var2 (ref)
		for i, v in pairs(t_1) do
			var2.setData(i, signalsModule.createComputed(function(p2)
				-- upvalues: var3 (copy), v (ref), i (ref)
				local var23 = nil
				local allData = var3.getAllData(p2)
				
				if typeof(allData) == "table" then
					for i_1, v_1 in pairs(allData) do
						local var25 = v(i_1, i, p2)
						
						if var25 and type(var25) == "number" then
							var23 = if var23 then var23 + var25 else var25
						end
					end
				end
				return var23
			end), false)
			t_1[i] = v
		end
	end
	
	return {
		getName = var7,
		getColor = var10,
		getOrder = var13,
		getStats = var2,
		getPlayers = var3,
		updateStat = function(p3, p4)
			-- upvalues: signalsModule (copy), var3 (ref), var2 (ref), t_1 (write)
			var2.setData(p3, signalsModule.createComputed(function(p5)
				-- upvalues: var3 (copy), p4 (ref), p3 (ref)
				local var23 = nil
				
				if typeof(var3.getAllData(p5)) == "table" then
					for i_1, v_1 in pairs(allData) do
						local var25 = p4(i_1, p3, p5)
						
						if var25 and type(var25) == "number" then
							var23 = if var23 then var23 + var25 else var25
						end
					end
				end
				return var23
			end), false)
			t_1[p3] = p4
		end,
		removeStat = function(p6)
			-- upvalues: var2 (ref), t_1 (write)
			var2.removeData(p6, false)
			t_1[p6] = nil
		end,
		addPlayer = function(p7)
			-- upvalues: var3 (ref), t_1 (write), signalsModule (copy), var2 (ref)
			var3.setData(p7, p7.UserId, false)
			
			for i, v in pairs(t_1) do
				var2.setData(i, signalsModule.createComputed(function(p8)
					-- upvalues: var3 (copy), v (ref), i (ref)
					local var23 = nil
					
					if typeof(var3.getAllData(p8)) == "table" then
						for i_1, v_1 in pairs(allData) do
							local var25 = v(i_1, i, p8)
							
							if var25 and type(var25) == "number" then
								var23 = if var23 then var23 + var25 else var25
							end
						end
					end
					return var23
				end), false)
				t_1[i] = v
			end
		end,
		removePlayer = function(p9)
			-- upvalues: var3 (ref), t_1 (write), signalsModule (copy), var2 (ref)
			var3.removeData(p9, false)
			
			for i, v in pairs(t_1) do
				var2.setData(i, signalsModule.createComputed(function(p10)
					-- upvalues: var3 (copy), v (ref), i (ref)
					local var23 = nil
					
					if typeof(var3.getAllData(p10)) == "table" then
						for i_1, v_1 in pairs(allData) do
							local var25 = v(i_1, i, p10)
							
							if var25 and type(var25) == "number" then
								var23 = if var23 then var23 + var25 else var25
							end
						end
					end
					return var23
				end), false)
				t_1[i] = v
			end
		end,
		destroy = function()
			-- upvalues: t (write), t_1 (write)
			for i, v in pairs(t) do
				if v.Disconnect then
					v:Disconnect()
				end
			end
			t = {}
			t_1 = {}
		end
	}
end