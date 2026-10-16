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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useLocalization (ref), useAudioStore (ref), getFFlagAudioPreviewLua (ref), useSignalState (ref), useSignalBinding (ref), getFFlagAudioPlayerCanSkipTracks (ref), getAudioPlaybackStore (ref), useCallback (ref), sendAudioPlayerAnalyticsModule (ref), analyticActionsModule (ref), useRef (ref), getFFlagLuaAppPersistentMusicPlayer (ref), useStopSongOnPageNavigationModule (ref), usePrevious (ref), useEffect (ref), reactModule (ref), foundationModule (ref), vector2 (ref), audioPlaybackTimelineModule (ref), roundIconButtonModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = createNextOrder()
	local var3 = useLocalization({ songPreview = "Feature.SongDetails.Label.SongPreview" })
	local var4 = useAudioStore(var1.audio.assetId, if getFFlagAudioPreviewLua() then var1.audio.isPrivate else nil)
	local var5 = useSignalState(var4.getIsPlaying)
	local var6 = useSignalState(var4.getIsElapsed)
	local var7 = useSignalState(var4.getDuration)
	local var8 = useSignalBinding(var4.getElapsed)
	local var9 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(getAudioPlaybackStore) else nil
	local var10 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(var9.hasNextSong) else nil
	local var11 = if getFFlagAudioPlayerCanSkipTracks() then useSignalState(var9.hasPrevSong) else nil
	local var12 = var10 or var11
	local var13 = useCallback(function(p2)
		-- upvalues: var1 (ref), sendAudioPlayerAnalyticsModule (copy), var8 (ref)
		sendAudioPlayerAnalyticsModule({
			action = p2,
			songId = var1.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if var1.audio.thumbnailAssetId then var1.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = var1.analyticsSource,
			listenDurationSeconds = var8:getValue()
		})
	end, {
		var1.audio.assetId,
		var1.audio.thumbnail,
		var1.analyticsSource,
		var8
	})
	local var14 = useCallback(function()
		-- upvalues: var13 (ref), analyticActionsModule (copy)
		var13(analyticActionsModule.AudioElapsed)
		var13(analyticActionsModule.AudioStopped)
	end, { var13 })
	local var15 = useRef(false)
	local var16 = useCallback(function()
		-- upvalues: var15 (ref), var5 (ref), var4 (ref)
		var15.current = var5
		var4.pause()
	end, { var4.pause, var5 })
	local var17 = useCallback(function(p2)
		-- upvalues: var4 (ref), var7 (ref)
		var4.seek(var7 * p2)
	end, { var4.seek, var7 })
	local var18 = useCallback(function()
		-- upvalues: var15 (ref), var4 (ref)
		if var15.current then
			var4.play()
		end
	end, { var4.play })
	local var19 = useCallback(function()
		-- upvalues: var5 (ref), var13 (ref), analyticActionsModule (copy), var4 (ref), getFFlagAudioPlayerCanSkipTracks (copy), var9 (ref), getAudioPlaybackStore (copy)
		if var5 then
			var13(analyticActionsModule.AudioPause)
			var13(analyticActionsModule.AudioStopped)
			var4.pause()
			
			return
		end
		var13(analyticActionsModule.AudioPlay)
		
		if getFFlagAudioPlayerCanSkipTracks() then
			var9.pauseAll()
		else
			getAudioPlaybackStore(false).pauseAll()
		end
		var4.play()
	end, {
		var4.play,
		var4.pause,
		var5,
		if getFFlagAudioPlayerCanSkipTracks() then var9 else nil
	})
	
	if not getFFlagLuaAppPersistentMusicPlayer() then
		useStopSongOnPageNavigationModule(var1.isNavigationFocus, useCallback(function()
			-- upvalues: var13 (ref), analyticActionsModule (copy)
			var13(analyticActionsModule.AudioStopped)
		end, { var13 }))
		local var20 = usePrevious(var6)
		useEffect(function()
			-- upvalues: var6 (ref), var20 (ref), var14 (ref)
			if var6 and not var20 then
				var14()
			end
		end, { var6 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy col align-x-center gap-large",
		LayoutOrder = var1.LayoutOrder
	}, {
		AudioDetails = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y col align-x-center gap-xlarge" }, {
			AlbumArt = reactModule.createElement(foundationModule.Image, {
				tag = "size-full shrink bg-surface-100 radius-medium",
				aspectRatio = 1,
				sizeConstraint = { MaxSize = vector2 },
				Image = var1.audio.thumbnail,
				LayoutOrder = var2()
			}),
			Info = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y grow col align-x-center gap-medium",
				LayoutOrder = var2()
			}, {
				Title = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = var1.audio.title,
					LayoutOrder = var2()
				}),
				Artist = if not getFFlagAudioPreviewLua() then reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-large content-default text-truncate-end",
					Text = var1.audio.artist,
					LayoutOrder = var2()
				}) else nil,
				ArtistRow = if getFFlagAudioPreviewLua() then reactModule.createElement(foundationModule.View, {
					tag = "row align-x-center align-y-center gap-xsmall auto-xy",
					LayoutOrder = var2()
				}, {
					Artist = reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large text-truncate-end content-default",
						LayoutOrder = 1,
						Text = var1.audio.artist
					}),
					SongPreviewSeparator = if var1.audio.isPrivate then reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						Text = "\194\183",
						LayoutOrder = 2
					}) else nil,
					SongPreviewLabel = if var1.audio.isPrivate then reactModule.createElement(foundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						LayoutOrder = 3,
						Text = var3.songPreview
					}) else nil
				}) else nil
			})
		}),
		PlaybackProgress = reactModule.createElement(audioPlaybackTimelineModule, {
			LayoutOrder = var2(),
			duration = var7,
			elapsed = var8,
			onDragTimeline = var17,
			onDragTimelineStart = var16,
			onDragTimelineEnd = var18
		}),
		PlaybackControls = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy row gap-medium align-y-center",
			LayoutOrder = var2()
		}, {
			PrevButton = if getFFlagAudioPlayerCanSkipTracks() and var12 then reactModule.createElement(foundationModule.IconButton, {
				icon = foundationModule.Enums.IconName.SkipStartLarge,
				isDisabled = not var11,
				onActivated = var9.playPrevSong,
				LayoutOrder = var2()
			}) else nil,
			PlaybackToggleButton = if getFFlagAudioPlayerCanSkipTracks() then reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				icon = if var5 then foundationModule.Enums.IconName.PauseLarge else foundationModule.Enums.IconName.PlayLarge,
				variant = foundationModule.Enums.ButtonVariant.Emphasis,
				onActivated = var19,
				LayoutOrder = var2()
			}) else reactModule.createElement(roundIconButtonModule, {
				icon = if var5 then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = var19,
				LayoutOrder = var2()
			}),
			NextButton = if getFFlagAudioPlayerCanSkipTracks() and var12 then reactModule.createElement(foundationModule.IconButton, {
				icon = foundationModule.Enums.IconName.SkipEndLarge,
				isDisabled = not var10,
				onActivated = var9.playNextSong,
				LayoutOrder = var2()
			}) else nil
		})
	})
end