local ConstantsModule = require(script.Parent.Parent.Resources.Constants)
local VoiceAnalyticsModule = {}
VoiceAnalyticsModule.__index = VoiceAnalyticsModule

function VoiceAnalyticsModule.new(_eventStreamImpl, p1) --[[ Line: 6 ]]
	-- upvalues: VoiceAnalyticsModule (copy)
	local config = {
		_target = "EventIngest",
		_eventStreamImpl = _eventStreamImpl,
		_context = p1 or "SettingsHub"
	}
	setmetatable(config, VoiceAnalyticsModule)
	
	return config
end

function VoiceAnalyticsModule:onToggleMuteAll(p1) --[[ Line: 17 ]]
	if p1 then
		self:onMuteAll()
		
		return
	else
		self:onUnmuteAll()
	end
end

function VoiceAnalyticsModule:onToggleMuteSelf(p1) --[[ Line: 25 ]]
	if p1 then
		self:onMuteSelf()
		
		return
	else
		self:onUnmuteSelf()
	end
end

function VoiceAnalyticsModule:onToggleMutePlayer(MutedUserId, p1) --[[ Line: 33 ]]
	if p1 then
		self:onMutePlayer(MutedUserId)
		
		return
	else
		self:onUnmutePlayer(MutedUserId)
	end
end

function VoiceAnalyticsModule:onMuteSelf() --[[ Line: 41 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MuteSelf, {})
end

function VoiceAnalyticsModule:onUnmuteSelf() --[[ Line: 46 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmuteSelf, {})
end

function VoiceAnalyticsModule:onMuteAll() --[[ Line: 51 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MuteAll, {})
end

function VoiceAnalyticsModule:onUnmuteAll() --[[ Line: 56 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmuteAll, {})
end

function VoiceAnalyticsModule:onMutePlayer(MutedUserId) --[[ Line: 61 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.MutePlayer, { mutedUserId = MutedUserId })
end

function VoiceAnalyticsModule:onUnmutePlayer(MutedUserId) --[[ Line: 68 ]]
	-- upvalues: ConstantsModule (copy)
	self._eventStreamImpl:setRBXEventStream(self._target, self._context, ConstantsModule.VoiceAnalytics.UnmutePlayer, { mutedUserId = MutedUserId })
end

return VoiceAnalyticsModule