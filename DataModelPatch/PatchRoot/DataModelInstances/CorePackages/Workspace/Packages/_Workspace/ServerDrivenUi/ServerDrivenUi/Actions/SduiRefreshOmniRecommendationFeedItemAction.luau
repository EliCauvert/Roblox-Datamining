local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local SduiCoreSystemModule = require(ServerDrivenUi.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local RefreshOmniRecommendationFeedItemModule = require(ServerDrivenUi.Actions.refreshOmniRecommendationFeedItem)

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.RefreshOmniRecommendationFeedItem,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), RefreshOmniRecommendationFeedItemModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.RefreshOmniRecommendationFeedItem
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local TopicId = ActionParams.topicId
	
	if typeof(TopicId) ~= "string" or TopicId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "topicId",
			name = SduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing topicId: {TopicId}`
		}, p2.appPage)
		
		return
	end
	local FeedItemKey = ActionParams.feedItemKey
	
	if typeof(FeedItemKey) ~= "string" or FeedItemKey == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "feedItemKey",
			name = SduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid or missing feedItemKey: {FeedItemKey}`
		}, p2.appPage)
		
		return
	end
	local RequestIntent = ActionParams.requestIntent
	
	if typeof(RequestIntent) ~= "string" or RequestIntent == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "requestIntent",
			name = SduiActionType.RefreshOmniRecommendationFeedItem,
			message = `Invalid requestIntent: {RequestIntent}`
		}, p2.appPage)
	end
	local ContextFeatures = nil
	local SelectedOption = ActionParams.selectedOption
	
	if SelectedOption ~= nil then
		if typeof(SelectedOption) == "string" and SelectedOption ~= "" then
			ContextFeatures = { selected_option = SelectedOption }
		else
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				propName = "selectedOption",
				name = SduiActionType.RefreshOmniRecommendationFeedItem,
				message = `Invalid selectedOption: {SelectedOption}`
			}, p2.appPage)
		end
	end
	return RefreshOmniRecommendationFeedItemModule(p2.dependencies.networking, p2.appPage, TopicId, FeedItemKey, RequestIntent, function(p3, p4)
		-- upvalues: p2 (copy)
		p2.dependencies.logger.reportError(p3, p4, p2.appPage)
	end, { contextFeatures = ContextFeatures })
end