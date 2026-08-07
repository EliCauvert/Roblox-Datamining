local constantsModule = require(script.Parent.Parent.Resources.Constants)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 6 ]]
	-- upvalues: t (ref)
	local t_1 = {
		_target = "EventIngest",
		_eventStreamImpl = p0,
		_context = p1 or "SettingsHub"
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:onToggleMuteAll(p2) --[[ line: 17 ]]
	if p2 then
		self:onMuteAll()
		
		return
	end
	self:onUnmuteAll()
end

function t:onToggleMuteSelf(p3) --[[ line: 25 ]]
	if p3 then
		self:onMuteSelf()
		
		return
	end
	self:onUnmuteSelf()
end

function t:onToggleMutePlayer(p4, p5) --[[ line: 33 ]]
	if p5 then
		self:onMutePlayer(p4)
		
		return
	end
	self:onUnmutePlayer(p4)
end

function t:onMuteSelf() --[[ line: 41 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MuteSelf, {})
end

function t:onUnmuteSelf() --[[ line: 46 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmuteSelf, {})
end

function t:onMuteAll() --[[ line: 51 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MuteAll, {})
end

function t:onUnmuteAll() --[[ line: 56 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmuteAll, {})
end

function t:onMutePlayer(p6) --[[ line: 61 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MutePlayer, { mutedUserId = p6 })
end

function t:onUnmutePlayer(p7) --[[ line: 68 ]]
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmutePlayer, { mutedUserId = p7 })
end

return t