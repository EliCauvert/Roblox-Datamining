local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local PlaytestersRequestsModule = require(script.Parent.playtestersRequests)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)
local CreatePlayersGetterCacheModule = require(script.Parent.createPlayersGetterCache)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreatePlayersGetterCacheModule (copy), CreateDataResolverModule (copy), PlaytestersRequestsModule (copy), PromiseModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
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
	
	return {
		MAX_INVITES = 10,
		getAndFetchInvitedPlayers = function(p2)
			-- upvalues: DataResolverModule (copy), PlayersGetterCacheModule (copy)
			local AndFetchItem = DataResolverModule.getAndFetchItem((tostring(p2)))
			
			return {
				players = PlayersGetterCacheModule.getFor(AndFetchItem.data),
				status = AndFetchItem.status
			}
		end,
		sendInvites = function(p2, p3, _)
			-- upvalues: PlaytestersRequestsModule (upval), config (copy), DataCacheModule (copy), PromiseModule (upval)
			return PlaytestersRequestsModule.fetchPlaytesters(p2, config):andThen(function(List)
				-- upvalues: p3 (copy), DataCacheModule (upval), p2 (copy), PromiseModule (upval), PlaytestersRequestsModule (upval), config (upval)
				local Largest = math.max(0, 10 - #List)
				local List1 = {}
				
				for _, value in p3 do
					if Largest <= #List1 then break end
					if table.find(List, value) == nil then
						table.insert(List1, value)
					end
				end
				if #List1 == 0 then
					DataCacheModule.replaceItem(tostring(p2), List)
					
					return PromiseModule.resolve({ added = {}, rejected = {} })
				else
					return PlaytestersRequestsModule.addPlaytester(p2, List1, config):andThen(function(List)
						-- upvalues: DataCacheModule (upval), p2 (upval), List1 (copy)
						DataCacheModule.replaceItem(tostring(p2), List)
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
		removeInvite = function(p4, p5)
			-- upvalues: PlaytestersRequestsModule (upval), config (copy), DataCacheModule (copy)
			return PlaytestersRequestsModule.removePlaytester(p4, p5, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval), p4 (copy)
				DataCacheModule.replaceItem(tostring(p4), Result)
				
				return Result
			end)
		end
	}
end