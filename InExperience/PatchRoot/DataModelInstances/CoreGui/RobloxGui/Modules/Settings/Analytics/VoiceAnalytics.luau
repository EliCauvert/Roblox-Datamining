local constantsModule = require(script.Parent.Parent.Resources.Constants)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {
		_target = "EventIngest",
		_eventStreamImpl = p1,
		_context = p2 or "SettingsHub"
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:onToggleMuteAll(p1)
	if p1 then
		self:onMuteAll()
		
		return
	end
	self:onUnmuteAll()
end

function t:onToggleMuteSelf(p1)
	if p1 then
		self:onMuteSelf()
		
		return
	end
	self:onUnmuteSelf()
end

function t:onToggleMutePlayer(p1, p2)
	if p2 then
		self:onMutePlayer(p1)
		
		return
	end
	self:onUnmutePlayer(p1)
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

function t:onMutePlayer(p1)
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.MutePlayer, { mutedUserId = p1 })
end

function t:onUnmutePlayer(p1)
	-- upvalues: constantsModule (ref)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, constantsModule.VoiceAnalytics.UnmutePlayer, { mutedUserId = p1 })
end

return t