local audioFocusManagementEngineFeature = game:GetEngineFeature("AudioFocusManagement")
local dependenciesModule = require(script:FindFirstAncestor("CrossExperienceVoice").dependencies)
local sharedFlags = dependenciesModule.SharedFlags
local fFlagEnableCrossExperienceVoiceCaptureMute = sharedFlags.GetFFlagEnableCrossExperienceVoiceCaptureMute()
local fFlagEnableVoiceChatMuteForVideoCaptures = sharedFlags.GetFFlagEnableVoiceChatMuteForVideoCaptures()
local var4 = if fFlagEnableVoiceChatMuteForVideoCaptures then game:GetService("CaptureService") else nil
local react = dependenciesModule.React
local cryo = dependenciesModule.Cryo

local function useIsCapturingVideo()
	-- upvalues: react (ref), var4 (ref)
	local var6, var7 = react.useState(var4 and var4:IsCapturingVideo())
	react.useEffect(function()
		-- upvalues: var4 (copy), var7 (ref)
		if var4 then
			local videoCaptureInProgressConnection = var4.VideoCaptureInProgress:Connect(function(p0)
				-- upvalues: var7 (copy)
				var7(p0)
			end)
			
			return function()
				-- upvalues: var4 (copy), videoCaptureInProgressConnection (ref)
				if var4 then
					videoCaptureInProgressConnection:Disconnect()
				end
			end
		end
	end, {})
	
	return var6
end

return function()
	-- upvalues: react (ref), fFlagEnableCrossExperienceVoiceCaptureMute (ref), fFlagEnableVoiceChatMuteForVideoCaptures (ref), useIsCapturingVideo (ref), cryo (ref), audioFocusManagementEngineFeature (ref)
	local var9, var10 = react.useState({})
	local var11 = if fFlagEnableCrossExperienceVoiceCaptureMute and fFlagEnableVoiceChatMuteForVideoCaptures then useIsCapturingVideo() else false
	local var12 = react.useCallback(function(p1)
		-- upvalues: var9 (ref), cryo (copy), var10 (ref)
		if not var9[p1] then
			var10(cryo.Dictionary.join(var9, { [p1] = true }))
		end
	end, { var9 })
	local var13 = react.useCallback(function(p2)
		-- upvalues: var9 (ref), cryo (copy), var10 (ref)
		if var9[p2] then
			var10(cryo.Dictionary.join(var9, { [p2] = nil }))
		end
	end, { var9 })
	react.useEffect(function()
		-- upvalues: audioFocusManagementEngineFeature (copy), var10 (ref), var12 (ref), var13 (ref)
		if not audioFocusManagementEngineFeature then return end
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if not ok or not status then return end
		local t = {}
		
		for i, v in pairs(status:GetRegisteredContexts()) do
			t[i] = true
		end
		var10(t)
		local onContextRegisteredConnection = status.OnContextRegistered:Connect(var12)
		local onContextUnregisteredConnection = status.OnContextUnregistered:Connect(var13)
		
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
	
	return var9[1] and (var9[2] and not var11)
end