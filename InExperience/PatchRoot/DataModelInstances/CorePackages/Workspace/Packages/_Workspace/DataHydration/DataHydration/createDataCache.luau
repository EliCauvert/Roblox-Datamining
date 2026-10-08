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
local luaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local luaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p1, p2, p3)
	-- upvalues: luaAppDefaultDataTtlSec (ref), luaAppDefaultFailedDataTtlSec (ref), signalsModule (ref), dataStatus (ref), fFlagDataHydrationStaleTime (ref), signalsExperimentalModule (ref), cryoModule (ref), fFlagMigrateGameInfoToStore (ref), fFlagDataHydrationAccountReset (ref), getLocalPlayerUserId (ref), observeLocalPlayerUserId (ref), playersService (ref)
	p1 = p1 or luaAppDefaultDataTtlSec
	p2 = p2 or luaAppDefaultFailedDataTtlSec
	local var1 = if p3 then p3.sanitizeItem else nil
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
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
	
	local function getItem(p4, p5, p6)
		-- upvalues: getOrCreateSignals (ref), fFlagDataHydrationStaleTime (copy), dataStatus (copy), t_4 (write), t_3 (write)
		local var2 = getOrCreateSignals(p4)
		
		if fFlagDataHydrationStaleTime and p6 ~= nil then
			local var3 = var2.data(false)
			
			if var2.status(false) == dataStatus.Failed then
				local var4 = true
				
				if t_3[p4] and os.clock() < t_3[p4] then
					local var5 = var2.data(false)
					
					if var5 ~= nil or var2.status(false) == dataStatus.Failed then
						if p5 then
							return var2, p5(var5)
						end
						var4 = false
					end
				end
				return var2, var4
			else
				local var6 = t_4[p4]
				local var7 = var3 ~= nil and (var6 ~= nil and os.clock() - var6 < p6)
				
				if var7 and p5 then
					return var2, p5(var3)
				end
				return var2, not var7
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
			local var2, var3 = getItem(v, p5, p6)
			t[v] = var2
			t_1[v] = var3
		end
		return t, t_1
	end
	
	local function replaceItems(p7)
		-- upvalues: p1 (ref), getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), signalsExperimentalModule (copy)
		local processTime = os.clock()
		local var4 = processTime + p1
		signalsExperimentalModule.batch(function()
			-- upvalues: p7 (ref), getOrCreateSignals (copy), var1 (copy), t_2 (copy), dataStatus (copy), t_3 (copy), var4 (ref), fFlagDataHydrationStaleTime (copy), t_4 (copy), processTime (ref)
			for i, v in p7 do
				local _, var5 = getOrCreateSignals(i)
				var5(if var1 then var1(v) else v)
				t_2[i](dataStatus.Ready)
				t_3[i] = var4
				
				if fFlagDataHydrationStaleTime then
					t_4[i] = processTime
				end
			end
		end)
	end
	
	local function updateItems(p8, p9)
		-- upvalues: p1 (ref), getOrCreateSignals (ref), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), signalsExperimentalModule (copy)
		local processTime = os.clock()
		local var5 = processTime + p1
		signalsExperimentalModule.batch(function()
			-- upvalues: p8 (ref), getOrCreateSignals (copy), cryoModule (copy), var1 (copy), t_2 (copy), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), p9 (ref), t_3 (copy), var5 (ref), fFlagDataHydrationStaleTime (copy), t_4 (copy), processTime (ref)
			for i, v in p8 do
				local var6, var7 = getOrCreateSignals(i)
				local var8 = var6.data(false)
				local var9 = if var8 and type(var8) == "table" and type(v) == "table" then cryoModule.Dictionary.join(var8, v) else v
				var7(if var1 then var1(var9) else var9)
				t_2[i](dataStatus.Ready)
				
				if not fFlagMigrateGameInfoToStore then
					t_3[i] = var5
					
					if fFlagDataHydrationStaleTime then
						t_4[i] = processTime
					end
				elseif p9 ~= false then
					t_3[i] = var5
					
					if fFlagDataHydrationStaleTime then
						t_4[i] = processTime
					end
				end
			end
		end)
	end
	
	local function updateItem(p10, p11, p12)
		-- upvalues: getOrCreateSignals (ref), cryoModule (copy), var1 (ref), t_2 (write), dataStatus (copy), fFlagMigrateGameInfoToStore (copy), t_3 (write), p1 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write)
		local var6, var7 = getOrCreateSignals(p10)
		local var8 = var6.data(false)
		local var9 = if var8 and type(var8) == "table" and type(p11) == "table" then cryoModule.Dictionary.join(var8, p11) else p11
		var7(if var1 then var1(var9) else var9)
		t_2[p10](dataStatus.Ready)
		
		if not fFlagMigrateGameInfoToStore then
			t_3[p10] = os.clock() + p1
			
			if fFlagDataHydrationStaleTime then
				t_4[p10] = os.clock()
			end
		elseif p12 ~= false then
			t_3[p10] = os.clock() + p1
			
			if fFlagDataHydrationStaleTime then
				t_4[p10] = os.clock()
				
				return
			end
		end
	end
	
	local function replaceItem(p10, p11)
		-- upvalues: getOrCreateSignals (ref), var1 (ref), t_2 (write), dataStatus (copy), t_3 (write), p1 (ref), fFlagDataHydrationStaleTime (copy), t_4 (write)
		local _, var6 = getOrCreateSignals(p10)
		var6(if var1 then var1(p11) else p11)
		t_2[p10](dataStatus.Ready)
		t_3[p10] = os.clock() + p1
		
		if fFlagDataHydrationStaleTime then
			t_4[p10] = os.clock()
		end
	end
	
	local function resetFailedItem(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		local var6 = t[value]
		
		if var6 and var6.status(false) == dataStatus.Failed then
			t_2[value](dataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(value)
		-- upvalues: t (write), dataStatus (copy), t_2 (write)
		for i, v in value do
			local var6 = t[v]
			
			if var6 and var6.status(false) == dataStatus.Failed then
				t_2[v](dataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p10)
		-- upvalues: p2 (ref), t_2 (write), dataStatus (copy), t_3 (write), signalsExperimentalModule (copy)
		local var7 = os.clock() + p2
		signalsExperimentalModule.batch(function()
			-- upvalues: p10 (ref), t_2 (copy), dataStatus (copy), t_3 (copy), var7 (ref)
			for i, v in p10 do
				if t_2[v] then
					t_2[v](dataStatus.Failed)
				end
				t_3[v] = var7
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
	
	local function _()
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
	
	local var8 = getLocalPlayerUserId()
	local var9 = nil
	local var10 = nil
	
	if fFlagDataHydrationAccountReset then
		if if p3 and p3.observeLocalUser ~= nil then p3.observeLocalUser else true then
			var10 = observeLocalPlayerUserId(function(p11)
				-- upvalues: var8 (write), fFlagDataHydrationAccountReset (copy), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy), releaseEntries (ref)
				var8 = p11
				
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
		var9 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: getLocalPlayerUserId (copy), var8 (write), fFlagDataHydrationAccountReset (copy), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy), releaseEntries (ref)
			local var11 = getLocalPlayerUserId()
			
			if var11 ~= var8 then
				var8 = var11
				
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
			-- upvalues: fFlagDataHydrationAccountReset (copy), var10 (write), releaseEntries (ref), var9 (write), signalsExperimentalModule (copy), t_3 (write), fFlagDataHydrationStaleTime (copy), t_4 (write), t (write), t_1 (write), t_2 (write), dataStatus (copy)
			if fFlagDataHydrationAccountReset then
				if var10 then
					var10()
					var10 = nil
				end
				releaseEntries()
				
				return
			elseif var9 then
				var9:Disconnect()
				var9 = nil
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