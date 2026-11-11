local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local VoiceAnalyticsModule = {}
VoiceAnalyticsModule.__index = VoiceAnalyticsModule

function VoiceAnalyticsModule.new(_eventStreamImpl, p1)
	-- upvalues: VoiceAnalyticsModule (copy)
	local config = {
		_target = "EventIngest",
		_eventStreamImpl = _eventStreamImpl,
		_context = p1 or "SettingsHub"
	}
	setmetatable(config, VoiceAnalyticsModule)
	
	return config
end

function VoiceAnalyticsModule:onToggleMuteAll(p1)
	if p1 then
		self:onMuteAll()
		
		return
	else
		self:onUnmuteAll()
	end
end

function VoiceAnalyticsModule:onToggleMuteSelf(p1)
	if p1 then
		self:onMuteSelf()
		
		return
	else
		self:onUnmuteSelf()
	end
end

function VoiceAnalyticsModule:onToggleMutePlayer(MutedUserId, p1)
	if p1 then
		self:onMutePlayer(MutedUserId)
		
		return
	else
		self:onUnmutePlayer(MutedUserId)
	end
end

function VoiceAnalyticsModule:onMuteSelf()
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MuteSelf, {})
end

function VoiceAnalyticsModule:onUnmuteSelf()
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmuteSelf, {})
end

function VoiceAnalyticsModule:onMuteAll()
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MuteAll, {})
end

function VoiceAnalyticsModule:onUnmuteAll()
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmuteAll, {})
end

function VoiceAnalyticsModule:onMutePlayer(MutedUserId)
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MutePlayer, { mutedUserId = MutedUserId })
end

function VoiceAnalyticsModule:onUnmutePlayer(MutedUserId)
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmutePlayer, { mutedUserId = MutedUserId })
end

return VoiceAnalyticsModule