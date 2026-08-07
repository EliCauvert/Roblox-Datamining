-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

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

local function _(value) --[[ line: 22 | named "assetIdAsContent" ]]
	return if value then `rbxassetid://{value}` else nil
end

local t = {
	autoplay = false,
	looping = false,
	playbackRegion = NumberRange.new(0, 1e999)
}

return function(p0, p1, p2) --[[ line: 46 | named "useAudioPlayback" ]]
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useToggleStateModule (ref), useState (ref), useCallback (ref), useMemo (ref), useEffect (ref), localPlayer (ref)
	local var6 = cryoModule.Dictionary.union(t, p2 or {})
	local var7 = useRef(nil)
	local var8 = useToggleStateModule(var6.autoplay)
	local var9 = useToggleStateModule(false)
	local var10, var11 = useState(0)
	local var12, var13 = useState(0)
	local var14, var15 = useState(0)
	local var16, var17 = useState(0)
	local var18 = useCallback(function(p3) --[[ line: 64 ]]
		-- upvalues: var7 (ref), var6 (ref), var10 (ref)
		local current = var7.current
		
		if current then
			current.TimePosition = math.clamp(p3 + var6.playbackRegion.Min, 0, var10)
		end
	end, { var10, var6.playbackRegion })
	local var19 = useCallback(function() --[[ line: 72 ]]
		-- upvalues: p0 (ref), var7 (ref), var17 (ref), var6 (ref), var13 (ref)
		if not p0 then return end
		local current = var7.current
		
		if current then
			var17(current.TimePosition - var6.playbackRegion.Min)
			var13(current.TimePosition)
		end
	end, { p0, p1, var6.playbackRegion })
	p1 = useMemo(function() --[[ line: 87 ]]
		-- upvalues: p1 (write)
		return if p1 then `rbxassetid://{p1}` else nil
	end, { p1 })
	useEffect(function() --[[ line: 91 ]]
		-- upvalues: p1 (write), var6 (ref), var11 (ref), var7 (ref), localPlayer (copy)
		if p1 then
			local folder = Instance.new("Folder")
			folder.Name = `AudioPlayback_{p1}`
			local audioPlayer = Instance.new("AudioPlayer")
			audioPlayer.Asset = p1
			audioPlayer.PlaybackRegion = var6.playbackRegion
			audioPlayer.Looping = var6.looping or false
			audioPlayer.Parent = folder
			audioPlayer.Volume = 0.2
			audioPlayer:GetPropertyChangedSignal("TimeLength"):Connect(function() --[[ line: 106 | named "updateTimeLength" ]]
				-- upvalues: var11 (copy), audioPlayer (ref)
				var11(audioPlayer.TimeLength)
			end)
			var11(audioPlayer.TimeLength)
			local audioDeviceOutput = Instance.new("AudioDeviceOutput")
			audioDeviceOutput.Parent = folder
			local wire = Instance.new("Wire")
			wire.SourceInstance = audioPlayer
			wire.TargetInstance = audioDeviceOutput
			wire.Parent = folder
			var7.current = audioPlayer
			task.spawn(function() --[[ line: 123 ]]
				-- upvalues: folder (ref), localPlayer (copy)
				folder.Parent = localPlayer:WaitForChild("PlayerGui")
			end)
			
			return function() --[[ line: 127 ]]
				-- upvalues: folder (ref)
				folder:Destroy()
			end
		end
	end, { p1 })
	useEffect(function() --[[ line: 132 ]]
		-- upvalues: var7 (ref), var6 (ref)
		local current = var7.current
		
		if current then
			current.PlaybackRegion = var6.playbackRegion
			current.TimePosition = 0
		end
	end, { var6.playbackRegion })
	useEffect(function() --[[ line: 140 ]]
		-- upvalues: var6 (ref), var15 (ref), var10 (ref)
		var15(math.min(var6.playbackRegion.Max - var6.playbackRegion.Min, var10))
	end, { var10, var6.playbackRegion })
	useEffect(function() --[[ line: 145 ]]
		-- upvalues: var7 (ref), var8 (ref)
		local current = var7.current
		
		if current then
			if var8.enabled then
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
	end, { p1, var8.enabled })
	useEffect(function() --[[ line: 163 ]]
		-- upvalues: var7 (ref), var9 (ref), var8 (ref)
		local current = var7.current
		
		if current then
			if var9.enabled or not var8.enabled then
				current.Volume = 0
				
				return
			end
			current.Volume = 0.2
		end
	end, { var9.enabled, var8.enabled })
	local var20 = useCallback(function() --[[ line: 180 ]]
		-- upvalues: var8 (ref)
		var8.disable()
	end, {})
	useEffect(function() --[[ line: 184 ]]
		-- upvalues: var7 (ref), var19 (ref), var20 (ref)
		local t = {}
		
		if var7.current then
			table.insert(t, game:GetService("RunService").RenderStepped:Connect(var19))
			table.insert(t, var7.current.Ended:Connect(var20))
		end
		return function() --[[ line: 192 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { var19, var20 })
	
	return {
		timeline = {
			duration = var14,
			elapsed = var16,
			seek = var18,
			timeLength = var10,
			timePosition = var12
		},
		playback = {
			isPlaying = var8.enabled,
			pause = var8.disable,
			play = var8.enable,
			toggle = var8.toggle
		},
		volume = {
			isMuted = var9.enabled,
			mute = var9.enable,
			unmute = var9.disable,
			toggle = var9.toggle
		},
		ref = var7
	}
end