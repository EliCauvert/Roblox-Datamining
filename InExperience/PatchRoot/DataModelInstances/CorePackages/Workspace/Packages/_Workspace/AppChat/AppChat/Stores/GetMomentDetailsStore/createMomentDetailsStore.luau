local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsGetMomentsStoreModule = require(parent.DataHydration.MomentsGetMomentsStore)
local name = require(appChat.Logger):new(script.Name)
local momentStatus = momentsTypesModule.Enums.MomentStatus
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis

return function(p1)
	-- upvalues: dataHydrationModule (ref), name (ref), momentsGetMomentsStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), momentStatus (ref), shareLinkTargetIdType (ref)
	p1 = p1 or {}
	
	local function createResolver(p2)
		-- upvalues: dataHydrationModule (copy), p1 (ref), name (copy), momentsGetMomentsStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), momentStatus (copy), shareLinkTargetIdType (copy)
		return dataHydrationModule.createDataResolver({
			supportsMultiGet = true,
			queueProcessDelaySec = 0,
			replaceItems = true,
			cache = dataHydrationModule.createDataCache(p1.ttlSeconds, p1.failedTtlSeconds),
			logError = function(p3)
				-- upvalues: name (copy)
				name:warning(`Error resolving Moment details: {tostring(p3)}`)
			end,
			fetchFn = function(p3)
				-- upvalues: momentsGetMomentsStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), p2 (ref), momentStatus (copy), shareLinkTargetIdType (copy)
				local t = {}
				
				for i in p3 do
					table.insert(t, i)
				end
				local var1 = momentsGetMomentsStoreModule(false)
				
				return (if fFlagMomentsPassFeedItemIdToBackendApis then var1.getMomentsByIds(t, p2) else var1.getMomentsByIds(t)):andThen(function(p4)
					-- upvalues: momentStatus (copy), p2 (copy), shareLinkTargetIdType (copy), p3 (ref)
					local t = {}
					
					for i, v in p4.moments do
						if v.isModerated ~= true and v.status ~= momentStatus.Deleted then
							local var2 = if p2 == shareLinkTargetIdType.FeedItemId then v.recommendationMetadata.feedItemId else v.momentId
							
							if var2 ~= nil and p3[var2] ~= nil then
								t[var2] = v
							end
						end
					end
					return t
				end)
			end
		})
	end
	
	local var2 = createResolver(nil)
	local var3 = if fFlagMomentsPassFeedItemIdToBackendApis then createResolver(shareLinkTargetIdType.FeedItemId) else nil
	
	local function _(p4)
		-- upvalues: var3 (ref), shareLinkTargetIdType (copy), var2 (ref)
		return if var3 == nil or p4 ~= shareLinkTargetIdType.FeedItemId then var2 else var3
	end
	
	return {
		getCachedMomentDetails = function(p4, p5)
			-- upvalues: var3 (ref), shareLinkTargetIdType (copy), var2 (ref)
			return (if var3 == nil or p5 ~= shareLinkTargetIdType.FeedItemId then var2 else var3).getCachedItem(p4)
		end,
		fetchMomentDetails = function(p4, p5)
			-- upvalues: var3 (ref), shareLinkTargetIdType (copy), var2 (ref)
			return (if var3 == nil or p5 ~= shareLinkTargetIdType.FeedItemId then var2 else var3).fetchItem(p4)
		end,
		getAndFetchMomentDetails = function(p4, p5)
			-- upvalues: var3 (ref), shareLinkTargetIdType (copy), var2 (ref)
			return (if var3 == nil or p5 ~= shareLinkTargetIdType.FeedItemId then var2 else var3).getAndFetchItem(p4)
		end,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref)
			var2.clear()
			
			if var3 ~= nil then
				var3.clear()
			end
		end,
		dispose = function()
			-- upvalues: var2 (ref), var3 (ref)
			var2.dispose()
			
			if var3 ~= nil then
				var3.dispose()
			end
		end
	}
end