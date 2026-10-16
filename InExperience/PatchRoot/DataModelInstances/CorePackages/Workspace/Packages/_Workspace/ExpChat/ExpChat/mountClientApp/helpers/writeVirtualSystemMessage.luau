local ExpChat = script:FindFirstAncestor("ExpChat")
local MarkChannelUnreadForSystemMessageModule = require(ExpChat.Actions.MarkChannelUnreadForSystemMessage)
local ShouldSuppressUnreadForTabMetadataModule = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local FFlagExpChatUnreadTabIndicatorV2WindowModule = require(ExpChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)

return function(p1, p2) --[[ Line: 40 | Named "writeVirtualSystemMessage" ]]
	-- upvalues: ShouldSuppressUnreadForTabMetadataModule (copy), FFlagExpChatUnreadTabIndicatorV2WindowModule (copy), MarkChannelUnreadForSystemMessageModule (copy)
	p1.messagesStore.addSystemMessage(p2.text, p2.channelName, p2.metadata, p2.postProcessMessage, p2.isError, p2.textChannel)
	p1.resetTextTransparency(p2.channelName)
	
	if p1.suppressWelcomeMessageTabUnread and ShouldSuppressUnreadForTabMetadataModule(p2.metadata) then return end
	if p1.channelTabsStore then
		p1.channelTabsStore.markChannelUnread(p2.channelName)
		
		return
	end
	if FFlagExpChatUnreadTabIndicatorV2WindowModule then
		p1.store:dispatch(MarkChannelUnreadForSystemMessageModule(p2.text, p2.channelName, p2.metadata))
	end
end