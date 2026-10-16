local Parent = script:FindFirstAncestor("VoiceChat").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local Default = require(Parent.VoiceChatCore).CoreVoiceManager.default
local Default1 = require(Parent.CrossExperienceVoice).CrossExperienceVoiceManager.default
local AUDIOFOCUSMANAGEMENT = require(Parent.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT
local FFlagEnableCrossExpVoice = SharedFlagsModule.GetFFlagEnableCrossExpVoice()
local FFlagEnableCrossExperienceVoiceCaptureMute = SharedFlagsModule.GetFFlagEnableCrossExperienceVoiceCaptureMute()
local GlobalVoiceManager = {}
GlobalVoiceManager.__index = GlobalVoiceManager

function GlobalVoiceManager.new() --[[ Line: 38 ]]
	-- upvalues: GlobalVoiceManager (copy)
	local t = {}
	setmetatable(t, GlobalVoiceManager)
	
	return t
end

function GlobalVoiceManager:isPublicVoiceFocused(): boolean --[[ Line: 44 ]]
	-- upvalues: FFlagEnableCrossExpVoice (copy), Default1 (copy), AUDIOFOCUSMANAGEMENT (copy)
	return not FFlagEnableCrossExpVoice or Default1:getCurrentAudioContext() == AUDIOFOCUSMANAGEMENT.UGC.CONTEXT_ID
end

function GlobalVoiceManager:isPrivateVoiceFocused(): boolean --[[ Line: 49 ]]
	-- upvalues: FFlagEnableCrossExpVoice (copy), Default1 (copy), AUDIOFOCUSMANAGEMENT (copy)
	return FFlagEnableCrossExpVoice and Default1:getCurrentAudioContext() == AUDIOFOCUSMANAGEMENT.CEV.CONTEXT_ID
end

function GlobalVoiceManager:MuteAll(p1) --[[ Line: 54 ]]
	-- upvalues: FFlagEnableCrossExperienceVoiceCaptureMute (copy), Default1 (copy), Default (copy)
	if self:isPrivateVoiceFocused() and FFlagEnableCrossExperienceVoiceCaptureMute then
		Default1:muteAll(p1)
	end
	if self:isPublicVoiceFocused() and Default:UserVoiceEnabled() and Default:IsInitialized() then
		Default:MuteAll(true, p1)
	end
end

function GlobalVoiceManager:UnmuteAll(p1) --[[ Line: 64 ]]
	-- upvalues: FFlagEnableCrossExperienceVoiceCaptureMute (copy), Default1 (copy), Default (copy)
	if self:isPrivateVoiceFocused() and FFlagEnableCrossExperienceVoiceCaptureMute then
		Default1:unmuteAll(p1)
	end
	if self:isPublicVoiceFocused() and Default:UserVoiceEnabled() and Default:IsInitialized() then
		Default:MuteAll(false, p1)
	end
end

GlobalVoiceManager.default = GlobalVoiceManager.new()

return GlobalVoiceManager