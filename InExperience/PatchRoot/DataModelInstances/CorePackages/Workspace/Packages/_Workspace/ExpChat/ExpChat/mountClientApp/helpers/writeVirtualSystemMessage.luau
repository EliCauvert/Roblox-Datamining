local expChat = script:FindFirstAncestor("ExpChat")
local markChannelUnreadForSystemMessageModule = require(expChat.Actions.MarkChannelUnreadForSystemMessage)
local shouldSuppressUnreadForTabMetadataModule = require(expChat.shouldSuppressUnreadForTabMetadata)
local fFlagExpChatUnreadTabIndicatorV2WindowModule = require(expChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)

return function(p1, p2)
	-- upvalues: shouldSuppressUnreadForTabMetadataModule (ref), fFlagExpChatUnreadTabIndicatorV2WindowModule (ref), markChannelUnreadForSystemMessageModule (ref)
	p1.messagesStore.addSystemMessage(p2.text, p2.channelName, p2.metadata, p2.postProcessMessage, p2.isError, p2.textChannel)
	p1.resetTextTransparency(p2.channelName)
	
	if p1.suppressWelcomeMessageTabUnread and shouldSuppressUnreadForTabMetadataModule(p2.metadata) then return end
	if p1.channelTabsStore then
		p1.channelTabsStore.markChannelUnread(p2.channelName)
		
		return
	elseif fFlagExpChatUnreadTabIndicatorV2WindowModule then
		p1.store:dispatch(markChannelUnreadForSystemMessageModule(p2.text, p2.channelName, p2.metadata))
	end
end