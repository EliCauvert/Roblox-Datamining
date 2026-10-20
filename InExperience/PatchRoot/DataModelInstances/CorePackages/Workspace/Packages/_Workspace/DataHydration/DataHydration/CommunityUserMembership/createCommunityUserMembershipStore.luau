local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.CommunityUserMembershipStoreTypes)
local RequestJoinCommunityModule = require(script.Parent.requestJoinCommunity)
local GroupsName: string = `{require(Parent.Http).Url.GROUPS_URL}v1/groups/`

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), SignalsModule (copy), RequestJoinCommunityModule (copy), LogResponseErrorFunction (copy), GroupsName (copy), DiscoveryEventErrorLogger (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMutations = true,
		cache = DataCacheModule,
		fetchFn = function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve({})
		end
	})
	
	local function applyOptimisticMembership(CommunityId)
		-- upvalues: SignalsModule (upval), DataResolverModule (copy)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		DataResolverModule.setMutation(CommunityId, { canJoin = false })
		
		return Signal, function(p1)
			-- upvalues: DataResolverModule (upval), CommunityId (copy), Signal2 (copy)
			if p1 and p1.type == "error" then
				DataResolverModule.clearMutation(CommunityId)
			else
				DataResolverModule.commitMutation(CommunityId)
			end
			Signal2(p1)
		end
	end
	
	return {
		getMembership = DataResolverModule.getOptimisticCachedItem,
		getMemberships = DataResolverModule.getOptimisticCachedItems,
		updateMembership = DataCacheModule.updateItem,
		updateMemberships = DataCacheModule.updateItems,
		joinCommunity = function(CommunityId)
			-- upvalues: applyOptimisticMembership (copy), RequestJoinCommunityModule (upval), LogResponseErrorFunction (upval), GroupsName (upval), DiscoveryEventErrorLogger (upval)
			local ApplyOptimisticMembershipResult, ApplyOptimisticMembershipResult2 = applyOptimisticMembership(CommunityId)
			RequestJoinCommunityModule(CommunityId):andThen(function()
				-- upvalues: ApplyOptimisticMembershipResult2 (copy)
				ApplyOptimisticMembershipResult2({ type = "success" })
			end):catch(function(Err)
				-- upvalues: ApplyOptimisticMembershipResult2 (copy), LogResponseErrorFunction (upval), GroupsName (upval), DiscoveryEventErrorLogger (upval), CommunityId (copy)
				local StatusCode = if type(Err) == "table" and Err.StatusCode then Err.StatusCode else nil
				local StatusMessage = if type(Err) == "table" and Err.StatusMessage then Err.StatusMessage elseif type(Err) == "string" then Err else nil
				ApplyOptimisticMembershipResult2({
					type = "error",
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
				LogResponseErrorFunction(GroupsName, { StatusCode = StatusCode })
				DiscoveryEventErrorLogger.reportError("joinCommunity", "Error joining community", {
					method = "POST",
					communityId = CommunityId,
					statusCode = StatusCode,
					statusMessage = StatusMessage
				})
			end)
			
			return ApplyOptimisticMembershipResult
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end