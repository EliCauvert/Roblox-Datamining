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

return function(p0, p1)
	-- upvalues: cryoModule (ref), t (ref), useToggleStateModule (ref), useRef (ref), signalModule (ref), useMemo (ref), constantsModule (ref), useAudioPlaybackModule (ref), useVideoPlaybackModule (ref), useImageDisplayModule (ref), useCallback (ref), useEffect (ref)
	local var10 = cryoModule.Dictionary.union(t, p1)
	local var11 = useToggleStateModule(false)
	local var12 = useToggleStateModule(false)
	local var13 = useRef(signalModule.new())
	local var14 = useMemo(function()
		-- upvalues: var10 (ref)
		return if var10.edits.music then var10.edits.music.assetId else nil
	end, { var10.edits })
	local var15 = useMemo(function()
		-- upvalues: var10 (ref), constantsModule (copy)
		return if var10.captureType == Enum.CaptureType.Screenshot then NumberRange.new(0, constantsModule.ScreenshotMusicDuration) elseif var10.edits.trim then NumberRange.new(var10.edits.trim.startTime, var10.edits.trim.endTime) else NumberRange.new(0, 1e999)
	end, { var10.edits, var10.captureType })
	local var16 = useAudioPlaybackModule(p0, var14, {
		playbackRegion = useMemo(function()
			-- upvalues: var10 (ref), var15 (ref)
			return if var10.edits.music then NumberRange.new(var10.edits.music.startTime, var10.edits.music.startTime + (var15.Max - var15.Min)) else NumberRange.new(0, 1e999)
		end, { var10.edits, var15 }),
		looping = p1.looping
	})
	local var17 = useVideoPlaybackModule(p0, if var10.captureType == Enum.CaptureType.Screenshot then nil else var10.content, { playbackRegion = var15, looping = p1.looping })
	local var18 = useImageDisplayModule(p0, if var10.captureType == Enum.CaptureType.Screenshot then var10.content else nil)
	local var19 = useCallback(function(p2)
		-- upvalues: var17 (ref), var16 (ref)
		if var17.ref.current and var17.ref.current.IsLoaded then
			var17.timeline.seek(p2)
			var16.timeline.seek(p2)
			
			return
		end
	end, { var17.timeline.seek, var16.timeline.seek })
	useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), p0 (ref), var11 (ref)
		if (not var17.ref.current or not var17.ref.current.IsLoaded) and (not var18.ref.current or not var18.isLoadedRef.current) then return end
		if p0 then
			var11.enable()
			
			return
		end
		var11.disable()
	end, { p0 })
	useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), var11 (ref), var16 (ref)
		if (not var17.ref.current or not var17.ref.current.IsLoaded) and (not var18.ref.current or not var18.isLoadedRef.current) then return end
		if var11.enabled then
			var17.playback.play()
			var16.playback.play()
			
			return
		end
		var17.playback.pause()
		var16.playback.pause()
	end, { var11.enabled })
	useEffect(function()
		-- upvalues: var12 (ref), var16 (ref), var14 (ref), var17 (ref)
		if var12.enabled then
			var16.volume.mute()
		else
			var16.volume.unmute()
		end
		if var14 or var12.enabled then
			var17.volume.mute()
			
			return
		end
		var17.volume.unmute()
	end, { var12.enabled, var14 })
	local var20 = useCallback(function(p3)
		-- upvalues: p0 (ref), var10 (ref), var11 (ref), var13 (ref)
		if p0 and var10.autoplay then
			var11.enable()
		end
		var13.current:fire(p3)
	end, { p0, var10.autoplay })
	local var21 = useCallback(function()
		-- upvalues: var20 (ref)
		var20(Enum.AssetType.Image)
	end, { var20 })
	local var22 = useCallback(function()
		-- upvalues: var20 (ref)
		var20(Enum.AssetType.Video)
	end, { var20 })
	local var23 = useCallback(function()
		-- upvalues: var16 (ref)
		var16.timeline.seek(0)
	end, { var16.timeline.seek })
	useEffect(function()
		-- upvalues: var17 (ref), var23 (ref), var22 (ref), var18 (ref), var21 (ref)
		local t = {}
		
		if var17.onVideoDidLoopSignalRef.current then
			table.insert(t, var17.onVideoDidLoopSignalRef.current:connect(var23))
		end
		if var17.onVideoLoadedSignalRef.current then
			table.insert(t, var17.onVideoLoadedSignalRef.current:connect(var22))
		end
		if var18.onImageLoadedSignalRef.current then
			table.insert(t, var18.onImageLoadedSignalRef.current:connect(var21))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v.disconnect()
			end
		end
	end, { var22, var23, var21 })
	
	return {
		timeline = if var10.captureType == Enum.CaptureType.Video then {
			duration = var17.timeline.duration,
			elapsed = var17.timeline.elapsed,
			seek = var19,
			timeLength = var17.timeline.timeLength,
			timePosition = var17.timeline.timePosition
		} else {
			duration = constantsModule.ScreenshotMusicDuration,
			elapsed = var16.timeline.elapsed,
			seek = var19,
			timeLength = constantsModule.ScreenshotMusicDuration,
			timePosition = var16.timeline.timePosition
		},
		playback = {
			isPlaying = var11.enabled,
			pause = var11.disable,
			play = var11.enable,
			toggle = var11.toggle
		},
		volume = {
			isMuted = var12.enabled,
			mute = var12.enable,
			unmute = var12.disable,
			toggle = var12.toggle
		},
		audio = {
			timeLength = var16.timeline.timeLength,
			timePosition = var16.timeline.timePosition
		},
		onContentLoadedSignalRef = var13,
		imageRef = var18.updateRef,
		videoRef = var17.updateRef,
		audioRef = var16.ref
	}
end