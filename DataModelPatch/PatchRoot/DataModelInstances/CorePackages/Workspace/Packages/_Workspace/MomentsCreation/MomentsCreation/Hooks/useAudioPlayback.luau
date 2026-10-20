local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local RunService = game:GetService("RunService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseToggleStateFunction = require(Parent.MomentsCommon).Hooks.useToggleState
local LocalPlayer = game:GetService("Players").LocalPlayer

local function _(p1)
	return if p1 == nil then nil else `rbxassetid://{p1}`
end

return function(p1, p2, p3)
	-- upvalues: UseRefFunction (copy), UseToggleStateFunction (copy), UseStateFunction (copy), UseMemoFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy), LocalPlayer (copy), RunService (copy)
	local P3 = p3 or {}
	local Autoplay = P3.autoplay ~= nil and P3.autoplay
	local Looping = P3.looping ~= nil and P3.looping
	local PlaybackRegion = P3.playbackRegion or NumberRange.new(0, 1e999)
	local UseRefResult = UseRefFunction(nil)
	local UseToggleStateResult = UseToggleStateFunction(Autoplay)
	local UseToggleStateResult1 = UseToggleStateFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(0)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(0)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: p2 (copy)
		return if p2 == nil then nil else `rbxassetid://{p2}`
	end, { p2 })
	local UseCallbackResult = UseCallbackFunction(function(p4)
		-- upvalues: UseRefResult (copy), PlaybackRegion (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.TimePosition = math.clamp(p4 + PlaybackRegion.Min, 0, UseStateResult)
		end
	end, { UseStateResult, PlaybackRegion })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2_3 (copy), PlaybackRegion (copy), UseStateResult2_1 (copy)
		if not p1 then return end
		local Current = UseRefResult.current
		
		if Current then
			UseStateResult2_3(Current.TimePosition - PlaybackRegion.Min)
			UseStateResult2_1(Current.TimePosition)
		end
	end, { p1, PlaybackRegion })
	UseEffectFunction(function()
		-- upvalues: UseMemoResult (copy), PlaybackRegion (copy), Looping (copy), UseStateResult2 (copy), UseRefResult (copy), LocalPlayer (upval)
		if UseMemoResult == nil then return end
		local Folder = Instance.new("Folder")
		Folder.Name = `AudioPlayback_{UseMemoResult}`
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Asset = UseMemoResult
		AudioPlayer.PlaybackRegion = PlaybackRegion
		AudioPlayer.Looping = Looping
		AudioPlayer.Parent = Folder
		AudioPlayer.Volume = 0.2
		AudioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
			-- upvalues: UseStateResult2 (upval), AudioPlayer (copy)
			UseStateResult2(AudioPlayer.TimeLength)
		end)
		UseStateResult2(AudioPlayer.TimeLength)
		local AudioDeviceOutput = Instance.new("AudioDeviceOutput")
		AudioDeviceOutput.Parent = Folder
		local Wire = Instance.new("Wire")
		Wire.SourceInstance = AudioPlayer
		Wire.TargetInstance = AudioDeviceOutput
		Wire.Parent = Folder
		UseRefResult.current = AudioPlayer
		local Flag = false
		task.spawn(function()
			-- upvalues: LocalPlayer (upval), Flag (ref), Folder (copy)
			local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
			
			if not Flag then
				Folder.Parent = PlayerGui
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), Folder (copy)
			Flag = true
			Folder:Destroy()
		end
	end, { UseMemoResult })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), PlaybackRegion (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.PlaybackRegion = PlaybackRegion
			Current.TimePosition = 0
		end
	end, { PlaybackRegion })
	UseEffectFunction(function()
		-- upvalues: UseStateResult2_2 (copy), PlaybackRegion (copy), UseStateResult (copy)
		UseStateResult2_2((math.min(PlaybackRegion.Max - PlaybackRegion.Min, UseStateResult)))
	end, { UseStateResult, PlaybackRegion })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseToggleStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			if UseToggleStateResult.enabled then
				Current.PlaybackSpeed = 1
				
				if not Current.IsPlaying then
					Current:Play()
					
					return
				end
			else
				Current.PlaybackSpeed = 0
				
				if Current.IsPlaying then
					Current:Stop()
				end
			end
		end
	end, { UseToggleStateResult.enabled, UseMemoResult })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseToggleStateResult1 (copy), UseToggleStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			if UseToggleStateResult1.enabled or not UseToggleStateResult.enabled then
				Current.Volume = 0
				
				return
			end
			Current.Volume = 0.2
		end
	end, {
		UseToggleStateResult1.enabled,
		UseToggleStateResult.enabled
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseToggleStateResult (copy)
		UseToggleStateResult.disable()
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), RunService (upval), UseCallbackResult1 (copy), UseCallbackResult2 (copy)
		local List = {}
		local Current = UseRefResult.current
		
		if Current then
			table.insert(List, RunService.RenderStepped:Connect(UseCallbackResult1))
			table.insert(List, Current.Ended:Connect(UseCallbackResult2))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { UseCallbackResult1, UseCallbackResult2, UseMemoResult })
	
	return {
		timeline = {
			duration = UseStateResult3,
			elapsed = UseStateResult4,
			seek = UseCallbackResult,
			timeLength = UseStateResult,
			timePosition = UseStateResult1
		},
		playback = {
			isPlaying = UseToggleStateResult.enabled,
			pause = UseToggleStateResult.disable,
			play = UseToggleStateResult.enable,
			toggle = UseToggleStateResult.toggle
		},
		volume = {
			isMuted = UseToggleStateResult1.enabled,
			mute = UseToggleStateResult1.enable,
			unmute = UseToggleStateResult1.disable,
			toggle = UseToggleStateResult1.toggle
		},
		ref = UseRefResult
	}
end