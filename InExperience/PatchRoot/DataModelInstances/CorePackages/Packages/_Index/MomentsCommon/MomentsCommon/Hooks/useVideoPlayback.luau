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

return function(p1, p2, p3)
	-- upvalues: cryoModule (ref), t (ref), useRef (ref), useToggleStateModule (ref), useState (ref), signalModule (ref), useCallback (ref), useEffect (ref)
	local var1 = cryoModule.Dictionary.union(t, p3 or {})
	local var2 = useRef(nil)
	local var3 = useToggleStateModule(false)
	local var4 = useToggleStateModule(var1.autoplay)
	local var5 = useToggleStateModule(false)
	local var6, var7 = useState(0)
	local var8, var9 = useState(0)
	local var10, var11 = useState(0)
	local var12, var13 = useState(0)
	local var14 = useRef(signalModule.new())
	local var15 = useRef(signalModule.new())
	local var16 = useCallback(function(p4)
		-- upvalues: var2 (ref), var1 (ref), var6 (ref)
		local current = var2.current
		
		if current then
			current.TimePosition = math.clamp(p4 + var1.playbackRegion.Min, 0, var6)
		end
	end, { var6, var1.playbackRegion })
	local var17 = useCallback(function()
		-- upvalues: var2 (ref), var15 (ref), var1 (ref), var5 (ref), var11 (ref), var7 (ref)
		local current = var2.current
		
		if current then
			var15.current:fire()
			local var18 = var1.playbackRegion.Max - var1.playbackRegion.Min
			current.Volume = if var5.enabled then 0 else 0.2
			var11(math.min(var18, current.TimeLength))
			var7(current.TimeLength)
		end
	end, { var1.playbackRegion, var5.enabled })
	local var18 = useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), var13 (ref), var1 (ref), var9 (ref)
		if not p1 then return end
		local current = var2.current
		
		if current then
			var13(current.TimePosition - var1.playbackRegion.Min)
			var9(current.TimePosition)
		end
	end, { p1, var1.playbackRegion })
	local var19 = useCallback(function()
		-- upvalues: var2 (ref), var1 (ref), var14 (ref)
		if var2.current then
			var2.current.TimePosition = var1.playbackRegion.Min
			var14.current:fire()
			
			return
		end
	end, { var1.playbackRegion })
	useEffect(function()
		-- upvalues: var2 (ref), p2 (ref)
		local current = var2.current
		
		if not current then return end
		if p2 then
			current.VideoContent = p2
		end
	end, { var3.enabled, p2 })
	useEffect(function()
		-- upvalues: var2 (ref), var17 (ref), var18 (ref), var19 (ref)
		local current = var2.current
		
		if current then
			local loadedConnection = current.Loaded:Connect(var17)
			local renderSteppedConnection = game:GetService("RunService").RenderStepped:Connect(var18)
			local didLoopConnection = current.DidLoop:Connect(var19)
			
			return function()
				-- upvalues: loadedConnection (ref), renderSteppedConnection (ref), didLoopConnection (ref)
				loadedConnection:Disconnect()
				renderSteppedConnection:Disconnect()
				didLoopConnection:Disconnect()
			end
		end
	end, { var3.enabled, var18, var17, var19 })
	useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		local current = var2.current
		
		if current then
			current.Looped = var1.looping
		end
	end, { var3.enabled, var1.looping })
	useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		local current = var2.current
		
		if current then
			current.Playing = var4.enabled
		end
	end, { var3.enabled, var4.enabled })
	useEffect(function()
		-- upvalues: var2 (ref), var5 (ref)
		local current = var2.current
		
		if current then
			current.Volume = if var5.enabled then 0 else 0.2
		end
	end, { var3.enabled, var5.enabled })
	useEffect(function()
		-- upvalues: var2 (ref), var8 (write), var1 (ref), var4 (ref), var14 (ref)
		local current = var2.current
		
		if not current then return end
		if var1.playbackRegion.Max + 0.001 <= var8 then
			if not var4.enabled then
				var8 = var1.playbackRegion.Max
			elseif var1.looping then
				current.TimePosition = var1.playbackRegion.Min
				var14.current:fire()
			else
				var4.disable()
			end
		end
		if var8 < var1.playbackRegion.Min - 0.001 then
			current.TimePosition = var1.playbackRegion.Min
		end
	end, { var8, var1.playbackRegion, var1.looping, var4.disable })
	useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), var11 (ref)
		local current = var2.current
		
		if current then
			var11(math.min(var1.playbackRegion.Max - var1.playbackRegion.Min, current.TimeLength))
		end
	end, { var1.playbackRegion })
	
	return {
		timeline = {
			duration = var10,
			elapsed = var12,
			seek = var16,
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
		onVideoDidLoopSignalRef = var14,
		onVideoLoadedSignalRef = var15,
		ref = var2,
		updateRef = useCallback(function(p4)
			-- upvalues: var3 (ref), var2 (ref)
			var3.toggle()
			var2.current = p4
		end, { var3.toggle })
	}
end