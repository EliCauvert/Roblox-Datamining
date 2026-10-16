local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local GetLocalPlayerUserIdFunction = DataHydrationUtilsModule.getLocalPlayerUserId
local ObserveLocalPlayerUserIdFunction = DataHydrationUtilsModule.observeLocalPlayerUserId
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMigrateGameInfoToStore = SharedFlagsModule.FFlagMigrateGameInfoToStore
local FFlagDataHydrationAccountReset = SharedFlagsModule.FFlagDataHydrationAccountReset
local FFlagDataHydrationStaleTime = SharedFlagsModule.FFlagDataHydrationStaleTime
local FFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(DataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local LuaAppDefaultDataTtlSec = game:DefineFastInt("LuaAppDefaultDataTtlSec", 3600)
local LuaAppDefaultFailedDataTtlSec = game:DefineFastInt("LuaAppDefaultFailedDataTtlSec", 60)

return function(p1, p2, p3) --[[ Line: 33 | Named "createDataCache" ]]
	-- upvalues: LuaAppDefaultDataTtlSec (copy), LuaAppDefaultFailedDataTtlSec (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), SignalsModule (copy), DataStatus (copy), FFlagDataHydrationStaleTime (copy), SignalsExperimentalModule (copy), CryoModule (copy), FFlagMigrateGameInfoToStore (copy), FFlagDataHydrationAccountReset (copy), GetLocalPlayerUserIdFunction (copy), ObserveLocalPlayerUserIdFunction (copy), Players (copy)
	local P0 = p1 or LuaAppDefaultDataTtlSec
	local P1 = p2 or LuaAppDefaultFailedDataTtlSec
	local SanitizeItem = if p3 then p3.sanitizeItem else nil
	local TtlSecondsForItem = if FFlagDataHydrationPreserveIncompleteCatalogResultsModule and p3 then p3.ttlSecondsForItem else nil
	local t = {}
	local t1 = {}
	local t2 = {}
	local NewClockTimes = {}
	local ClockTimes = {}
	
	local function _(p4, p5) --[[ Line: 50 | Named "expiryFor" ]]
		-- upvalues: TtlSecondsForItem (copy), P0 (copy)
		return if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(p4) or P0) else p5
	end
	
	local function getOrCreateSignals(Key) --[[ Line: 54 ]]
		-- upvalues: t (ref), t1 (ref), SignalsModule (upval), t2 (ref), DataStatus (upval)
		if t[Key] == nil or t1[Key] == nil then
			t[Key] = {}
			t[Key].data, t1[Key] = SignalsModule.createSignal(nil)
			t[Key].status, t2[Key] = SignalsModule.createSignal(DataStatus.NotReady)
		end
		return t[Key], t1[Key]
	end
	
	local function getItem(p4, Callback, p5) --[[ Line: 66 ]]
		-- upvalues: getOrCreateSignals (copy), FFlagDataHydrationStaleTime (upval), DataStatus (upval), ClockTimes (ref), NewClockTimes (ref)
		local OrCreateSignals = getOrCreateSignals(p4)
		
		if FFlagDataHydrationStaleTime and p5 ~= nil then
			local DataResult = OrCreateSignals.data(false)
			
			if OrCreateSignals.status(false) ~= DataStatus.Failed then
				local ClockTime = ClockTimes[p4]
				local IsClockTimeBelow: boolean = DataResult ~= nil and (ClockTime ~= nil and p5 > os.clock() - ClockTime)
				
				if IsClockTimeBelow and Callback then
					return OrCreateSignals, Callback(DataResult)
				else
					return OrCreateSignals, not IsClockTimeBelow
				end
			end
		end
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
	
	local function getItems(List, p4, p5) --[[ Line: 106 ]]
		-- upvalues: getItem (copy)
		local t = {}
		local t3 = {}
		
		if not List then
			return t, t3
		end
		for _, value in List do
			t[value], t3[value] = getItem(value, p4, p5)
		end
		return t, t3
	end
	
	local function replaceItems(p6) --[[ Line: 126 ]]
		-- upvalues: P0 (copy), getOrCreateSignals (copy), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), TtlSecondsForItem (copy), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), SignalsExperimentalModule (upval)
		local ClockTime = os.clock()
		local NewClockTime = ClockTime + P0
		SignalsExperimentalModule.batch(function() --[[ Line: 129 | Named "batchUpdate" ]]
			-- upvalues: p6 (copy), getOrCreateSignals (upval), SanitizeItem (upval), t2 (upval), DataStatus (upval), NewClockTimes (upval), NewClockTime (copy), TtlSecondsForItem (upval), P0 (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), ClockTime (copy)
			for i, value in p6 do
				local _, OrCreateSignals2 = getOrCreateSignals(i)
				OrCreateSignals2(if SanitizeItem then SanitizeItem(value) else value)
				t2[i](DataStatus.Ready)
				NewClockTimes[i] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(value) or P0) else NewClockTime
				
				if FFlagDataHydrationStaleTime then
					ClockTimes[i] = ClockTime
				end
			end
		end)
	end
	
	local function updateItems(p7, Enabled) --[[ Line: 143 ]]
		-- upvalues: P0 (copy), getOrCreateSignals (copy), CryoModule (upval), SanitizeItem (copy), t2 (ref), DataStatus (upval), FFlagMigrateGameInfoToStore (upval), NewClockTimes (ref), TtlSecondsForItem (copy), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), SignalsExperimentalModule (upval)
		local ClockTime = os.clock()
		local NewClockTime = ClockTime + P0
		SignalsExperimentalModule.batch(function() --[[ Line: 146 | Named "batchUpdate" ]]
			-- upvalues: p7 (copy), getOrCreateSignals (upval), CryoModule (upval), SanitizeItem (upval), t2 (upval), DataStatus (upval), FFlagMigrateGameInfoToStore (upval), Enabled (copy), NewClockTimes (upval), NewClockTime (copy), TtlSecondsForItem (upval), P0 (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), ClockTime (copy)
			for i, value in p7 do
				local OrCreateSignals, OrCreateSignals2 = getOrCreateSignals(i)
				local DataResult = OrCreateSignals.data(false)
				local JoinResult = if DataResult and type(DataResult) == "table" and type(value) == "table" then CryoModule.Dictionary.join(DataResult, value) else value
				OrCreateSignals2(if SanitizeItem then SanitizeItem(JoinResult) else JoinResult)
				t2[i](DataStatus.Ready)
				
				if not FFlagMigrateGameInfoToStore then
					NewClockTimes[i] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(JoinResult) or P0) else NewClockTime
					
					if FFlagDataHydrationStaleTime then
						ClockTimes[i] = ClockTime
					end
				elseif Enabled ~= false then
					NewClockTimes[i] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(JoinResult) or P0) else NewClockTime
					
					if FFlagDataHydrationStaleTime then
						ClockTimes[i] = ClockTime
					end
				end
			end
		end)
	end
	
	local function updateItem(Key, p8, Enabled) --[[ Line: 177 ]]
		-- upvalues: getOrCreateSignals (copy), CryoModule (upval), SanitizeItem (copy), t2 (ref), DataStatus (upval), FFlagMigrateGameInfoToStore (upval), NewClockTimes (ref), P0 (copy), TtlSecondsForItem (copy), FFlagDataHydrationStaleTime (upval), ClockTimes (ref)
		local OrCreateSignals, OrCreateSignals2 = getOrCreateSignals(Key)
		local DataResult = OrCreateSignals.data(false)
		local JoinResult = if DataResult and type(DataResult) == "table" and type(p8) == "table" then CryoModule.Dictionary.join(DataResult, p8) else p8
		OrCreateSignals2(if SanitizeItem then SanitizeItem(JoinResult) else JoinResult)
		t2[Key](DataStatus.Ready)
		
		if not FFlagMigrateGameInfoToStore then
			local NewClockTime = os.clock() + P0
			NewClockTimes[Key] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(JoinResult) or P0) else NewClockTime
			
			if FFlagDataHydrationStaleTime then
				ClockTimes[Key] = os.clock()
			end
		elseif Enabled ~= false then
			local NewClockTime = os.clock() + P0
			NewClockTimes[Key] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(JoinResult) or P0) else NewClockTime
			
			if FFlagDataHydrationStaleTime then
				ClockTimes[Key] = os.clock()
				
				return
			end
		end
	end
	
	local function replaceItem(Key, p8) --[[ Line: 203 ]]
		-- upvalues: getOrCreateSignals (copy), SanitizeItem (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), P0 (copy), TtlSecondsForItem (copy), FFlagDataHydrationStaleTime (upval), ClockTimes (ref)
		local _, OrCreateSignals2 = getOrCreateSignals(Key)
		OrCreateSignals2(if SanitizeItem then SanitizeItem(p8) else p8)
		t2[Key](DataStatus.Ready)
		local NewClockTime = os.clock() + P0
		NewClockTimes[Key] = if TtlSecondsForItem then os.clock() + (TtlSecondsForItem(p8) or P0) else NewClockTime
		
		if FFlagDataHydrationStaleTime then
			ClockTimes[Key] = os.clock()
		end
	end
	
	local function resetFailedItem(p8) --[[ Line: 217 ]]
		-- upvalues: t (ref), DataStatus (upval), t2 (ref)
		local Entry = t[p8]
		
		if Entry and Entry.status(false) == DataStatus.Failed then
			t2[p8](DataStatus.NotReady)
		end
	end
	
	local function resetFailedItems(List) --[[ Line: 224 ]]
		-- upvalues: t (ref), DataStatus (upval), t2 (ref)
		for _, value in List do
			local Entry = t[value]
			
			if Entry and Entry.status(false) == DataStatus.Failed then
				t2[value](DataStatus.NotReady)
			end
		end
	end
	
	local function markItemsAsFailed(p8) --[[ Line: 230 ]]
		-- upvalues: P1 (copy), t2 (ref), DataStatus (upval), NewClockTimes (ref), SignalsExperimentalModule (upval)
		local NewClockTime = os.clock() + P1
		SignalsExperimentalModule.batch(function() --[[ Line: 232 | Named "batchUpdate" ]]
			-- upvalues: p8 (copy), t2 (upval), DataStatus (upval), NewClockTimes (upval), NewClockTime (copy)
			for _, value in p8 do
				if t2[value] then
					t2[value](DataStatus.Failed)
				end
				NewClockTimes[value] = NewClockTime
			end
		end)
	end
	
	local function releaseEntries() --[[ Line: 243 ]]
		-- upvalues: NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref)
		NewClockTimes = {}
		
		if FFlagDataHydrationStaleTime then
			ClockTimes = {}
		end
		t = {}
		t3 = {}
		t2 = {}
	end
	
	local _ = function() --[[ Line: 254 | Named "invalidateEntries" ]]
		-- upvalues: SignalsExperimentalModule (upval), NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref), DataStatus (upval)
		SignalsExperimentalModule.batch(function() --[[ Line: 255 ]]
			-- upvalues: NewClockTimes (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), t (upval), t3 (upval), t2 (upval), DataStatus (upval)
			table.clear(NewClockTimes)
			
			if FFlagDataHydrationStaleTime then
				table.clear(ClockTimes)
			end
			for i in t do
				t3[i](nil)
				t2[i](DataStatus.NotReady)
			end
		end)
	end
	
	local function clear() --[[ Line: 267 ]]
		-- upvalues: FFlagDataHydrationAccountReset (upval), SignalsExperimentalModule (upval), NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref), DataStatus (upval), releaseEntries (copy)
		if FFlagDataHydrationAccountReset then
			SignalsExperimentalModule.batch(function() --[[ Line: 255 ]]
				-- upvalues: NewClockTimes (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), t (upval), t3 (upval), t2 (upval), DataStatus (upval)
				table.clear(NewClockTimes)
				
				if FFlagDataHydrationStaleTime then
					table.clear(ClockTimes)
				end
				for i in t do
					t3[i](nil)
					t2[i](DataStatus.NotReady)
				end
			end)
			
			return
		else
			releaseEntries()
		end
	end
	
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local Connection = nil
	local Callback = nil
	
	if FFlagDataHydrationAccountReset then
		if not p3 or p3.observeLocalUser == nil or p3.observeLocalUser then
			Callback = ObserveLocalPlayerUserIdFunction(function(p9) --[[ Line: 281 ]]
				-- upvalues: LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), SignalsExperimentalModule (upval), NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref), DataStatus (upval), releaseEntries (copy)
				LocalPlayerUserId = p9
				
				if FFlagDataHydrationAccountReset then
					SignalsExperimentalModule.batch(function() --[[ Line: 255 ]]
						-- upvalues: NewClockTimes (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), t (upval), t3 (upval), t2 (upval), DataStatus (upval)
						table.clear(NewClockTimes)
						
						if FFlagDataHydrationStaleTime then
							table.clear(ClockTimes)
						end
						for i in t do
							t3[i](nil)
							t2[i](DataStatus.NotReady)
						end
					end)
					
					return
				else
					releaseEntries()
				end
			end)
		end
	else
		Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 287 ]]
			-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), SignalsExperimentalModule (upval), NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref), DataStatus (upval), releaseEntries (copy)
			local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId1 ~= LocalPlayerUserId then
				LocalPlayerUserId = LocalPlayerUserId1
				
				if FFlagDataHydrationAccountReset then
					SignalsExperimentalModule.batch(function() --[[ Line: 255 ]]
						-- upvalues: NewClockTimes (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), t (upval), t3 (upval), t2 (upval), DataStatus (upval)
						table.clear(NewClockTimes)
						
						if FFlagDataHydrationStaleTime then
							table.clear(ClockTimes)
						end
						for i in t do
							t3[i](nil)
							t2[i](DataStatus.NotReady)
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
		dispose = function() --[[ Line: 296 ]]
			-- upvalues: FFlagDataHydrationAccountReset (upval), Callback (ref), releaseEntries (copy), Connection (ref), SignalsExperimentalModule (upval), NewClockTimes (ref), FFlagDataHydrationStaleTime (upval), ClockTimes (ref), t (ref), t3 (ref), t2 (ref), DataStatus (upval)
			if FFlagDataHydrationAccountReset then
				if Callback then
					Callback()
					Callback = nil
				end
				releaseEntries()
				
				return
			else
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
				if FFlagDataHydrationAccountReset then
					SignalsExperimentalModule.batch(function() --[[ Line: 255 ]]
						-- upvalues: NewClockTimes (upval), FFlagDataHydrationStaleTime (upval), ClockTimes (upval), t (upval), t3 (upval), t2 (upval), DataStatus (upval)
						table.clear(NewClockTimes)
						
						if FFlagDataHydrationStaleTime then
							table.clear(ClockTimes)
						end
						for i in t do
							t3[i](nil)
							t2[i](DataStatus.NotReady)
						end
					end)
					
					return
				else
					releaseEntries()
				end
			end
		end
	}
end