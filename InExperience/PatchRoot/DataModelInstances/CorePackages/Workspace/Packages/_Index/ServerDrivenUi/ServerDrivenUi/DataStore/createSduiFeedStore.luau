local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local signalsModule = require(parent.Signals)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppRfySignalApportioning
local luaAppNilApportionedItems = game:DefineFastFlag("LuaAppNilApportionedItems", false)
local fFlagLuaAppAddRequestIdToRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local var1 = game:DefineFastInt("SduiCreateSduiFeedStoreLogDelayMs", 1000) / 1000

return function()
	-- upvalues: signalsModule (ref), fFlagLuaAppRfySignalApportioning (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (ref), var1 (ref), discoveryEventErrorLogger (ref), luaAppNilApportionedItems (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var2, var3 = signalsModule.createSignal({})
	local var4, var5 = signalsModule.createSignal(0)
	local _ = nil
	local _ = nil
	local var6, var7 = signalsModule.createSignal({})
	local var8 = var7
	
	local function _(value, p1)
		-- upvalues: signalsModule (copy), t (ref)
		local var9, var10 = signalsModule.createSignal(p1)
		t[value] = { get = var9, set = var10 }
		
		return t[value]
	end
	
	local function getItemCollection(p1, p2)
		-- upvalues: t (ref), signalsModule (copy)
		local var9 = t[p1]
		
		if var9 == nil then
			if p2 then
				local var10, var11 = signalsModule.createSignal(nil)
				t[p1] = { get = var10, set = var11 }
				var9 = t[p1]
			else
				error(`createSduiFeedStore missing item collection for feedItemKey {p1}`)
			end
		end
		return var9.get
	end
	
	local function getFirstItemCollectionWithFilter(p3)
		-- upvalues: t (ref)
		for i, v in t do
			if p3(v.get(false)) then
				return v.get
			end
		end
		return nil
	end
	
	local function setItemCollections(value)
		-- upvalues: t (ref), signalsModule (copy)
		for i, v in value do
			if t[i] then
				t[i].set(v)
			else
				local var12, var13 = signalsModule.createSignal(v)
				t[i] = { get = var12, set = var13 }
				local _ = t[i]
			end
		end
	end
	
	local setApportioningData = nil
	local updateApportioningCapacity = nil
	local getSingleGridApportioningMetadata = nil
	local getApportionedItems = nil
	
	if fFlagLuaAppRfySignalApportioning then
		local var14 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then function(p4, p5)
			return if p5 then p4 .. "_" .. p5 else p4
		end else nil
		
		local function createApportioningDataSignals(value, p4, p5)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (ref), signalsModule (copy), t_1 (ref), t_2 (ref)
			local var15 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(value, p5) else value
			local var16, var17 = signalsModule.createSignal(p4.items)
			local var18, var19 = signalsModule.createSignal(p4.gridApportioningMetadata)
			local var20, var21 = signalsModule.createSignal({
				isCapacityUpdateScheduled = false,
				capacityUpdateCoroutine = nil,
				getItems = var16,
				setItems = var17,
				getGridApportioningMetadata = var18,
				setGridApportioningMetadata = var19,
				scheduledCapacityUpdates = {}
			})
			t_1[var15] = { get = var20, set = var21 }
			
			if fFlagLuaAppAddRequestIdToRfySignalApportioning then
				local previousKey = t_2[value] and t_2[value].previousKey
				local currentKey = t_2[value] and t_2[value].currentKey
				
				if previousKey then
					t_1[previousKey] = nil
				end
				t_2[value] = { previousKey = currentKey, currentKey = var15 }
			end
		end
		
		local var15 = function(p4, p5)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (ref), t_1 (ref), createApportioningDataSignals (ref)
			local var16 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(p4, p5) else p4
			
			if not t_1[var16] then
				createApportioningDataSignals(p4, { items = {}, gridApportioningMetadata = {} }, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p5 else nil)
			end
			return t_1[var16].get
		end
		
		setApportioningData = function(value, p4)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (ref), t_1 (ref), createApportioningDataSignals (ref)
			for i, v in value do
				local var16 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(i, p4) else i
				
				if t_1[var16] then
					local var17 = t_1[var16].get(false)
					var17.setItems(v.items)
					var17.setGridApportioningMetadata(v.gridApportioningMetadata)
					var17.scheduledCapacityUpdates = {}
					var17.isCapacityUpdateScheduled = false
					
					if var17.capacityUpdateCoroutine then
						task.cancel(var17.capacityUpdateCoroutine)
						var17.capacityUpdateCoroutine = nil
					end
				else
					createApportioningDataSignals(i, v, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p4 else nil)
				end
			end
		end
		
		local function updateGridApportioningMetadata(p5, p6)
			-- upvalues: var15 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (ref), var1 (copy), t_1 (ref), discoveryEventErrorLogger (copy)
			local var18 = var15(p5, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p6 else nil)(false)
			local gridApportioningMetadata = var18.getGridApportioningMetadata(false)
			local scheduledCapacityUpdates = var18.scheduledCapacityUpdates
			
			if #gridApportioningMetadata == 0 then
				local var19 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(p5, p6) else p5
				task.delay(var1, function()
					-- upvalues: t_1 (copy), var19 (ref), discoveryEventErrorLogger (copy)
					local var20 = t_1[var19].get(false)
					
					if #(var20 and var20.getGridApportioningMetadata(false) or {}) == 0 then
						discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var19} in updateGridApportioningMetadata`, { apportioningKey = var19 })
					end
				end)
				
				return
			end
			local var20 = 1
			local t = {}
			
			for i, v in gridApportioningMetadata do
				local var21 = if scheduledCapacityUpdates[v.sortIndex] then scheduledCapacityUpdates[v.sortIndex] else v.capacity
				table.insert(t, {
					sortIndex = v.sortIndex,
					startingItemIndex = var20,
					capacity = var21
				})
				var20 += var21
			end
			var18.setGridApportioningMetadata(t)
		end
		
		updateApportioningCapacity = function(p7, p8, p9, p10)
			-- upvalues: var15 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), updateGridApportioningMetadata (ref)
			local var22 = var15(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p10 else nil)(false)
			var22.scheduledCapacityUpdates[p8] = p9
			
			if not var22.isCapacityUpdateScheduled then
				var22.isCapacityUpdateScheduled = true
				var22.capacityUpdateCoroutine = task.defer(function()
					-- upvalues: updateGridApportioningMetadata (copy), p7 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p10 (ref), var22 (ref)
					updateGridApportioningMetadata(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p10 else nil)
					var22.scheduledCapacityUpdates = {}
					var22.isCapacityUpdateScheduled = false
					var22.capacityUpdateCoroutine = nil
				end)
			end
		end
		
		getSingleGridApportioningMetadata = function(p7, p8, p9)
			-- upvalues: signalsModule (copy), var15 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var1 (copy), var14 (ref), t_1 (ref), discoveryEventErrorLogger (copy)
			return signalsModule.createComputed(function(p10)
				-- upvalues: var15 (copy), p7 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p9 (ref), var1 (copy), var14 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p8 (ref)
				local gridApportioningMetadata = var15(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)(p10).getGridApportioningMetadata(p10)
				
				if #gridApportioningMetadata == 0 then
					task.delay(var1, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (copy), p7 (copy), p9 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p8 (copy)
						local var22 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(p7, p9) else p7
						local var23 = t_1[var22].get(false)
						
						if #(var23 and var23.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var22} in getSingleGridApportioningMetadata`, { apportioningKey = var22, sortIndex = p8 })
						end
					end)
					
					return nil
				end
				for i, v in gridApportioningMetadata do
					if v.sortIndex == p8 then
						return v
					end
				end
				return nil
			end)
		end
		
		getApportionedItems = function(p11, p12, p13)
			-- upvalues: signalsModule (copy), var15 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), getSingleGridApportioningMetadata (write), var14 (ref), var1 (copy), t_1 (ref), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
			return signalsModule.createComputed(function(p14)
				-- upvalues: var15 (copy), p11 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p13 (ref), getSingleGridApportioningMetadata (copy), p12 (ref), var14 (copy), var1 (copy), t_1 (copy), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
				local startingItemIndex
				local var22 = var15(p11, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(p14)
				local items = var22.getItems(p14)
				local var23 = getSingleGridApportioningMetadata(p11, p12, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(p14)
				
				if #items == 0 and #var22.getGridApportioningMetadata(false) == 0 then
					local var24 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(p11, p13) else p11
					task.delay(var1, function()
						-- upvalues: t_1 (copy), var24 (ref), discoveryEventErrorLogger (copy), p12 (copy)
						local var25 = t_1[var24].get(false)
						
						if #(var25 and var25.getItems(false) or {}) == 0 and #(var25 and var25.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyData", `All apportioning data is empty for {var24} in getApportionedItems`, { apportioningKey = var24, sortIndex = p12 })
						end
					end)
					
					return if luaAppNilApportionedItems then nil else {}
				elseif not var23 then
					startingItemIndex = nil
					task.delay(var1, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var14 (copy), p11 (copy), p13 (copy), getSingleGridApportioningMetadata (copy), p12 (copy), t_1 (copy), startingItemIndex (write), discoveryEventErrorLogger (copy)
						local var26 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var14(p11, p13) else p11
						
						if not getSingleGridApportioningMetadata(p11, p12, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(false) then
							local var27 = t_1[var26].get(false)
							local t = {}
							
							for i, v in var27 and var27.getGridApportioningMetadata(false) or {} do
								table.insert(t, v.sortIndex)
							end
							startingItemIndex = if #t > 0 then table.concat(t, ",") else "none"
							discoveryEventErrorLogger.reportError("ApportioningSortIndexNotFound", `Sort index {p12} not found in apportioning data for {var26}`, {
								apportioningKey = var26,
								sortIndex = p12,
								availableSortIndices = startingItemIndex
							})
						end
					end)
					
					return {}
				end
				startingItemIndex = var23.startingItemIndex
				local t = {}
				
				for i = startingItemIndex, math.min(startingItemIndex + var23.capacity - 1, #items) do
					table.insert(t, items[i])
				end
				return t
			end)
		end
	end
	return {
		getFirstItemCollectionWithFilter = getFirstItemCollectionWithFilter,
		getItemCollection = getItemCollection,
		getTemplates = var2,
		getDataUpdatedTimestamp = var4,
		getItemCollectionKeys = var6,
		updateApportioningCapacity = if fFlagLuaAppRfySignalApportioning then updateApportioningCapacity else nil,
		getSingleGridApportioningMetadata = if fFlagLuaAppRfySignalApportioning then getSingleGridApportioningMetadata else nil,
		getApportionedItems = if fFlagLuaAppRfySignalApportioning then getApportionedItems else nil,
		updateData = function(p15, p16)
			-- upvalues: var3 (ref), var5 (ref), setItemCollections (ref), var8 (write), fFlagLuaAppRfySignalApportioning (copy), setApportioningData (write), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy)
			if p15.templates then
				var3(p15.templates)
			end
			if p15.dataUpdatedTimestamp then
				var5(p15.dataUpdatedTimestamp)
			end
			if p15.itemCollections then
				setItemCollections(p15.itemCollections)
				local t = {}
				
				for i in p15.itemCollections do
					table.insert(t, i)
				end
				var8(t)
			end
			if fFlagLuaAppRfySignalApportioning and p15.apportioningData then
				setApportioningData(p15.apportioningData, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p16 else nil)
			end
		end
	}
end