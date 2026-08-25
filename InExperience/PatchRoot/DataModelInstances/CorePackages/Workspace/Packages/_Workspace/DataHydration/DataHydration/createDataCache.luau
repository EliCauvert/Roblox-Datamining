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
local fFlagLuaAppDataHydrationSanitizeItem = sharedFlagsModule.FFlagLuaAppDataHydrationSanitizeItem
local fFlagLuaAppDataHydrationOptimisticMutationLayer = sharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local luaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local luaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p0, p1, p2)
	-- upvalues: luaAppDefaultDataTtlSec (ref), luaAppDefaultFailedDataTtlSec (ref), fFlagLuaAppDataHydrationSanitizeItem (ref), signalsModule (ref), dataStatus (ref), luaAppDataCacheBatch (ref), signalsExperimentalModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), cryoModule (ref), fFlagMigrateGameInfoToStore (ref), getLocalPlayerUserId (ref), playersService (ref)
	p0 = p0 or luaAppDefaultDataTtlSec
	p1 = p1 or luaAppDefaultFailedDataTtlSec
	local var11 = if fFlagLuaAppDataHydrationSanitizeItem and p2 then p2.sanitizeItem else nil
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local function getOrCreateSignals(value)
		-- upvalues: t (write), t_1 (write), signalsModule (copy), t_2 (write), dataStatus (copy)
		if t[value] == nil or t_1[value] == nil then
			t[value] = {}
			local var29 = t[value]
			local var30, var31 = signalsModule.createSignal(nil)
			var29.data = var30
			t_1[value] = var31
			local var32 = t[value]
			local var33 = t_2
			local var34, var35 = signalsModule.createSignal(dataStatus.NotReady)
			var32.status = var34
			var33[value] = var35
		end
		return t[value], t_1[value]
	end
	
	local function getItem(p3, p4)
		-- upvalues: getOrCreateSignals (ref), t_3 (write), dataStatus (copy)
		local var36 = getOrCreateSignals(p3)
		local var37 = true
		
		if t_3[p3] and os.clock() < t_3[p3] then
			local var38 = var36.data(false)
			
			if var38 ~= nil or var36.status(false) == dataStatus.Failed then
				if p4 then
					return var36, p4(var38)
				end
				var37 = false
			end
		end
		return var36, var37
	end
	
	local function getItems(p5, p6)
		-- upvalues: getItem (ref)
		local t = {}
		local t_1 = {}
		
		if not p5 then
			return t, t_1
		end
		for i, v in p5 do
			local var41, var42 = getItem(v, p6)
			t[v] = var41
			t_1[v] = var42
		end
		return t, t_1
	end
	
	local function replaceItems(p7)
		-- upvalues: p0 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), var11 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var43 = os.clock() + p0
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p7 (ref), getOrCreateSignals (copy), var11 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var43 (ref)
				for i, v in p7 do
					local _, var45 = getOrCreateSignals(i)
					var45(if var11 then var11(v) else v)
					t_2[i](dataStatus.Ready)
					t_3[i] = var43
				end
			end)
			
			return
		end
		for i, v in p7 do
			local _, var44 = getOrCreateSignals(i)
			var44(if var11 then var11(v) else v)
			t_2[i](dataStatus.Ready)
			t_3[i] = var43
		end
	end
	
	local function updateItems(p8, p9)
		-- upvalues: p0 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var11 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), signalsExperimentalModule (copy)
		local var46 = os.clock() + p0
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p8 (ref), getOrCreateSignals (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var11 (copy), t_2 (copy), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), p9 (ref), t_3 (copy), var46 (ref)
				for i, v in p8 do
					local var51, var52 = getOrCreateSignals(i)
					local var53 = var51.data(false)
					local var54 = if var53 and type(var53) == "table" and type(v) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var53, v) else cryoModule.Dictionary.union(var53, v) else v
					var52(if var11 then var11(var54) else var54)
					t_2[i](dataStatus.Ready)
					
					if not fFlagMigrateGameInfoToStore then
						t_3[i] = var46
					elseif p9 ~= false then
						t_3[i] = var46
					end
				end
			end)
			
			return
		end
		for i, v in p8 do
			local var47, var48 = getOrCreateSignals(i)
			local var49 = var47.data(false)
			local var50 = if var49 and type(var49) == "table" and type(v) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var49, v) else cryoModule.Dictionary.union(var49, v) else v
			var48(if var11 then var11(var50) else var50)
			t_2[i](dataStatus.Ready)
			
			if not fFlagMigrateGameInfoToStore then
				t_3[i] = var46
			elseif p9 ~= false then
				t_3[i] = var46
			end
		end
	end
	
	local function updateItem(p10, p11, p12)
		-- upvalues: getOrCreateSignals (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), cryoModule (copy), var11 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), p0 (ref)
		local var55, var56 = getOrCreateSignals(p10)
		local var57 = var55.data(false)
		local var58 = if var57 and type(var57) == "table" and type(p11) == "table" then if fFlagLuaAppDataHydrationOptimisticMutationLayer then cryoModule.Dictionary.join(var57, p11) else cryoModule.Dictionary.union(var57, p11) else p11
		var56(if var11 then var11(var58) else var58)
		t_2[p10](dataStatus.Ready)
		
		if fFlagMigrateGameInfoToStore then
			if p12 == false then
				return
			else
				t_3[p10] = os.clock() + p0
				
				return
			end
		else
			t_3[p10] = os.clock() + p0
		end
	end
	
	local function replaceItem(p13, p14)
		-- upvalues: getOrCreateSignals (ref), var11 (ref), t_2 (write), dataStatus (copy), t_3 (write), p0 (ref)
		local _, var59 = getOrCreateSignals(p13)
		var59(if var11 then var11(p14) else p14)
		t_2[p13](dataStatus.Ready)
		t_3[p13] = os.clock() + p0
	end
	
	local function resetFailedItem(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		local var60 = t[value]
		
		if var60 and var60.status(false) == dataStatus.Failed then
			t_2[value](dataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		for i, v in value do
			local var61 = t[v]
			
			if var61 and var61.status(false) == dataStatus.Failed then
				t_2[v](dataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p15)
		-- upvalues: p1 (ref), luaAppDataCacheBatch (copy), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var62 = os.clock() + p1
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function()
				-- upvalues: p15 (ref), t_2 (copy), dataStatus (copy), t_3 (copy), var62 (ref)
				for i, v in p15 do
					if t_2[v] then
						t_2[v](dataStatus.Failed)
					end
					t_3[v] = var62
				end
			end)
			
			return
		end
		for i, v in p15 do
			if t_2[v] then
				t_2[v](dataStatus.Failed)
			end
			t_3[v] = var62
		end
	end
	
	local function clear()
		-- upvalues: t_3 (write), t (write), t_1 (write), t_2 (write)
		t_3 = {}
		t = {}
		t_1 = {}
		t_2 = {}
	end
	
	local var27 = getLocalPlayerUserId()
	local var28 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var27 (write), clear (ref)
		local var63 = getLocalPlayerUserId()
		
		if var63 ~= var27 then
			var27 = var63
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
			-- upvalues: var28 (write), clear (ref)
			if var28 then
				var28:Disconnect()
				var28 = nil
			end
			clear()
		end
	}
end