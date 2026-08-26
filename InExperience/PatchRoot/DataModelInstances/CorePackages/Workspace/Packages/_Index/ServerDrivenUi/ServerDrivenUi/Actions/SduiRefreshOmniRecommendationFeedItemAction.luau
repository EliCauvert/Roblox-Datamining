local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local sduiCoreSystemModule = require(serverDrivenUi.Parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local refreshOmniRecommendationFeedItemModule = require(serverDrivenUi.Actions.refreshOmniRecommendationFeedItem)

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.RefreshOmniRecommendationFeedItem,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), refreshOmniRecommendationFeedItemModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.RefreshOmniRecommendationFeedItem
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local topicId = var1.topicId
	
	if typeof(topicId) ~= "string" or topicId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "topicId",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing topicId: {topicId}`
		}, p2.appPage)
		
		return
	end
	local feedItemKey = var1.feedItemKey
	
	if typeof(feedItemKey) ~= "string" or feedItemKey == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "feedItemKey",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing feedItemKey: {feedItemKey}`
		}, p2.appPage)
		
		return
	end
	local requestIntent = var1.requestIntent
	
	if typeof(requestIntent) ~= "string" or requestIntent == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "requestIntent",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid requestIntent: {requestIntent}`
		}, p2.appPage)
	end
	local t = nil
	local selectedOption = var1.selectedOption
	
	if selectedOption ~= nil then
		if typeof(selectedOption) == "string" and selectedOption ~= "" then
			t = { selected_option = selectedOption }
		else
			p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				propName = "selectedOption",
				name = sduiActionType.RefreshOmniRecommendationFeedItem,
				message = `Invalid selectedOption: {selectedOption}`
			}, p2.appPage)
		end
	end
	return refreshOmniRecommendationFeedItemModule(p2.dependencies.networking, p2.appPage, topicId, feedItemKey, requestIntent, function(p3, p4)
		-- upvalues: p2 (ref)
		p2.dependencies.logger.reportError(p3, p4, p2.appPage)
	end, { contextFeatures = t })
end