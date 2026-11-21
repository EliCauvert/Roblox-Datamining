local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local MediaPlaybackModule = require(Parent.MediaPlayback)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local SignalsModule = require(Parent.Signals)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: NavigationModule (copy), ReactModule (copy), MediaPlaybackModule (copy), SignalsModule (copy), RoactNavigationModule (copy), SendBuildExperienceEventModule (copy)
	local UseNavigationResult = NavigationModule.useNavigation()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult4 = if UseStateResult3 == nil or UseStateResult3.soundId ~= UseStateResult or UseStateResult3.store ~= UseRefResult.current then nil else UseStateResult3
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), MediaPlaybackModule (upval), UseRefResult (copy), SignalsModule (upval), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if UseStateResult == nil then
			return nil
		else
			local AudioPlaybackStore = MediaPlaybackModule.getAudioPlaybackStore(false)
			local OrCreateAudioStore = AudioPlaybackStore.getOrCreateAudioStore(UseStateResult, false)
			UseRefResult.current = OrCreateAudioStore
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: UseStateResult2_2 (upval), UseStateResult (copy), OrCreateAudioStore (copy)
				UseStateResult2_2({
					soundId = UseStateResult,
					store = OrCreateAudioStore,
					isLoaded = OrCreateAudioStore.getIsLoaded(p2),
					isPlaying = OrCreateAudioStore.getIsPlaying(p2)
				})
			end)
			local DelayedThread = task.delay(15, function()
				-- upvalues: OrCreateAudioStore (copy), UseStateResult2_1 (upval), UseStateResult2 (upval)
				if not OrCreateAudioStore.getIsLoaded(false) then
					UseStateResult2_1(false)
					UseStateResult2(nil)
				end
			end)
			
			return function()
				-- upvalues: UseRefResult (upval), DelayedThread (copy), Effect (copy), OrCreateAudioStore (copy), AudioPlaybackStore (copy), UseStateResult (copy)
				UseRefResult.current = nil
				task.cancel(DelayedThread)
				Effect()
				OrCreateAudioStore.stop()
				AudioPlaybackStore.destroyAudioStore(UseStateResult, false)
			end
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult4 (copy), UseStateResult2_1 (copy), MediaPlaybackModule (upval)
		if UseStateResult1 and UseStateResult4 ~= nil and UseStateResult4.isLoaded then
			UseStateResult2_1(false)
			MediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
			UseStateResult4.store.play()
		end
	end, { UseStateResult1, UseStateResult4 })
	local NoUseStateResult: boolean = UseStateResult == nil or p1.isOpen and table.find(p1.visibleSoundIds, UseStateResult) ~= nil
	ReactModule.useEffect(function()
		-- upvalues: NoUseStateResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if not NoUseStateResult then
			UseStateResult2_1(false)
			UseStateResult2(nil)
		end
	end, { NoUseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationResult (copy), RoactNavigationModule (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if UseNavigationResult == nil then
			return nil
		else
			local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function()
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval)
				UseStateResult2_1(false)
				UseStateResult2(nil)
			end)
			
			return function()
				-- upvalues: AddListenerResult (copy)
				AddListenerResult.remove()
			end
		end
	end, { UseNavigationResult or false })
	local IsPlaying = UseStateResult4 ~= nil and UseStateResult4.isPlaying
	local Surface = p1.surface
	
	return {
		playingSoundId = if IsPlaying or UseStateResult1 then UseStateResult else nil,
		onTogglePlayback = ReactModule.useCallback(function(SoundId)
			-- upvalues: UseStateResult (copy), IsPlaying (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult4 (copy), UseStateResult2 (copy), SendBuildExperienceEventModule (upval), Surface (copy)
			local IsPlaying1 = SoundId == UseStateResult and (IsPlaying or UseStateResult1)
			
			if IsPlaying1 then
				UseStateResult2_1(false)
				
				if UseStateResult4 ~= nil then
					UseStateResult4.store.pause()
				end
			else
				UseStateResult2(SoundId)
				UseStateResult2_1(true)
			end
			SendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", { universeId = game.GameId, placeId = game.PlaceId }, {
				kind = "Sound",
				surface = Surface,
				action = if IsPlaying1 then "tile_pause" else "tile_play"
			})
		end, {
			UseStateResult,
			UseStateResult4,
			IsPlaying,
			UseStateResult1,
			Surface
		})
	}
end