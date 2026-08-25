local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local playtestersRequestsModule = require(script.Parent.playtestersRequests)
local _ = require(script.Parent.PrivatePlaytestersStoreTypes)
local createPlayersGetterCacheModule = require(script.Parent.createPlayersGetterCache)

return function(p0)
	-- upvalues: createDataCacheModule (ref), createPlayersGetterCacheModule (ref), createDataResolverModule (ref), playtestersRequestsModule (ref), promiseModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var8 = createDataCacheModule()
	local var9 = createPlayersGetterCacheModule()
	local var10 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var8,
		fetchFn = function(p1, _)
			-- upvalues: playtestersRequestsModule (copy), t (ref)
			return playtestersRequestsModule.fetchPlaytesters(tonumber(p1), t)
		end,
		onClear = var9.clear
	})
	
	return {
		MAX_INVITES = 10,
		getAndFetchInvitedPlayers = function(p2)
			-- upvalues: var10 (ref), var9 (ref)
			local andFetchItem = var10.getAndFetchItem(tostring(p2))
			
			return {
				players = var9.getFor(andFetchItem.data),
				status = andFetchItem.status
			}
		end,
		sendInvites = function(p3, p4, _)
			-- upvalues: playtestersRequestsModule (copy), t (ref), var8 (ref), promiseModule (copy)
			return playtestersRequestsModule.fetchPlaytesters(p3, t):andThen(function(p5)
				-- upvalues: p4 (ref), var8 (copy), p3 (ref), promiseModule (copy), playtestersRequestsModule (copy), t (copy)
				local maxValue = math.max(0, 10 - #p5)
				local t_1 = {}
				
				for i, v in p4 do
					if maxValue <= #t_1 then break end
					if table.find(p5, v) == nil then
						table.insert(t_1, v)
					end
				end
				if #t_1 == 0 then
					var8.replaceItem(tostring(p3), p5)
					
					return promiseModule.resolve(p5)
				end
				return playtestersRequestsModule.addPlaytester(p3, t_1, t):andThen(function(p6)
					-- upvalues: var8 (copy), p3 (copy)
					var8.replaceItem(tostring(p3), p6)
					
					return p6
				end)
			end)
		end,
		removeInvite = function(p7, p8)
			-- upvalues: playtestersRequestsModule (copy), t (ref), var8 (ref)
			return playtestersRequestsModule.removePlaytester(p7, p8, t):andThen(function(p9)
				-- upvalues: var8 (copy), p7 (ref)
				var8.replaceItem(tostring(p7), p9)
				
				return p9
			end)
		end
	}
end