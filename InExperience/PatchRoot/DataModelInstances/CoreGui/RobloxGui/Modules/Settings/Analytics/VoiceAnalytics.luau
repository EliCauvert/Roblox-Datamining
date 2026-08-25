local constantsModule = require(script.Parent.Parent.Resources.Constants)
local t = {}
t.__index = t

function t.new(p0, p1)
	-- upvalues: t (ref)
	local t_1 = {
		_target = "EventIngest",
		_eventStreamImpl = p0,
		_context = p1 or "SettingsHub"
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:onToggleMuteAll(p2)
	if p2 then
		self:onMuteAll()
		
		return
	end
	self:onUnmuteAll()
end

function t:onToggleMuteSelf(p3)
	if p3 then
		self:onMuteSelf()
		
		return
	end
	self:onUnmuteSelf()
end

function t:onToggleMutePlayer(p4, p5)
	if p5 then
		self:onMutePlayer(p4)
		
		return
	end
	self:onUnmutePlayer(p4)
end

function t:onMuteSelf()
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MuteSelf, {})
end

function t:onUnmuteSelf()
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmuteSelf, {})
end

function t:onMuteAll()
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MuteAll, {})
end

function t:onUnmuteAll()
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmuteAll, {})
end

function t:onMutePlayer(p6)
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MutePlayer, { mutedUserId = p6 })
end

function t:onUnmutePlayer(p7)
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmutePlayer, { mutedUserId = p7 })
end

return t