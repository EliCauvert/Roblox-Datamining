local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseAudioPlaybackModule = require(MomentsCommon.Hooks.useAudioPlayback)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseImageDisplayModule = require(MomentsCommon.Hooks.useImageDisplay)
local UseMemoFunction = ReactModule.useMemo
local UseRefFunction = ReactModule.useRef
local UseToggleStateModule = require(MomentsCommon.Hooks.useToggleState)
local UseVideoPlaybackModule = require(MomentsCommon.Hooks.useVideoPlayback)
local SignalModule = require(MomentsCommon.Utils.Signal)
local ConstantsModule = require(MomentsCommon.Constants)
local _ = require(MomentsCommon.Types)
local config = {
	autoplay = false,
	looping = false,
	content = nil,
	captureType = nil,
	edits = { music = nil, trim = nil }
}

return function(p1, p2) --[[ Line: 40 | Named "useUnifiedPlayback" ]]
	-- upvalues: CryoModule (copy), config (copy), UseToggleStateModule (copy), UseRefFunction (copy), SignalModule (copy), UseMemoFunction (copy), ConstantsModule (copy), UseAudioPlaybackModule (copy), UseVideoPlaybackModule (copy), UseImageDisplayModule (copy), UseCallbackFunction (copy), UseEffectFunction (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p2)
	local UseToggleStateModuleResult = UseToggleStateModule(false)
	local UseToggleStateModuleResult1 = UseToggleStateModule(false)
	local UseRefResult = UseRefFunction(SignalModule.new())
	local UseMemoResult = UseMemoFunction(function() --[[ Line: 49 ]]
		-- upvalues: UnionResult (copy)
		return if UnionResult.edits.music then UnionResult.edits.music.assetId else nil
	end, { UnionResult.edits })
	local UseMemoResult1 = UseMemoFunction(function(): NumberRange --[[ Line: 57 ]]
		-- upvalues: UnionResult (copy), ConstantsModule (upval)
		return if UnionResult.captureType == Enum.CaptureType.Screenshot then NumberRange.new(0, ConstantsModule.ScreenshotMusicDuration) elseif UnionResult.edits.trim then NumberRange.new(UnionResult.edits.trim.startTime, UnionResult.edits.trim.endTime) else NumberRange.new(0, 1e999)
	end, { UnionResult.edits, UnionResult.captureType })
	local UseAudioPlaybackModuleResult = UseAudioPlaybackModule(p1, UseMemoResult, {
		playbackRegion = UseMemoFunction(function(): NumberRange --[[ Line: 69 ]]
			-- upvalues: UnionResult (copy), UseMemoResult1 (copy)
			return if UnionResult.edits.music then NumberRange.new(UnionResult.edits.music.startTime, UnionResult.edits.music.startTime + (UseMemoResult1.Max - UseMemoResult1.Min)) else NumberRange.new(0, 1e999)
		end, { UnionResult.edits, UseMemoResult1 }),
		looping = p2.looping
	})
	local UseVideoPlaybackModuleResult = UseVideoPlaybackModule(p1, if UnionResult.captureType == Enum.CaptureType.Screenshot then nil else UnionResult.content, { playbackRegion = UseMemoResult1, looping = p2.looping })
	local UseImageDisplayModuleResult = UseImageDisplayModule(p1, if UnionResult.captureType == Enum.CaptureType.Screenshot then UnionResult.content else nil)
	local UseCallbackResult = UseCallbackFunction(function(p3) --[[ Line: 94 ]]
		-- upvalues: UseVideoPlaybackModuleResult (copy), UseAudioPlaybackModuleResult (copy)
		if UseVideoPlaybackModuleResult.ref.current and UseVideoPlaybackModuleResult.ref.current.IsLoaded then
			UseVideoPlaybackModuleResult.timeline.seek(p3)
			UseAudioPlaybackModuleResult.timeline.seek(p3)
			
			return
		end
	end, {
		UseVideoPlaybackModuleResult.timeline.seek,
		UseAudioPlaybackModuleResult.timeline.seek
	})
	UseEffectFunction(function() --[[ Line: 103 ]]
		-- upvalues: UseVideoPlaybackModuleResult (copy), UseImageDisplayModuleResult (copy), p1 (copy), UseToggleStateModuleResult (copy)
		if (not UseVideoPlaybackModuleResult.ref.current or not UseVideoPlaybackModuleResult.ref.current.IsLoaded) and (not UseImageDisplayModuleResult.ref.current or not UseImageDisplayModuleResult.isLoadedRef.current) then return end
		if p1 then
			UseToggleStateModuleResult.enable()
			
			return
		else
			UseToggleStateModuleResult.disable()
		end
	end, { p1 })
	UseEffectFunction(function() --[[ Line: 118 ]]
		-- upvalues: UseVideoPlaybackModuleResult (copy), UseImageDisplayModuleResult (copy), UseToggleStateModuleResult (copy), UseAudioPlaybackModuleResult (copy)
		if (not UseVideoPlaybackModuleResult.ref.current or not UseVideoPlaybackModuleResult.ref.current.IsLoaded) and (not UseImageDisplayModuleResult.ref.current or not UseImageDisplayModuleResult.isLoadedRef.current) then return end
		if UseToggleStateModuleResult.enabled then
			UseVideoPlaybackModuleResult.playback.play()
			UseAudioPlaybackModuleResult.playback.play()
			
			return
		else
			UseVideoPlaybackModuleResult.playback.pause()
			UseAudioPlaybackModuleResult.playback.pause()
		end
	end, { UseToggleStateModuleResult.enabled })
	UseEffectFunction(function() --[[ Line: 135 ]]
		-- upvalues: UseToggleStateModuleResult1 (copy), UseAudioPlaybackModuleResult (copy), UseMemoResult (copy), UseVideoPlaybackModuleResult (copy)
		if UseToggleStateModuleResult1.enabled then
			UseAudioPlaybackModuleResult.volume.mute()
		else
			UseAudioPlaybackModuleResult.volume.unmute()
		end
		if UseMemoResult or UseToggleStateModuleResult1.enabled then
			UseVideoPlaybackModuleResult.volume.mute()
			
			return
		else
			UseVideoPlaybackModuleResult.volume.unmute()
		end
	end, { UseToggleStateModuleResult1.enabled, UseMemoResult })
	local UseCallbackResult1 = UseCallbackFunction(function(p3) --[[ Line: 149 ]]
		-- upvalues: p1 (copy), UnionResult (copy), UseToggleStateModuleResult (copy), UseRefResult (copy)
		if p1 and UnionResult.autoplay then
			UseToggleStateModuleResult.enable()
		end
		UseRefResult.current:fire(p3)
	end, { p1, UnionResult.autoplay })
	local UseCallbackResult2 = UseCallbackFunction(function() --[[ Line: 156 ]]
		-- upvalues: UseCallbackResult1 (copy)
		UseCallbackResult1(Enum.AssetType.Image)
	end, { UseCallbackResult1 })
	local UseCallbackResult3 = UseCallbackFunction(function() --[[ Line: 160 ]]
		-- upvalues: UseCallbackResult1 (copy)
		UseCallbackResult1(Enum.AssetType.Video)
	end, { UseCallbackResult1 })
	local UseCallbackResult4 = UseCallbackFunction(function() --[[ Line: 164 ]]
		-- upvalues: UseAudioPlaybackModuleResult (copy)
		UseAudioPlaybackModuleResult.timeline.seek(0)
	end, { UseAudioPlaybackModuleResult.timeline.seek })
	UseEffectFunction(function() --[[ Line: 168 ]]
		-- upvalues: UseVideoPlaybackModuleResult (copy), UseCallbackResult4 (copy), UseCallbackResult3 (copy), UseImageDisplayModuleResult (copy), UseCallbackResult2 (copy)
		local CurrentConnections = {}
		
		if UseVideoPlaybackModuleResult.onVideoDidLoopSignalRef.current then
			table.insert(CurrentConnections, UseVideoPlaybackModuleResult.onVideoDidLoopSignalRef.current:connect(UseCallbackResult4))
		end
		if UseVideoPlaybackModuleResult.onVideoLoadedSignalRef.current then
			table.insert(CurrentConnections, UseVideoPlaybackModuleResult.onVideoLoadedSignalRef.current:connect(UseCallbackResult3))
		end
		if UseImageDisplayModuleResult.onImageLoadedSignalRef.current then
			table.insert(CurrentConnections, UseImageDisplayModuleResult.onImageLoadedSignalRef.current:connect(UseCallbackResult2))
		end
		return function() --[[ Line: 183 ]]
			-- upvalues: CurrentConnections (copy)
			for _, currentConnection in CurrentConnections do
				currentConnection.disconnect()
			end
		end
	end, {
		UseCallbackResult3,
		UseCallbackResult4,
		UseCallbackResult2
	})
	
	return {
		timeline = if UnionResult.captureType == Enum.CaptureType.Video then {
			duration = UseVideoPlaybackModuleResult.timeline.duration,
			elapsed = UseVideoPlaybackModuleResult.timeline.elapsed,
			seek = UseCallbackResult,
			timeLength = UseVideoPlaybackModuleResult.timeline.timeLength,
			timePosition = UseVideoPlaybackModuleResult.timeline.timePosition
		} else {
			duration = ConstantsModule.ScreenshotMusicDuration,
			elapsed = UseAudioPlaybackModuleResult.timeline.elapsed,
			seek = UseCallbackResult,
			timeLength = ConstantsModule.ScreenshotMusicDuration,
			timePosition = UseAudioPlaybackModuleResult.timeline.timePosition
		},
		playback = {
			isPlaying = UseToggleStateModuleResult.enabled,
			pause = UseToggleStateModuleResult.disable,
			play = UseToggleStateModuleResult.enable,
			toggle = UseToggleStateModuleResult.toggle
		},
		volume = {
			isMuted = UseToggleStateModuleResult1.enabled,
			mute = UseToggleStateModuleResult1.enable,
			unmute = UseToggleStateModuleResult1.disable,
			toggle = UseToggleStateModuleResult1.toggle
		},
		audio = {
			timeLength = UseAudioPlaybackModuleResult.timeline.timeLength,
			timePosition = UseAudioPlaybackModuleResult.timeline.timePosition
		},
		onContentLoadedSignalRef = UseRefResult,
		imageRef = UseImageDisplayModuleResult.updateRef,
		videoRef = UseVideoPlaybackModuleResult.updateRef,
		audioRef = UseAudioPlaybackModuleResult.ref
	}
end