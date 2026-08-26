local cryoModule = require(script:FindFirstAncestor("GameInvite").Parent.Cryo)
game:DefineFastFlag("GameInviteModalIncludeLinkIdInShareButton", false)
local t = {}
t.__index = t
t.ButtonName = {
	SettingsHub = "settingsHub",
	ModalPrompt = "modalPrompt",
	GameDetailsMoreMenu = "uaGameDetailsMoreMenu",
	GameDetailsPlayWithFriendsMenu = "uaGameDetailsPlayWithFriendsMenu"
}
t.EventName = {
	InviteSent = "inputShareGameInviteSent",
	EntryPoint = "inputShareGameEntryPoint",
	LinkGenerated = "linkGenerated",
	ShareButtonClick = "buttonClick",
	InviteSearchFocused = "inviteSearchFocused",
	GameInviteModal = "gameInviteModal"
}
t.ActionType = {
	ModalOpen = "modalOpen",
	InviteTriggered = "inviteTriggered",
	ModalClose = "modalClose",
	InviteFailure = "inviteFailure"
}
t.DiagCounters = {
	EntryPoint = {
		[t.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter"),
		[t.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptEntryCounter")
	},
	InviteSent = {
		[t.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubInviteCounter"),
		[t.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptInviteCounter")
	}
}

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		_eventStreamImpl = nil,
		_diagImpl = nil,
		_buttonName = nil
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:withEventStream(p1)
	self._eventStreamImpl = p1
	
	return self
end

function t:withDiag(p1)
	self._diagImpl = p1
	
	return self
end

function t:withButtonName(p1)
	self._buttonName = p1
	
	return self
end

function t:onActivatedInviteSent(_, p1, p2, p3, p4)
	-- upvalues: t (ref)
	local var1, var2
	local buttonName = self:_getButtonName()
	local var3 = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local inviteSent = t.EventName.InviteSent
	local joined = table.concat(p2, ",")
	local _ = nil
	local _ = nil
	
	if self:_getIsUniversalApp() then
		var1 = tostring(p3)
		var2 = tostring(p4)
	else
		var1 = tostring(game.PlaceId)
		var2 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(var3, inviteSent, {
		btn = buttonName,
		placeId = var1,
		gameId = var2,
		conversationId = tostring(p1),
		participants = joined
	})
	local var4 = t.DiagCounters.InviteSent[self:_getButtonName()]
	
	if var4 then
		self:_getDiag():reportCounter(var4, 1)
	end
end

function t:inputShareGameEntryPoint(p1, p2)
	-- upvalues: t (ref)
	local var1, var2
	local buttonName = self:_getButtonName()
	local var3 = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local entryPoint = t.EventName.EntryPoint
	local _ = nil
	local _ = nil
	
	if self:_getIsUniversalApp() then
		var1 = tostring(p1)
		var2 = tostring(p2)
	else
		var1 = tostring(game.PlaceId)
		var2 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(var3, entryPoint, { btn = buttonName, placeId = var1, gameId = var2 })
	local var4 = t.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if var4 then
		self:_getDiag():reportCounter(var4, 1)
	end
end

function t:linkGenerated(p1)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("shareLinks", t.EventName.LinkGenerated, {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		linkType = p1.linkType,
		linkId = p1.linkId
	})
end

function t:onShareButtonClick(p1)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("shareLinks", t.EventName.ShareButtonClick, {
		btn = "shareServerInviteLink",
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		isShortUrlEnabled = true,
		linkId = if game:GetFastFlag("GameInviteModalIncludeLinkIdInShareButton") then p1 else nil
	})
end

function t:onSearchFocused()
	-- upvalues: t (ref)
	local inviteSearchFocused = t.EventName.InviteSearchFocused
	local var1 = "inGame"
	local t_1 = {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		btn = self:_getButtonName()
	}
	
	if self:_getIsUniversalApp() then
		var1 = "inApp"
		t_1.page = "inAppGameDetails"
	end
	self:_getEventStream():setRBXEventStream(var1, inviteSearchFocused, t_1)
end

function t:sendEvent(p1, p2, p3)
	-- upvalues: cryoModule (ref)
	local join = cryoModule.Dictionary.join
	join = join(p2.Args, {
		placeId = if self:_getIsUniversalApp() and p3 and p3.place_id then p3.place_id else game.PlaceId
	})
	
	if p3 then
		join = cryoModule.Dictionary.join(join, p3)
	end
	self:_getEventStream():setRBXEventStream(p1, p2.Type, join)
end

function t:sendGameInviteModalEvent(p1, p2)
	-- upvalues: cryoModule (ref), t (ref)
	local t_1 = {
		place_id = if self:_getIsUniversalApp() and p2 and p2.place_id then p2.place_id else game.PlaceId
	}
	
	if p2 then
		t_1 = cryoModule.Dictionary.join(t_1, p2)
	end
	self:_getEventStream():setRBXEventStream(p1, t.EventName.GameInviteModal, t_1)
end

function t:_getEventStream()
	assert(self._eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?")
	
	return self._eventStreamImpl
end

function t:_getDiag()
	assert(self._diagImpl, "Diag implementation not found. Did you forget to construct withDiag?")
	
	return self._diagImpl
end

function t:_getButtonName()
	assert(self._buttonName, "ButtonName not found. Did you forget to construct withButtonName?")
	
	return self._buttonName
end

function t:_getIsUniversalApp()
	-- upvalues: t (ref)
	assert(self._buttonName, "ButtonName not found. Did you forget to construct withButtonName?")
	
	return if self._buttonName ~= t.ButtonName.GameDetailsMoreMenu then self._buttonName == t.ButtonName.GameDetailsPlayWithFriendsMenu else true
end

return t