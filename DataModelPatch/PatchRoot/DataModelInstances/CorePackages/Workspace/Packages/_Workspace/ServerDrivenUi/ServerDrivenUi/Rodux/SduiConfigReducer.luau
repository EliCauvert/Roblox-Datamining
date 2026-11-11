local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local AddSduiRootConfigModule = require(ServerDrivenUi.Rodux.AddSduiRootConfig)
local RemoveSduiRootConfigModule = require(ServerDrivenUi.Rodux.RemoveSduiRootConfig)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local GetItemCollectionKeyModule = require(ServerDrivenUi.DataStore.getItemCollectionKey)

return {
	key = "SduiConfigKey",
	reducer = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), AddSduiRootConfigModule (copy), SduiLogger (copy), SduiErrors (copy), GetItemCollectionKeyModule (copy), CryoModule (copy), RemoveSduiRootConfigModule (copy)
		local P0 = p1 or {}
		assert(P0, "state must exist")
		ArgCheckModule.assert(typeof(P0) == "table", "state must be a table")
		
		if p2.type == AddSduiRootConfigModule.name then
			local CustomFeedStoreKey = p2.customFeedStoreKey or p2.page
			local Entry = P0[CustomFeedStoreKey]
			local config = {
				rootConfig = p2.rootConfig,
				dataUpdatedTimestamp = p2.dataUpdatedTimestamp,
				itemCollections = Entry and Entry.itemCollections or {}
			}
			local Feed = p2.rootConfig.feed or (p2.rootConfig or nil)
			
			if typeof(Feed) ~= "table" then
				SduiLogger.reportError(SduiErrors.SduiErrorType.InvalidFeedInResponse, {
					message = `Invalid sdui.feed in response of type {typeof(Feed)}`
				}, p2.page)
				
				return P0
			end
			local FeedItems = Feed.props and Feed.props.feedItems or nil
			
			if FeedItems then
				local SortIndex = nil
				local TopicId = nil
				for _, feedItem in FeedItems do
					local FeedItemKey = feedItem.feedItemKey
					
					if not FeedItemKey then
						SduiLogger.reportError(SduiErrors.SduiErrorType.NilFeedItemKey, {
							message = "Missing feedItemKey for itemCollection in ConfigReducer"
						}, p2.page)
						continue
					end
					if config.itemCollections[FeedItemKey] ~= nil then
						SduiLogger.reportError(SduiErrors.SduiErrorType.DuplicateFeedItemKey, {
							message = `Multiple item collections with same feedItemKey {FeedItemKey}`
						}, p2.page)
					end
					if not p2.expectedSduiFeedItems then
						config.itemCollections[FeedItemKey] = {
							sduiConfig = feedItem,
							dataUpdatedTimestamp = p2.dataUpdatedTimestamp
						}
						continue
					end
					TopicId = nil
					SortIndex = nil
					
					for _, expectedSduiFeedItem in p2.expectedSduiFeedItems do
						if expectedSduiFeedItem.feedItemKey == FeedItemKey then
							TopicId = expectedSduiFeedItem.topicId
							SortIndex = expectedSduiFeedItem.sortIndex
							break
						end
					end
					if TopicId == nil or SortIndex == nil then
						SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFindCollectionId, {
							message = `Missing topicId or sortIndex for {FeedItemKey} in ConfigReducer. sortIndex = {SortIndex} topicId = {TopicId}`
						}, p2.page)
					end
					config.itemCollections[GetItemCollectionKeyModule(TopicId, SortIndex)] = {
						sduiConfig = feedItem,
						dataUpdatedTimestamp = p2.dataUpdatedTimestamp,
						topicId = TopicId,
						sortIndex = SortIndex
					}
				end
			end
			if p2.expectedSduiFeedItems then
				for _, expectedSduiFeedItem1 in p2.expectedSduiFeedItems do
					if config.itemCollections[GetItemCollectionKeyModule(expectedSduiFeedItem1.topicId, expectedSduiFeedItem1.sortIndex)] == nil then
						SduiLogger.reportError(SduiErrors.SduiErrorType.NilItemCollection, {
							message = `Missing item collection data for an sdui feed item for topic: {expectedSduiFeedItem1.topicId} sortIndex: {expectedSduiFeedItem1.sortIndex}`,
							name = expectedSduiFeedItem1.topicId
						}, p2.page)
					end
				end
			end
			P0 = CryoModule.Dictionary.union(P0, { [CustomFeedStoreKey] = config })
			
			return P0
		else
			if p2.type == RemoveSduiRootConfigModule.name then
				local FeedStoreKey = p2.feedStoreKey
				
				if P0[FeedStoreKey] then
					P0 = CryoModule.Dictionary.omit(P0, FeedStoreKey)
				end
			end
			return P0
		end
	end
}