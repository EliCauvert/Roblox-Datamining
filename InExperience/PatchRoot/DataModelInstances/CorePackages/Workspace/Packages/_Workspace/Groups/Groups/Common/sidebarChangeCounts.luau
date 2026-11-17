local Parent = script:FindFirstAncestor("Groups").Parent
local DataHydrationModule = require(Parent.DataHydration)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SignalsModule = require(Parent.Signals)
local Tbl = {}
local Signal, Signal2 = SignalsModule.createSignal(0)
local Tbl1 = {}

local function _()
	-- upvalues: DataHydrationModule (copy)
	return DataHydrationModule.Group.getGroupInfoStore(false).membershipChangeCount(false)
end

return {
	isOutdated = function(p1): boolean
		-- upvalues: Tbl (copy), DataHydrationModule (copy)
		local Entry = Tbl[p1]
		
		return Entry ~= nil and Entry ~= DataHydrationModule.Group.getGroupInfoStore(false).membershipChangeCount(false)
	end,
	countForRequest = function(p1)
		-- upvalues: SduiSharedUtilitiesModule (copy), DataHydrationModule (copy)
		return if SduiSharedUtilitiesModule.getSduiApiStore().isInFlight(p1) then nil else DataHydrationModule.Group.getGroupInfoStore(false).membershipChangeCount(false)
	end,
	markFetched = function(Key, p1)
		-- upvalues: Tbl (copy)
		if p1 ~= nil then
			Tbl[Key] = p1
		end
	end,
	getRefreshCount = Signal,
	markRefreshed = function()
		-- upvalues: Signal2 (copy), Signal (copy)
		Signal2(Signal(false) + 1)
	end,
	missedRefresh = function(p1): boolean
		-- upvalues: Tbl1 (copy), Signal (copy)
		local Entry = Tbl1[p1]
		
		return Entry ~= nil and Entry ~= Signal(false)
	end,
	countForLoad = function(Key)
		-- upvalues: Tbl1 (copy), SduiSharedUtilitiesModule (copy), Signal (copy)
		if Tbl1[Key] == nil then
			Tbl1[Key] = -1
		end
		return if SduiSharedUtilitiesModule.getSduiApiStore().isInFlight(Key) then nil else Signal(false)
	end,
	markLoaded = function(Key, p1)
		-- upvalues: Tbl1 (copy)
		if p1 ~= nil then
			Tbl1[Key] = p1
		end
	end,
	resetForTests = function()
		-- upvalues: Tbl (copy), Tbl1 (copy), Signal2 (copy)
		table.clear(Tbl)
		table.clear(Tbl1)
		Signal2(0)
	end
}