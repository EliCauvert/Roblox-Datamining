local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local luaAppDataCacheBatch = game:DefineFastFlag("LuaAppDataCacheBatch", false)
local fFlagLuaAppDataHydrationSanitizeItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationSanitizeItem
local luaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local luaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p0, p1, p2) --[[ line: 27 | named "createDataCache" ]]
	-- upvalues: luaAppDefaultDataTtlSec (ref), luaAppDefaultFailedDataTtlSec (ref), fFlagLuaAppDataHydrationSanitizeItem (ref), signalsModule (ref), dataStatus (ref), luaAppDataCacheBatch (ref), signalsExperimentalModule (ref), cryoModule (ref), getLocalPlayerUserId (ref), playersService (ref)
	p0 = p0 or luaAppDefaultDataTtlSec
	p1 = p1 or luaAppDefaultFailedDataTtlSec
	local var10 = if fFlagLuaAppDataHydrationSanitizeItem and p2 then p2.sanitizeItem else nil
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	local function getOrCreateSignals(value) --[[ line: 39 ]]
		-- upvalues: t (write), t_1 (write), signalsModule (copy), t_2 (write), dataStatus (copy)
		if t[value] == nil or t_1[value] == nil then
			t[value] = {}
			local var28 = t[value]
			local var29, var30 = signalsModule.createSignal(nil)
			var28.data = var29
			t_1[value] = var30
			local var31 = t[value]
			local var32 = t_2
			local var33, var34 = signalsModule.createSignal(dataStatus.NotReady)
			var31.status = var33
			var32[value] = var34
		end
		return t[value], t_1[value]
	end
	
	local function getItem(p3, p4) --[[ line: 51 ]]
		-- upvalues: getOrCreateSignals (ref), t_3 (write), dataStatus (copy)
		local var35 = getOrCreateSignals(p3)
		local var36 = true
		
		if t_3[p3] and os.clock() < t_3[p3] then
			local var37 = var35.data(false)
			
			if var37 ~= nil or var35.status(false) == dataStatus.Failed then
				if p4 then
					return var35, p4(var37)
				end
				var36 = false
			end
		end
		return var35, var36
	end
	
	local function getItems(p5, p6) --[[ line: 73 ]]
		-- upvalues: getItem (ref)
		local t = {}
		local t_1 = {}
		
		if not p5 then
			return t, t_1
		end
		for i, v in p5 do
			local var40, var41 = getItem(v, p6)
			t[v] = var40
			t_1[v] = var41
		end
		return t, t_1
	end
	
	local function replaceItems(p7) --[[ line: 92 ]]
		-- upvalues: p0 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), var10 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var42 = os.clock() + p0
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function() --[[ line: 96 | named "batchUpdate" ]]
				-- upvalues: p7 (ref), getOrCreateSignals (copy), var10 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var42 (ref)
				for i, v in p7 do
					local _, var44 = getOrCreateSignals(i)
					var44(if var10 then var10(v) else v)
					t_2[i](dataStatus.Ready)
					t_3[i] = var42
				end
			end)
			
			return
		end
		for i, v in p7 do
			local _, var43 = getOrCreateSignals(i)
			var43(if var10 then var10(v) else v)
			t_2[i](dataStatus.Ready)
			t_3[i] = var42
		end
	end
	
	local function updateItems(p8) --[[ line: 115 ]]
		-- upvalues: p0 (ref), luaAppDataCacheBatch (copy), getOrCreateSignals (ref), cryoModule (copy), var10 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var45 = os.clock() + p0
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function() --[[ line: 119 | named "batchUpdate" ]]
				-- upvalues: p8 (ref), getOrCreateSignals (copy), cryoModule (copy), var10 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var45 (ref)
				for i, v in p8 do
					local var50, var51 = getOrCreateSignals(i)
					local var52 = var50.data(false)
					local var53 = if var52 and type(var52) == "table" and type(v) == "table" then cryoModule.Dictionary.union(var52, v) else v
					var51(if var10 then var10(var53) else var53)
					t_2[i](dataStatus.Ready)
					t_3[i] = var45
				end
			end)
			
			return
		end
		for i, v in p8 do
			local var46, var47 = getOrCreateSignals(i)
			local var48 = var46.data(false)
			local var49 = if var48 and type(var48) == "table" and type(v) == "table" then cryoModule.Dictionary.union(var48, v) else v
			var47(if var10 then var10(var49) else var49)
			t_2[i](dataStatus.Ready)
			t_3[i] = var45
		end
	end
	
	local function updateItem(p9, p10) --[[ line: 153 ]]
		-- upvalues: getOrCreateSignals (ref), cryoModule (copy), var10 (ref), t_2 (write), dataStatus (copy), t_3 (write), p0 (ref)
		local var54, var55 = getOrCreateSignals(p9)
		local var56 = var54.data(false)
		local var57 = if var56 and type(var56) == "table" and type(p10) == "table" then cryoModule.Dictionary.union(var56, p10) else p10
		var55(if var10 then var10(var57) else var57)
		t_2[p9](dataStatus.Ready)
		t_3[p9] = os.clock() + p0
	end
	
	local function replaceItem(p11, p12) --[[ line: 167 ]]
		-- upvalues: getOrCreateSignals (ref), var10 (ref), t_2 (write), dataStatus (copy), t_3 (write), p0 (ref)
		local _, var58 = getOrCreateSignals(p11)
		var58(if var10 then var10(p12) else p12)
		t_2[p11](dataStatus.Ready)
		t_3[p11] = os.clock() + p0
	end
	
	local function resetFailedItem(value) --[[ line: 178 ]]
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		local var59 = t[value]
		
		if var59 and var59.status(false) == dataStatus.Failed then
			t_2[value](dataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(value) --[[ line: 185 ]]
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		for i, v in value do
			local var60 = t[v]
			
			if var60 and var60.status(false) == dataStatus.Failed then
				t_2[v](dataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p13) --[[ line: 191 ]]
		-- upvalues: p1 (ref), luaAppDataCacheBatch (copy), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var61 = os.clock() + p1
		
		if luaAppDataCacheBatch then
			signalsExperimentalModule.batch(function() --[[ line: 194 | named "batchUpdate" ]]
				-- upvalues: p13 (ref), t_2 (copy), dataStatus (copy), t_3 (copy), var61 (ref)
				for i, v in p13 do
					if t_2[v] then
						t_2[v](dataStatus.Failed)
					end
					t_3[v] = var61
				end
			end)
			
			return
		end
		for i, v in p13 do
			if t_2[v] then
				t_2[v](dataStatus.Failed)
			end
			t_3[v] = var61
		end
	end
	
	local function clear() --[[ line: 213 ]]
		-- upvalues: t_3 (write), t (write), t_1 (write), t_2 (write)
		t_3 = {}
		t = {}
		t_1 = {}
		t_2 = {}
	end
	
	local var26 = getLocalPlayerUserId()
	local var27 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ line: 221 ]]
		-- upvalues: getLocalPlayerUserId (copy), var26 (write), clear (ref)
		local var62 = getLocalPlayerUserId()
		
		if var62 ~= var26 then
			var26 = var62
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
		dispose = function() --[[ line: 229 ]]
			-- upvalues: var27 (write), clear (ref)
			if var27 then
				var27:Disconnect()
				var27 = nil
			end
			clear()
		end
	}
end