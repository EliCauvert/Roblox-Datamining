local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local t = {}
t.__index = t
t.DiagCounters = {
	FetchedOlderConversation = game:DefineFastString("RoactChatFetchedOlderConversationCounter", "RoactChatFetchedOlderConversation"),
	UserLoadedChat = game:DefineFastString("RoactChatUserLoadedCounter", "RoactChatUserLoaded")
}
t.DiagCounters.ChatDetailsProfile = game:DefineFastString("RoactChatNavigationChatDetailsProfileCounter", "RoactChatNavigationChatDetailsProfile")
t.DiagCounters.ChatConversationProfile = game:DefineFastString("RoactChatNavigationChatConversationProfileCounter", "RoactChatNavigationChatConversationProfile")
t.NavigationEvents = {
	ChatDetailsProfile = "ChatDetailsProfile",
	ChatConversationProfile = "ChatConversationProfile"
}
local t_1 = {
	[t.NavigationEvents.ChatConversationProfile] = {
		subpage = "peekView",
		page = "playerProfile",
		btn = "chatIcon"
	},
	[t.NavigationEvents.ChatDetailsProfile] = {
		subpage = "peekView",
		page = "playerProfile",
		btn = "chatDetailsMenu"
	}
}

function t.new(p1, p2)
	-- upvalues: t (ref)
	assert(p2, "RoactChatAnalytics must be passed the ID of the local user")
	local t_1 = {
		hasAlreadyFetchedOlderConversations = false,
		_diagImpl = p1.Diag,
		_eventStreamImpl = p1.EventStream,
		localUserId = p2
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:userFetchedOlderConversations()
	-- upvalues: t (ref)
	if self.hasAlreadyFetchedOlderConversations then
		return
	end
	self.hasAlreadyFetchedOlderConversations = true
	self._eventStreamImpl:setRBXEventStream("roactChat", "userFetchedOlderConversations", { uid = self.localUserId })
	self._diagImpl:reportCounter(t.DiagCounters.FetchedOlderConversation, 1)
end

function t:loadGameLinkCardInChat(p1, p2)
	self._eventStreamImpl:setRBXEventStream("roactChat", "loadGameLinkCardInChat", {
		uid = self.localUserId,
		cid = tostring(p1),
		pid = tostring(p2)
	})
end

function t:userLoadedChat()
	-- upvalues: t (ref)
	self._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", { uid = self.localUserId })
	self._diagImpl:reportCounter(t.DiagCounters.UserLoadedChat, 1)
end

function t:navigate(p1)
	-- upvalues: t_1 (ref), t (ref), cryoModule (ref)
	assert(t_1[p1], "Invalid navigation option given")
	self._diagImpl:reportCounter(t.DiagCounters[p1], 1)
	self._eventStreamImpl:setRBXEventStream("chat", "buttonClick", cryoModule.Dictionary.join({ uid = self.localUserId }, t_1[p1]))
end

return t