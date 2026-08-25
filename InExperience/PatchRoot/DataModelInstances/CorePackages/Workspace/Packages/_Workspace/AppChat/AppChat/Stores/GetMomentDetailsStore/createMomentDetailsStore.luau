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

return function(p0)
	-- upvalues: dataHydrationModule (ref), name (ref), momentsGetMomentsStoreModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), momentStatus (ref), shareLinkTargetIdType (ref)
	p0 = p0 or {}
	
	local function createResolver(p1)
		-- upvalues: dataHydrationModule (copy), p0 (ref), name (copy), momentsGetMomentsStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), momentStatus (copy), shareLinkTargetIdType (copy)
		return dataHydrationModule.createDataResolver({
			supportsMultiGet = true,
			queueProcessDelaySec = 0,
			replaceItems = true,
			cache = dataHydrationModule.createDataCache(p0.ttlSeconds, p0.failedTtlSeconds),
			logError = function(p2)
				-- upvalues: name (copy)
				name:warning(`Error resolving Moment details: {tostring(p2)}`)
			end,
			fetchFn = function(p3)
				-- upvalues: momentsGetMomentsStoreModule (copy), fFlagMomentsPassFeedItemIdToBackendApis (copy), p1 (ref), momentStatus (copy), shareLinkTargetIdType (copy)
				local t = {}
				
				for i in p3 do
					table.insert(t, i)
				end
				local var11 = momentsGetMomentsStoreModule(false)
				
				return (if fFlagMomentsPassFeedItemIdToBackendApis then var11.getMomentsByIds(t, p1) else var11.getMomentsByIds(t)):andThen(function(p4)
					-- upvalues: momentStatus (copy), p1 (copy), shareLinkTargetIdType (copy), p3 (ref)
					local t = {}
					
					for i, v in p4.moments do
						if v.isModerated ~= true and v.status ~= momentStatus.Deleted then
							local var13 = if p1 == shareLinkTargetIdType.FeedItemId then v.recommendationMetadata.feedItemId else v.momentId
							
							if var13 ~= nil and p3[var13] ~= nil then
								t[var13] = v
							end
						end
					end
					return t
				end)
			end
		})
	end
	
	local var8 = createResolver(nil)
	local var9 = if fFlagMomentsPassFeedItemIdToBackendApis then createResolver(shareLinkTargetIdType.FeedItemId) else nil
	
	local function _(p5)
		-- upvalues: var9 (ref), shareLinkTargetIdType (copy), var8 (ref)
		return if var9 == nil or p5 ~= shareLinkTargetIdType.FeedItemId then var8 else var9
	end
	
	return {
		getCachedMomentDetails = function(p6, p7)
			-- upvalues: var9 (ref), shareLinkTargetIdType (copy), var8 (ref)
			return (if var9 == nil or p7 ~= shareLinkTargetIdType.FeedItemId then var8 else var9).getCachedItem(p6)
		end,
		fetchMomentDetails = function(p8, p9)
			-- upvalues: var9 (ref), shareLinkTargetIdType (copy), var8 (ref)
			return (if var9 == nil or p9 ~= shareLinkTargetIdType.FeedItemId then var8 else var9).fetchItem(p8)
		end,
		getAndFetchMomentDetails = function(p10, p11)
			-- upvalues: var9 (ref), shareLinkTargetIdType (copy), var8 (ref)
			return (if var9 == nil or p11 ~= shareLinkTargetIdType.FeedItemId then var8 else var9).getAndFetchItem(p10)
		end,
		clear = function()
			-- upvalues: var8 (ref), var9 (ref)
			var8.clear()
			
			if var9 ~= nil then
				var9.clear()
			end
		end,
		dispose = function()
			-- upvalues: var8 (ref), var9 (ref)
			var8.dispose()
			
			if var9 ~= nil then
				var9.dispose()
			end
		end
	}
end