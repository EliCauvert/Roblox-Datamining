local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(ServerDrivenUi.DataStore.SduiFeedStoreTypes)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagLuaAppRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppRfySignalApportioning
local LuaAppNilApportionedItems = game:DefineFastFlag("LuaAppNilApportionedItems", false)
local FFlagLuaAppAddRequestIdToRfySignalApportioning = require(Parent.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning
local SduiCreateSduiFeedStoreLogDelayMsRatio = game:DefineFastInt("SduiCreateSduiFeedStoreLogDelayMs", 1000) / 1000

return function()
	-- upvalues: SignalsModule (copy), FFlagLuaAppRfySignalApportioning (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (copy), SduiCreateSduiFeedStoreLogDelayMsRatio (copy), DiscoveryEventErrorLogger (copy), LuaAppNilApportionedItems (copy)
	local t = {}
	local t1 = {}
	local t2 = {}
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal2_2 = nil
	local Signal3
	Signal3, Signal2_2 = SignalsModule.createSignal({})
	
	local function _(Key, p1)
		-- upvalues: SignalsModule (upval), t (copy)
		local Signal, Signal2 = SignalsModule.createSignal(p1)
		t[Key] = { get = Signal, set = Signal2 }
		
		return t[Key]
	end
	
	local function getItemCollection(Key, p1)
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			if p1 then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = { get = Signal, set = Signal2 }
				Entry = t[Key]
			else
				error(`createSduiFeedStore missing item collection for feedItemKey {Key}`)
			end
		end
		return Entry.get
	end
	
	local function getFirstItemCollectionWithFilter(Callback)
		-- upvalues: t (copy)
		for _, value in t do
			if Callback(value.get(false)) then
				return value.get
			end
		end
		return nil
	end
	
	local function setItemCollections(ItemCollections)
		-- upvalues: t (copy), SignalsModule (upval)
		for i, itemCollection in ItemCollections do
			if t[i] then
				t[i].set(itemCollection)
			else
				local Signal, Signal2 = SignalsModule.createSignal(itemCollection)
				t[i] = { get = Signal, set = Signal2 }
				local _ = t[i]
			end
		end
	end
	
	local Callback2: ((any, any) -> ())? = nil
	local UpdateApportioningCapacity: ((any, any, any, any) -> ())? = nil
	local Callback1: ((any, any, any) -> any)? = nil
	local GetApportionedItems: ((any, any, any) -> any)? = nil
	
	if FFlagLuaAppRfySignalApportioning then
		local Callback = if FFlagLuaAppAddRequestIdToRfySignalApportioning then function(Text, Text1)
			return if Text1 then Text .. "_" .. Text1 else Text
		end else nil
		
		local function createApportioningDataSignals(Key, p2, p3)
			-- upvalues: FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (copy), SignalsModule (upval), t1 (copy), t2 (copy)
			local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(Key, p3) else Key
			local Signal, Signal2 = SignalsModule.createSignal(p2.items)
			local Signal1, Signal2_1 = SignalsModule.createSignal(p2.gridApportioningMetadata)
			local Signal3, Signal2_2 = SignalsModule.createSignal({
				isCapacityUpdateScheduled = false,
				capacityUpdateCoroutine = nil,
				getItems = Signal,
				setItems = Signal2,
				getGridApportioningMetadata = Signal1,
				setGridApportioningMetadata = Signal2_1,
				scheduledCapacityUpdates = {}
			})
			t1[CallbackResult] = { get = Signal3, set = Signal2_2 }
			
			if FFlagLuaAppAddRequestIdToRfySignalApportioning then
				local PreviousKey = t2[Key] and t2[Key].previousKey
				local CurrentKey = t2[Key] and t2[Key].currentKey
				
				if PreviousKey then
					t1[PreviousKey] = nil
				end
				t2[Key] = { previousKey = CurrentKey, currentKey = CallbackResult }
			end
		end
		
		local function v26(p2, p3)
			-- upvalues: FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (copy), t1 (copy), createApportioningDataSignals (copy)
			local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(p2, p3) else p2
			
			if not t1[CallbackResult] then
				createApportioningDataSignals(p2, { items = {}, gridApportioningMetadata = {} }, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p3 else nil)
			end
			return t1[CallbackResult].get
		end
		
		Callback2 = function(ApportioningData, p2)
			-- upvalues: FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (copy), t1 (copy), createApportioningDataSignals (copy)
			for i, value in ApportioningData do
				local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(i, p2) else i
				
				if t1[CallbackResult] then
					local GetResult = t1[CallbackResult].get(false)
					GetResult.setItems(value.items)
					GetResult.setGridApportioningMetadata(value.gridApportioningMetadata)
					GetResult.scheduledCapacityUpdates = {}
					GetResult.isCapacityUpdateScheduled = false
					
					if GetResult.capacityUpdateCoroutine then
						task.cancel(GetResult.capacityUpdateCoroutine)
						GetResult.capacityUpdateCoroutine = nil
					end
				else
					createApportioningDataSignals(i, value, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p2 else nil)
				end
			end
		end
		
		local function updateGridApportioningMetadata(p3, p4)
			-- upvalues: v26 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (copy), SduiCreateSduiFeedStoreLogDelayMsRatio (upval), t1 (copy), DiscoveryEventErrorLogger (upval)
			local v1 = v26(p3, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p4 else nil)(false)
			local GridApportioningMetadata = v1.getGridApportioningMetadata(false)
			local ScheduledCapacityUpdates = v1.scheduledCapacityUpdates
			
			if #GridApportioningMetadata == 0 then
				local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(p3, p4) else p3
				task.delay(SduiCreateSduiFeedStoreLogDelayMsRatio, function()
					-- upvalues: t1 (upval), CallbackResult (copy), DiscoveryEventErrorLogger (upval)
					local GetResult = t1[CallbackResult].get(false)
					
					if #(GetResult and GetResult.getGridApportioningMetadata(false) or {}) == 0 then
						DiscoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {CallbackResult} in updateGridApportioningMetadata`, { apportioningKey = CallbackResult })
					end
				end)
				
				return
			end
			local StartingItemIndex = 1
			local List = {}
			
			for _, value in GridApportioningMetadata do
				local ScheduledCapacityUpdate = if ScheduledCapacityUpdates[value.sortIndex] then ScheduledCapacityUpdates[value.sortIndex] else value.capacity
				table.insert(List, {
					sortIndex = value.sortIndex,
					startingItemIndex = StartingItemIndex,
					capacity = ScheduledCapacityUpdate
				})
				StartingItemIndex += ScheduledCapacityUpdate
			end
			v1.setGridApportioningMetadata(List)
		end
		
		UpdateApportioningCapacity = function(p5, p6, p7, p8)
			-- upvalues: v26 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), updateGridApportioningMetadata (copy)
			local v2 = v26(p5, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p8 else nil)(false)
			v2.scheduledCapacityUpdates[p6] = p7
			
			if not v2.isCapacityUpdateScheduled then
				v2.isCapacityUpdateScheduled = true
				v2.capacityUpdateCoroutine = task.defer(function()
					-- upvalues: updateGridApportioningMetadata (upval), p5 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), p8 (copy), v2 (copy)
					updateGridApportioningMetadata(p5, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p8 else nil)
					v2.scheduledCapacityUpdates = {}
					v2.isCapacityUpdateScheduled = false
					v2.capacityUpdateCoroutine = nil
				end)
			end
		end
		
		Callback1 = function(p5, SortIndex, p6)
			-- upvalues: SignalsModule (upval), v26 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), SduiCreateSduiFeedStoreLogDelayMsRatio (upval), Callback (copy), t1 (copy), DiscoveryEventErrorLogger (upval)
			return SignalsModule.createComputed(function(p7)
				-- upvalues: v26 (upval), p5 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), p6 (copy), SduiCreateSduiFeedStoreLogDelayMsRatio (upval), Callback (upval), t1 (upval), DiscoveryEventErrorLogger (upval), SortIndex (copy)
				local GridApportioningMetadata = v26(p5, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p6 else nil)(p7).getGridApportioningMetadata(p7)
				
				if #GridApportioningMetadata == 0 then
					task.delay(SduiCreateSduiFeedStoreLogDelayMsRatio, function()
						-- upvalues: FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (upval), p5 (upval), p6 (upval), t1 (upval), DiscoveryEventErrorLogger (upval), SortIndex (upval)
						local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(p5, p6) else p5
						local GetResult = t1[CallbackResult].get(false)
						
						if #(GetResult and GetResult.getGridApportioningMetadata(false) or {}) == 0 then
							DiscoveryEventErrorLogger.reportError("ApportioningEmptyGridMetadata", `Apportioning grid metadata is empty for {CallbackResult} in getSingleGridApportioningMetadata`, { apportioningKey = CallbackResult, sortIndex = SortIndex })
						end
					end)
					
					return nil
				end
				for _, value in GridApportioningMetadata do
					if value.sortIndex == SortIndex then
						return value
					end
				end
				return nil
			end)
		end
		
		GetApportionedItems = function(p8, SortIndex, p9)
			-- upvalues: SignalsModule (upval), v26 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback1 (ref), Callback (copy), SduiCreateSduiFeedStoreLogDelayMsRatio (upval), t1 (copy), DiscoveryEventErrorLogger (upval), LuaAppNilApportionedItems (upval)
			return SignalsModule.createComputed(function(p10)
				-- upvalues: v26 (upval), p8 (copy), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), p9 (copy), Callback1 (upval), SortIndex (copy), Callback (upval), SduiCreateSduiFeedStoreLogDelayMsRatio (upval), t1 (upval), DiscoveryEventErrorLogger (upval), LuaAppNilApportionedItems (upval)
				local v2 = v26(p8, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)(p10)
				local Items = v2.getItems(p10)
				local v3 = Callback1(p8, SortIndex, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)(p10)
				
				if #Items == 0 and #v2.getGridApportioningMetadata(false) == 0 then
					local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(p8, p9) else p8
					task.delay(SduiCreateSduiFeedStoreLogDelayMsRatio, function()
						-- upvalues: t1 (upval), CallbackResult (copy), DiscoveryEventErrorLogger (upval), SortIndex (upval)
						local GetResult = t1[CallbackResult].get(false)
						local GridApportioningMetadata = GetResult and GetResult.getGridApportioningMetadata(false) or {}
						
						if #(GetResult and GetResult.getItems(false) or {}) == 0 and #GridApportioningMetadata == 0 then
							DiscoveryEventErrorLogger.reportError("ApportioningEmptyData", `All apportioning data is empty for {CallbackResult} in getApportionedItems`, { apportioningKey = CallbackResult, sortIndex = SortIndex })
						end
					end)
					
					return if LuaAppNilApportionedItems then nil else {}
				end
				if not v3 then
					local Joined = nil
					task.delay(SduiCreateSduiFeedStoreLogDelayMsRatio, function()
						-- upvalues: FFlagLuaAppAddRequestIdToRfySignalApportioning (upval), Callback (upval), p8 (upval), p9 (upval), Callback1 (upval), SortIndex (upval), t1 (upval), Joined (ref), DiscoveryEventErrorLogger (upval)
						local CallbackResult = if FFlagLuaAppAddRequestIdToRfySignalApportioning then Callback(p8, p9) else p8
						
						if not Callback1(p8, SortIndex, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p9 else nil)(false) then
							local GetResult = t1[CallbackResult].get(false)
							local List = {}
							
							for _, value in GetResult and GetResult.getGridApportioningMetadata(false) or {} do
								table.insert(List, value.sortIndex)
							end
							Joined = if #List > 0 then table.concat(List, ",") else "none"
							DiscoveryEventErrorLogger.reportError("ApportioningSortIndexNotFound", `Sort index {SortIndex} not found in apportioning data for {CallbackResult}`, {
								apportioningKey = CallbackResult,
								sortIndex = SortIndex,
								availableSortIndices = Joined
							})
						end
					end)
					
					return {}
				end
				local Joined = v3.startingItemIndex
				local List = {}
				
				for i = Joined, math.min(Joined + v3.capacity - 1, #Items) do
					table.insert(List, Items[i])
				end
				return List
			end)
		end
	end
	return {
		getFirstItemCollectionWithFilter = getFirstItemCollectionWithFilter,
		getItemCollection = getItemCollection,
		getTemplates = Signal,
		getDataUpdatedTimestamp = Signal1,
		getItemCollectionKeys = Signal3,
		updateApportioningCapacity = if FFlagLuaAppRfySignalApportioning then UpdateApportioningCapacity else nil,
		getSingleGridApportioningMetadata = if FFlagLuaAppRfySignalApportioning then Callback1 else nil,
		getApportionedItems = if FFlagLuaAppRfySignalApportioning then GetApportionedItems else nil,
		updateData = function(p11, p12)
			-- upvalues: Signal2 (copy), Signal2_1 (copy), setItemCollections (copy), Signal2_2 (ref), FFlagLuaAppRfySignalApportioning (upval), Callback2 (ref), FFlagLuaAppAddRequestIdToRfySignalApportioning (upval)
			if p11.templates then
				Signal2(p11.templates)
			end
			if p11.dataUpdatedTimestamp then
				Signal2_1(p11.dataUpdatedTimestamp)
			end
			if p11.itemCollections then
				setItemCollections(p11.itemCollections)
				local List = {}
				
				for itemCollection in p11.itemCollections do
					table.insert(List, itemCollection)
				end
				Signal2_2(List)
			end
			if FFlagLuaAppRfySignalApportioning and p11.apportioningData then
				Callback2(p11.apportioningData, if FFlagLuaAppAddRequestIdToRfySignalApportioning then p12 else nil)
			end
		end
	}
end