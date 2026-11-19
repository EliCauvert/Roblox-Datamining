local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local SignalsModule = require(Parent.Signals)
local StatusCodes = require(Parent.Http).StatusCodes
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local FFlagDataHydrationAccountReset = require(Parent.SharedFlags).FFlagDataHydrationAccountReset
local GamePassVoteDerivedFieldsModule = require(script.Parent.GamePassVoteDerivedFields)
local _ = require(script.Parent.GamePassVoteStoreTypes)
local RequestGamePassVoteModule = require(script.Parent.requestGamePassVote)

local function _(p1, p2): number
	return if p1 == p2 then 1 else 0
end

local function applyUserVote(DataResult, Enabled)
	return {
		totalUpVotes = math.max(0, DataResult.totalUpVotes - (if DataResult.userVote == true then 1 else 0) + (if Enabled == true then 1 else 0)),
		totalDownVotes = math.max(0, DataResult.totalDownVotes - (if DataResult.userVote == false then 1 else 0) + (if Enabled == false then 1 else 0)),
		userVote = Enabled
	}
end

return function(p1)
	-- upvalues: DataHydrationUtilsModule (copy), CreateDataCacheModule (copy), FFlagDataHydrationAccountReset (copy), SignalsModule (copy), applyUserVote (copy), RequestGamePassVoteModule (copy), StatusCodes (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), GamePassVoteDerivedFieldsModule (copy)
	local ObserveLocalPlayerUserId = p1 and p1.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId
	local DataCacheModule = CreateDataCacheModule(nil, nil, if FFlagDataHydrationAccountReset then { observeLocalUser = false } else nil)
	local t = {}
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local t1 = {}
	local Count = 0
	
	local function _(Key): number
		-- upvalues: t (copy)
		local v1 = (t[Key] or 0) + 1
		t[Key] = v1
		
		return v1
	end
	
	local _ = function(Key, p2, p3)
		-- upvalues: t1 (copy), Tbl2 (copy)
		if (t1[Key] or 0) < p3 then
			Tbl2[Key] = p2
			t1[Key] = p3
		end
	end
	
	local _ = function(p2)
		-- upvalues: Tbl2 (copy), Tbl1 (copy), DataCacheModule (copy)
		local Entry = Tbl2[p2]
		
		if Entry and not Tbl1[p2] then
			DataCacheModule.replaceItem(p2, Entry)
		end
	end
	
	local function updateGamePassVotes(List)
		-- upvalues: t (copy), t1 (copy), Tbl2 (copy), Tbl1 (copy), DataCacheModule (copy)
		local t2 = {}
		
		for i, value in List do
			local v1 = (t[i] or 0) + 1
			t[i] = v1
			
			if (t1[i] or 0) < v1 then
				Tbl2[i] = value
				t1[i] = v1
			end
			if not Tbl1[i] then
				t2[i] = value
			end
		end
		DataCacheModule.replaceItems(t2)
	end
	
	local function markGamePassVoteUnavailable(Key)
		-- upvalues: Tbl2 (copy), t1 (copy), t (copy), DataCacheModule (copy)
		Tbl2[Key] = nil
		local v2 = (t[Key] or 0) + 1
		t[Key] = v2
		t1[Key] = v2
		DataCacheModule.replaceItem(Key, nil)
	end
	
	local function updateUserVote(Key, UserVote, p2)
		-- upvalues: SignalsModule (upval), t (copy), Count (ref), Tbl (copy), Tbl1 (copy), Tbl2 (copy), DataCacheModule (copy), applyUserVote (upval), RequestGamePassVoteModule (upval), t1 (copy), StatusCodes (upval), LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		local v2 = (t[Key] or 0) + 1
		t[Key] = v2
		local Count1 = Count
		Tbl[Key] = v2
		Tbl1[Key] = true
		
		local function _()
			-- upvalues: Tbl (upval), Key (copy), v2 (copy), Tbl1 (upval), Tbl2 (upval), DataCacheModule (upval)
			if Tbl[Key] == v2 then
				Tbl1[Key] = nil
			end
			local Entry = Tbl2[Key]
			
			if Entry and not Tbl1[Key] then
				DataCacheModule.replaceItem(Key, Entry)
			end
		end
		
		local DataResult = DataCacheModule.getItem(Key).data(false)
		
		if DataResult and not p2 then
			DataCacheModule.replaceItem(Key, (applyUserVote(DataResult, UserVote)))
		end
		RequestGamePassVoteModule(Key, UserVote):andThen(function(Result)
			-- upvalues: Tbl (upval), Key (copy), v2 (copy), UserVote (copy), t (upval), t1 (upval), Tbl2 (upval), Tbl1 (upval), DataCacheModule (upval), Signal2 (copy)
			local config = {
				totalUpVotes = Result.upVotes,
				totalDownVotes = Result.downVotes,
				userVote = UserVote
			}
			local v3 = nil
			
			if Tbl[Key] == v2 then
				v3 = (t[Key] or 0) + 1
				t[Key] = v3
			else
				v3 = v2
			end
			if (t1[Key] or 0) < v3 then
				Tbl2[Key] = config
				t1[Key] = v3
			end
			if Tbl[Key] == v2 then
				Tbl1[Key] = nil
			end
			local Entry = Tbl2[Key]
			
			if Entry and not Tbl1[Key] then
				DataCacheModule.replaceItem(Key, Entry)
			end
			Signal2({ type = "success" })
		end, function(p3)
			-- upvalues: Tbl (upval), Key (copy), v2 (copy), StatusCodes (upval), LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval), Tbl1 (upval), Tbl2 (upval), DataCacheModule (upval), Count1 (copy), Count (upval), Signal2 (copy)
			local IsEntryMatch = Tbl[Key] == v2
			local IsRefused: boolean = type(p3) == "table" and p3.refused == true
			local StatusCode = if type(p3) == "table" then p3.StatusCode else nil
			local FloodCheckThresholdMet = if StatusCode == StatusCodes.TOO_MANY_REQUESTS then "FloodCheckThresholdMet" elseif type(p3) == "table" then p3.reasonForNotVoteable else nil
			
			if not IsRefused then
				LogResponseErrorFunction("voting-api/vote/game-pass", { StatusCode = StatusCode })
				DiscoveryEventErrorLogger.reportError("GamePassVoteStore", "Failed to update game pass vote", { gamePassId = Key, statusCode = StatusCode })
			end
			if Tbl[Key] == v2 then
				Tbl1[Key] = nil
			end
			local Entry = Tbl2[Key]
			
			if Entry and not Tbl1[Key] then
				DataCacheModule.replaceItem(Key, Entry)
			end
			if Count1 ~= Count then
				Signal2({ type = "superseded" })
				
				return
			end
			if IsRefused or IsEntryMatch then
				Signal2({
					type = "error",
					reasonForNotVoteable = FloodCheckThresholdMet
				})
				
				return
			else
				Signal2({ type = "superseded" })
			end
		end)
		
		return Signal
	end
	
	local function clear()
		-- upvalues: Count (ref), t (copy), t1 (copy), Tbl2 (copy), Tbl (copy), Tbl1 (copy), DataCacheModule (copy)
		Count += 1
		
		for i, value in t do
			t[i] = value + 1
			t1[i] = value + 1
		end
		table.clear(Tbl2)
		table.clear(Tbl)
		table.clear(Tbl1)
		DataCacheModule.clear()
	end
	
	local Callback = ObserveLocalPlayerUserId(clear)
	
	return {
		getGamePassVote = function(p2)
			-- upvalues: DataCacheModule (copy)
			return (DataCacheModule.getItem(p2))
		end,
		updateGamePassVotes = updateGamePassVotes,
		markGamePassVoteUnavailable = markGamePassVoteUnavailable,
		updateUserVote = updateUserVote,
		calculateDerivedField = GamePassVoteDerivedFieldsModule.calculateDerivedField,
		clear = clear,
		dispose = function()
			-- upvalues: Callback (copy), DataCacheModule (copy)
			Callback()
			DataCacheModule.dispose()
		end
	}
end