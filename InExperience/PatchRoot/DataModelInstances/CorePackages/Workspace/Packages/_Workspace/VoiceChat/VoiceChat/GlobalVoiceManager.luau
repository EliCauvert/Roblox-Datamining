local parent = script:FindFirstAncestor("VoiceChat").Parent
local voiceChatCoreModule = require(parent.VoiceChatCore)
local crossExperienceVoiceModule = require(parent.CrossExperienceVoice)
local crossExperienceModule = require(parent.CrossExperience)
local sharedFlagsModule = require(parent.SharedFlags)
local default = voiceChatCoreModule.CoreVoiceManager.default
local default_1 = crossExperienceVoiceModule.CrossExperienceVoiceManager.default
local AUDIO_FOCUS_MANAGEMENT = crossExperienceModule.Constants.AUDIO_FOCUS_MANAGEMENT
local fFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice()
local fFlagEnableCrossExperienceVoiceCaptureMute = sharedFlagsModule.GetFFlagEnableCrossExperienceVoiceCaptureMute()
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	
	return t_1
end

function t.isPublicVoiceFocused(_)
	-- upvalues: fFlagEnableCrossExpVoice (ref), default_1 (ref), AUDIO_FOCUS_MANAGEMENT (ref)
	return not fFlagEnableCrossExpVoice or default_1:getCurrentAudioContext() == AUDIO_FOCUS_MANAGEMENT.UGC.CONTEXT_ID
end

function t.isPrivateVoiceFocused(_)
	-- upvalues: fFlagEnableCrossExpVoice (ref), default_1 (ref), AUDIO_FOCUS_MANAGEMENT (ref)
	return fFlagEnableCrossExpVoice and default_1:getCurrentAudioContext() == AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
end

function t:MuteAll(p1)
	-- upvalues: fFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref), default (ref)
	if self:isPrivateVoiceFocused() and fFlagEnableCrossExperienceVoiceCaptureMute then
		default_1:muteAll(p1)
	end
	if self:isPublicVoiceFocused() and default:UserVoiceEnabled() and default:IsInitialized() then
		default:MuteAll(true, p1)
	end
end

function t:UnmuteAll(p1)
	-- upvalues: fFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref), default (ref)
	if self:isPrivateVoiceFocused() and fFlagEnableCrossExperienceVoiceCaptureMute then
		default_1:unmuteAll(p1)
	end
	if self:isPublicVoiceFocused() and default:UserVoiceEnabled() and default:IsInitialized() then
		default:MuteAll(false, p1)
	end
end

t.default = t.new()

return t