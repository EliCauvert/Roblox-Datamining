local ShareGameAnalyticsModule = {}
ShareGameAnalyticsModule.__index = ShareGameAnalyticsModule
ShareGameAnalyticsModule.ButtonName = {
	LuaChatInputBar = "luaChatInputBar",
	LuaGameDetails = "luaGameDetails"
}
ShareGameAnalyticsModule.EventName = {
	InviteSent = "inputShareGameInviteSent",
	EntryPoint = "inputShareGameEntryPoint"
}
ShareGameAnalyticsModule.DiagCounters = {
	EntryPoint = {
		[ShareGameAnalyticsModule.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarEntryCounter", "LuaShareGameLuaChatInputBarEntryCounter"),
		[ShareGameAnalyticsModule.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsEntryCounter", "LuaShareGameLuaGameDetailsEntryCounter")
	},
	InviteSent = {
		[ShareGameAnalyticsModule.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarInviteCounter", "LuaShareGameLuaChatInputBarInviteCounter"),
		[ShareGameAnalyticsModule.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsInviteCounter", "LuaShareGameLuaGameDetailsInviteCounter")
	}
}

function ShareGameAnalyticsModule.new(_eventStreamImpl, _diagImpl, _buttonName)
	-- upvalues: ShareGameAnalyticsModule (copy)
	assert(_eventStreamImpl, "EventStream implementation not found.")
	assert(_diagImpl, "Diag implementation not found.")
	assert(_buttonName, "ButtonName not found.")
	
	return (setmetatable({
		_eventStreamImpl = _eventStreamImpl,
		_diagImpl = _diagImpl,
		_buttonName = _buttonName
	}, ShareGameAnalyticsModule))
end

function ShareGameAnalyticsModule:onActivatedInviteSent(p1, p2, SenderId, p3, List)
	-- upvalues: ShareGameAnalyticsModule (copy)
	self:_getEventStream():setRBXEventStream("touch", ShareGameAnalyticsModule.EventName.InviteSent, {
		btn = self:_getButtonName(),
		placeId = tostring(p1),
		gameId = tostring(p2),
		senderId = SenderId,
		conversationId = tostring(p3),
		participants = table.concat(List, ",")
	})
	local InviteSentEntry = ShareGameAnalyticsModule.DiagCounters.InviteSent[self:_getButtonName()]
	
	if InviteSentEntry then
		self:_getDiag():reportCounter(InviteSentEntry, 1)
	end
end

function ShareGameAnalyticsModule:inputShareGameEntryPoint(p1, p2)
	-- upvalues: ShareGameAnalyticsModule (copy)
	self:_getEventStream():setRBXEventStream("touch", ShareGameAnalyticsModule.EventName.EntryPoint, {
		btn = self:_getButtonName(),
		placeId = p1 and tostring(p1),
		gameId = p2 and tostring(p2)
	})
	local EntryPointEntry = ShareGameAnalyticsModule.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if EntryPointEntry then
		self:_getDiag():reportCounter(EntryPointEntry, 1)
	end
end

function ShareGameAnalyticsModule:_getEventStream()
	return self._eventStreamImpl
end

function ShareGameAnalyticsModule:_getDiag()
	return self._diagImpl
end

function ShareGameAnalyticsModule:_getButtonName()
	return self._buttonName
end

return ShareGameAnalyticsModule