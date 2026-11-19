local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local PlaytestersRequestsModule = require(script.Parent.playtestersRequests)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)
local CreatePlayersGetterCacheModule = require(script.Parent.createPlayersGetterCache)
local FFlagBuildExperiencePlaytesterEligibleRetryModule = require(script.Parent.FFlagBuildExperiencePlaytesterEligibleRetry)

local function splitAddResult(Rejected, List)
	local Added = {}
	local Rejected1 = {}
	
	for _, value in Rejected do
		if table.find(List, value) == nil then
			table.insert(Rejected1, value)
		else
			table.insert(Added, value)
		end
	end
	return { added = Added, rejected = Rejected1 }
end

local function _(p1): boolean
	return type(p1) == "table" and p1.responseCode == 51
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreatePlayersGetterCacheModule (copy), CreateDataResolverModule (copy), PlaytestersRequestsModule (copy), PromiseModule (copy), splitAddResult (copy), FFlagBuildExperiencePlaytesterEligibleRetryModule (copy)
	local P2 = p1 or {}
	local config = { network = P2.network, baseUrl = P2.baseUrl }
	local DataCacheModule = CreateDataCacheModule()
	local PlayersGetterCacheModule = CreatePlayersGetterCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(p2, _)
			-- upvalues: PlaytestersRequestsModule (upval), config (copy)
			return PlaytestersRequestsModule.fetchPlaytesters(tonumber(p2), config)
		end,
		onClear = PlayersGetterCacheModule.clear
	})
	
	local function addEligibleAfterSafetyCheckFailure(p2, p3, Rejected, p4)
		-- upvalues: PlaytestersRequestsModule (upval), config (copy), PromiseModule (upval), DataCacheModule (copy), splitAddResult (upval)
		return PlaytestersRequestsModule.fetchEligiblePlaytesters(p2, Rejected, config):andThen(function(List)
			-- upvalues: Rejected (copy), PromiseModule (upval), p4 (copy), DataCacheModule (upval), p2 (copy), p3 (copy), PlaytestersRequestsModule (upval), config (upval), splitAddResult (upval)
			local List1 = {}
			
			for _, value in Rejected do
				if table.find(List, value) ~= nil then
					table.insert(List1, value)
				end
			end
			if #List1 == #Rejected then
				return PromiseModule.reject(p4)
			elseif #List1 == 0 then
				DataCacheModule.replaceItem(tostring(p2), p3)
				
				return { added = {}, rejected = Rejected }
			else
				return PlaytestersRequestsModule.addPlaytester(p2, List1, config):andThen(function(Result)
					-- upvalues: DataCacheModule (upval), p2 (upval), splitAddResult (upval), Rejected (upval)
					DataCacheModule.replaceItem(tostring(p2), Result)
					
					return (splitAddResult(Rejected, Result))
				end)
			end
		end, function()
			-- upvalues: PromiseModule (upval), p4 (copy)
			return PromiseModule.reject(p4)
		end)
	end
	
	return {
		MAX_INVITES = 10,
		getAndFetchInvitedPlayers = function(p5)
			-- upvalues: DataResolverModule (copy), PlayersGetterCacheModule (copy)
			local AndFetchItem = DataResolverModule.getAndFetchItem((tostring(p5)))
			
			return {
				players = PlayersGetterCacheModule.getFor(AndFetchItem.data),
				status = AndFetchItem.status
			}
		end,
		sendInvites = function(p5, p6, _)
			-- upvalues: PlaytestersRequestsModule (upval), config (copy), DataCacheModule (copy), PromiseModule (upval), FFlagBuildExperiencePlaytesterEligibleRetryModule (upval), splitAddResult (upval), addEligibleAfterSafetyCheckFailure (copy)
			return PlaytestersRequestsModule.fetchPlaytesters(p5, config):andThen(function(List)
				-- upvalues: p6 (copy), DataCacheModule (upval), p5 (copy), PromiseModule (upval), FFlagBuildExperiencePlaytesterEligibleRetryModule (upval), PlaytestersRequestsModule (upval), config (upval), splitAddResult (upval), addEligibleAfterSafetyCheckFailure (upval)
				local Largest = math.max(0, 10 - #List)
				local List1 = {}
				
				for _, value in p6 do
					if Largest <= #List1 then break end
					if table.find(List, value) == nil then
						table.insert(List1, value)
					end
				end
				if #List1 == 0 then
					DataCacheModule.replaceItem(tostring(p5), List)
					
					return PromiseModule.resolve({ added = {}, rejected = {} })
				else
					return if FFlagBuildExperiencePlaytesterEligibleRetryModule then PlaytestersRequestsModule.addPlaytester(p5, List1, config):andThen(function(Result)
						-- upvalues: DataCacheModule (upval), p5 (upval), splitAddResult (upval), List1 (copy)
						DataCacheModule.replaceItem(tostring(p5), Result)
						
						return (splitAddResult(List1, Result))
					end):catch(function(Err)
						-- upvalues: PromiseModule (upval), addEligibleAfterSafetyCheckFailure (upval), p5 (upval), List (copy), List1 (copy)
						local IsResponseCodeMatch: boolean = type(Err) == "table" and Err.responseCode == 51
						
						return if IsResponseCodeMatch then addEligibleAfterSafetyCheckFailure(p5, List, List1, Err) else PromiseModule.reject(Err)
					end) else PlaytestersRequestsModule.addPlaytester(p5, List1, config):andThen(function(List)
						-- upvalues: DataCacheModule (upval), p5 (upval), List1 (copy)
						DataCacheModule.replaceItem(tostring(p5), List)
						local Added = {}
						local Rejected = {}
						
						for _, value in List1 do
							if table.find(List, value) == nil then
								table.insert(Rejected, value)
							else
								table.insert(Added, value)
							end
						end
						return { added = Added, rejected = Rejected }
					end)
				end
			end)
		end,
		removeInvite = function(p7, p8)
			-- upvalues: PlaytestersRequestsModule (upval), config (copy), DataCacheModule (copy)
			return PlaytestersRequestsModule.removePlaytester(p7, p8, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval), p7 (copy)
				DataCacheModule.replaceItem(tostring(p7), Result)
				
				return Result
			end)
		end
	}
end