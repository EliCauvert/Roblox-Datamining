local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local sharedFlags = dependenciesModule.SharedFlags
local fFlagEnableCrossExperienceVoiceCaptureMute = sharedFlags.GetFFlagEnableCrossExperienceVoiceCaptureMute()
local fFlagEnableVoiceChatMuteForVideoCaptures = sharedFlags.GetFFlagEnableVoiceChatMuteForVideoCaptures()
local var1 = if fFlagEnableVoiceChatMuteForVideoCaptures then game:GetService("CaptureService") else nil
local react = dependenciesModule.React
local cryo = dependenciesModule.Cryo

local function useIsCapturingVideo()
	-- upvalues: react (ref), var1 (ref)
	local var2, var3 = react.useState(var1 and var1:IsCapturingVideo())
	react.useEffect(function()
		-- upvalues: var1 (copy), var3 (ref)
		if var1 then
			local videoCaptureInProgressConnection = var1.VideoCaptureInProgress:Connect(function(p1)
				-- upvalues: var3 (copy)
				var3(p1)
			end)
			
			return function()
				-- upvalues: var1 (copy), videoCaptureInProgressConnection (ref)
				if var1 then
					videoCaptureInProgressConnection:Disconnect()
				end
			end
		end
	end, {})
	
	return var2
end

return function()
	-- upvalues: react (ref), fFlagEnableCrossExperienceVoiceCaptureMute (ref), fFlagEnableVoiceChatMuteForVideoCaptures (ref), useIsCapturingVideo (ref), cryo (ref), audioFocusManagementEngineFeature (ref)
	local var2, var3 = react.useState({})
	local var4 = if fFlagEnableCrossExperienceVoiceCaptureMute and fFlagEnableVoiceChatMuteForVideoCaptures then useIsCapturingVideo() else false
	local var5 = react.useCallback(function(p1)
		-- upvalues: var2 (ref), cryo (copy), var3 (ref)
		if not var2[p1] then
			var3(cryo.Dictionary.join(var2, { [p1] = true }))
		end
	end, { var2 })
	local var6 = react.useCallback(function(p1)
		-- upvalues: var2 (ref), cryo (copy), var3 (ref)
		if var2[p1] then
			var3(cryo.Dictionary.join(var2, { [p1] = nil }))
		end
	end, { var2 })
	react.useEffect(function()
		-- upvalues: audioFocusManagementEngineFeature (copy), var3 (ref), var5 (ref), var6 (ref)
		if not audioFocusManagementEngineFeature then return end
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if not ok or not status then return end
		local t = {}
		
		for i, v in pairs(status:GetRegisteredContexts()) do
			t[i] = true
		end
		var3(t)
		local onContextRegisteredConnection = status.OnContextRegistered:Connect(var5)
		local onContextUnregisteredConnection = status.OnContextUnregistered:Connect(var6)
		
		return function()
			-- upvalues: onContextRegisteredConnection (ref), onContextUnregisteredConnection (ref)
			if onContextRegisteredConnection then
				onContextRegisteredConnection:Disconnect()
			end
			if onContextUnregisteredConnection then
				onContextUnregisteredConnection:Disconnect()
			end
		end
	end, {})
	
	return var2[1] and (var2[2] and not var4)
end