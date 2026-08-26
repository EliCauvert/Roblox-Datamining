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

return function(p1, p2, p3)
	-- upvalues: useRef (ref), useToggleState (ref), useState (ref), useMemo (ref), useCallback (ref), useEffect (ref), localPlayer (ref), runService (ref)
	p3 = p3 or {}
	local var1 = if p3.autoplay ~= nil then false else p3.autoplay
	local var2 = if p3.looping ~= nil then false else p3.looping
	local playbackRegion = p3.playbackRegion or NumberRange.new(0, 1e999)
	local var3 = useRef(nil)
	local var4 = useToggleState(var1)
	local var5 = useToggleState(false)
	local var6, var7 = useState(0)
	local var8, var9 = useState(0)
	local var10, var11 = useState(0)
	local var12, var13 = useState(0)
	local var14 = useMemo(function()
		-- upvalues: p2 (ref)
		return if p2 == nil then nil else `rbxassetid://{p2}`
	end, { p2 })
	local var15 = useCallback(function(p4)
		-- upvalues: var3 (ref), playbackRegion (ref), var6 (ref)
		local current = var3.current
		
		if current then
			current.TimePosition = math.clamp(p4 + playbackRegion.Min, 0, var6)
		end
	end, { var6, playbackRegion })
	local var16 = useCallback(function()
		-- upvalues: p1 (ref), var3 (ref), var13 (ref), playbackRegion (ref), var9 (ref)
		if not p1 then return end
		local current = var3.current
		
		if current then
			var13(current.TimePosition - playbackRegion.Min)
			var9(current.TimePosition)
		end
	end, { p1, playbackRegion })
	useEffect(function()
		-- upvalues: var14 (ref), playbackRegion (ref), var2 (ref), var7 (ref), var3 (ref), localPlayer (copy)
		if var14 == nil then
			return
		end
		local folder = Instance.new("Folder")
		folder.Name = `AudioPlayback_{var14}`
		local audioPlayer = Instance.new("AudioPlayer")
		audioPlayer.Asset = var14
		audioPlayer.PlaybackRegion = playbackRegion
		audioPlayer.Looping = var2
		audioPlayer.Parent = folder
		audioPlayer.Volume = 0.2
		audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
			-- upvalues: var7 (copy), audioPlayer (ref)
			var7(audioPlayer.TimeLength)
		end)
		var7(audioPlayer.TimeLength)
		local audioDeviceOutput = Instance.new("AudioDeviceOutput")
		audioDeviceOutput.Parent = folder
		local wire = Instance.new("Wire")
		wire.SourceInstance = audioPlayer
		wire.TargetInstance = audioDeviceOutput
		wire.Parent = folder
		var3.current = audioPlayer
		local var17 = false
		task.spawn(function()
			-- upvalues: localPlayer (copy), var17 (write), folder (ref)
			local playerGui = localPlayer:WaitForChild("PlayerGui")
			
			if var17 then
				return
			end
			folder.Parent = playerGui
		end)
		
		return function()
			-- upvalues: var17 (write), folder (ref)
			var17 = true
			folder:Destroy()
		end
	end, { var14 })
	useEffect(function()
		-- upvalues: var3 (ref), playbackRegion (ref)
		local current = var3.current
		
		if current then
			current.PlaybackRegion = playbackRegion
			current.TimePosition = 0
		end
	end, { playbackRegion })
	useEffect(function()
		-- upvalues: var11 (ref), playbackRegion (ref), var6 (ref)
		var11(math.min(playbackRegion.Max - playbackRegion.Min, var6))
	end, { var6, playbackRegion })
	useEffect(function()
		-- upvalues: var3 (ref), var4 (ref)
		local current = var3.current
		
		if current then
			if var4.enabled then
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
	end, { var4.enabled, var14 })
	useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), var4 (ref)
		local current = var3.current
		
		if current then
			if var5.enabled or not var4.enabled then
				current.Volume = 0
				
				return
			end
			current.Volume = 0.2
		end
	end, { var5.enabled, var4.enabled })
	local var17 = useCallback(function()
		-- upvalues: var4 (ref)
		var4.disable()
	end, {})
	useEffect(function()
		-- upvalues: var3 (ref), runService (copy), var16 (ref), var17 (ref)
		local t = {}
		local current = var3.current
		
		if current then
			table.insert(t, runService.RenderStepped:Connect(var16))
			table.insert(t, current.Ended:Connect(var17))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var16, var17, var14 })
	
	return {
		timeline = {
			duration = var10,
			elapsed = var12,
			seek = var15,
			timeLength = var6,
			timePosition = var8
		},
		playback = {
			isPlaying = var4.enabled,
			pause = var4.disable,
			play = var4.enable,
			toggle = var4.toggle
		},
		volume = {
			isMuted = var5.enabled,
			mute = var5.enable,
			unmute = var5.disable,
			toggle = var5.toggle
		},
		ref = var3
	}
end