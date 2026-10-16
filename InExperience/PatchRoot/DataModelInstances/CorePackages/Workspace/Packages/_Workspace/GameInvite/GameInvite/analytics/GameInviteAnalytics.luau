local CryoModule = require(script:FindFirstAncestor("GameInvite").Parent.Cryo)
game:DefineFastFlag("GameInviteModalIncludeLinkIdInShareButton", false)
local GameInviteAnalyticsModule = {}
GameInviteAnalyticsModule.__index = GameInviteAnalyticsModule
GameInviteAnalyticsModule.ButtonName = {
	SettingsHub = "settingsHub",
	ModalPrompt = "modalPrompt",
	GameDetailsMoreMenu = "uaGameDetailsMoreMenu",
	GameDetailsPlayWithFriendsMenu = "uaGameDetailsPlayWithFriendsMenu"
}
GameInviteAnalyticsModule.EventName = {
	InviteSent = "inputShareGameInviteSent",
	EntryPoint = "inputShareGameEntryPoint",
	LinkGenerated = "linkGenerated",
	ShareButtonClick = "buttonClick",
	InviteSearchFocused = "inviteSearchFocused",
	GameInviteModal = "gameInviteModal"
}
GameInviteAnalyticsModule.ActionType = {
	ModalOpen = "modalOpen",
	InviteTriggered = "inviteTriggered",
	ModalClose = "modalClose",
	InviteFailure = "inviteFailure"
}
GameInviteAnalyticsModule.DiagCounters = {
	EntryPoint = {
		[GameInviteAnalyticsModule.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter"),
		[GameInviteAnalyticsModule.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptEntryCounter")
	},
	InviteSent = {
		[GameInviteAnalyticsModule.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubInviteCounter"),
		[GameInviteAnalyticsModule.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptInviteCounter")
	}
}

function GameInviteAnalyticsModule.new() --[[ Line: 47 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	local config = {
		_eventStreamImpl = nil,
		_diagImpl = nil,
		_buttonName = nil
	}
	setmetatable(config, GameInviteAnalyticsModule)
	
	return config
end

function GameInviteAnalyticsModule:withEventStream(_eventStreamImpl) --[[ Line: 58 ]]
	self._eventStreamImpl = _eventStreamImpl
	
	return self
end

function GameInviteAnalyticsModule:withDiag(_diagImpl) --[[ Line: 63 ]]
	self._diagImpl = _diagImpl
	
	return self
end

function GameInviteAnalyticsModule:withButtonName(_buttonName) --[[ Line: 68 ]]
	self._buttonName = _buttonName
	
	return self
end

function GameInviteAnalyticsModule:onActivatedInviteSent(_, p1, List, p2, p3) --[[ Line: 73 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	local ButtonName = self:_getButtonName()
	local InApp: string = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local InviteSent = GameInviteAnalyticsModule.EventName.InviteSent
	local Joined = table.concat(List, ",")
	local Text = nil
	local Text1 = nil
	
	if self:_getIsUniversalApp() then
		Text = tostring(p2)
		Text1 = tostring(p3)
	else
		Text = tostring(game.PlaceId)
		Text1 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(InApp, InviteSent, {
		btn = ButtonName,
		placeId = Text,
		gameId = Text1,
		conversationId = tostring(p1),
		participants = Joined
	})
	local InviteSentEntry = GameInviteAnalyticsModule.DiagCounters.InviteSent[self:_getButtonName()]
	
	if InviteSentEntry then
		self:_getDiag():reportCounter(InviteSentEntry, 1)
	end
end

function GameInviteAnalyticsModule:inputShareGameEntryPoint(p1, p2) --[[ Line: 105 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	local ButtonName = self:_getButtonName()
	local InApp: string = if self:_getIsUniversalApp() then "inApp" else "inGame"
	local EntryPoint = GameInviteAnalyticsModule.EventName.EntryPoint
	local Text = nil
	local Text1 = nil
	
	if self:_getIsUniversalApp() then
		Text = tostring(p1)
		Text1 = tostring(p2)
	else
		Text = tostring(game.PlaceId)
		Text1 = tostring(game.GameId)
	end
	self:_getEventStream():setRBXEventStream(InApp, EntryPoint, { btn = ButtonName, placeId = Text, gameId = Text1 })
	local EntryPointEntry = GameInviteAnalyticsModule.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if EntryPointEntry then
		self:_getDiag():reportCounter(EntryPointEntry, 1)
	end
end

function GameInviteAnalyticsModule:linkGenerated(p1) --[[ Line: 133 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	self:_getEventStream():setRBXEventStream("shareLinks", GameInviteAnalyticsModule.EventName.LinkGenerated, {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		linkType = p1.linkType,
		linkId = p1.linkId
	})
end

function GameInviteAnalyticsModule:onShareButtonClick(p1) --[[ Line: 145 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	self:_getEventStream():setRBXEventStream("shareLinks", GameInviteAnalyticsModule.EventName.ShareButtonClick, {
		btn = "shareServerInviteLink",
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		isShortUrlEnabled = true,
		linkId = if game:GetFastFlag("GameInviteModalIncludeLinkIdInShareButton") then p1 else nil
	})
end

function GameInviteAnalyticsModule:onSearchFocused() --[[ Line: 158 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	local InviteSearchFocused = GameInviteAnalyticsModule.EventName.InviteSearchFocused
	local v1 = "inGame"
	local config = {
		page = "inGameMenu",
		subpage = "inviteFriendsPage",
		btn = self:_getButtonName()
	}
	
	if self:_getIsUniversalApp() then
		v1 = "inApp"
		config.page = "inAppGameDetails"
	end
	self:_getEventStream():setRBXEventStream(v1, InviteSearchFocused, config)
end

function GameInviteAnalyticsModule:sendEvent(p1, p2, p3) --[[ Line: 173 ]]
	-- upvalues: CryoModule (copy)
	local JoinResult = CryoModule.Dictionary.join(p2.Args, {
		placeId = if self:_getIsUniversalApp() and p3 and p3.place_id then p3.place_id else game.PlaceId
	})
	
	if p3 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p3)
	end
	self:_getEventStream():setRBXEventStream(p1, p2.Type, JoinResult)
end

function GameInviteAnalyticsModule:sendGameInviteModalEvent(p1, p2) --[[ Line: 187 ]]
	-- upvalues: CryoModule (copy), GameInviteAnalyticsModule (copy)
	local JoinResult = {
		place_id = if self:_getIsUniversalApp() and p2 and p2.place_id then p2.place_id else game.PlaceId
	}
	
	if p2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, p2)
	end
	self:_getEventStream():setRBXEventStream(p1, GameInviteAnalyticsModule.EventName.GameInviteModal, JoinResult)
end

function GameInviteAnalyticsModule:_getEventStream() --[[ Line: 201 ]]
	assert(self._eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?")
	
	return self._eventStreamImpl
end

function GameInviteAnalyticsModule:_getDiag() --[[ Line: 206 ]]
	assert(self._diagImpl, "Diag implementation not found. Did you forget to construct withDiag?")
	
	return self._diagImpl
end

function GameInviteAnalyticsModule:_getButtonName() --[[ Line: 211 ]]
	assert(self._buttonName, "ButtonName not found. Did you forget to construct withButtonName?")
	
	return self._buttonName
end

function GameInviteAnalyticsModule:_getIsUniversalApp(): boolean --[[ Line: 216 ]]
	-- upvalues: GameInviteAnalyticsModule (copy)
	assert(self._buttonName, "ButtonName not found. Did you forget to construct withButtonName?")
	
	return self._buttonName == GameInviteAnalyticsModule.ButtonName.GameDetailsMoreMenu or self._buttonName == GameInviteAnalyticsModule.ButtonName.GameDetailsPlayWithFriendsMenu
end

return GameInviteAnalyticsModule