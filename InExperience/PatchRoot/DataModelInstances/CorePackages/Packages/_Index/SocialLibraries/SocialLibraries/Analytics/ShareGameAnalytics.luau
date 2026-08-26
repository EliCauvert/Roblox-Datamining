local t = {}
t.__index = t
t.ButtonName = {
	LuaChatInputBar = "luaChatInputBar",
	LuaGameDetails = "luaGameDetails"
}
t.EventName = {
	InviteSent = "inputShareGameInviteSent",
	EntryPoint = "inputShareGameEntryPoint"
}
t.DiagCounters = {
	EntryPoint = {
		[t.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarEntryCounter", "LuaShareGameLuaChatInputBarEntryCounter"),
		[t.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsEntryCounter", "LuaShareGameLuaGameDetailsEntryCounter")
	},
	InviteSent = {
		[t.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarInviteCounter", "LuaShareGameLuaChatInputBarInviteCounter"),
		[t.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsInviteCounter", "LuaShareGameLuaGameDetailsInviteCounter")
	}
}

function t.new(p1, p2, p3)
	-- upvalues: t (ref)
	assert(p1, "EventStream implementation not found.")
	assert(p2, "Diag implementation not found.")
	assert(p3, "ButtonName not found.")
	
	return setmetatable({ _eventStreamImpl = p1, _diagImpl = p2, _buttonName = p3 }, t)
end

function t:onActivatedInviteSent(p1, p2, p3, p4, p5)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("touch", t.EventName.InviteSent, {
		btn = self:_getButtonName(),
		placeId = tostring(p1),
		gameId = tostring(p2),
		senderId = p3,
		conversationId = tostring(p4),
		participants = table.concat(p5, ",")
	})
	local var1 = t.DiagCounters.InviteSent[self:_getButtonName()]
	
	if var1 then
		self:_getDiag():reportCounter(var1, 1)
	end
end

function t:inputShareGameEntryPoint(p1, p2)
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("touch", t.EventName.EntryPoint, {
		btn = self:_getButtonName(),
		placeId = p1 and tostring(p1),
		gameId = p2 and tostring(p2)
	})
	local var1 = t.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if var1 then
		self:_getDiag():reportCounter(var1, 1)
	end
end

function t:_getEventStream()
	return self._eventStreamImpl
end

function t:_getDiag()
	return self._diagImpl
end

function t:_getButtonName()
	return self._buttonName
end

return t