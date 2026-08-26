local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useAudioPlaybackModule = require(momentsCommon.Hooks.useAudioPlayback)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useImageDisplayModule = require(momentsCommon.Hooks.useImageDisplay)
local useMemo = reactModule.useMemo
local useRef = reactModule.useRef
local useToggleStateModule = require(momentsCommon.Hooks.useToggleState)
local useVideoPlaybackModule = require(momentsCommon.Hooks.useVideoPlayback)
local signalModule = require(momentsCommon.Utils.Signal)
local constantsModule = require(momentsCommon.Constants)
local _ = require(momentsCommon.Types)
local t = {
	autoplay = false,
	looping = false,
	content = nil,
	captureType = nil,
	edits = { music = nil, trim = nil }
}

return function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useToggleStateModule (ref), useRef (ref), signalModule (ref), useMemo (ref), constantsModule (ref), useAudioPlaybackModule (ref), useVideoPlaybackModule (ref), useImageDisplayModule (ref), useCallback (ref), useEffect (ref)
	local var1 = cryoModule.Dictionary.union(t, p2)
	local var2 = useToggleStateModule(false)
	local var3 = useToggleStateModule(false)
	local var4 = useRef(signalModule.new())
	local var5 = useMemo(function()
		-- upvalues: var1 (ref)
		return if var1.edits.music then var1.edits.music.assetId else nil
	end, { var1.edits })
	local var6 = useMemo(function()
		-- upvalues: var1 (ref), constantsModule (copy)
		return if var1.captureType == Enum.CaptureType.Screenshot then NumberRange.new(0, constantsModule.ScreenshotMusicDuration) elseif var1.edits.trim then NumberRange.new(var1.edits.trim.startTime, var1.edits.trim.endTime) else NumberRange.new(0, 1e999)
	end, { var1.edits, var1.captureType })
	local var7 = useAudioPlaybackModule(p1, var5, {
		playbackRegion = useMemo(function()
			-- upvalues: var1 (ref), var6 (ref)
			return if var1.edits.music then NumberRange.new(var1.edits.music.startTime, var1.edits.music.startTime + (var6.Max - var6.Min)) else NumberRange.new(0, 1e999)
		end, { var1.edits, var6 }),
		looping = p2.looping
	})
	local var8 = useVideoPlaybackModule(p1, if var1.captureType == Enum.CaptureType.Screenshot then nil else var1.content, { playbackRegion = var6, looping = p2.looping })
	local var9 = useImageDisplayModule(p1, if var1.captureType == Enum.CaptureType.Screenshot then var1.content else nil)
	local var10 = useCallback(function(p3)
		-- upvalues: var8 (ref), var7 (ref)
		if var8.ref.current and var8.ref.current.IsLoaded then
			var8.timeline.seek(p3)
			var7.timeline.seek(p3)
			
			return
		end
	end, { var8.timeline.seek, var7.timeline.seek })
	useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), p1 (ref), var2 (ref)
		if (not var8.ref.current or not var8.ref.current.IsLoaded) and (not var9.ref.current or not var9.isLoadedRef.current) then return end
		if p1 then
			var2.enable()
			
			return
		end
		var2.disable()
	end, { p1 })
	useEffect(function()
		-- upvalues: var8 (ref), var9 (ref), var2 (ref), var7 (ref)
		if (not var8.ref.current or not var8.ref.current.IsLoaded) and (not var9.ref.current or not var9.isLoadedRef.current) then return end
		if var2.enabled then
			var8.playback.play()
			var7.playback.play()
			
			return
		end
		var8.playback.pause()
		var7.playback.pause()
	end, { var2.enabled })
	useEffect(function()
		-- upvalues: var3 (ref), var7 (ref), var5 (ref), var8 (ref)
		if var3.enabled then
			var7.volume.mute()
		else
			var7.volume.unmute()
		end
		if var5 or var3.enabled then
			var8.volume.mute()
			
			return
		end
		var8.volume.unmute()
	end, { var3.enabled, var5 })
	local var11 = useCallback(function(p3)
		-- upvalues: p1 (ref), var1 (ref), var2 (ref), var4 (ref)
		if p1 and var1.autoplay then
			var2.enable()
		end
		var4.current:fire(p3)
	end, { p1, var1.autoplay })
	local var12 = useCallback(function()
		-- upvalues: var11 (ref)
		var11(Enum.AssetType.Image)
	end, { var11 })
	local var13 = useCallback(function()
		-- upvalues: var11 (ref)
		var11(Enum.AssetType.Video)
	end, { var11 })
	local var14 = useCallback(function()
		-- upvalues: var7 (ref)
		var7.timeline.seek(0)
	end, { var7.timeline.seek })
	useEffect(function()
		-- upvalues: var8 (ref), var14 (ref), var13 (ref), var9 (ref), var12 (ref)
		local t = {}
		
		if var8.onVideoDidLoopSignalRef.current then
			table.insert(t, var8.onVideoDidLoopSignalRef.current:connect(var14))
		end
		if var8.onVideoLoadedSignalRef.current then
			table.insert(t, var8.onVideoLoadedSignalRef.current:connect(var13))
		end
		if var9.onImageLoadedSignalRef.current then
			table.insert(t, var9.onImageLoadedSignalRef.current:connect(var12))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v.disconnect()
			end
		end
	end, { var13, var14, var12 })
	
	return {
		timeline = if var1.captureType == Enum.CaptureType.Video then {
			duration = var8.timeline.duration,
			elapsed = var8.timeline.elapsed,
			seek = var10,
			timeLength = var8.timeline.timeLength,
			timePosition = var8.timeline.timePosition
		} else {
			duration = constantsModule.ScreenshotMusicDuration,
			elapsed = var7.timeline.elapsed,
			seek = var10,
			timeLength = constantsModule.ScreenshotMusicDuration,
			timePosition = var7.timeline.timePosition
		},
		playback = {
			isPlaying = var2.enabled,
			pause = var2.disable,
			play = var2.enable,
			toggle = var2.toggle
		},
		volume = {
			isMuted = var3.enabled,
			mute = var3.enable,
			unmute = var3.disable,
			toggle = var3.toggle
		},
		audio = {
			timeLength = var7.timeline.timeLength,
			timePosition = var7.timeline.timePosition
		},
		onContentLoadedSignalRef = var4,
		imageRef = var9.updateRef,
		videoRef = var8.updateRef,
		audioRef = var7.ref
	}
end