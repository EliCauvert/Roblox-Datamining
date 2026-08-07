local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local mediaPlaybackModule = require(songbird.Parent.MediaPlayback)
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local signalsReactModule = require(songbird.Parent.SignalsReact)
local useLocalization = require(songbird.Parent.Localization).Hooks.useLocalization
local roundIconButtonModule = require(songbird.Components.RoundIconButton)
local audioPlaybackTimelineModule = require(songbird.Components.AudioPlaybackTimeline)
local _ = require(songbird.types)
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendAudioPlayerAnalyticsModule = require(songbird.Analytics.sendAudioPlayerAnalytics)
local useStopSongOnPageNavigationModule = require(songbird.Hooks.useStopSongOnPageNavigation)
local getFFlagLuaAppPersistentMusicPlayer = require(songbird.Parent.SharedFlags).GetFFlagLuaAppPersistentMusicPlayer
local getFFlagAudioPlayerCanSkipTracks = require(songbird.Parent.SharedFlags).GetFFlagAudioPlayerCanSkipTracks
local getFFlagAudioPreviewLua = mediaPlaybackModule.getFFlagAudioPreviewLua
local getAudioPlaybackStore = mediaPlaybackModule.getAudioPlaybackStore
local useAudioStore = mediaPlaybackModule.useAudioStore
local useCallback = reactModule.useCallback
local useRef = reactModule.useRef
local useEffect = reactModule.useEffect
local createNextOrder = reactUtilsModule.createNextOrder
local usePrevious = reactUtilsModule.usePrevious
local useSignalState = signalsReactModule.useSignalState
local useSignalBinding = signalsReactModule.useSignalBinding
local t = { isNavigationFocus = true }
local vector2 = Vector2.new(320, 320)

return function(p0) --[[ line: 62 | named "AudioPlayer" ]]
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useLocalization (ref), useAudioStore (ref), getFFlagAudioPreviewLua (ref), useSignalState (ref), useSignalBinding (ref), getFFlagAudioPlayerCanSkipTracks (ref), getAudioPlaybackStore (ref), useCallback (ref), sendAudioPlayerAnalyticsModule (ref), analyticActionsModule (ref), useRef (ref), getFFlagLuaAppPersistentMusicPlayer (ref), useStopSongOnPageNavigationModule (ref), usePrevious (ref), useEffect (ref), reactModule (ref), foundationModule (ref), vector2 (ref), audioPlaybackTimelineModule (ref), roundIconButtonModule (ref)
	local var14 = cryoModule.Dictionary.join(t, p0)
	local var15 = createNextOrder()
	local var16 = useLocalization({ songPreview = "Feature.SongDetails.Label.SongPreview" })
	local var17 = useAudioStore(var14.audio.assetId, if getFFlagAudioPreviewLua() then var14.audio.isPrivate else nil)
	local var18 = useSignalState(var17.getIsPlaying)
	local var19 = useSignalState(var17.getIsElapsed)
	local var20 = useSignalState(var17.getDuration)
	local var21 = useSignalBinding(var17.getElapsed)
	local var22 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(getAudioPlaybackStore) else nil
	local var23 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(var22.hasNextSong) else nil
	local var24 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(var22.hasPrevSong) else nil
	local var23_1 = var23 or var24
	local var26 = useCallback(function(p1) --[[ line: 91 ]]
		-- upvalues: var14 (ref), sendAudioPlayerAnalyticsModule (copy), var21 (ref)
		sendAudioPlayerAnalyticsModule({
			action = p1,
			songId = var14.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if var14.audio.thumbnailAssetId then var14.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = var14.analyticsSource,
			listenDurationSeconds = var21:getValue()
		})
	end, {
		var14.audio.assetId,
		var14.audio.thumbnail,
		var14.analyticsSource,
		var21
	})
	local var27 = useCallback(function() --[[ line: 118 ]]
		-- upvalues: var26 (ref), analyticActionsModule (copy)
		var26(analyticActionsModule.AudioElapsed)
		var26(analyticActionsModule.AudioStopped)
	end, { var26 })
	local var28 = useRef(false)
	local var29 = useCallback(function() --[[ line: 125 ]]
		-- upvalues: var28 (ref), var18 (ref), var17 (ref)
		var28.current = var18
		var17.pause()
	end, { var17.pause, var18 })
	local var30 = useCallback(function(p2) --[[ line: 130 ]]
		-- upvalues: var17 (ref), var20 (ref)
		var17.seek(var20 * p2)
	end, { var17.seek, var20 })
	local var31 = useCallback(function() --[[ line: 134 ]]
		-- upvalues: var28 (ref), var17 (ref)
		if var28.current then
			var17.play()
		end
	end, { var17.play })
	local var32 = useCallback(function() --[[ line: 141 ]]
		-- upvalues: var18 (ref), var26 (ref), analyticActionsModule (copy), var17 (ref), getFFlagAudioPlayerCanSkipTracks (copy), var22 (ref), getAudioPlaybackStore (copy)
		if var18 then
			var26(analyticActionsModule.AudioPause)
			var26(analyticActionsModule.AudioStopped)
			var17.pause()
			
			return
		end
		var26(analyticActionsModule.AudioPlay)
		
		if getFFlagAudioPlayerCanSkipTracks() then
			var22.pauseAll()
		else
			getAudioPlaybackStore(false).pauseAll()
		end
		var17.play()
	end, {
		var17.play,
		var17.pause,
		var18,
		if getFFlagAudioPlayerCanSkipTracks() then var22 else nil
	})
	
	if not getFFlagLuaAppPersistentMusicPlayer() then
		useStopSongOnPageNavigationModule(var14.isNavigationFocus, useCallback(function() --[[ line: 165 ]]
			-- upvalues: var26 (ref), analyticActionsModule (copy)
			var26(analyticActionsModule.AudioStopped)
		end, { var26 }))
		local var33 = usePrevious(var19)
		useEffect(function() --[[ line: 171 ]]
			-- upvalues: var19 (ref), var33 (ref), var27 (ref)
			if var19 and not var33 then
				var27()
			end
		end, { var19 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy col align-x-center gap-large",
		LayoutOrder = var14.LayoutOrder
	}, {
		AudioDetails = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y col align-x-center gap-xlarge" }, {
			AlbumArt = reactModule.createElement(foundationModule.Image, {
				tag = "size-full shrink bg-surface-100 radius-medium",
				aspectRatio = 1,
				sizeConstraint = { MaxSize = vector2 },
				Image = var14.audio.thumbnail,
				LayoutOrder = var15()
			}),
			Info = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y grow col align-x-center gap-medium",
				LayoutOrder = var15()
			}, {
				Title = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = var14.audio.title,
					LayoutOrder = var15()
				}),
				Artist = if not getFFlagAudioPreviewLua() then reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-large content-default text-truncate-end",
					Text = var14.audio.artist,
					LayoutOrder = var15()
				}) else nil,
				ArtistRow = if getFFlagAudioPreviewLua() then reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center gap-xsmall auto-xy",
					LayoutOrder = var15()
				}, {
					Artist = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large text-truncate-end content-default",
						LayoutOrder = 1,
						Text = var14.audio.artist
					}),
					SongPreviewSeparator = if var14.audio.isPrivate then reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						Text = "\194\183",
						LayoutOrder = 2
					}) else nil,
					SongPreviewLabel = if var14.audio.isPrivate then reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						LayoutOrder = 3,
						Text = var16.songPreview
					}) else nil
				}) else nil
			})
		}),
		PlaybackProgress = reactModule.createElement(audioPlaybackTimelineModule, {
			LayoutOrder = var15(),
			duration = var20,
			elapsed = var21,
			onDragTimeline = var30,
			onDragTimelineStart = var29,
			onDragTimelineEnd = var31
		}),
		PlaybackControls = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy row gap-medium align-y-center",
			LayoutOrder = var15()
		}, {
			PrevButton = if getFFlagAudioPlayerCanSkipTracks() and var23_1 then reactModule.createElement(foundationModule.IconButton, {
				icon = foundationModule.Enums.IconName.SkipStartLarge,
				isDisabled = not var24,
				onActivated = var22.playPrevSong,
				LayoutOrder = var15()
			}) else nil,
			PlaybackToggleButton = if getFFlagAudioPlayerCanSkipTracks() then reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				icon = if var18 then foundationModule.Enums.IconName.PauseLarge else foundationModule.Enums.IconName.PlayLarge,
				variant = foundationModule.Enums.ButtonVariant.Emphasis,
				onActivated = var32,
				LayoutOrder = var15()
			}) else reactModule.createElement(roundIconButtonModule, {
				icon = if var18 then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = var32,
				LayoutOrder = var15()
			}),
			NextButton = if getFFlagAudioPlayerCanSkipTracks() and var23_1 then reactModule.createElement(foundationModule.IconButton, {
				icon = foundationModule.Enums.IconName.SkipEndLarge,
				isDisabled = not var23,
				onActivated = var22.playNextSong,
				LayoutOrder = var15()
			}) else nil
		})
	})
end