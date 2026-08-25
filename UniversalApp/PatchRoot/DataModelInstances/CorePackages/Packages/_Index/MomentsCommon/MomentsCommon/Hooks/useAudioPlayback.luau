local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local playersService = game:GetService("Players")
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useState = reactModule.useState
local useToggleStateModule = require(momentsCommon.Hooks.useToggleState)
local _ = require(momentsCommon.Types)
local localPlayer = playersService.LocalPlayer

local function _(value)
	return if value then `rbxassetid://{value}` else nil
end

local t = {
	autoplay = false,
	looping = false,
	playbackRegion = NumberRange.new(0, 1e999)
}

return function(p1, p2, p3)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useToggleStateModule (ref), useState (ref), useCallback (ref), useMemo (ref), useEffect (ref), localPlayer (ref)
	local var1 = cryoModule.Dictionary.union(t, p3 or {})
	local var2 = useRef(nil)
	local var3 = useToggleStateModule(var1.autoplay)
	local var4 = useToggleStateModule(false)
	local var5, var6 = useState(0)
	local var7, var8 = useState(0)
	local var9, var10 = useState(0)
	local var11, var12 = useState(0)
	local var13 = useCallback(function(p1)
		-- upvalues: var2 (ref), var1 (ref), var5 (ref)
		local current = var2.current
		
		if current then
			current.TimePosition = math.clamp(p1 + var1.playbackRegion.Min, 0, var5)
		end
	end, { var5, var1.playbackRegion })
	local var14 = useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), var12 (ref), var1 (ref), var8 (ref)
		if not p1 then return end
		local current = var2.current
		
		if current then
			var12(current.TimePosition - var1.playbackRegion.Min)
			var8(current.TimePosition)
		end
	end, { p1, p2, var1.playbackRegion })
	p2 = useMemo(function()
		-- upvalues: p2 (write)
		return if p2 then `rbxassetid://{p2}` else nil
	end, { p2 })
	useEffect(function()
		-- upvalues: p2 (write), var1 (ref), var6 (ref), var2 (ref), localPlayer (copy)
		if p2 then
			local folder = Instance.new("Folder")
			folder.Name = `AudioPlayback_{p2}`
			local audioPlayer = Instance.new("AudioPlayer")
			audioPlayer.Asset = p2
			audioPlayer.PlaybackRegion = var1.playbackRegion
			audioPlayer.Looping = var1.looping or false
			audioPlayer.Parent = folder
			audioPlayer.Volume = 0.2
			audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function()
				-- upvalues: var6 (copy), audioPlayer (ref)
				var6(audioPlayer.TimeLength)
			end)
			var6(audioPlayer.TimeLength)
			local audioDeviceOutput = Instance.new("AudioDeviceOutput")
			audioDeviceOutput.Parent = folder
			local wire = Instance.new("Wire")
			wire.SourceInstance = audioPlayer
			wire.TargetInstance = audioDeviceOutput
			wire.Parent = folder
			var2.current = audioPlayer
			task.spawn(function()
				-- upvalues: folder (ref), localPlayer (copy)
				folder.Parent = localPlayer:WaitForChild("PlayerGui")
			end)
			
			return function()
				-- upvalues: folder (ref)
				folder:Destroy()
			end
		end
	end, { p2 })
	useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		local current = var2.current
		
		if current then
			current.PlaybackRegion = var1.playbackRegion
			current.TimePosition = 0
		end
	end, { var1.playbackRegion })
	useEffect(function()
		-- upvalues: var1 (ref), var10 (ref), var5 (ref)
		var10(math.min(var1.playbackRegion.Max - var1.playbackRegion.Min, var5))
	end, { var5, var1.playbackRegion })
	useEffect(function()
		-- upvalues: var2 (ref), var3 (ref)
		local current = var2.current
		
		if current then
			if var3.enabled then
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
	end, { p2, var3.enabled })
	useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), var3 (ref)
		local current = var2.current
		
		if current then
			if var4.enabled or not var3.enabled then
				current.Volume = 0
				
				return
			end
			current.Volume = 0.2
		end
	end, { var4.enabled, var3.enabled })
	local var1 = useCallback(function()
		-- upvalues: var3 (ref)
		var3.disable()
	end, {})
	useEffect(function()
		-- upvalues: var2 (ref), var14 (ref), var1 (ref)
		local t = {}
		
		if var2.current then
			table.insert(t, game:GetService("RunService").RenderStepped:Connect(var14))
			table.insert(t, var2.current.Ended:Connect(var1))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var14, var1 })
	
	return {
		timeline = {
			duration = var9,
			elapsed = var11,
			seek = var13,
			timeLength = var5,
			timePosition = var7
		},
		playback = {
			isPlaying = var3.enabled,
			pause = var3.disable,
			play = var3.enable,
			toggle = var3.toggle
		},
		volume = {
			isMuted = var4.enabled,
			mute = var4.enable,
			unmute = var4.disable,
			toggle = var4.toggle
		},
		ref = var2
	}
end