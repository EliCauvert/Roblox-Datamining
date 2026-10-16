local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local MediaPlaybackModule = require(Parent.MediaPlayback)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.LibraryAudioPlayerView)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1) --[[ Line: 21 | Named "useLibraryAudioPlayerViewModel" ]]
	-- upvalues: MediaPlaybackModule (copy), NavigationModule (copy), ReactModule (copy), RoactNavigationModule (copy), SignalsReactModule (copy), SendBuildExperienceEventModule (copy)
	local IsIsActive = p1.isActive ~= false
	local UseAudioStoreResult = MediaPlaybackModule.useAudioStore(p1.soundId, false)
	local UseNavigationResult = NavigationModule.useNavigation()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseNavigationResult == nil or UseNavigationResult.isFocused())
	ReactModule.useEffect(function() --[[ Line: 26 ]]
		-- upvalues: UseStateResult2 (copy), UseNavigationResult (copy), RoactNavigationModule (upval)
		UseStateResult2(UseNavigationResult == nil or UseNavigationResult.isFocused())
		
		if UseNavigationResult == nil then
			return nil
		else
			local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillFocus, function() --[[ Line: 31 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
			local AddListenerResult1 = UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function() --[[ Line: 34 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			
			return function() --[[ Line: 37 ]]
				-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
				AddListenerResult.remove()
				AddListenerResult1.remove()
			end
		end
	end, { UseNavigationResult or false })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseAudioStoreResult.getIsPlaying)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseAudioStoreResult.getIsLoaded)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseAudioStoreResult.getDuration)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(UseAudioStoreResult.getElapsed)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 48 ]]
		-- upvalues: UseStateResult2_1 (copy), UseSignalStateResult1 (copy), SendBuildExperienceEventModule (upval)
		UseStateResult2_1(false)
		
		if UseSignalStateResult1 then
			return nil
		else
			local DelayedThread = task.delay(15, function() --[[ Line: 53 ]]
				-- upvalues: UseStateResult2_1 (upval), SendBuildExperienceEventModule (upval)
				UseStateResult2_1(true)
				SendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", { universeId = game.GameId, placeId = game.PlaceId }, {
					surface = "Detail",
					kind = "Sound",
					reason = "audio_load_timeout"
				})
			end)
			
			return function() --[[ Line: 61 ]]
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		end
	end, { UseAudioStoreResult, UseSignalStateResult1 })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 66 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseStateResult (copy), IsIsActive (copy), UseSignalStateResult (copy), UseAudioStoreResult (copy), MediaPlaybackModule (upval), SendBuildExperienceEventModule (upval)
		if not UseSignalStateResult1 or not UseStateResult or not IsIsActive then return end
		if UseSignalStateResult then
			UseAudioStoreResult.pause()
		else
			MediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
			UseAudioStoreResult.play()
		end
		SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", { universeId = game.GameId, placeId = game.PlaceId }, {
			surface = "Detail",
			kind = "Sound",
			action = if UseSignalStateResult then "pause" else "play"
		})
	end, {
		UseAudioStoreResult,
		UseSignalStateResult1,
		UseSignalStateResult,
		UseStateResult,
		IsIsActive
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 84 ]]
		-- upvalues: UseRefResult (copy), UseSignalStateResult1 (copy), IsIsActive (copy), UseStateResult (copy), UseSignalStateResult (copy), UseAudioStoreResult (copy)
		UseRefResult.current = UseSignalStateResult1 and (IsIsActive and (UseStateResult and UseSignalStateResult))
		UseAudioStoreResult.pause()
	end, {
		UseAudioStoreResult,
		UseSignalStateResult1,
		IsIsActive,
		UseStateResult,
		UseSignalStateResult
	})
	local UseResult2 = ReactModule.useCallback(function(Value: number) --[[ Line: 88 ]]
		-- upvalues: UseSignalStateResult1 (copy), IsIsActive (copy), UseStateResult (copy), UseAudioStoreResult (copy), UseSignalStateResult2 (copy)
		if UseSignalStateResult1 and IsIsActive and UseStateResult then
			UseAudioStoreResult.seek(math.clamp(Value, 0, 1) * UseSignalStateResult2)
		end
	end, {
		UseAudioStoreResult,
		UseSignalStateResult2,
		UseSignalStateResult1,
		IsIsActive,
		UseStateResult
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 93 ]]
		-- upvalues: UseRefResult (copy), IsIsActive (copy), UseStateResult (copy), UseAudioStoreResult (copy)
		if UseRefResult.current and IsIsActive and UseStateResult then
			UseAudioStoreResult.play()
		end
		UseRefResult.current = false
	end, { UseAudioStoreResult, IsIsActive, UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: UseStateResult (copy), UseAudioStoreResult (copy), IsIsActive (copy)
		if not UseStateResult then
			UseAudioStoreResult.stop()
			
			return
		end
		if not IsIsActive then
			UseAudioStoreResult.pause()
		end
	end, { UseAudioStoreResult, UseStateResult, IsIsActive })
	ReactModule.useEffect(function() --[[ Line: 108 ]]
		-- upvalues: UseAudioStoreResult (copy)
		return function() --[[ Line: 109 ]]
			-- upvalues: UseAudioStoreResult (upval)
			UseAudioStoreResult.stop()
		end
	end, { UseAudioStoreResult })
	
	return {
		isCompact = p1.isCompact,
		title = p1.title,
		artist = p1.soundLabel or "",
		isPlaying = UseSignalStateResult,
		elapsed = UseSignalBindingResult,
		duration = UseSignalStateResult2,
		onTogglePlayback = UseResult,
		onSeek = UseResult2,
		onSeekStarted = UseResult1,
		onSeekEnded = UseResult3,
		unavailableText = p1.unavailableText,
		status = if UseSignalStateResult1 then "Ready" elseif UseStateResult1 then "Failed" else "Loading"
	}
end