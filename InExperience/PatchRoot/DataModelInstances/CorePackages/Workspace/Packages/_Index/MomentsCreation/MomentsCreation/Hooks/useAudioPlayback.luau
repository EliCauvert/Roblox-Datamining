local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local fadeVolumeModule = require(momentsCreation.Audio.fadeVolume)
local startAudioOnLoadModule = require(momentsCreation.Audio.startAudioOnLoad)
local fFlagMomentsCreationStartAudioOnLoadModule = require(momentsCreation.Flags.FFlagMomentsCreationStartAudioOnLoad)
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
	-- upvalues: useRef (ref), useToggleState (ref), fFlagMomentsCreationStartAudioOnLoadModule (ref), useState (ref), useMemo (ref), useCallback (ref), useEffect (ref), startAudioOnLoadModule (ref), localPlayer (ref), getFFlagMomentsTTSAudioOverlayModule (ref), fadeVolumeModule (ref), runService (ref)
	p3 = p3 or {}
	local var1 = if p3.autoplay ~= nil then false else p3.autoplay
	local var2 = if p3.looping ~= nil then false else p3.looping
	local playbackRegion = p3.playbackRegion or NumberRange.new(0, 1e999)
	local var3 = if p3.duckScalar ~= nil then 1 else p3.duckScalar
	local var4 = useRef(nil)
	local var5 = useToggleState(var1)
	local var6 = useToggleState(false)
	local var7 = useRef(var5.enabled)
	
	if fFlagMomentsCreationStartAudioOnLoadModule then
		var7.current = var5.enabled
	end
	local var8, var9 = useState(0)
	local var10, var11 = useState(0)
	local var12, var13 = useState(0)
	local var14, var15 = useState(0)
	local var16 = useMemo(function()
		-- upvalues: p2 (ref)
		return if p2 == nil then nil else `rbxassetid://{p2}`
	end, { p2 })
	local var17 = useCallback(function(p4)
		-- upvalues: var4 (ref), playbackRegion (ref), var8 (ref)
		local current = var4.current
		
		if current then
			current.TimePosition = math.clamp(p4 + playbackRegion.Min, 0, var8)
		end
	end, { var8, playbackRegion })
	local var18 = useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var15 (ref), playbackRegion (ref), var11 (ref)
		if not p1 then return end
		local current = var4.current
		
		if current then
			var15(current.TimePosition - playbackRegion.Min)
			var11(current.TimePosition)
		end
	end, { p1, playbackRegion })
	useEffect(function()
		-- upvalues: var16 (ref), playbackRegion (ref), var2 (ref), var9 (ref), var4 (ref), fFlagMomentsCreationStartAudioOnLoadModule (copy), startAudioOnLoadModule (copy), var7 (ref), localPlayer (copy)
		if var16 == nil then
			return
		end
		local folder = Instance.new("Folder")
		folder.Name = `AudioPlayback_{var16}`
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var16
		audioPlayer.PlaybackRegion = playbackRegion
		audioPlayer.Looping = var2
		audioPlayer.Parent = folder
		audioPlayer.Volume = 0.2
		audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
			-- upvalues: var9 (copy), audioPlayer (ref)
			var9(audioPlayer.TimeLength)
		end)
		var9(audioPlayer.TimeLength)
		local audioDeviceOutput = Instance.new("AudioDeviceOutput")
		audioDeviceOutput.Parent = folder
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioPlayer
		wire.TargetInstance = audioDeviceOutput
		wire.Parent = folder
		var4.current = audioPlayer
		local var19 = if fFlagMomentsCreationStartAudioOnLoadModule then startAudioOnLoadModule(audioPlayer, function()
			-- upvalues: var7 (copy)
			return var7.current
		end) else nil
		local var20 = false
		task.spawn(function()
			-- upvalues: localPlayer (copy), var20 (write), folder (ref)
			local playerGui = localPlayer:WaitForChild("PlayerGui")
			
			if var20 then
				return
			end
			folder.Parent = playerGui
		end)
		
		return function()
			-- upvalues: var20 (write), var19 (write), folder (ref)
			var20 = true
			
			if var19 ~= nil then
				var19:Disconnect()
			end
			folder:Destroy()
		end
	end, { var16 })
	useEffect(function()
		-- upvalues: var4 (ref), playbackRegion (ref), fFlagMomentsCreationStartAudioOnLoadModule (copy)
		local current = var4.current
		
		if current then
			current.PlaybackRegion = playbackRegion
			
			if fFlagMomentsCreationStartAudioOnLoadModule then
				if current.IsReady then
					current.TimePosition = playbackRegion.Min
					
					return
				end
			else
				current.TimePosition = 0
			end
		end
	end, { playbackRegion })
	useEffect(function()
		-- upvalues: var13 (ref), playbackRegion (ref), var8 (ref)
		var13(math.min(playbackRegion.Max - playbackRegion.Min, var8))
	end, { var8, playbackRegion })
	useEffect(function()
		-- upvalues: var4 (ref), fFlagMomentsCreationStartAudioOnLoadModule (copy), var5 (ref)
		local current = var4.current
		
		if current then
			if fFlagMomentsCreationStartAudioOnLoadModule and not current.IsReady then
				current.PlaybackSpeed = 0
				
				return
			elseif var5.enabled then
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
	end, { var5.enabled, var16 })
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
	end, { var6.enabled, var5.enabled, var3, var16 })
	local var19 = useCallback(function()
		-- upvalues: var5 (ref)
		var5.disable()
	end, {})
	useEffect(function()
		-- upvalues: var4 (ref), runService (copy), var18 (ref), var19 (ref)
		local t = {}
		local current = var4.current
		
		if current then
			table.insert(t, runService.RenderStepped:Connect(var18))
			table.insert(t, current.Ended:Connect(var19))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var18, var19, var16 })
	
	return {
		timeline = {
			duration = var12,
			elapsed = var14,
			seek = var17,
			timeLength = var8,
			timePosition = var10
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