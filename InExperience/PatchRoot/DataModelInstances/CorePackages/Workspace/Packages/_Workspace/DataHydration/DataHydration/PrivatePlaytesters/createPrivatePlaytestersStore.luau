local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local playtestersRequestsModule = require(script.Parent.playtestersRequests)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)
local createPlayersGetterCacheModule = require(script.Parent.createPlayersGetterCache)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createPlayersGetterCacheModule (ref), createDataResolverModule (ref), playtestersRequestsModule (ref), promiseModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createDataCacheModule()
	local var2 = createPlayersGetterCacheModule()
	local var3 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var1,
		fetchFn = function(p2, _)
			-- upvalues: playtestersRequestsModule (copy), t (ref)
			return playtestersRequestsModule.fetchPlaytesters(tonumber(p2), t)
		end,
		onClear = var2.clear
	})
	
	return {
		MAX_INVITES = 10,
		getAndFetchInvitedPlayers = function(p2)
			-- upvalues: var3 (ref), var2 (ref)
			local andFetchItem = var3.getAndFetchItem(tostring(p2))
			
			return {
				players = var2.getFor(andFetchItem.data),
				status = andFetchItem.status
			}
		end,
		sendInvites = function(p2, p3, _)
			-- upvalues: playtestersRequestsModule (copy), t (ref), var1 (ref), promiseModule (copy)
			return playtestersRequestsModule.fetchPlaytesters(p2, t):andThen(function(p4)
				-- upvalues: p3 (ref), var1 (copy), p2 (ref), promiseModule (copy), playtestersRequestsModule (copy), t (copy)
				local maxValue = math.max(0, 10 - #p4)
				local t_1 = {}
				
				for i, v in p3 do
					if maxValue <= #t_1 then break end
					if table.find(p4, v) == nil then
						table.insert(t_1, v)
					end
				end
				if #t_1 == 0 then
					var1.replaceItem(tostring(p2), p4)
					
					return promiseModule.resolve(p4)
				end
				return playtestersRequestsModule.addPlaytester(p2, t_1, t):andThen(function(p5)
					-- upvalues: var1 (copy), p2 (copy)
					var1.replaceItem(tostring(p2), p5)
					
					return p5
				end)
			end)
		end,
		removeInvite = function(p4, p5)
			-- upvalues: playtestersRequestsModule (copy), t (ref), var1 (ref)
			return playtestersRequestsModule.removePlaytester(p4, p5, t):andThen(function(p6)
				-- upvalues: var1 (copy), p4 (ref)
				var1.replaceItem(tostring(p4), p6)
				
				return p6
			end)
		end
	}
end