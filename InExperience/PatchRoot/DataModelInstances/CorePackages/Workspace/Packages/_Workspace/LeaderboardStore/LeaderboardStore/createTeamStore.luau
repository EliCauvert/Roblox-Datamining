local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local createSignalMap = require(parent.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(script.Parent.LeaderboardStoreTypes)

return function(p1, _)
	-- upvalues: createSignalMap (ref), signalsModule (ref)
	local var1, var2, var3
	local t = {}
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var4 = createSignalMap()
	local var5 = createSignalMap()
	local t_1 = {}
	
	if p1 == "Neutral" then
		local neutral, neutral_1 = signalsModule.createSignal("Neutral")
		var1 = neutral
		local _ = neutral_1
		local var6, var7 = signalsModule.createSignal(BrickColor.White().Color)
		var2 = var6
		local _ = var7
		local var8, var9 = signalsModule.createSignal(1000)
		var3 = var8
		local _ = var9
	else
		local var10, var11 = signalsModule.createSignal(p1.Name)
		var1 = var10
		local var12 = var11
		local var13, var14 = signalsModule.createSignal(p1.TeamColor.Color)
		var2 = var13
		local var15 = var14
		local var16, var17 = signalsModule.createSignal(p1.ChildOrder)
		var3 = var16
		local var18 = var17
		t.teamPropChanged = p1.Changed:Connect(function(p2)
			-- upvalues: var12 (write), p1 (ref), var15 (write), var18 (write)
			if p2 == "Name" then
				var12(p1.Name)
				
				return
			elseif p2 == "TeamColor" then
				var15(p1.TeamColor.Color)
				
				return
			elseif p2 == "ChildOrder" then
				var18(p1.ChildOrder)
			end
		end)
	end
	local function _()
		-- upvalues: t_1 (write), signalsModule (copy), var5 (ref), var4 (ref)
		for i, v in pairs(t_1) do
			var4.setData(i, signalsModule.createComputed(function(p2)
				-- upvalues: var5 (copy), v (ref), i (ref)
				local var19 = nil
				local allData = var5.getAllData(p2)
				
				if typeof(allData) == "table" then
					for i_1, v_1 in pairs(allData) do
						local var20 = v(i_1, i, p2)
						
						if var20 and type(var20) == "number" then
							var19 = if var19 then var19 + var20 else var20
						end
					end
				end
				return var19
			end), false)
			t_1[i] = v
		end
	end
	
	return {
		getName = var1,
		getColor = var2,
		getOrder = var3,
		getStats = var4,
		getPlayers = var5,
		updateStat = function(p2, p3)
			-- upvalues: signalsModule (copy), var5 (ref), var4 (ref), t_1 (write)
			var4.setData(p2, signalsModule.createComputed(function(p4)
				-- upvalues: var5 (copy), p3 (ref), p2 (ref)
				local var19 = nil
				
				if typeof(var5.getAllData(p4)) == "table" then
					for i_1, v_1 in pairs(allData) do
						local var20 = p3(i_1, p2, p4)
						
						if var20 and type(var20) == "number" then
							var19 = if var19 then var19 + var20 else var20
						end
					end
				end
				return var19
			end), false)
			t_1[p2] = p3
		end,
		removeStat = function(p4)
			-- upvalues: var4 (ref), t_1 (write)
			var4.removeData(p4, false)
			t_1[p4] = nil
		end,
		addPlayer = function(p4)
			-- upvalues: var5 (ref), t_1 (write), signalsModule (copy), var4 (ref)
			var5.setData(p4, p4.UserId, false)
			
			for i, v in pairs(t_1) do
				var4.setData(i, signalsModule.createComputed(function(p5)
					-- upvalues: var5 (copy), v (ref), i (ref)
					local var19 = nil
					
					if typeof(var5.getAllData(p5)) == "table" then
						for i_1, v_1 in pairs(allData) do
							local var20 = v(i_1, i, p5)
							
							if var20 and type(var20) == "number" then
								var19 = if var19 then var19 + var20 else var20
							end
						end
					end
					return var19
				end), false)
				t_1[i] = v
			end
		end,
		removePlayer = function(p5)
			-- upvalues: var5 (ref), t_1 (write), signalsModule (copy), var4 (ref)
			var5.removeData(p5, false)
			
			for i, v in pairs(t_1) do
				var4.setData(i, signalsModule.createComputed(function(p6)
					-- upvalues: var5 (copy), v (ref), i (ref)
					local var19 = nil
					
					if typeof(var5.getAllData(p6)) == "table" then
						for i_1, v_1 in pairs(allData) do
							local var20 = v(i_1, i, p6)
							
							if var20 and type(var20) == "number" then
								var19 = if var19 then var19 + var20 else var20
							end
						end
					end
					return var19
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