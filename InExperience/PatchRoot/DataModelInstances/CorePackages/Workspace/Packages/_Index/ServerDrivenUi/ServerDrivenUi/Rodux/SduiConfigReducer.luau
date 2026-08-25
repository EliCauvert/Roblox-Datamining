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
	reducer = function(p0, p1)
		-- upvalues: argCheckModule (ref), addSduiRootConfigModule (ref), sduiLogger (ref), sduiErrors (ref), getItemCollectionKeyModule (ref), cryoModule (ref), removeSduiRootConfigModule (ref)
		p0 = p0 or {}
		assert(p0, "state must exist")
		argCheckModule.assert(typeof(p0) == "table", "state must be a table")
		
		if p1.type == addSduiRootConfigModule.name then
			local customFeedStoreKey = p1.customFeedStoreKey or p1.page
			local var8 = p0[customFeedStoreKey]
			local t = {
				rootConfig = p1.rootConfig,
				dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
				itemCollections = if var8 then var8.itemCollections else {}
			}
			local feed = p1.rootConfig.feed or (p1.rootConfig or nil)
			
			if typeof(feed) ~= "table" then
				sduiLogger.reportError(sduiErrors.SduiErrorType.InvalidFeedInResponse, {
					message = `Invalid sdui.feed in response of type {typeof(feed)}`
				}, p1.page)
				
				return p0
			end
			local var11 = if feed.props then feed.props.feedItems else nil
			
			if var11 then
				local topicId, sortIndex
				for i, v in var11 do
					local feedItemKey = v.feedItemKey
					
					if not feedItemKey then
						sduiLogger.reportError(sduiErrors.SduiErrorType.NilFeedItemKey, {
							message = "Missing feedItemKey for itemCollection in ConfigReducer"
						}, p1.page)
						continue
					end
					if t.itemCollections[feedItemKey] ~= nil then
						sduiLogger.reportError(sduiErrors.SduiErrorType.DuplicateFeedItemKey, {
							message = `Multiple item collections with same feedItemKey {feedItemKey}`
						}, p1.page)
					end
					if p1.expectedSduiFeedItems then
						topicId = nil
						sortIndex = nil
						
						for i_1, v_1 in p1.expectedSduiFeedItems do
							if v_1.feedItemKey == feedItemKey then
								topicId = v_1.topicId
								sortIndex = v_1.sortIndex
								break
							end
						end
						if topicId == nil or sortIndex == nil then
							sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToFindCollectionId, {
								message = `Missing topicId or sortIndex for {feedItemKey} in ConfigReducer. sortIndex = {sortIndex} topicId = {topicId}`
							}, p1.page)
						end
						t.itemCollections[getItemCollectionKeyModule(topicId, sortIndex)] = {
							sduiConfig = v,
							dataUpdatedTimestamp = p1.dataUpdatedTimestamp,
							topicId = topicId,
							sortIndex = sortIndex
						}
					else
						t.itemCollections[feedItemKey] = {
							sduiConfig = v,
							dataUpdatedTimestamp = p1.dataUpdatedTimestamp
						}
					end
				end
			end
			if p1.expectedSduiFeedItems then
				for i, v in p1.expectedSduiFeedItems do
					if t.itemCollections[getItemCollectionKeyModule(v.topicId, v.sortIndex)] == nil then
						sduiLogger.reportError(sduiErrors.SduiErrorType.NilItemCollection, {
							message = `Missing item collection data for an sdui feed item for topic: {v.topicId} sortIndex: {v.sortIndex}`,
							name = v.topicId
						}, p1.page)
					end
				end
			end
			p0 = cryoModule.Dictionary.union(p0, { [customFeedStoreKey] = t })
			
			return p0
		elseif p1.type == removeSduiRootConfigModule.name then
			local feedStoreKey = p1.feedStoreKey
			
			if p0[feedStoreKey] then
				p0 = cryoModule.Dictionary.omit(p0, feedStoreKey)
			end
		end
		return p0
	end
}