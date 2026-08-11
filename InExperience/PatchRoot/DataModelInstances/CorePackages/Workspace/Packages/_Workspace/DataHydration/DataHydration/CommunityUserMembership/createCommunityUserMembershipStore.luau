local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local url = require(parent.Http).Url
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.CommunityUserMembershipStoreTypes)
local requestJoinCommunityModule = require(script.Parent.requestJoinCommunity)
local fFlagLuaAppDataHydrationOptimisticMutationLayer = require(parent.SharedFlags).FFlagLuaAppDataHydrationOptimisticMutationLayer
local groups_url = `{url.GROUPS_URL}v1/groups/`

return function() --[[ line: 26 | named "createCommunityUserMembershipStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), signalsModule (ref), requestJoinCommunityModule (ref), logResponseError (ref), groups_url (ref), discoveryEventErrorLogger (ref)
	local var8 = createDataCacheModule()
	local var9 = createDataResolverModule({
		cache = var8,
		fetchFn = function(_) --[[ line: 30 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end,
		supportsMutations = fFlagLuaAppDataHydrationOptimisticMutationLayer
	})
	
	local function applyOptimisticMembership(p0) --[[ line: 38 ]]
		-- upvalues: signalsModule (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var9 (ref), var8 (ref)
		local var11, var12 = signalsModule.createSignal(nil)
		local canJoin = nil
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer then
			var9.setMutation(p0, { canJoin = false })
		else
			local item = var8.getItem(p0)
			local var15 = item and item.data(false)
			canJoin = var15 and var15.canJoin
			var8.updateItem(p0, { canJoin = false })
		end
		return var11, function(p1) --[[ line: 61 ]]
			-- upvalues: fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var9 (copy), p0 (ref), var8 (copy), canJoin (write), var12 (ref)
			local var16 = p1 and p1.type == "error"
			
			if fFlagLuaAppDataHydrationOptimisticMutationLayer then
				if var16 then
					var9.clearMutation(p0)
				else
					var9.commitMutation(p0)
				end
			elseif var16 then
				var8.updateItem(p0, { canJoin = canJoin })
			end
			var12(p1)
		end
	end
	
	return {
		getMembership = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var9.getOptimisticCachedItem else var9.getCachedItem,
		getMemberships = if fFlagLuaAppDataHydrationOptimisticMutationLayer then var9.getOptimisticCachedItems else var9.getCachedItems,
		updateMembership = var8.updateItem,
		updateMemberships = var8.updateItems,
		joinCommunity = function(p2) --[[ line: 84 ]]
			-- upvalues: applyOptimisticMembership (ref), requestJoinCommunityModule (copy), logResponseError (copy), groups_url (copy), discoveryEventErrorLogger (copy)
			local var17, var18 = applyOptimisticMembership(p2)
			requestJoinCommunityModule(p2):andThen(function() --[[ line: 88 ]]
				-- upvalues: var18 (ref)
				var18({ type = "success" })
			end):catch(function(p3) --[[ line: 91 ]]
				-- upvalues: var18 (ref), logResponseError (copy), groups_url (copy), discoveryEventErrorLogger (copy), p2 (ref)
				local var19 = if type(p3) == "table" and p3.StatusCode then p3.StatusCode else nil
				local var20 = if type(p3) == "table" and p3.StatusMessage then p3.StatusMessage elseif type(p3) == "string" then p3 else nil
				var18({
					type = "error",
					statusCode = var19,
					statusMessage = var20
				})
				logResponseError(groups_url, { StatusCode = var19 })
				discoveryEventErrorLogger.reportError("joinCommunity", "Error joining community", {
					method = "POST",
					communityId = p2,
					statusCode = var19,
					statusMessage = var20
				})
			end)
			
			return var17
		end,
		clear = var9.clear,
		dispose = var9.dispose
	}
end