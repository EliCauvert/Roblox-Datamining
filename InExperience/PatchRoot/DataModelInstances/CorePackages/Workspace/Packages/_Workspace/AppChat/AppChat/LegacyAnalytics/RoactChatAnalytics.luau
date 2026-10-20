local CryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local RoactChatAnalyticsModule = {}
RoactChatAnalyticsModule.__index = RoactChatAnalyticsModule
RoactChatAnalyticsModule.DiagCounters = {
	FetchedOlderConversation = game:DefineFastString("RoactChatFetchedOlderConversationCounter", "RoactChatFetchedOlderConversation"),
	UserLoadedChat = game:DefineFastString("RoactChatUserLoadedCounter", "RoactChatUserLoaded")
}
RoactChatAnalyticsModule.DiagCounters.ChatDetailsProfile = game:DefineFastString("RoactChatNavigationChatDetailsProfileCounter", "RoactChatNavigationChatDetailsProfile")
RoactChatAnalyticsModule.DiagCounters.ChatConversationProfile = game:DefineFastString("RoactChatNavigationChatConversationProfileCounter", "RoactChatNavigationChatConversationProfile")
RoactChatAnalyticsModule.NavigationEvents = {
	ChatDetailsProfile = "ChatDetailsProfile",
	ChatConversationProfile = "ChatConversationProfile"
}
local config = {
	[RoactChatAnalyticsModule.NavigationEvents.ChatConversationProfile] = {
		subpage = "peekView",
		page = "playerProfile",
		btn = "chatIcon"
	},
	[RoactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile] = {
		subpage = "peekView",
		page = "playerProfile",
		btn = "chatDetailsMenu"
	}
}

function RoactChatAnalyticsModule.new(p1, LocalUserId)
	-- upvalues: RoactChatAnalyticsModule (copy)
	assert(LocalUserId, "RoactChatAnalytics must be passed the ID of the local user")
	local config = {
		hasAlreadyFetchedOlderConversations = false,
		_diagImpl = p1.Diag,
		_eventStreamImpl = p1.EventStream,
		localUserId = LocalUserId
	}
	setmetatable(config, RoactChatAnalyticsModule)
	
	return config
end

function RoactChatAnalyticsModule:userFetchedOlderConversations()
	-- upvalues: RoactChatAnalyticsModule (copy)
	if not self.hasAlreadyFetchedOlderConversations then
		self.hasAlreadyFetchedOlderConversations = true
		self._eventStreamImpl:setRBXEventStream("roactChat", "userFetchedOlderConversations", { uid = self.localUserId })
		self._diagImpl:reportCounter(RoactChatAnalyticsModule.DiagCounters.FetchedOlderConversation, 1)
		
		return
	end
end

function RoactChatAnalyticsModule:loadGameLinkCardInChat(p1, p2)
	self._eventStreamImpl:setRBXEventStream("roactChat", "loadGameLinkCardInChat", {
		uid = self.localUserId,
		cid = tostring(p1),
		pid = tostring(p2)
	})
end

function RoactChatAnalyticsModule:userLoadedChat()
	-- upvalues: RoactChatAnalyticsModule (copy)
	self._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", { uid = self.localUserId })
	self._diagImpl:reportCounter(RoactChatAnalyticsModule.DiagCounters.UserLoadedChat, 1)
end

function RoactChatAnalyticsModule:navigate(p1)
	-- upvalues: config (copy), RoactChatAnalyticsModule (copy), CryoModule (copy)
	assert(config[p1], "Invalid navigation option given")
	self._diagImpl:reportCounter(RoactChatAnalyticsModule.DiagCounters[p1], 1)
	self._eventStreamImpl:setRBXEventStream("chat", "buttonClick", CryoModule.Dictionary.join({ uid = self.localUserId }, config[p1]))
end

return RoactChatAnalyticsModule