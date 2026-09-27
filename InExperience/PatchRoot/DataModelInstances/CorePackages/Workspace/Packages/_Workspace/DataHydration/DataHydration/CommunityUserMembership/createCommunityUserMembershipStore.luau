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
local groups_url = `{url.GROUPS_URL}v1/groups/`

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), signalsModule (ref), requestJoinCommunityModule (ref), logResponseError (ref), groups_url (ref), discoveryEventErrorLogger (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMutations = true,
		cache = var1,
		fetchFn = function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve({})
		end
	})
	
	local function applyOptimisticMembership(p1)
		-- upvalues: signalsModule (copy), var2 (ref)
		local var3, var4 = signalsModule.createSignal(nil)
		var2.setMutation(p1, { canJoin = false })
		
		return var3, function(p2)
			-- upvalues: var2 (copy), p1 (ref), var4 (ref)
			if p2 and p2.type == "error" then
				var2.clearMutation(p1)
			else
				var2.commitMutation(p1)
			end
			var4(p2)
		end
	end
	
	return {
		getMembership = var2.getOptimisticCachedItem,
		getMemberships = var2.getOptimisticCachedItems,
		updateMembership = var1.updateItem,
		updateMemberships = var1.updateItems,
		joinCommunity = function(p1)
			-- upvalues: applyOptimisticMembership (ref), requestJoinCommunityModule (copy), logResponseError (copy), groups_url (copy), discoveryEventErrorLogger (copy)
			local var3, var4 = applyOptimisticMembership(p1)
			requestJoinCommunityModule(p1):andThen(function()
				-- upvalues: var4 (ref)
				var4({ type = "success" })
			end):catch(function(p2)
				-- upvalues: var4 (ref), logResponseError (copy), groups_url (copy), discoveryEventErrorLogger (copy), p1 (ref)
				local var5 = if type(p2) == "table" and p2.StatusCode then p2.StatusCode else nil
				local var6 = if type(p2) == "table" and p2.StatusMessage then p2.StatusMessage elseif type(p2) == "string" then p2 else nil
				var4({
					type = "error",
					statusCode = var5,
					statusMessage = var6
				})
				logResponseError(groups_url, { StatusCode = var5 })
				discoveryEventErrorLogger.reportError("joinCommunity", "Error joining community", {
					method = "POST",
					communityId = p1,
					statusCode = var5,
					statusMessage = var6
				})
			end)
			
			return var3
		end,
		clear = var2.clear,
		dispose = var2.dispose
	}
end