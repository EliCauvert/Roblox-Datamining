local AudioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local DependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local SharedFlags = DependenciesModule.SharedFlags
local FFlagEnableCrossExperienceVoiceCaptureMute = SharedFlags.GetFFlagEnableCrossExperienceVoiceCaptureMute()
local FFlagEnableVoiceChatMuteForVideoCaptures = SharedFlags.GetFFlagEnableVoiceChatMuteForVideoCaptures()
local CaptureService = if FFlagEnableVoiceChatMuteForVideoCaptures then game:GetService("CaptureService") else nil
local React = DependenciesModule.React
local Cryo = DependenciesModule.Cryo

local function useIsCapturingVideo() --[[ Line: 18 ]]
	-- upvalues: React (copy), CaptureService (copy)
	local UseStateResult, UseStateResult2 = React.useState(CaptureService and CaptureService:IsCapturingVideo())
	React.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: CaptureService (upval), UseStateResult2 (copy)
		if not CaptureService then return end
		local VideoCaptureInProgressConnection = CaptureService.VideoCaptureInProgress:Connect(function(IsInProgress) --[[ Line: 26 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(IsInProgress)
		end)
		
		return function() --[[ Line: 30 ]]
			-- upvalues: CaptureService (upval), VideoCaptureInProgressConnection (copy)
			if CaptureService then
				VideoCaptureInProgressConnection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end

return function(): boolean --[[ Line: 40 | Named "useEnableAudioFocusToggle" ]]
	-- upvalues: React (copy), FFlagEnableCrossExperienceVoiceCaptureMute (copy), FFlagEnableVoiceChatMuteForVideoCaptures (copy), useIsCapturingVideo (copy), Cryo (copy), AudioFocusManagementEngineFeature (copy)
	local UseStateResult, UseStateResult2 = React.useState({})
	local UseIsCapturingVideoResult = if FFlagEnableCrossExperienceVoiceCaptureMute and FFlagEnableVoiceChatMuteForVideoCaptures then useIsCapturingVideo() else false
	local UseResult = React.useCallback(function(p1) --[[ Line: 48 ]]
		-- upvalues: UseStateResult (copy), Cryo (upval), UseStateResult2 (copy)
		if not UseStateResult[p1] then
			UseStateResult2((Cryo.Dictionary.join(UseStateResult, { [p1] = true })))
		end
	end, { UseStateResult })
	local UseResult1 = React.useCallback(function(p1) --[[ Line: 57 ]]
		-- upvalues: UseStateResult (copy), Cryo (upval), UseStateResult2 (copy)
		if UseStateResult[p1] then
			UseStateResult2((Cryo.Dictionary.join(UseStateResult, { [p1] = nil })))
		end
	end, { UseStateResult })
	React.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: AudioFocusManagementEngineFeature (upval), UseStateResult2 (copy), UseResult (copy), UseResult1 (copy)
		if not AudioFocusManagementEngineFeature then return end
		local Success, Result = pcall(function() --[[ Line: 71 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if not Success or not Result then return end
		local t = {}
		
		for i, _ in pairs((Result:GetRegisteredContexts())) do
			t[i] = true
		end
		UseStateResult2(t)
		local OnContextRegisteredConnection = Result.OnContextRegistered:Connect(UseResult)
		local OnContextUnregisteredConnection = Result.OnContextUnregistered:Connect(UseResult1)
		
		return function() --[[ Line: 88 ]]
			-- upvalues: OnContextRegisteredConnection (copy), OnContextUnregisteredConnection (copy)
			if OnContextRegisteredConnection then
				OnContextRegisteredConnection:Disconnect()
			end
			if OnContextUnregisteredConnection then
				OnContextUnregisteredConnection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult[1] and (UseStateResult[2] and not UseIsCapturingVideoResult)
end