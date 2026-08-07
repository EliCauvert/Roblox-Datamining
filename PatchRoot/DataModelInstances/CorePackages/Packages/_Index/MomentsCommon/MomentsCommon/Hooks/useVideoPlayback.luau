-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState
local useToggleStateModule = require(momentsCommon.Hooks.useToggleState)
local signalModule = require(momentsCommon.Utils.Signal)
local _ = require(momentsCommon.Types)
local t = {
	autoplay = false,
	looping = false,
	playbackRegion = NumberRange.new(0, 1e999)
}

return function(p0, p1, p2) --[[ line: 41 | named "useVideoPlayback" ]]
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useToggleStateModule (ref), useState (ref), signalModule (ref), useCallback (ref), useEffect (ref)
	local var6 = cryoModule.Dictionary.union(t, p2 or {})
	local var7 = useRef(nil)
	local var8 = useToggleStateModule(false)
	local var9 = useToggleStateModule(var6.autoplay)
	local var10 = useToggleStateModule(false)
	local var11, var12 = useState(0)
	local var13, var14 = useState(0)
	local var15, var16 = useState(0)
	local var17, var18 = useState(0)
	local var19 = useRef(signalModule.new())
	local var20 = useRef(signalModule.new())
	local var21 = useCallback(function(p3) --[[ line: 64 ]]
		-- upvalues: var7 (ref), var6 (ref), var11 (ref)
		local current = var7.current
		
		if current then
			current.TimePosition = math.clamp(p3 + var6.playbackRegion.Min, 0, var11)
		end
	end, { var11, var6.playbackRegion })
	local var22 = useCallback(function() --[[ line: 72 ]]
		-- upvalues: var7 (ref), var20 (ref), var6 (ref), var10 (ref), var16 (ref), var12 (ref)
		local current = var7.current
		
		if current then
			var20.current:fire()
			local var25 = var6.playbackRegion.Max - var6.playbackRegion.Min
			current.Volume = if var10.enabled then 0 else 0.2
			var16(math.min(var25, current.TimeLength))
			var12(current.TimeLength)
		end
	end, { var6.playbackRegion, var10.enabled })
	local var23 = useCallback(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), var7 (ref), var18 (ref), var6 (ref), var14 (ref)
		if not p0 then return end
		local current = var7.current
		
		if current then
			var18(current.TimePosition - var6.playbackRegion.Min)
			var14(current.TimePosition)
		end
	end, { p0, var6.playbackRegion })
	local var24 = useCallback(function() --[[ line: 95 ]]
		-- upvalues: var7 (ref), var6 (ref), var19 (ref)
		if var7.current then
			var7.current.TimePosition = var6.playbackRegion.Min
			var19.current:fire()
			
			return
		end
	end, { var6.playbackRegion })
	useEffect(function() --[[ line: 106 ]]
		-- upvalues: var7 (ref), p1 (ref)
		local current = var7.current
		
		if not current then return end
		if p1 then
			current.VideoContent = p1
		end
	end, { var8.enabled, p1 })
	useEffect(function() --[[ line: 117 ]]
		-- upvalues: var7 (ref), var22 (ref), var23 (ref), var24 (ref)
		local current = var7.current
		
		if current then
			local loadedConnection = current.Loaded:Connect(var22)
			local renderSteppedConnection = game:GetService("RunService").RenderStepped:Connect(var23)
			local didLoopConnection = current.DidLoop:Connect(var24)
			
			return function() --[[ line: 127 ]]
				-- upvalues: loadedConnection (ref), renderSteppedConnection (ref), didLoopConnection (ref)
				loadedConnection:Disconnect()
				renderSteppedConnection:Disconnect()
				didLoopConnection:Disconnect()
			end
		end
	end, { var8.enabled, var23, var22, var24 })
	useEffect(function() --[[ line: 134 ]]
		-- upvalues: var7 (ref), var6 (ref)
		local current = var7.current
		
		if current then
			current.Looped = var6.looping
		end
	end, { var8.enabled, var6.looping })
	useEffect(function() --[[ line: 141 ]]
		-- upvalues: var7 (ref), var9 (ref)
		local current = var7.current
		
		if current then
			current.Playing = var9.enabled
		end
	end, { var8.enabled, var9.enabled })
	useEffect(function() --[[ line: 148 ]]
		-- upvalues: var7 (ref), var10 (ref)
		local current = var7.current
		
		if current then
			current.Volume = if var10.enabled then 0 else 0.2
		end
	end, { var8.enabled, var10.enabled })
	useEffect(function() --[[ line: 155 ]]
		-- upvalues: var7 (ref), var13 (write), var6 (ref), var9 (ref), var19 (ref)
		local current = var7.current
		
		if not current then return end
		if var6.playbackRegion.Max + 0.001 <= var13 then
			if not var9.enabled then
				var13 = var6.playbackRegion.Max
			elseif var6.looping then
				current.TimePosition = var6.playbackRegion.Min
				var19.current:fire()
			else
				var9.disable()
			end
		end
		if var13 < var6.playbackRegion.Min - 0.001 then
			current.TimePosition = var6.playbackRegion.Min
		end
	end, { var13, var6.playbackRegion, var6.looping, var9.disable })
	useEffect(function() --[[ line: 182 ]]
		-- upvalues: var7 (ref), var6 (ref), var16 (ref)
		local current = var7.current
		
		if current then
			var16(math.min(var6.playbackRegion.Max - var6.playbackRegion.Min, current.TimeLength))
		end
	end, { var6.playbackRegion })
	
	return {
		timeline = {
			duration = var15,
			elapsed = var17,
			seek = var21,
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
		onVideoDidLoopSignalRef = var19,
		onVideoLoadedSignalRef = var20,
		ref = var7,
		updateRef = useCallback(function(p4) --[[ line: 190 ]]
			-- upvalues: var8 (ref), var7 (ref)
			var8.toggle()
			var7.current = p4
		end, { var8.toggle })
	}
end