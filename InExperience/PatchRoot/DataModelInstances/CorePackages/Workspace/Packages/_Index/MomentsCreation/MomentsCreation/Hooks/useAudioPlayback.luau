local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local fadeVolumeModule = require(momentsCreation.Audio.fadeVolume)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local useToggleState = momentsCommonModule.Hooks.useToggleState
local localPlayer = playersService.LocalPlayer

local function _(value)
	return if value == nil then nil else `rbxassetid://{value}`
end

return function(p1, p2, p3)
	-- upvalues: useRef (ref), useToggleState (ref), useState (ref), useMemo (ref), useCallback (ref), useEffect (ref), localPlayer (ref), getFFlagMomentsTTSAudioOverlayModule (ref), fadeVolumeModule (ref), runService (ref)
	p3 = p3 or {}
	local var1 = if p3.autoplay ~= nil then false else p3.autoplay
	local var2 = if p3.looping ~= nil then false else p3.looping
	local playbackRegion = p3.playbackRegion or NumberRange.new(0, 1e999)
	local var3 = if p3.duckScalar ~= nil then 1 else p3.duckScalar
	local var4 = useRef(nil)
	local var5 = useToggleState(var1)
	local var6 = useToggleState(false)
	local var7, var8 = useState(0)
	local var9, var10 = useState(0)
	local var11, var12 = useState(0)
	local var13, var14 = useState(0)
	local var15 = useMemo(function()
		-- upvalues: p2 (ref)
		return if p2 == nil then nil else `rbxassetid://{p2}`
	end, { p2 })
	local var16 = useCallback(function(p4)
		-- upvalues: var4 (ref), playbackRegion (ref), var7 (ref)
		local current = var4.current
		
		if current then
			current.TimePosition = math.clamp(p4 + playbackRegion.Min, 0, var7)
		end
	end, { var7, playbackRegion })
	local var17 = useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var14 (ref), playbackRegion (ref), var10 (ref)
		if not p1 then return end
		local current = var4.current
		
		if current then
			var14(current.TimePosition - playbackRegion.Min)
			var10(current.TimePosition)
		end
	end, { p1, playbackRegion })
	useEffect(function()
		-- upvalues: var15 (ref), playbackRegion (ref), var2 (ref), var8 (ref), var4 (ref), localPlayer (copy)
		if var15 == nil then
			return
		end
		local folder = Instance.new("Folder")
		folder.Name = `AudioPlayback_{var15}`
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var15
		audioPlayer.PlaybackRegion = playbackRegion
		audioPlayer.Looping = var2
		audioPlayer.Parent = folder
		audioPlayer.Volume = 0.2
		audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
			-- upvalues: var8 (copy), audioPlayer (ref)
			var8(audioPlayer.TimeLength)
		end)
		var8(audioPlayer.TimeLength)
		local audioDeviceOutput = Instance.new("AudioDeviceOutput")
		audioDeviceOutput.Parent = folder
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioPlayer
		wire.TargetInstance = audioDeviceOutput
		wire.Parent = folder
		var4.current = audioPlayer
		local var18 = false
		task.spawn(function()
			-- upvalues: localPlayer (copy), var18 (write), folder (ref)
			local playerGui = localPlayer:WaitForChild("PlayerGui")
			
			if var18 then
				return
			end
			folder.Parent = playerGui
		end)
		
		return function()
			-- upvalues: var18 (write), folder (ref)
			var18 = true
			folder:Destroy()
		end
	end, { var15 })
	useEffect(function()
		-- upvalues: var4 (ref), playbackRegion (ref)
		local current = var4.current
		
		if current then
			current.PlaybackRegion = playbackRegion
			current.TimePosition = 0
		end
	end, { playbackRegion })
	useEffect(function()
		-- upvalues: var12 (ref), playbackRegion (ref), var7 (ref)
		var12(math.min(playbackRegion.Max - playbackRegion.Min, var7))
	end, { var7, playbackRegion })
	useEffect(function()
		-- upvalues: var4 (ref), var5 (ref)
		local current = var4.current
		
		if current then
			if var5.enabled then
				current.PlaybackSpeed = 1
				
				if current.IsPlaying then
					return
				else
					current:Play()
					
					return
				end
			else
				current.PlaybackSpeed = 0
				
				if current.IsPlaying then
					current:Stop()
				end
			end
		end
	end, { var5.enabled, var15 })
	useEffect(function()
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var4 (ref), var6 (ref), var5 (ref)
		if getFFlagMomentsTTSAudioOverlayModule then return end
		local current = var4.current
		
		if current ~= nil then
			current.Volume = if var6.enabled or not var5.enabled then 0 else 0.2
		end
	end, { var6.enabled, var5.enabled })
	useEffect(function()
		-- upvalues: getFFlagMomentsTTSAudioOverlayModule (copy), var4 (ref), var6 (ref), var5 (ref), fadeVolumeModule (copy), var3 (ref)
		if not getFFlagMomentsTTSAudioOverlayModule then return end
		local current = var4.current
		
		if current ~= nil then
			if var6.enabled or not var5.enabled then
				fadeVolumeModule(current, 0, true)
				
				return
			end
			fadeVolumeModule(current, 0.2 * var3)
		end
	end, { var6.enabled, var5.enabled, var3, var15 })
	local var18 = useCallback(function()
		-- upvalues: var5 (ref)
		var5.disable()
	end, {})
	useEffect(function()
		-- upvalues: var4 (ref), runService (copy), var17 (ref), var18 (ref)
		local t = {}
		local current = var4.current
		
		if current then
			table.insert(t, runService.RenderStepped:Connect(var17))
			table.insert(t, current.Ended:Connect(var18))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var17, var18, var15 })
	
	return {
		timeline = {
			duration = var11,
			elapsed = var13,
			seek = var16,
			timeLength = var7,
			timePosition = var9
		},
		playback = {
			isPlaying = var5.enabled,
			pause = var5.disable,
			play = var5.enable,
			toggle = var5.toggle
		},
		volume = {
			isMuted = var6.enabled,
			mute = var6.enable,
			unmute = var6.disable,
			toggle = var6.toggle
		},
		ref = var4
	}
end