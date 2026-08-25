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

function t:withEventStream(p0)
	self._eventStreamImpl = p0
	
	return self
end

function t:withDiag(p1)
	self._diagImpl = p1
	
	return self
end

function t:withButtonName(p2)
	self._buttonName = p2
	
	return self
end

function t:onActivatedInviteSent(_, p3, p4, p5, p6)
	-- upvalues: t (ref)
	local var6, var7
	local buttonName = self:_getButtonName()
	local var4 = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local inviteSent = t.EventName.InviteSent
	local joined = table.concat(p4, ",")
	local _ = nil
	local _ = nil
	
	if self:_getIsUniversalApp() then
		var6 = tostring(p5)
		var7 = tostring(p6)
	else
		var6 = tostring(game.PlaceId)
		var7 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(var4, inviteSent, {
		btn = buttonName,
		placeId = var6,
		gameId = var7,
		conversationId = tostring(p3),
		participants = joined
	})
	local var8 = t.DiagCounters.InviteSent[self:_getButtonName()]
	
	if var8 then
		self:_getDiag():reportCounter(var8, 1)
	end
end

function t:inputShareGameEntryPoint(p7, p8)
	-- upvalues: t (ref)
	local var11, var12
	local buttonName = self:_getButtonName()
	local var10 = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local entryPoint = t.EventName.EntryPoint
	local _ = nil
	local _ = nil
	
	if self:_getIsUniversalApp() then
		var11 = tostring(p7)
		var12 = tostring(p8)
	else
		var11 = tostring(game.PlaceId)
		var12 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(var10, entryPoint, { btn = buttonName, placeId = var11, gameId = var12 })
	local var13 = t.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if var13 then
		self:_getDiag():reportCounter(var13, 1)
	end
end

function t:linkGenerated(p9)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("shareLinks", t.EventName.LinkGenerated, {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		linkType = p9.linkType,
		linkId = p9.linkId
	})
end

function t:onShareButtonClick(p10)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("shareLinks", t.EventName.ShareButtonClick, {
		btn = "shareServerInviteLink",
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		isShortUrlEnabled = true,
		linkId = if game:GetFastFlag("GameInviteModalIncludeLinkIdInShareButton") then p10 else nil
	})
end

function t:onSearchFocused()
	-- upvalues: t (ref)
	local inviteSearchFocused = t.EventName.InviteSearchFocused
	local var14 = "inGame"
	local t_1 = {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		btn = self:_getButtonName()
	}
	
	if self:_getIsUniversalApp() then
		var14 = "inApp"
		t_1.page = "inAppGameDetails"
	end
	self:_getEventStream():setRBXEventStream(var14, inviteSearchFocused, t_1)
end

function t:sendEvent(p11, p12, p13)
	-- upvalues: cryoModule (ref)
	local join = cryoModule.Dictionary.join
	join = join(p12.Args, {
		placeId = if self:_getIsUniversalApp() and p13 and p13.place_id then p13.place_id else game.PlaceId
	})
	
	if p13 then
		join = cryoModule.Dictionary.join(join, p13)
	end
	self:_getEventStream():setRBXEventStream(p11, p12.Type, join)
end

function t:sendGameInviteModalEvent(p14, p15)
	-- upvalues: cryoModule (ref), t (ref)
	local t_1 = {
		place_id = if self:_getIsUniversalApp() and p15 and p15.place_id then p15.place_id else game.PlaceId
	}
	
	if p15 then
		t_1 = cryoModule.Dictionary.join(t_1, p15)
	end
	self:_getEventStream():setRBXEventStream(p14, t.EventName.GameInviteModal, t_1)
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