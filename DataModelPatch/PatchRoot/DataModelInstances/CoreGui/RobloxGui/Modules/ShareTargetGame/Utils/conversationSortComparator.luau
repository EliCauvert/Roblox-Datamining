local GetConversationDisplayTitleFunction = require(script:FindFirstAncestor("ShareTargetGame").dependencies).SocialLibraries.Conversation.getConversationDisplayTitle

return function(p1, p2): boolean
	-- upvalues: GetConversationDisplayTitleFunction (copy)
	assert(type(p1 == "table"), "ConversationA should be a table value. Value given: ", (type(p1)))
	assert(p1.title or p1.titleForViewer, "ConversationA should have a title string")
	assert(type(p2 == "table"), "ConversationB should be a table value. Value given: ", (type(p2)))
	assert(p2.title or p2.titleForViewer, "ConversationB should have a title string")
	
	return if p1.lastUpdated == nil or p2.lastUpdated == nil then p1.lastUpdated ~= nil or p2.lastUpdated == nil and GetConversationDisplayTitleFunction(p1) < GetConversationDisplayTitleFunction(p2) else p2.lastUpdated < p1.lastUpdated
end