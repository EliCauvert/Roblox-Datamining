local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Default = require(Parent1.VoiceChatCore).CoreVoiceManager.default
local Default1 = require(Parent1.VoiceChat).GlobalVoiceManager.default
local EventNamesModule = require(Parent.Analytics.EventNames)
local VideoCaptureStartedModule = require(Parent.Actions.VideoCaptureStarted)
local VideoCaptureStoppedModule = require(Parent.Actions.VideoCaptureStopped)
local _ = require(Parent.Types)
local CaptureTriggerTypeModule = require(Parent.Enums.CaptureTriggerType)
local ConstantsModule = require(Parent.Constants)
local GetFFlagEnableVoiceChatMuteForVideoCaptures = require(Parent1.SharedFlags).GetFFlagEnableVoiceChatMuteForVideoCaptures
local GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction = require(Parent1.SharedFlags).GetFFlagEnableCrossExperienceVoiceCaptureMute

local function maybeMuteVoiceChat(p1) --[[ Line: 22 ]]
	-- upvalues: GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction (copy), Default1 (copy), Default (copy), GetFFlagEnableVoiceChatMuteForVideoCaptures (copy)
	if game:GetEngineFeature("ReenableMomentsVoice") then return end
	if GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then
		if p1 then
			Default1:MuteAll("Capture")
		else
			Default1:UnmuteAll("Capture")
		end
	end
	if Default:UserVoiceEnabled() and Default:IsInitialized() then
		if not GetFFlagEnableCrossExperienceVoiceCaptureMuteFunction() then
			Default:MuteAll(p1, "Capture")
		end
		if GetFFlagEnableVoiceChatMuteForVideoCaptures then
			if p1 then
				Default:RequestHidePublicVoiceUI()
				
				return
			end
			Default:RequestShowPublicVoiceUI()
		end
	end
end

return function(p1, _, Callback) --[[ Line: 47 | Named "makeVideoCaptureInProgressHandler" ]]
	-- upvalues: ConstantsModule (copy), VideoCaptureStartedModule (copy), CaptureTriggerTypeModule (copy), maybeMuteVoiceChat (copy), EventNamesModule (copy), VideoCaptureStoppedModule (copy)
	return function(p2, DeveloperCapture) --[[ Line: 52 | Named "videoCaptureInProgressHandler" ]]
		-- upvalues: p1 (copy), ConstantsModule (upval), VideoCaptureStartedModule (upval), CaptureTriggerTypeModule (upval), maybeMuteVoiceChat (upval), Callback (copy), EventNamesModule (upval), VideoCaptureStoppedModule (upval)
		local Status = p1:getState()[ConstantsModule.RoduxKey].IsVideoCaptureActive.status
		
		if p2 and not Status then
			p1:dispatch(VideoCaptureStartedModule(DeveloperCapture))
			
			if DeveloperCapture == CaptureTriggerTypeModule.UserCapture or DeveloperCapture == CaptureTriggerTypeModule.DeveloperCapture then
				maybeMuteVoiceChat(true)
			end
			if DeveloperCapture == CaptureTriggerTypeModule.DeveloperCapture then
				Callback(EventNamesModule.CapturesVideoCaptureDevApiStarted)
			end
			Callback(EventNamesModule.CapturesVideoCaptureStarted, { triggerType = DeveloperCapture })
			
			return
		else
			if not p2 and Status then
				p1:dispatch(VideoCaptureStoppedModule(DeveloperCapture))
				
				if DeveloperCapture == CaptureTriggerTypeModule.UserCapture or DeveloperCapture == CaptureTriggerTypeModule.DeveloperCapture then
					maybeMuteVoiceChat(false)
				end
				if DeveloperCapture == CaptureTriggerTypeModule.DeveloperCapture then
					Callback(EventNamesModule.CapturesVideoCaptureDevApiEnded)
				end
				Callback(EventNamesModule.CapturesVideoCaptureStopped, { triggerType = DeveloperCapture })
			end
		end
	end
end