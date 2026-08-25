local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local signalsModule = require(parent.Signals)
local _ = require(serverDrivenUi.DataStore.SduiFeedStoreTypes)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagSduiGetItemCollectionKeys = require(serverDrivenUi.Flags).FFlagSduiGetItemCollectionKeys
local fFlagLuaAppRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppRfySignalApportioning
local luaAppNilApportionedItems = game:DefineFastFlag("LuaAppNilApportionedItems", false)
local fFlagLuaAppAddRequestIdToRfySignalApportioning = require(parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local var3 = game:DefineFastInt("SduiCreateSduiFeedStoreLogDelayMs", 1000) / 1000

return function()
	-- upvalues: signalsModule (ref), fFlagSduiGetItemCollectionKeys (ref), fFlagLuaAppRfySignalApportioning (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (ref), var3 (ref), discoveryEventErrorLogger (ref), luaAppNilApportionedItems (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var7, var8 = signalsModule.createSignal({})
	local var9, var10 = signalsModule.createSignal(0)
	local var11 = nil
	local var12 = nil
	
	if fFlagSduiGetItemCollectionKeys then
		local var13, var14 = signalsModule.createSignal({})
		var11 = var13
		var12 = var14
	end
	local function _(value, p0)
		-- upvalues: signalsModule (copy), t (ref)
		local var26, var27 = signalsModule.createSignal(p0)
		t[value] = { get = var26, set = var27 }
		
		return t[value]
	end
	
	local function getItemCollection(p1, p2)
		-- upvalues: t (ref), signalsModule (copy)
		local var28 = t[p1]
		
		if var28 == nil then
			if p2 then
				local var29, var30 = signalsModule.createSignal(nil)
				t[p1] = { get = var29, set = var30 }
				var28 = t[p1]
			else
				error(`createSduiFeedStore missing item collection for feedItemKey {p1}`)
			end
		end
		return var28.get
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
				local var31, var32 = signalsModule.createSignal(v)
				t[i] = { get = var31, set = var32 }
				local _ = t[i]
			end
		end
	end
	
	local setApportioningData = nil
	local updateApportioningCapacity = nil
	local getSingleGridApportioningMetadata = nil
	local getApportionedItems = nil
	
	if fFlagLuaAppRfySignalApportioning then
		local var22 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then function(p4, p5)
			return if p5 then p4 .. "_" .. p5 else p4
		end else nil
		
		local function createApportioningDataSignals(value, p6, p7)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (ref), signalsModule (copy), t_1 (ref), t_2 (ref)
			local var33 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(value, p7) else value
			local var34, var35 = signalsModule.createSignal(p6.items)
			local var36, var37 = signalsModule.createSignal(p6.gridApportioningMetadata)
			local var38, var39 = signalsModule.createSignal({
				isCapacityUpdateScheduled = false,
				capacityUpdateCoroutine = nil,
				getItems = var34,
				setItems = var35,
				getGridApportioningMetadata = var36,
				setGridApportioningMetadata = var37,
				scheduledCapacityUpdates = {}
			})
			t_1[var33] = { get = var38, set = var39 }
			
			if fFlagLuaAppAddRequestIdToRfySignalApportioning then
				local previousKey = t_2[value] and t_2[value].previousKey
				local currentKey = t_2[value] and t_2[value].currentKey
				
				if previousKey then
					t_1[previousKey] = nil
				end
				t_2[value] = { previousKey = currentKey, currentKey = var33 }
			end
		end
		
		local var24 = function(p8, p9)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (ref), t_1 (ref), createApportioningDataSignals (ref)
			local var42 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(p8, p9) else p8
			
			if not t_1[var42] then
				createApportioningDataSignals(p8, { items = {}, gridApportioningMetadata = {} }, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)
			end
			return t_1[var42].get
		end
		
		setApportioningData = function(value, p10)
			-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (ref), t_1 (ref), createApportioningDataSignals (ref)
			for i, v in value do
				local var43 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(i, p10) else i
				
				if t_1[var43] then
					local var44 = t_1[var43].get(false)
					var44.setItems(v.items)
					var44.setGridApportioningMetadata(v.gridApportioningMetadata)
					var44.scheduledCapacityUpdates = {}
					var44.isCapacityUpdateScheduled = false
					
					if var44.capacityUpdateCoroutine then
						task.cancel(var44.capacityUpdateCoroutine)
						var44.capacityUpdateCoroutine = nil
					end
				else
					createApportioningDataSignals(i, v, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p10 else nil)
				end
			end
		end
		
		local function updateGridApportioningMetadata(p11, p12)
			-- upvalues: var24 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (ref), var3 (copy), t_1 (ref), discoveryEventErrorLogger (copy)
			local var45 = var24(p11, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p12 else nil)(false)
			local gridApportioningMetadata = var45.getGridApportioningMetadata(false)
			local scheduledCapacityUpdates = var45.scheduledCapacityUpdates
			
			if #gridApportioningMetadata == 0 then
				local var47 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(p11, p12) else p11
				task.delay(var3, function()
					-- upvalues: t_1 (copy), var47 (ref), discoveryEventErrorLogger (copy)
					local var51 = t_1[var47].get(false)
					
					if #(var51 and var51.getGridApportioningMetadata(false) or {}) == 0 then
						discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var47} in updateGridApportioningMetadata`, { apportioningKey = var47 })
					end
				end)
				
				return
			end
			local var48 = 1
			local t = {}
			
			for i, v in gridApportioningMetadata do
				local var50 = if scheduledCapacityUpdates[v.sortIndex] then scheduledCapacityUpdates[v.sortIndex] else v.capacity
				table.insert(t, {
					sortIndex = v.sortIndex,
					startingItemIndex = var48,
					capacity = var50
				})
				var48 += var50
			end
			var45.setGridApportioningMetadata(t)
		end
		
		updateApportioningCapacity = function(p13, p14, p15, p16)
			-- upvalues: var24 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), updateGridApportioningMetadata (ref)
			local var52 = var24(p13, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p16 else nil)(false)
			var52.scheduledCapacityUpdates[p14] = p15
			
			if not var52.isCapacityUpdateScheduled then
				var52.isCapacityUpdateScheduled = true
				var52.capacityUpdateCoroutine = task.defer(function()
					-- upvalues: updateGridApportioningMetadata (copy), p13 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p16 (ref), var52 (ref)
					updateGridApportioningMetadata(p13, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p16 else nil)
					var52.scheduledCapacityUpdates = {}
					var52.isCapacityUpdateScheduled = false
					var52.capacityUpdateCoroutine = nil
				end)
			end
		end
		
		getSingleGridApportioningMetadata = function(p17, p18, p19)
			-- upvalues: signalsModule (copy), var24 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var3 (copy), var22 (ref), t_1 (ref), discoveryEventErrorLogger (copy)
			return signalsModule.createComputed(function(p20)
				-- upvalues: var24 (copy), p17 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p19 (ref), var3 (copy), var22 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p18 (ref)
				local gridApportioningMetadata = var24(p17, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p19 else nil)(p20).getGridApportioningMetadata(p20)
				
				if #gridApportioningMetadata == 0 then
					task.delay(var3, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (copy), p17 (copy), p19 (copy), t_1 (copy), discoveryEventErrorLogger (copy), p18 (copy)
						local var54 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(p17, p19) else p17
						local var55 = t_1[var54].get(false)
						
						if #(var55 and var55.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {var54} in getSingleGridApportioningMetadata`, { apportioningKey = var54, sortIndex = p18 })
						end
					end)
					
					return nil
				end
				for i, v in gridApportioningMetadata do
					if v.sortIndex == p18 then
						return v
					end
				end
				return nil
			end)
		end
		
		getApportionedItems = function(p21, p22, p23)
			-- upvalues: signalsModule (copy), var24 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), getSingleGridApportioningMetadata (write), var22 (ref), var3 (copy), t_1 (ref), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
			return signalsModule.createComputed(function(p24)
				-- upvalues: var24 (copy), p21 (ref), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), p23 (ref), getSingleGridApportioningMetadata (copy), p22 (ref), var22 (copy), var3 (copy), t_1 (copy), discoveryEventErrorLogger (copy), luaAppNilApportionedItems (copy)
				local startingItemIndex
				local var56 = var24(p21, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p23 else nil)(p24)
				local items = var56.getItems(p24)
				local var58 = getSingleGridApportioningMetadata(p21, p22, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p23 else nil)(p24)
				
				if #items == 0 and #var56.getGridApportioningMetadata(false) == 0 then
					local var60 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(p21, p23) else p21
					task.delay(var3, function()
						-- upvalues: t_1 (copy), var60 (ref), discoveryEventErrorLogger (copy), p22 (copy)
						local var61 = t_1[var60].get(false)
						
						if #(var61 and var61.getItems(false) or {}) == 0 and #(var61 and var61.getGridApportioningMetadata(false) or {}) == 0 then
							discoveryEventErrorLogger.reportError("ApportioningEmptyData", `All apportioning data is empty for {var60} in getApportionedItems`, { apportioningKey = var60, sortIndex = p22 })
						end
					end)
					
					return if luaAppNilApportionedItems then nil else {}
				elseif not var58 then
					startingItemIndex = nil
					task.delay(var3, function()
						-- upvalues: fFlagLuaAppAddRequestIdToRfySignalApportioning (copy), var22 (copy), p21 (copy), p23 (copy), getSingleGridApportioningMetadata (copy), p22 (copy), t_1 (copy), startingItemIndex (write), discoveryEventErrorLogger (copy)
						local var62 = if fFlagLuaAppAddRequestIdToRfySignalApportioning then var22(p21, p23) else p21
						
						if not getSingleGridApportioningMetadata(p21, p22, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p23 else nil)(false) then
							local var63 = t_1[var62].get(false)
							local t = {}
							
							for i, v in var63 and var63.getGridApportioningMetadata(false) or {} do
								table.insert(t, v.sortIndex)
							end
							startingItemIndex = if #t > 0 then table.concat(t, ",") else "none"
							discoveryEventErrorLogger.reportError("ApportioningSortIndexNotFound", `Sort index {p22} not found in apportioning data for {var62}`, {
								apportioningKey = var62,
								sortIndex = p22,
								availableSortIndices = startingItemIndex
							})
						end
					end)
					
					return {}
				end
				startingItemIndex = var58.startingItemIndex
				local t = {}
				
				for i = startingItemIndex, math.min(startingItemIndex + var58.capacity - 1, #items) do
					table.insert(t, items[i])
				end
				return t
			end)
		end
	end
	return {
		getFirstItemCollectionWithFilter = getFirstItemCollectionWithFilter,
		getItemCollection = getItemCollection,
		getTemplates = var7,
		getDataUpdatedTimestamp = var9,
		getItemCollectionKeys = if fFlagSduiGetItemCollectionKeys then var11 else nil,
		updateApportioningCapacity = if fFlagLuaAppRfySignalApportioning then updateApportioningCapacity else nil,
		getSingleGridApportioningMetadata = if fFlagLuaAppRfySignalApportioning then getSingleGridApportioningMetadata else nil,
		getApportionedItems = if fFlagLuaAppRfySignalApportioning then getApportionedItems else nil,
		updateData = function(p25, p26)
			-- upvalues: var8 (ref), var10 (ref), setItemCollections (ref), fFlagSduiGetItemCollectionKeys (copy), var12 (write), fFlagLuaAppRfySignalApportioning (copy), setApportioningData (write), fFlagLuaAppAddRequestIdToRfySignalApportioning (copy)
			if p25.templates then
				var8(p25.templates)
			end
			if p25.dataUpdatedTimestamp then
				var10(p25.dataUpdatedTimestamp)
			end
			if p25.itemCollections then
				setItemCollections(p25.itemCollections)
				
				if fFlagSduiGetItemCollectionKeys then
					local t = {}
					
					for i in p25.itemCollections do
						table.insert(t, i)
					end
					var12(t)
				end
			end
			if fFlagLuaAppRfySignalApportioning and p25.apportioningData then
				setApportioningData(p25.apportioningData, if fFlagLuaAppAddRequestIdToRfySignalApportioning then p26 else nil)
			end
		end
	}
end