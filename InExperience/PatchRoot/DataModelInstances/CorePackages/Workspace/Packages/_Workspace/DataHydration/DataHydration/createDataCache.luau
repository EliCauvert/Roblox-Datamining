local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local luaAppDataCacheBatch = game:DefineFastFlag("LuaAppDataCacheBatch", false)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDataHydrationOptimisticMutationLayer = sharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local luaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local luaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p1, p2, p3)
	-- upvalues: luaAppDefaultDataTtlSec (ref), luaAppDefaultFailedDataTtlSec (ref), signalsModule (ref), dataStatus (ref), luaAppDataCacheBatch (ref), signalsExperimentalModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), cryoModule (ref), fFlagMigrateGameInfoToStore (ref), getLocalPlayerUserId (ref), playersService (ref)
	p1 = p1 or luaAppDefaultDataTtlSec
	p2 = p2 or luaAppDefaultFailedDataTtlSec
	local var1 = if p3 then p3.sanitizeItem else nil
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local function getOrCreateSignals(value)
		-- upvalues: t (write), t_1 (write), signalsModule (copy), t_2 (write), dataStatus (copy)
		if t[value] == nil or t_1[value] == nil then
			t[value] = {}
			local var2 = t[value]
			local var3, var4 = signalsModule.createSignal(nil)
			var2.data = var3
			t_1[value] = var4
			local var5 = t[value]
			local var6 = t_2
			local var7, var8 = signalsModule.createSignal(dataStatus.NotReady)
			var5.status = var7
			var6[value] = var8
		end
		return t[value], t_1[value]
	end
	
	local function getItem(p4, p5)
		-- upvalues: getOrCreateSignals (ref), t_3 (write), dataStatus (copy)
		local var2 = getOrCreateSignals(p4)
		local var3 = true
		
		if t_3[p4] and os.clock() < t_3[p4] then
			local var4 = var2.data(false)
			
			if var4 ~= nil or var2.status(false) == dataStatus.Failed then
				if p5 then
					return var2, p5(var4)
				end
				var3 = false
			end
		end
		return var2, var3
	end
	
	local function getItems(p4, p5)
		-- upvalues: getItem (ref)
		local t = {}
		local t_1 = {}
		
		if not p4 then
			return t, t_1
		end
		for i, v in p4 do
			local var2, var3 = getItem(v, p5)
			t[v] = var2
			t_1[v] = var3
		end
		return t, t_1
	end
	
	local function replaceItems(p6)
		-- upvalues: p1 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var4 = os.clock() + p1
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p6 (ref), getOrCreateSignals (copy), var1 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var4 (ref)
				for i, v in p6 do
					local _, var5 = getOrCreateSignals(i)
					var5(if var1 then var1(v) else v)
					t_2[i](dataStatus.Ready)
					t_3[i] = var4
				end
			end)
			
			return
		end
		for i, v in p6 do
			local _, var5 = getOrCreateSignals(i)
			var5(if var1 then var1(v) else v)
			t_2[i](dataStatus.Ready)
			t_3[i] = var4
		end
	end
	
	local function updateItems(p7, p8)
		-- upvalues: p1 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), signalsExperimentalModule (copy)
		local var6 = os.clock() + p1
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p7 (ref), getOrCreateSignals (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var1 (copy), t_2 (copy), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), p8 (ref), t_3 (copy), var6 (ref)
				for i, v in p7 do
					local var7, var8 = getOrCreateSignals(i)
					local var9 = var7.data(false)
					local var10 = if var9 and type(var9) == "table" and type(v) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var9, v) else cryoModule.Dictionary.union(var9, v) else v
					var8(if var1 then var1(var10) else var10)
					t_2[i](dataStatus.Ready)
					
					if not fFlagMigrateGameInfoToStore then
						t_3[i] = var6
					elseif p8 ~= false then
						t_3[i] = var6
					end
				end
			end)
			
			return
		end
		for i, v in p7 do
			local var7, var8 = getOrCreateSignals(i)
			local var9 = var7.data(false)
			local var10 = if var9 and type(var9) == "table" and type(v) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var9, v) else cryoModule.Dictionary.union(var9, v) else v
			var8(if var1 then var1(var10) else var10)
			t_2[i](dataStatus.Ready)
			
			if not fFlagMigrateGameInfoToStore then
				t_3[i] = var6
			elseif p8 ~= false then
				t_3[i] = var6
			end
		end
	end
	
	local function updateItem(p9, p10, p11)
		-- upvalues: getOrCreateSignals (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), p1 (ref)
		local var11, var12 = getOrCreateSignals(p9)
		local var13 = var11.data(false)
		local var14 = if var13 and type(var13) == "table" and type(p10) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var13, p10) else cryoModule.Dictionary.union(var13, p10) else p10
		var12(if var1 then var1(var14) else var14)
		t_2[p9](dataStatus.Ready)
		
		if fFlagMigrateGameInfoToStore then
			if p11 == false then
				return
			else
				t_3[p9] = os.clock() + p1
				
				return
			end
		else
			t_3[p9] = os.clock() + p1
		end
	end
	
	local function replaceItem(p9, p10)
		-- upvalues: getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), p1 (ref)
		local _, var11 = getOrCreateSignals(p9)
		var11(if var1 then var1(p10) else p10)
		t_2[p9](dataStatus.Ready)
		t_3[p9] = os.clock() + p1
	end
	
	local function resetFailedItem(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		local var11 = t[value]
		
		if var11 and var11.status(false) == dataStatus.Failed then
			t_2[value](dataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		for i, v in value do
			local var11 = t[v]
			
			if var11 and var11.status(false) == dataStatus.Failed then
				t_2[v](dataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p9)
		-- upvalues: p2 (ref), luaAppDataCacheBatch (copy), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var12 = os.clock() + p2
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p9 (ref), t_2 (copy), dataStatus (copy), t_3 (copy), var12 (ref)
				for i, v in p9 do
					if t_2[v] then
						t_2[v](dataStatus.Failed)
					end
					t_3[v] = var12
				end
			end)
			
			return
		end
		for i, v in p9 do
			if t_2[v] then
				t_2[v](dataStatus.Failed)
			end
			t_3[v] = var12
		end
	end
	
	local function clear()
		-- upvalues: t_3 (write), t (write), t_1 (write), t_2 (write)
		t_3 = {}
		t = {}
		t_1 = {}
		t_2 = {}
	end
	
	local var13 = getLocalPlayerUserId()
	local var14 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var13 (write), clear (ref)
		local var15 = getLocalPlayerUserId()
		
		if var15 ~= var13 then
			var13 = var15
			clear()
		end
	end)
	
	return {
		getItem = getItem,
		getItems = getItems,
		updateItems = updateItems,
		updateItem = updateItem,
		replaceItems = replaceItems,
		replaceItem = replaceItem,
		markItemsAsFailed = markItemsAsFailed,
		resetFailedItem = resetFailedItem,
		resetFailedItems = resetFailedItems,
		clear = clear,
		dispose = function()
			-- upvalues: var14 (write), clear (ref)
			if var14 then
				var14:Disconnect()
				var14 = nil
			end
			clear()
		end
	}
end