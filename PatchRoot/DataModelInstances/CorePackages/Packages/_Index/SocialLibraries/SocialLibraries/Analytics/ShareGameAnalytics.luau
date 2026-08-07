-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

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

function t.new(p0, p1, p2) --[[ line: 38 ]]
	-- upvalues: t (ref)
	assert(p0, "EventStream implementation not found.")
	assert(p1, "Diag implementation not found.")
	assert(p2, "ButtonName not found.")
	
	return setmetatable({ _eventStreamImpl = p0, _diagImpl = p1, _buttonName = p2 }, t)
end

function t:onActivatedInviteSent(p3, p4, p5, p6, p7) --[[ line: 50 ]]
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("touch", t.EventName.InviteSent, {
		btn = self:_getButtonName(),
		placeId = tostring(p3),
		gameId = tostring(p4),
		senderId = p5,
		conversationId = tostring(p6),
		participants = table.concat(p7, ",")
	})
	local var1 = t.DiagCounters.InviteSent[self:_getButtonName()]
	
	if var1 then
		self:_getDiag():reportCounter(var1, 1)
	end
end

function t:inputShareGameEntryPoint(p8, p9) --[[ line: 71 ]]
	-- upvalues: t (ref)
	self:_getEventStream():setRBXEventStream("touch", t.EventName.EntryPoint, {
		btn = self:_getButtonName(),
		placeId = p8 and tostring(p8),
		gameId = p9 and tostring(p9)
	})
	local var2 = t.DiagCounters.EntryPoint[self:_getButtonName()]
	
	if var2 then
		self:_getDiag():reportCounter(var2, 1)
	end
end

function t:_getEventStream() --[[ line: 89 ]]
	return self._eventStreamImpl
end

function t:_getDiag() --[[ line: 93 ]]
	return self._diagImpl
end

function t:_getButtonName() --[[ line: 97 ]]
	return self._buttonName
end

return t