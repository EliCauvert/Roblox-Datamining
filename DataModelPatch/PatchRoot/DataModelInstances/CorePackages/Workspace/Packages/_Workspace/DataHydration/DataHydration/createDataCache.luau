local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local LuaAppDataCacheBatch = game:DefineFastFlag("LuaAppDataCacheBatch", false)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDataHydrationSanitizeItem = SharedFlagsModule.FFlagLuaAppDataHydrationSanitizeItem
local FFlagLuaAppDataHydrationOptimisticMutationLayer = SharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local LuaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local LuaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p1, p2, p3)
	-- upvalues: LuaAppDefaultDataTtlSec (copy), LuaAppDefaultFailedDataTtlSec (copy), FFlagLuaAppDataHydrationSanitizeItem (copy), SignalsModule (copy), DataStatus (copy), LuaAppDataCacheBatch (copy), SignalsExperimentalModule (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (copy), CryoModule (copy), GetLocalPlayerUserIdFunction (copy), Players (copy)
	local P0 = p1 or LuaAppDefaultDataTtlSec
	local P1 = p2 or LuaAppDefaultFailedDataTtlSec
	local SanitizeItem = if FFlagLuaAppDataHydrationSanitizeItem and p3 then p3.sanitizeItem else nil
	local t = {}
	local t1 = {}
	local t2 = {}
	local NewClockTimes = {}
	
	local function getOrCreateSignals(Key)
		-- upvalues: t (ref), t1 (ref), SignalsModule (upval), t2 (ref), DataStatus (upval)
		if t[Key] == nil or t1[Key] == nil then
			t[Key] = {}
			t[Key].data, t1[Key] = SignalsModule.createSignal(nil)
			t[Key].status, t2[Key] = SignalsModule.createSignal(DataStatus.NotReady)
		end
		return t[Key], t1[Key]
	end
	
	local function getItem(p4, Callback)
		-- upvalues: getOrCreateSignals (copy), NewClockTimes (ref), DataStatus (upval)
		local OrCreateSignals = getOrCreateSignals(p4)
		local Flag = true
		
		if NewClockTimes[p4] and os.clock() < NewClockTimes[p4] then
			local DataResult = OrCreateSignals.data(false)
			local StatusResult = OrCreateSignals.status(false)
			
			if DataResult ~= nil or StatusResult == DataStatus.Failed then
				if Callback then
					return OrCreateSignals, (Callback(DataResult))
				end
				Flag = false
			end
		end
		return OrCreateSignals, Flag
	end
	
	local function getItems(List, p4)
		-- upvalues: getItem (copy)
		local t = {}
		local t3 = {}
		
		if not List then
			return t, t3
		end
		for _, value in List do
			t[value], t3[value] = getItem(value, p4)
		end
		return t, t3
	end
	
	local function replaceItems(List)
		-- upvalues: P0 (copy), LuaAppDataCacheBatch (upval), getOrCreateSignals (copy), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), SignalsExperimentalModule (upval)
		local NewClockTime = os.clock() + P0
		
		if LuaAppDataCacheBatch then
			SignalsExperimentalModule.batch(function()
				-- upvalues: List (copy), getOrCreateSignals (upval), SanitizeItem (upval), t2 (upval), DataStatus (upval), NewClockTimes (upval), NewClockTime (copy)
				for i, value in List do
					local _, OrCreateSignals2 = getOrCreateSignals(i)
					OrCreateSignals2(if SanitizeItem then SanitizeItem(value) else value)
					t2[i](DataStatus.Ready)
					NewClockTimes[i] = NewClockTime
				end
			end)
			
			return
		end
		for i, value in List do
			local _, OrCreateSignals2 = getOrCreateSignals(i)
			OrCreateSignals2(if SanitizeItem then SanitizeItem(value) else value)
			t2[i](DataStatus.Ready)
			NewClockTimes[i] = NewClockTime
		end
	end
	
	local function updateItems(List)
		-- upvalues: P0 (copy), LuaAppDataCacheBatch (upval), getOrCreateSignals (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), CryoModule (upval), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), SignalsExperimentalModule (upval)
		local NewClockTime = os.clock() + P0
		
		if LuaAppDataCacheBatch then
			SignalsExperimentalModule.batch(function()
				-- upvalues: List (copy), getOrCreateSignals (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), CryoModule (upval), SanitizeItem (upval), t2 (upval), DataStatus (upval), NewClockTimes (upval), NewClockTime (copy)
				for i, value in List do
					local OrCreateSignals, OrCreateSignals2 = getOrCreateSignals(i)
					local DataResult = OrCreateSignals.data(false)
					local JoinResult = if DataResult and type(DataResult) == "table" and type(value) == "table" then if FFlagLuaAppDataHydrationOptimisticMutationLayer then CryoModule.Dictionary.join(DataResult, value) else CryoModule.Dictionary.union(DataResult, value) else value
					OrCreateSignals2(if SanitizeItem then SanitizeItem(JoinResult) else JoinResult)
					t2[i](DataStatus.Ready)
					NewClockTimes[i] = NewClockTime
				end
			end)
			
			return
		end
		for i, value in List do
			local OrCreateSignals, OrCreateSignals2 = getOrCreateSignals(i)
			local DataResult = OrCreateSignals.data(false)
			local JoinResult = if DataResult and type(DataResult) == "table" and type(value) == "table" then if FFlagLuaAppDataHydrationOptimisticMutationLayer then CryoModule.Dictionary.join(DataResult, value) else CryoModule.Dictionary.union(DataResult, value) else value
			OrCreateSignals2(if SanitizeItem then SanitizeItem(JoinResult) else JoinResult)
			t2[i](DataStatus.Ready)
			NewClockTimes[i] = NewClockTime
		end
	end
	
	local function updateItem(Key, p5)
		-- upvalues: getOrCreateSignals (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), CryoModule (upval), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), P0 (copy)
		local OrCreateSignals, OrCreateSignals2 = getOrCreateSignals(Key)
		local DataResult = OrCreateSignals.data(false)
		local JoinResult = if DataResult and type(DataResult) == "table" and type(p5) == "table" then if FFlagLuaAppDataHydrationOptimisticMutationLayer then CryoModule.Dictionary.join(DataResult, p5) else CryoModule.Dictionary.union(DataResult, p5) else p5
		OrCreateSignals2(if SanitizeItem then SanitizeItem(JoinResult) else JoinResult)
		t2[Key](DataStatus.Ready)
		NewClockTimes[Key] = os.clock() + P0
	end
	
	local function replaceItem(Key, p5)
		-- upvalues: getOrCreateSignals (copy), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), P0 (copy)
		local _, OrCreateSignals2 = getOrCreateSignals(Key)
		OrCreateSignals2(if SanitizeItem then SanitizeItem(p5) else p5)
		t2[Key](DataStatus.Ready)
		NewClockTimes[Key] = os.clock() + P0
	end
	
	local function resetFailedItem(p5)
		-- upvalues: t (ref), DataStatus (upval), t2 (ref)
		local Entry = t[p5]
		
		if Entry and Entry.status(false) == DataStatus.Failed then
			t2[p5](DataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(List)
		-- upvalues: t (ref), DataStatus (upval), t2 (ref)
		for _, value in List do
			local Entry = t[value]
			
			if Entry and Entry.status(false) == DataStatus.Failed then
				t2[value](DataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(List)
		-- upvalues: P1 (copy), LuaAppDataCacheBatch (upval), t2 (ref), DataStatus (upval), NewClockTimes (ref), SignalsExperimentalModule (upval)
		local NewClockTime = os.clock() + P1
		
		if LuaAppDataCacheBatch then
			SignalsExperimentalModule.batch(function()
				-- upvalues: List (copy), t2 (upval), DataStatus (upval), NewClockTimes (upval), NewClockTime (copy)
				for _, value in List do
					if t2[value] then
						t2[value](DataStatus.Failed)
					end
					NewClockTimes[value] = NewClockTime
				end
			end)
			
			return
		end
		for _, value in List do
			if t2[value] then
				t2[value](DataStatus.Failed)
			end
			NewClockTimes[value] = NewClockTime
		end
	end
	
	local function clear()
		-- upvalues: NewClockTimes (ref), t (ref), t3 (ref), t2 (ref)
		NewClockTimes = {}
		t = {}
		t3 = {}
		t2 = {}
	end
	
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), clear (copy)
		local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
		
		if LocalPlayerUserId1 ~= LocalPlayerUserId then
			LocalPlayerUserId = LocalPlayerUserId1
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
			-- upvalues: Connection (ref), clear (copy)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			clear()
		end
	}
end