local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local MomentsTypesModule = require(Parent.MomentsTypes)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentsGetMomentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsStore)
local FFlagAppChatMomentShareCardEdgeCasesModule = require(AppChat.Flags.FFlagAppChatMomentShareCardEdgeCases)
local NewResult = require(AppChat.Logger):new(script.Name)
local MomentStatus = MomentsTypesModule.Enums.MomentStatus
local ShareLinkTargetIdType = MomentsTypesModule.Enums.ShareLinkTargetIdType

return function(p1)
	-- upvalues: DataHydrationModule (copy), NewResult (copy), MomentsGetMomentsStoreModule (copy), MomentStatus (copy), FFlagAppChatMomentShareCardEdgeCasesModule (copy), ShareLinkTargetIdType (copy)
	local P0 = p1 or {}
	
	local function createResolver(FeedItemId)
		-- upvalues: DataHydrationModule (upval), P0 (copy), NewResult (upval), MomentsGetMomentsStoreModule (upval), MomentStatus (upval), FFlagAppChatMomentShareCardEdgeCasesModule (upval), ShareLinkTargetIdType (upval)
		return DataHydrationModule.createDataResolver({
			supportsMultiGet = true,
			queueProcessDelaySec = 0,
			replaceItems = true,
			cache = DataHydrationModule.createDataCache(P0.ttlSeconds, P0.failedTtlSeconds),
			logError = function(p2)
				-- upvalues: NewResult (upval)
				NewResult:warning(`Error resolving Moment details: {tostring(p2)}`)
			end,
			fetchFn = function(List)
				-- upvalues: MomentsGetMomentsStoreModule (upval), FeedItemId (copy), MomentStatus (upval), FFlagAppChatMomentShareCardEdgeCasesModule (upval), ShareLinkTargetIdType (upval)
				local List1 = {}
				
				for i in List do
					table.insert(List1, i)
				end
				return MomentsGetMomentsStoreModule(false).getMomentsByIds(List1, FeedItemId):andThen(function(Result)
					-- upvalues: MomentStatus (upval), FFlagAppChatMomentShareCardEdgeCasesModule (upval), FeedItemId (upval), ShareLinkTargetIdType (upval), List (copy)
					local t = {}
					
					for _, moment in Result.moments do
						local IsNotStatusMatch: boolean = moment.isModerated ~= true and moment.status ~= MomentStatus.Deleted
						
						if FFlagAppChatMomentShareCardEdgeCasesModule or IsNotStatusMatch then
							local FeedItemId1 = if FeedItemId == ShareLinkTargetIdType.FeedItemId then moment.recommendationMetadata.feedItemId else moment.momentId
							
							if FeedItemId1 ~= nil and List[FeedItemId1] ~= nil then
								t[FeedItemId1] = moment
							end
						end
					end
					return t
				end)
			end
		})
	end
	
	local Resolver = createResolver(nil)
	local Resolver1 = createResolver(ShareLinkTargetIdType.FeedItemId)
	
	local function _(FeedItemId)
		-- upvalues: ShareLinkTargetIdType (upval), Resolver1 (copy), Resolver (copy)
		return if FeedItemId == ShareLinkTargetIdType.FeedItemId then Resolver1 else Resolver
	end
	
	return {
		getCachedMomentDetails = function(p2, FeedItemId)
			-- upvalues: ShareLinkTargetIdType (upval), Resolver1 (copy), Resolver (copy)
			return (if FeedItemId == ShareLinkTargetIdType.FeedItemId then Resolver1 else Resolver).getCachedItem(p2)
		end,
		fetchMomentDetails = function(p2, FeedItemId)
			-- upvalues: ShareLinkTargetIdType (upval), Resolver1 (copy), Resolver (copy)
			return (if FeedItemId == ShareLinkTargetIdType.FeedItemId then Resolver1 else Resolver).fetchItem(p2)
		end,
		getAndFetchMomentDetails = function(p2, FeedItemId)
			-- upvalues: ShareLinkTargetIdType (upval), Resolver1 (copy), Resolver (copy)
			return (if FeedItemId == ShareLinkTargetIdType.FeedItemId then Resolver1 else Resolver).getAndFetchItem(p2)
		end,
		clear = function()
			-- upvalues: Resolver (copy), Resolver1 (copy)
			Resolver.clear()
			Resolver1.clear()
		end,
		dispose = function()
			-- upvalues: Resolver (copy), Resolver1 (copy)
			Resolver.dispose()
			Resolver1.dispose()
		end
	}
end