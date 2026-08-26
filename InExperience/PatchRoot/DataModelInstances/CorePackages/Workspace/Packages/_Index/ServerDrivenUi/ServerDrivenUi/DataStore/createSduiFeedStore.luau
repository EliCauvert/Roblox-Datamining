local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local signalsModule = require(parent.Signals)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagSduiGetItemCollectionKeys = require(serverDrivenUi.Flags).FFlagSduiGetItemCollectionKeys
local fFlagLuaAppRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppRfySignalApportioning
local luaAppNilApportionedItems = game:DefineFastFlag("LuaAppNilApportionedItems", false)
local fFlagLuaAppAddRequestIdToRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local var1 = game:DefineFastInt("SduiCreateSduiFeedStoreLogDelayMs", 1000) / 1000

return function()
	-- upvalues: signalsModule (ref), fFlagSduiGetItemCollectionKeys (ref), fFlagLuaAppRfySignalApportioning (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (ref), var1 (ref), discoveryEventErrorLogger (ref), luaAppNilApportionedItems (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var2, var3 = signalsModule.createSignal({})
	local var4, var5 = signalsModule.createSignal(0)
	local var6 = nil
	local var7 = nil
	
	if fFlagSduiGetItemCollectionKeys then
		local var8, var9 = signalsModule.createSignal({})
		var6 = var8
		var7 = var9
	end
	local function _(value, p1)
		-- upvalues: signalsModule (copy), t (ref)
		local var10, var11 = signalsModule.createSignal(p1)
		t[value] = { get = var10, set = var11 }
		
		return t[value]
	end
	
	local function getItemCollection(p1, p2)
		-- upvalues: t (ref), signalsModule (copy)
		local var10 = t[p1]
		
		if var10 == nil then
			if p2 then
				local var11, var12 = signalsModule.createSignal(nil)
				t[p1] = { get = var11, set = var12 }
				var10 = t[p1]
			else
				error(`createSduiFeedStore missing item collection for feedItemKey {p1}`)
			end
		end
		return var10.get
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
				local var13, var14 = signalsModule.createSignal(v)
				t[i] = { get = var13, set = var14 }
				local _ = t[i]
			end
		end
	end
	
	local setApportioningData = nil
	local updateApportioningCapacity = nil
	local getSingleGridApportioningMetadata = nil
	local getApportionedItems = nil
	
	if fFlagLuaAppRfySignalApportioning then
		local var15 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then function(p4, p5)
			return if p5 then p4 .. "_" .. p5 else p4
		end else nil
		
		local function createApportioningDataSignals(value, p4, p5)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (ref), signalsModule (copy), t_1 (ref), t_2 (ref)
			local var16 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(value, p5) else value
			local var17, var18 = signalsModule.createSignal(p4.items)
			local var19, var20 = signalsModule.createSignal(p4.gridApportioningMetadata)
			local var21, var22 = signalsModule.createSignal({
				isCapacityUpdateScheduled = false,
				capacityUpdateCoroutine = nil,
				getItems = var17,
				setItems = var18,
				getGridApportioningMetadata = var19,
				setGridApportioningMetadata = var20,
				scheduledCapacityUpdates = {}
			})
			t_1[var16] = { get = var21, set = var22 }
			
			if fFlagLuaAppAddRequestIdToRfySignalApportioning then
				local previousKey = t_2[value] and t_2[value].previousKey
				local currentKey = t_2[value] and t_2[value].currentKey
				
				if previousKey then
					t_1[previousKey] = nil
				end
				t_2[value] = { previousKey = currentKey, currentKey = var16 }
			end
		end
		
		local var16 = function(p4, p5)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (ref), t_1 (ref), createApportioningDataSignals (ref)
			local var17 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(p4, p5) else p4
			
			if not t_1[var17] then
				createApportioningDataSignals(p4, { items = {}, gridApportioningMetadata = {} }, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p5 else nil)
			end
			return t_1[var17].get
		end
		
		setApportioningData = function(value, p4)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (ref), t_1 (ref), createApportioningDataSignals (ref)
			for i, v in value do
				local var17 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(i, p4) else i
				
				if t_1[var17] then
					local var18 = t_1[var17].get(false)
					var18.setItems(v.items)
					var18.setGridApportioningMetadata(v.gridApportioningMetadata)
					var18.scheduledCapacityUpdates = {}
					var18.isCapacityUpdateScheduled = false
					
					if var18.capacityUpdateCoroutine then
						task.cancel(var18.capacityUpdateCoroutine)
						var18.capacityUpdateCoroutine = nil
					end
				else
					createApportioningDataSignals(i, v, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p4 else nil)
				end
			end
		end
		
		local function updateGridApportioningMetadata(p5, p6)
			-- upvalues: var16 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (ref), var1 (copy), t_1 (ref), discoveryEventErrorLogger (copy)
			local var19 = var16(p5, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p6 else nil)(false)
			local gridApportioningMetadata = var19.getGridApportioningMetadata(false)
			local scheduledCapacityUpdates = var19.scheduledCapacityUpdates
			
			if #gridApportioningMetadata == 0 then
				local var20 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(p5, p6) else p5
				task.delay(var1, function()
					-- upvalues: t_1 (copy), var20 (ref), discoveryEventErrorLogger (copy)
					local var21 = t_1[var20].get(false)
					
					if #(var21 and var21.getGridApportioningMetadata(false) or {}) == 0 then
						discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var20} in updateGridApportioningMetadata`, { apportioningKey = var20 })
					end
				end)
				
				return
			end
			local var21 = 1
			local t = {}
			
			for i, v in gridApportioningMetadata do
				local var22 = if scheduledCapacityUpdates[v.sortIndex] then scheduledCapacityUpdates[v.sortIndex] else v.capacity
				table.insert(t, {
					sortIndex = v.sortIndex,
					startingItemIndex = var21,
					capacity = var22
				})
				var21 += var22
			end
			var19.setGridApportioningMetadata(t)
		end
		
		updateApportioningCapacity = function(p7, p8, p9, p10)
			-- upvalues: var16 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), updateGridApportioningMetadata (ref)
			local var23 = var16(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p10 else nil)(false)
			var23.scheduledCapacityUpdates[p8] = p9
			
			if not var23.isCapacityUpdateScheduled then
				var23.isCapacityUpdateScheduled = true
				var23.capacityUpdateCoroutine = task.defer(function()
					-- upvalues: updateGridApportioningMetadata (copy), p7 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p10 (ref), var23 (ref)
					updateGridApportioningMetadata(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p10 else nil)
					var23.scheduledCapacityUpdates = {}
					var23.isCapacityUpdateScheduled = false
					var23.capacityUpdateCoroutine = nil
				end)
			end
		end
		
		getSingleGridApportioningMetadata = function(p7, p8, p9)
			-- upvalues: signalsModule (copy), var16 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var1 (copy), var15 (ref), t_1 (ref), discoveryEventErrorLogger (copy)
			return signalsModule.createComputed(function(p10)
				-- upvalues: var16 (copy), p7 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p9 (ref), var1 (copy), var15 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p8 (ref)
				local gridApportioningMetadata = var16(p7, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)(p10).getGridApportioningMetadata(p10)
				
				if #gridApportioningMetadata == 0 then
					task.delay(var1, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (copy), p7 (copy), p9 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p8 (copy)
						local var23 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(p7, p9) else p7
						local var24 = t_1[var23].get(false)
						
						if #(var24 and var24.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var23} in getSingleGridApportioningMetadata`, { apportioningKey = var23, sortIndex = p8 })
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
			-- upvalues: signalsModule (copy), var16 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), getSingleGridApportioningMetadata (write), var15 (ref), var1 (copy), t_1 (ref), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
			return signalsModule.createComputed(function(p14)
				-- upvalues: var16 (copy), p11 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p13 (ref), getSingleGridApportioningMetadata (copy), p12 (ref), var15 (copy), var1 (copy), t_1 (copy), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
				local startingItemIndex
				local var23 = var16(p11, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(p14)
				local items = var23.getItems(p14)
				local var24 = getSingleGridApportioningMetadata(p11, p12, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(p14)
				
				if #items == 0 and #var23.getGridApportioningMetadata(false) == 0 then
					local var25 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(p11, p13) else p11
					task.delay(var1, function()
						-- upvalues: t_1 (copy), var25 (ref), discoveryEventErrorLogger (copy), p12 (copy)
						local var26 = t_1[var25].get(false)
						
						if #(var26 and var26.getItems(false) or {}) == 0 and #(var26 and var26.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyData", `All apportioning data is empty for {var25} in getApportionedItems`, { apportioningKey = var25, sortIndex = p12 })
						end
					end)
					
					return if luaAppNilApportionedItems then nil else {}
				elseif not var24 then
					startingItemIndex = nil
					task.delay(var1, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var15 (copy), p11 (copy), p13 (copy), getSingleGridApportioningMetadata (copy), p12 (copy), t_1 (copy), startingItemIndex (write), discoveryEventErrorLogger (copy)
						local var27 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var15(p11, p13) else p11
						
						if not getSingleGridApportioningMetadata(p11, p12, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p13 else nil)(false) then
							local var28 = t_1[var27].get(false)
							local t = {}
							
							for i, v in var28 and var28.getGridApportioningMetadata(false) or {} do
								table.insert(t, v.sortIndex)
							end
							startingItemIndex = if #t > 0 then table.concat(t, ",") else "none"
							discoveryEventErrorLogger.reportError("ApportioningSortIndexNotFound", `Sort index {p12} not found in apportioning data for {var27}`, {
								apportioningKey = var27,
								sortIndex = p12,
								availableSortIndices = startingItemIndex
							})
						end
					end)
					
					return {}
				end
				startingItemIndex = var24.startingItemIndex
				local t = {}
				
				for i = startingItemIndex, math.min(startingItemIndex + var24.capacity - 1, #items) do
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
		getItemCollectionKeys = if fFlagSduiGetItemCollectionKeys then var6 else nil,
		updateApportioningCapacity = if fFlagLuaAppRfySignalApportioning then updateApportioningCapacity else nil,
		getSingleGridApportioningMetadata = if fFlagLuaAppRfySignalApportioning then getSingleGridApportioningMetadata else nil,
		getApportionedItems = if fFlagLuaAppRfySignalApportioning then getApportionedItems else nil,
		updateData = function(p15, p16)
			-- upvalues: var3 (ref), var5 (ref), setItemCollections (ref), fFlagSduiGetItemCollectionKeys (copy), var7 (write), fFlagLuaAppRfySignalApportioning (copy), setApportioningData (write), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy)
			if p15.templates then
				var3(p15.templates)
			end
			if p15.dataUpdatedTimestamp then
				var5(p15.dataUpdatedTimestamp)
			end
			if p15.itemCollections then
				setItemCollections(p15.itemCollections)
				
				if fFlagSduiGetItemCollectionKeys then
					local t = {}
					
					for i in p15.itemCollections do
						table.insert(t, i)
					end
					var7(t)
				end
			end
			if fFlagLuaAppRfySignalApportioning and p15.apportioningData then
				setApportioningData(p15.apportioningData, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p16 else nil)
			end
		end
	}
end