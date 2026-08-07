local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local sduiCoreSystemModule = require(serverDrivenUi.Parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local refreshOmniRecommendationFeedItemModule = require(serverDrivenUi.Actions.refreshOmniRecommendationFeedItem)

local function _(p0, p1, p2) --[[ line: 14 | named "reportInvalidActionParams" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.RefreshOmniRecommendationFeedItem,
		message = p1,
		propName = p2
	}, p0.appPage)
end

return function(p3, _, p4) --[[ line: 24 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), refreshOmniRecommendationFeedItemModule (ref)
	local var3 = if p3 then p3.actionParams else nil
	
	if var3 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.RefreshOmniRecommendationFeedItem
		}, p4.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	local topicId = var3.topicId
	
	if typeof(topicId) ~= "string" or topicId == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "topicId",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing topicId: {topicId}`
		}, p4.appPage)
		
		return
	end
	local feedItemKey = var3.feedItemKey
	
	if typeof(feedItemKey) ~= "string" or feedItemKey == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "feedItemKey",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing feedItemKey: {feedItemKey}`
		}, p4.appPage)
		
		return
	end
	local requestIntent = var3.requestIntent
	
	if typeof(requestIntent) ~= "string" or requestIntent == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "requestIntent",
			name = sduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid requestIntent: {requestIntent}`
		}, p4.appPage)
	end
	local t = nil
	local selectedOption = var3.selectedOption
	
	if selectedOption ~= nil then
		if typeof(selectedOption) == "string" and selectedOption ~= "" then
			t = { selected_option = selectedOption }
		else
			p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				propName = "selectedOption",
				name = sduiActionType.RefreshOmniRecommendationFeedItem,
				message = `Invalid selectedOption: {selectedOption}`
			}, p4.appPage)
		end
	end
	return refreshOmniRecommendationFeedItemModule(p4.dependencies.networking, p4.appPage, topicId, feedItemKey, requestIntent, function(p5, p6) --[[ line: 74 ]]
		-- upvalues: p4 (ref)
		p4.dependencies.logger.reportError(p5, p6, p4.appPage)
	end, { contextFeatures = t })
end