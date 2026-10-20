local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local UseToggleStateModule = require(MomentsCommon.Hooks.useToggleState)
local _ = require(MomentsCommon.Types)
local LocalPlayer = game:GetService("Players").LocalPlayer

local function _(p1)
	return if p1 then `rbxassetid://{p1}` else nil
end

local config = {
	autoplay = false,
	looping = false,
	playbackRegion = NumberRange.new(0, 1e999)
}

return function(p1, Asset, p2)
	-- upvalues: CryoModule (copy), config (copy), UseRefFunction (copy), UseToggleStateModule (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseMemoFunction (copy), UseEffectFunction (copy), LocalPlayer (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p2 or {})
	local UseRefResult = UseRefFunction(nil)
	local UseToggleStateModuleResult = UseToggleStateModule(UnionResult.autoplay)
	local UseToggleStateModuleResult1 = UseToggleStateModule(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(0)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(0)
	local UseCallbackResult = UseCallbackFunction(function(p3)
		-- upvalues: UseRefResult (copy), UnionResult (copy), UseStateResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.TimePosition = math.clamp(p3 + UnionResult.playbackRegion.Min, 0, UseStateResult)
		end
	end, { UseStateResult, UnionResult.playbackRegion })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2_3 (copy), UnionResult (copy), UseStateResult2_1 (copy)
		if not p1 then return end
		local Current = UseRefResult.current
		
		if Current then
			UseStateResult2_3(Current.TimePosition - UnionResult.playbackRegion.Min)
			UseStateResult2_1(Current.TimePosition)
		end
	end, { p1, Asset, UnionResult.playbackRegion })
	Asset = UseMemoFunction(function()
		-- upvalues: Asset (ref)
		local Asset1 = Asset
		
		return if Asset1 then `rbxassetid://{Asset1}` else nil
	end, { Asset })
	UseEffectFunction(function()
		-- upvalues: Asset (ref), UnionResult (copy), UseStateResult2 (copy), UseRefResult (copy), LocalPlayer (upval)
		if not Asset then return end
		local Folder = Instance.new("Folder")
		Folder.Name = `AudioPlayback_{Asset}`
		local AudioPlayer = Instance.new("AudioPlayer")
		AudioPlayer.Asset = Asset
		AudioPlayer.PlaybackRegion = UnionResult.playbackRegion
		AudioPlayer.Looping = UnionResult.looping or false
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
		task.spawn(function()
			-- upvalues: Folder (copy), LocalPlayer (upval)
			Folder.Parent = LocalPlayer:WaitForChild("PlayerGui")
		end)
		
		return function()
			-- upvalues: Folder (copy)
			Folder:Destroy()
		end
	end, { Asset })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UnionResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.PlaybackRegion = UnionResult.playbackRegion
			Current.TimePosition = 0
		end
	end, { UnionResult.playbackRegion })
	UseEffectFunction(function()
		-- upvalues: UnionResult (copy), UseStateResult2_2 (copy), UseStateResult (copy)
		UseStateResult2_2((math.min(UnionResult.playbackRegion.Max - UnionResult.playbackRegion.Min, UseStateResult)))
	end, { UseStateResult, UnionResult.playbackRegion })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseToggleStateModuleResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			if UseToggleStateModuleResult.enabled then
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
	end, { Asset, UseToggleStateModuleResult.enabled })
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseToggleStateModuleResult1 (copy), UseToggleStateModuleResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			if UseToggleStateModuleResult1.enabled or not UseToggleStateModuleResult.enabled then
				Current.Volume = 0
				
				return
			end
			Current.Volume = 0.2
		end
	end, {
		UseToggleStateModuleResult1.enabled,
		UseToggleStateModuleResult.enabled
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseToggleStateModuleResult (copy)
		UseToggleStateModuleResult.disable()
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseCallbackResult1 (copy), UseCallbackResult2 (copy)
		local List = {}
		
		if UseRefResult.current then
			table.insert(List, game:GetService("RunService").RenderStepped:Connect(UseCallbackResult1))
			table.insert(List, UseRefResult.current.Ended:Connect(UseCallbackResult2))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { UseCallbackResult1, UseCallbackResult2 })
	
	return {
		timeline = {
			duration = UseStateResult3,
			elapsed = UseStateResult4,
			seek = UseCallbackResult,
			timeLength = UseStateResult,
			timePosition = UseStateResult1
		},
		playback = {
			isPlaying = UseToggleStateModuleResult.enabled,
			pause = UseToggleStateModuleResult.disable,
			play = UseToggleStateModuleResult.enable,
			toggle = UseToggleStateModuleResult.toggle
		},
		volume = {
			isMuted = UseToggleStateModuleResult1.enabled,
			mute = UseToggleStateModuleResult1.enable,
			unmute = UseToggleStateModuleResult1.disable,
			toggle = UseToggleStateModuleResult1.toggle
		},
		ref = UseRefResult
	}
end