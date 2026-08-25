local cryoModule = require(script:FindFirstAncestor("AppChat").Parent.Cryo)
local t = {}
t.__index = t
t.DiagCounters = {
	FetchedOlderConversation = game:DefineFastString("RoactChatFetchedOlderConversationCounter", "RoactChatFetchedOlderConversation"),
	LuaShareGameInputBarEntry = game:DefineFastString("LuaShareGameRoactChatInputBarEntryCounter", "LuaShareGameRoactChatInputBarEntry"),
	LuaShareGameInputBarInvite = game:DefineFastString("LuaShareGameRoactChatInputBarInviteCounter", "LuaShareGameRoactChatInputBarInvite"),
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

function t.new(p0, p1)
	-- upvalues: t (ref)
	assert(p1, "RoactChatAnalytics must be passed the ID of the local user")
	local t_1 = {
		hasAlreadyFetchedOlderConversations = false,
		_diagImpl = p0.Diag,
		_eventStreamImpl = p0.EventStream,
		localUserId = p1
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:withEventStream(p2)
	self._eventStreamImpl = p2
	
	return self
end

function t:withDiag(p3)
	self._diagImpl = p3
	
	return self
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

function t:inputShareGameInviteSent(p4, p5, p6, p7, p8)
	-- upvalues: t (ref)
	self._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", {
		btn = "roactChatInputBar",
		placeId = tostring(p4),
		gameId = tostring(p5),
		senderId = p6,
		conversationId = tostring(p7),
		participants = table.concat(p8, ",")
	})
	self._diagImpl:reportCounter(t.DiagCounters.LuaShareGameInputBarInvite, 1)
end

function t:inputShareGameEntryPoint(p9)
	-- upvalues: t (ref)
	self._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", {
		btn = "roactChatInputBar",
		uid = self.localUserId,
		cid = tostring(p9)
	})
	self._diagImpl:reportCounter(t.DiagCounters.LuaShareGameInputBarEntry, 1)
end

function t:loadGameLinkCardInChat(p10, p11)
	self._eventStreamImpl:setRBXEventStream("roactChat", "loadGameLinkCardInChat", {
		uid = self.localUserId,
		cid = tostring(p10),
		pid = tostring(p11)
	})
end

function t:userLoadedChat()
	-- upvalues: t (ref)
	self._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", { uid = self.localUserId })
	self._diagImpl:reportCounter(t.DiagCounters.UserLoadedChat, 1)
end

function t:navigate(p12)
	-- upvalues: t_1 (ref), t (ref), cryoModule (ref)
	assert(t_1[p12], "Invalid navigation option given")
	self._diagImpl:reportCounter(t.DiagCounters[p12], 1)
	self._eventStreamImpl:setRBXEventStream("chat", "buttonClick", cryoModule.Dictionary.join({ uid = self.localUserId }, t_1[p12]))
end

return t