local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local getLocalPlayerUserId = dataHydrationUtilsModule.getLocalPlayerUserId
local observeLocalPlayerUserId = dataHydrationUtilsModule.observeLocalPlayerUserId
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local fFlagDataHydrationAccountReset = sharedFlagsModule.FFlagDataHydrationAccountReset
local fFlagDataHydrationStaleTime = sharedFlagsModule.FFlagDataHydrationStaleTime
local fFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(dataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local luaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local luaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p1, p2, p3)
	-- upvalues: luaAppDefaultDataTtlSec (ref), luaAppDefaultFailedDataTtlSec (ref), fFlagDataHydrationPreserveIncompleteCatalogResultsModule (ref), signalsModule (ref), dataStatus (ref), fFlagDataHydrationStaleTime (ref), signalsExperimentalModule (ref), cryoModule (ref), fFlagMigrateGameInfoToStore (ref), fFlagDataHydrationAccountReset (ref), getLocalPlayerUserId (ref), observeLocalPlayerUserId (ref), playersService (ref)
	p1 = p1 or luaAppDefaultDataTtlSec
	p2 = p2 or luaAppDefaultFailedDataTtlSec
	local var1 = if p3 then p3.sanitizeItem else nil
	local var2 = if fFlagDataHydrationPreserveIncompleteCatalogResultsModule and p3 then p3.ttlSecondsForItem else nil
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function _(p4, p5)
		-- upvalues: var2 (ref), p1 (ref)
		return if var2 then os.clock() + (var2(p4) or p1) else p5
	end
	
	local function getOrCreateSignals(value)
		-- upvalues: t (write), t_1 (write), signalsModule (copy), t_2 (write), dataStatus (copy)
		if t[value] == nil or t_1[value] == nil then
			t[value] = {}
			local var3 = t[value]
			local var4, var5 = signalsModule.createSignal(nil)
			var3.data = var4
			t_1[value] = var5
			local var6 = t[value]
			local var7 = t_2
			local var8, var9 = signalsModule.createSignal(dataStatus.NotReady)
			var6.status = var8
			var7[value] = var9
		end
		return t[value], t_1[value]
	end
	
	local function getItem(p4, p5, p6)
		-- upvalues: getOrCreateSignals (ref), fFlagDataHydrationStaleTime (copy), dataStatus (copy), t_4 (write), t_3 (write)
		local var3 = getOrCreateSignals(p4)
		
		if fFlagDataHydrationStaleTime and p6 ~= nil then
			local var4 = var3.data(false)
			
			if var3.status(false) == dataStatus.Failed then
				local var5 = true
				
				if t_3[p4] and os.clock() < t_3[p4] then
					local var6 = var3.data(false)
					
					if var6 ~= nil or var3.status(false) == dataStatus.Failed then
						if p5 then
							return var3, p5(var6)
						end
						var5 = false
					end
				end
				return var3, var5
			else
				local var7 = t_4[p4]
				local var8 = var4 ~= nil and (var7 ~= nil and os.clock() - var7 < p6)
				
				if var8 and p5 then
					return var3, p5(var4)
				end
				return var3, not var8
			end
		end
	end
	
	local function getItems(p4, p5, p6)
		-- upvalues: getItem (ref)
		local t = {}
		local t_1 = {}
		
		if not p4 then
			return t, t_1
		end
		for i, v in p4 do
			local var3, var4 = getItem(v, p5, p6)
			t[v] = var3
			t_1[v] = var4
		end
		return t, t_1
	end
	
	local function replaceItems(p7)
		-- upvalues: p1 (ref), getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), var2 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write), signalsExperimentalModule (copy)
		local processTime = os.clock()
		local var5 = processTime + p1
		signalsExperimentalModule.batch(function()
			-- upvalues: p7 (ref), getOrCreateSignals (copy), var1 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var5 (ref), var2 (copy), p1 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), processTime (ref)
			for i, v in p7 do
				local _, var6 = getOrCreateSignals(i)
				var6(if var1 then var1(v) else v)
				t_2[i](dataStatus.Ready)
				t_3[i] = if var2 then os.clock() + (if not var2(v) then p1 else var2(v)) else var5
				
				if fFlagDataHydrationStaleTime then
					t_4[i] = processTime
				end
			end
		end)
	end
	
	local function updateItems(p8, p9)
		-- upvalues: p1 (ref), getOrCreateSignals (ref), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), var2 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write), signalsExperimentalModule (copy)
		local processTime = os.clock()
		local var6 = processTime + p1
		signalsExperimentalModule.batch(function()
			-- upvalues: p8 (ref), getOrCreateSignals (copy), cryoModule (copy), var1 (copy), t_2 (copy), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), p9 (ref), t_3 (copy), var6 (ref), var2 (copy), p1 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), processTime (ref)
			for i, v in p8 do
				local var7, var8 = getOrCreateSignals(i)
				local var9 = var7.data(false)
				local var10 = if var9 and type(var9) == "table" and type(v) == "table" then cryoModule.Dictionary.join(var9, v) else v
				var8(if var1 then var1(var10) else var10)
				t_2[i](dataStatus.Ready)
				
				if not fFlagMigrateGameInfoToStore then
					t_3[i] = if var2 then os.clock() + (if not var2(var10) then p1 else var2(var10)) else var6
					
					if fFlagDataHydrationStaleTime then
						t_4[i] = processTime
					end
				elseif p9 ~= false then
					t_3[i] = if var2 then os.clock() + (if not var2(var10) then p1 else var2(var10)) else var6
					
					if fFlagDataHydrationStaleTime then
						t_4[i] = processTime
					end
				end
			end
		end)
	end
	
	local function updateItem(p10, p11, p12)
		-- upvalues: getOrCreateSignals (ref), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), p1 (ref), var2 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write)
		local var7, var8 = getOrCreateSignals(p10)
		local var9 = var7.data(false)
		local var10 = if var9 and type(var9) == "table" and type(p11) == "table" then cryoModule.Dictionary.join(var9, p11) else p11
		var8(if var1 then var1(var10) else var10)
		t_2[p10](dataStatus.Ready)
		
		if not fFlagMigrateGameInfoToStore then
			t_3[p10] = if var2 then os.clock() + (if not var2(var10) then p1 else var2(var10)) else os.clock() + p1
			
			if fFlagDataHydrationStaleTime then
				t_4[p10] = os.clock()
			end
		elseif p12 ~= false then
			t_3[p10] = if var2 then os.clock() + (if not var2(var10) then p1 else var2(var10)) else os.clock() + p1
			
			if fFlagDataHydrationStaleTime then
				t_4[p10] = os.clock()
				
				return
			end
		end
	end
	
	local function replaceItem(p10, p11)
		-- upvalues: getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), p1 (ref), var2 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write)
		local _, var7 = getOrCreateSignals(p10)
		var7(if var1 then var1(p11) else p11)
		t_2[p10](dataStatus.Ready)
		t_3[p10] = if var2 then os.clock() + (if not var2(p11) then p1 else var2(p11)) else os.clock() + p1
		
		if fFlagDataHydrationStaleTime then
			t_4[p10] = os.clock()
		end
	end
	
	local function resetFailedItem(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		local var7 = t[value]
		
		if var7 and var7.status(false) == dataStatus.Failed then
			t_2[value](dataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		for i, v in value do
			local var7 = t[v]
			
			if var7 and var7.status(false) == dataStatus.Failed then
				t_2[v](dataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p10)
		-- upvalues: p2 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var8 = os.clock() + p2
		signalsExperimentalModule.batch(function()
			-- upvalues: p10 (ref), t_2 (copy), dataStatus (copy), t_3 (copy), var8 (ref)
			for i, v in p10 do
				if t_2[v] then
					t_2[v](dataStatus.Failed)
				end
				t_3[v] = var8
			end
		end)
	end
	
	local function releaseEntries()
		-- upvalues: t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write)
		t_3 = {}
		
		if fFlagDataHydrationStaleTime then
			t_4 = {}
		end
		t = {}
		t_1 = {}
		t_2 = {}
	end
	
	local _ = function()
		-- upvalues: signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy)
		signalsExperimentalModule.batch(function()
			-- upvalues: t_3 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), t (copy), t_1 (copy), t_2 (copy), dataStatus (copy)
			table.clear(t_3)
			
			if fFlagDataHydrationStaleTime then
				table.clear(t_4)
			end
			for i in t do
				t_1[i](nil)
				t_2[i](dataStatus.NotReady)
			end
		end)
	end
	
	local function clear()
		-- upvalues: fFlagDataHydrationAccountReset (copy), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy), releaseEntries (ref)
		if fFlagDataHydrationAccountReset then
			signalsExperimentalModule.batch(function()
				-- upvalues: t_3 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), t (copy), t_1 (copy), t_2 (copy), dataStatus (copy)
				table.clear(t_3)
				
				if fFlagDataHydrationStaleTime then
					table.clear(t_4)
				end
				for i in t do
					t_1[i](nil)
					t_2[i](dataStatus.NotReady)
				end
			end)
			
			return
		end
		releaseEntries()
	end
	
	local var9 = getLocalPlayerUserId()
	local var10 = nil
	local var11 = nil
	
	if fFlagDataHydrationAccountReset then
		if if p3 and p3.observeLocalUser ~= nil then p3.observeLocalUser else true then
			var11 = observeLocalPlayerUserId(function(p11)
				-- upvalues: var9 (write), fFlagDataHydrationAccountReset (copy), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy), releaseEntries (ref)
				var9 = p11
				
				if fFlagDataHydrationAccountReset then
					signalsExperimentalModule.batch(function()
						-- upvalues: t_3 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), t (copy), t_1 (copy), t_2 (copy), dataStatus (copy)
						table.clear(t_3)
						
						if fFlagDataHydrationStaleTime then
							table.clear(t_4)
						end
						for i in t do
							t_1[i](nil)
							t_2[i](dataStatus.NotReady)
						end
					end)
					
					return
				end
				releaseEntries()
			end)
		end
	else
		var10 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: getLocalPlayerUserId (copy), var9 (write), fFlagDataHydrationAccountReset (copy), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy), releaseEntries (ref)
			local var12 = getLocalPlayerUserId()
			
			if var12 ~= var9 then
				var9 = var12
				
				if fFlagDataHydrationAccountReset then
					signalsExperimentalModule.batch(function()
						-- upvalues: t_3 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), t (copy), t_1 (copy), t_2 (copy), dataStatus (copy)
						table.clear(t_3)
						
						if fFlagDataHydrationStaleTime then
							table.clear(t_4)
						end
						for i in t do
							t_1[i](nil)
							t_2[i](dataStatus.NotReady)
						end
					end)
					
					return
				end
				releaseEntries()
			end
		end)
	end
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
			-- upvalues: fFlagDataHydrationAccountReset (copy), var11 (write), releaseEntries (ref), var10 (write), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy)
			if fFlagDataHydrationAccountReset then
				if var11 then
					var11()
					var11 = nil
				end
				releaseEntries()
				
				return
			elseif var10 then
				var10:Disconnect()
				var10 = nil
			end
			if fFlagDataHydrationAccountReset then
				signalsExperimentalModule.batch(function()
					-- upvalues: t_3 (copy), fFlagDataHydrationStaleTime (copy), t_4 (copy), t (copy), t_1 (copy), t_2 (copy), dataStatus (copy)
					table.clear(t_3)
					
					if fFlagDataHydrationStaleTime then
						table.clear(t_4)
					end
					for i in t do
						t_1[i](nil)
						t_2[i](dataStatus.NotReady)
					end
				end)
				
				return
			end
			releaseEntries()
		end
	}
end