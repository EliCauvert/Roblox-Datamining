local parent = script:FindFirstAncestor("MomentsCreation").Parent
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
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

return function(p0, p1, p2)
	-- upvalues: useRef (ref), useToggleState (ref), useState (ref), useMemo (ref), useCallback (ref), useEffect (ref), localPlayer (ref), runService (ref)
	p2 = p2 or {}
	local var5 = if p2.autoplay ~= nil then false else p2.autoplay
	local var6 = if p2.looping ~= nil then false else p2.looping
	local playbackRegion = p2.playbackRegion or NumberRange.new(0, 1e999)
	local var8 = useRef(nil)
	local var9 = useToggleState(var5)
	local var10 = useToggleState(false)
	local var11, var12 = useState(0)
	local var13, var14 = useState(0)
	local var15, var16 = useState(0)
	local var17, var18 = useState(0)
	local var19 = useMemo(function()
		-- upvalues: p1 (ref)
		return if p1 == nil then nil else `rbxassetid://{p1}`
	end, { p1 })
	local var20 = useCallback(function(p3)
		-- upvalues: var8 (ref), playbackRegion (ref), var11 (ref)
		local current = var8.current
		
		if current then
			current.TimePosition = math.clamp(p3 + playbackRegion.Min, 0, var11)
		end
	end, { var11, playbackRegion })
	local var21 = useCallback(function()
		-- upvalues: p0 (ref), var8 (ref), var18 (ref), playbackRegion (ref), var14 (ref)
		if not p0 then return end
		local current = var8.current
		
		if current then
			var18(current.TimePosition - playbackRegion.Min)
			var14(current.TimePosition)
		end
	end, { p0, playbackRegion })
	useEffect(function()
		-- upvalues: var19 (ref), playbackRegion (ref), var6 (ref), var12 (ref), var8 (ref), localPlayer (copy)
		if var19 == nil then
			return
		end
		local folder = Instance.new("Folder")
		folder.Name = `AudioPlayback_{var19}`
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var19
		audioPlayer.PlaybackRegion = playbackRegion
		audioPlayer.Looping = var6
		audioPlayer.Parent = folder
		audioPlayer.Volume = 0.2
		audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
			-- upvalues: var12 (copy), audioPlayer (ref)
			var12(audioPlayer.TimeLength)
		end)
		var12(audioPlayer.TimeLength)
		local audioDeviceOutput = Instance.new("AudioDeviceOutput")
		audioDeviceOutput.Parent = folder
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioPlayer
		wire.TargetInstance = audioDeviceOutput
		wire.Parent = folder
		var8.current = audioPlayer
		local var27 = false
		task.spawn(function()
			-- upvalues: localPlayer (copy), var27 (write), folder (ref)
			local playerGui = localPlayer:WaitForChild("PlayerGui")
			
			if var27 then
				return
			end
			folder.Parent = playerGui
		end)
		
		return function()
			-- upvalues: var27 (write), folder (ref)
			var27 = true
			folder:Destroy()
		end
	end, { var19 })
	useEffect(function()
		-- upvalues: var8 (ref), playbackRegion (ref)
		local current = var8.current
		
		if current then
			current.PlaybackRegion = playbackRegion
			current.TimePosition = 0
		end
	end, { playbackRegion })
	useEffect(function()
		-- upvalues: var16 (ref), playbackRegion (ref), var11 (ref)
		var16(math.min(playbackRegion.Max - playbackRegion.Min, var11))
	end, { var11, playbackRegion })
	useEffect(function()
		-- upvalues: var8 (ref), var9 (ref)
		local current = var8.current
		
		if current then
			if var9.enabled then
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
	end, { var9.enabled, var19 })
	useEffect(function()
		-- upvalues: var8 (ref), var10 (ref), var9 (ref)
		local current = var8.current
		
		if current then
			if var10.enabled or not var9.enabled then
				current.Volume = 0
				
				return
			end
			current.Volume = 0.2
		end
	end, { var10.enabled, var9.enabled })
	local var22 = useCallback(function()
		-- upvalues: var9 (ref)
		var9.disable()
	end, {})
	useEffect(function()
		-- upvalues: var8 (ref), runService (copy), var21 (ref), var22 (ref)
		local t = {}
		local current = var8.current
		
		if current then
			table.insert(t, runService.RenderStepped:Connect(var21))
			table.insert(t, current.Ended:Connect(var22))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var21, var22, var19 })
	
	return {
		timeline = {
			duration = var15,
			elapsed = var17,
			seek = var20,
			timeLength = var11,
			timePosition = var13
		},
		playback = {
			isPlaying = var9.enabled,
			pause = var9.disable,
			play = var9.enable,
			toggle = var9.toggle
		},
		volume = {
			isMuted = var10.enabled,
			mute = var10.enable,
			unmute = var10.disable,
			toggle = var10.toggle
		},
		ref = var8
	}
end