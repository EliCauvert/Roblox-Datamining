local parent = script.Parent.Parent
local parent_1 = parent.Parent
local default = require(parent_1.VoiceChatCore).CoreVoiceManager.default
local default_1 = require(parent_1.VoiceChat).GlobalVoiceManager.default
local eventNamesModule = require(parent.Analytics.EventNames)
local videoCaptureStartedModule = require(parent.Actions.VideoCaptureStarted)
local videoCaptureStoppedModule = require(parent.Actions.VideoCaptureStopped)
local _ = require(parent.Types)
local captureTriggerTypeModule = require(parent.Enums.CaptureTriggerType)
local constantsModule = require(parent.Constants)
local getFFlagEnableVoiceChatMuteForVideoCaptures = require(parent_1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local getFFlagEnableCrossExperienceVoiceCaptureMute = require(parent_1.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute

local function maybeMuteVoiceChat(p0) --[[ line: 22 ]]
	-- upvalues: getFFlagEnableCrossExperienceVoiceCaptureMute (ref), default_1 (ref), default (ref), getFFlagEnableVoiceChatMuteForVideoCaptures (ref)
	if game:GetEngineFeature("ReenableMomentsVoice") then return end
	if getFFlagEnableCrossExperienceVoiceCaptureMute() then
		if p0 then
			default_1:MuteAll("Capture")
		else
			default_1:UnmuteAll("Capture")
		end
	end
	if default:UserVoiceEnabled() and default:IsInitialized() then
		if not getFFlagEnableCrossExperienceVoiceCaptureMute() then
			default:MuteAll(p0, "Capture")
		end
		if getFFlagEnableVoiceChatMuteForVideoCaptures then
			if p0 then
				default:RequestHidePublicVoiceUI()
				
				return
			end
			default:RequestShowPublicVoiceUI()
		end
	end
end

return function(p1, _, p2) --[[ line: 47 | named "makeVideoCaptureInProgressHandler" ]]
	-- upvalues: constantsModule (ref), videoCaptureStartedModule (ref), captureTriggerTypeModule (ref), maybeMuteVoiceChat (ref), eventNamesModule (ref), videoCaptureStoppedModule (ref)
	return function(p3, p4) --[[ line: 52 | named "videoCaptureInProgressHandler" ]]
		-- upvalues: p1 (ref), constantsModule (copy), videoCaptureStartedModule (copy), captureTriggerTypeModule (copy), maybeMuteVoiceChat (copy), p2 (ref), eventNamesModule (copy), videoCaptureStoppedModule (copy)
		local status = p1:getState()[constantsModule.RoduxKey].IsVideoCaptureActive.status
		
		if p3 and not status then
			p1:dispatch(videoCaptureStartedModule(p4))
			
			if p4 == captureTriggerTypeModule.UserCapture or p4 == captureTriggerTypeModule.DeveloperCapture then
				maybeMuteVoiceChat(true)
			end
			if p4 == captureTriggerTypeModule.DeveloperCapture then
				p2(eventNamesModule.CapturesVideoCaptureDevApiStarted)
			end
			p2(eventNamesModule.CapturesVideoCaptureStarted, { triggerType = p4 })
			
			return
		elseif not p3 and status then
			p1:dispatch(videoCaptureStoppedModule(p4))
			
			if p4 == captureTriggerTypeModule.UserCapture or p4 == captureTriggerTypeModule.DeveloperCapture then
				maybeMuteVoiceChat(false)
			end
			if p4 == captureTriggerTypeModule.DeveloperCapture then
				p2(eventNamesModule.CapturesVideoCaptureDevApiEnded)
			end
			p2(eventNamesModule.CapturesVideoCaptureStopped, { triggerType = p4 })
		end
	end
end