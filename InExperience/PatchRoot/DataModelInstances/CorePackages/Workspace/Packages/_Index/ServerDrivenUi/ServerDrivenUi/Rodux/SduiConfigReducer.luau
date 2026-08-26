local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local addSduiRootConfigModule = require(serverDrivenUi.Rodux.AddSduiRootConfig)
local removeSduiRootConfigModule = require(serverDrivenUi.Rodux.RemoveSduiRootConfig)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local getItemCollectionKeyModule = require(serverDrivenUi.DataStore.getItemCollectionKey)

return {
	key = "SduiConfigKey",
	reducer = function(p1, p2)
		-- upvalues: argCheckModule (ref), addSduiRootConfigModule (ref), sduiLogger (ref), sduiErrors (ref), getItemCollectionKeyModule (ref), cryoModule (ref), removeSduiRootConfigModule (ref)
		p1 = p1 or {}
		assert(p1, "state must exist")
		argCheckModule.assert(typeof(p1) == "table", "state must be a table")
		
		if p2.type == addSduiRootConfigModule.name then
			local customFeedStoreKey = p2.customFeedStoreKey or p2.page
			local var1 = p1[customFeedStoreKey]
			local t = {
				rootConfig = p2.rootConfig,
				dataUpdatedTimestamp = p2.dataUpdatedTimestamp,
				itemCollections = if var1 then var1.itemCollections else {}
			}
			local feed = p2.rootConfig.feed or (p2.rootConfig or nil)
			
			if typeof(feed) ~= "table" then
				sduiLogger.reportError(sduiErrors.SduiErrorType.InvalidFeedInResponse, {
					message = `Invalid sdui.feed in response of type {typeof(feed)}`
				}, p2.page)
				
				return p1
			end
			local var2 = if feed.props then feed.props.feedItems else nil
			
			if var2 then
				local topicId, sortIndex
				for i, v in var2 do
					local feedItemKey = v.feedItemKey
					
					if not feedItemKey then
						sduiLogger.reportError(sduiErrors.SduiErrorType.NilFeedItemKey, {
							message = "Missing feedItemKey for itemCollection in ConfigReducer"
						}, p2.page)
						continue
					end
					if t.itemCollections[feedItemKey] ~= nil then
						sduiLogger.reportError(sduiErrors.SduiErrorType.DuplicateFeedItemKey, {
							message = `Multiple item collections with same feedItemKey {feedItemKey}`
						}, p2.page)
					end
					if p2.expectedSduiFeedItems then
						topicId = nil
						sortIndex = nil
						
						for i_1, v_1 in p2.expectedSduiFeedItems do
							if v_1.feedItemKey == feedItemKey then
								topicId = v_1.topicId
								sortIndex = v_1.sortIndex
								break
							end
						end
						if topicId == nil or sortIndex == nil then
							sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFindCollectionId, {
								message = `Missing topicId or sortIndex for {feedItemKey} in ConfigReducer. sortIndex = {sortIndex} topicId = {topicId}`
							}, p2.page)
						end
						t.itemCollections[getItemCollectionKeyModule(topicId, sortIndex)] = {
							sduiConfig = v,
							dataUpdatedTimestamp = p2.dataUpdatedTimestamp,
							topicId = topicId,
							sortIndex = sortIndex
						}
					else
						t.itemCollections[feedItemKey] = {
							sduiConfig = v,
							dataUpdatedTimestamp = p2.dataUpdatedTimestamp
						}
					end
				end
			end
			if p2.expectedSduiFeedItems then
				for i, v in p2.expectedSduiFeedItems do
					if t.itemCollections[getItemCollectionKeyModule(v.topicId, v.sortIndex)] == nil then
						sduiLogger.reportError(sduiErrors.SduiErrorType.NilItemCollection, {
							message = `Missing item collection data for an sdui feed item for topic: {v.topicId} sortIndex: {v.sortIndex}`,
							name = v.topicId
						}, p2.page)
					end
				end
			end
			p1 = cryoModule.Dictionary.union(p1, { [customFeedStoreKey] = t })
			
			return p1
		elseif p2.type == removeSduiRootConfigModule.name then
			local feedStoreKey = p2.feedStoreKey
			
			if p1[feedStoreKey] then
				p1 = cryoModule.Dictionary.omit(p1, feedStoreKey)
			end
		end
		return p1
	end
}