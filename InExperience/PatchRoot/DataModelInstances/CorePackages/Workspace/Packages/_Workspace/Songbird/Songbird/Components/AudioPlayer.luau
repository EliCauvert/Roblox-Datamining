local Songbird = script:FindFirstAncestor("Songbird")
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local MediaPlaybackModule = require(Songbird.Parent.MediaPlayback)
local ReactModule = require(Songbird.Parent.React)
local ReactUtilsModule = require(Songbird.Parent.ReactUtils)
local SignalsReactModule = require(Songbird.Parent.SignalsReact)
local UseLocalizationFunction = require(Songbird.Parent.Localization).Hooks.useLocalization
local RoundIconButtonModule = require(Songbird.Components.RoundIconButton)
local AudioPlaybackTimelineModule = require(Songbird.Components.AudioPlaybackTimeline)
local _ = require(Songbird.types)
local AnalyticActionsModule = require(Songbird.Analytics.AnalyticActions)
local SendAudioPlayerAnalyticsModule = require(Songbird.Analytics.sendAudioPlayerAnalytics)
local UseStopSongOnPageNavigationModule = require(Songbird.Hooks.useStopSongOnPageNavigation)
local GetFFlagAudioPlayerCanSkipTracksFunction = require(Songbird.Parent.SharedFlags).GetFFlagAudioPlayerCanSkipTracks
local GetFFlagAudioPreviewLuaFunction = MediaPlaybackModule.getFFlagAudioPreviewLua
local GetAudioPlaybackStoreFunction = MediaPlaybackModule.getAudioPlaybackStore
local UseAudioStoreFunction = MediaPlaybackModule.useAudioStore
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local UseEffectFunction = ReactModule.useEffect
local CreateNextOrderFunction = ReactUtilsModule.createNextOrder
local UsePreviousFunction = ReactUtilsModule.usePrevious
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local config = { isNavigationFocus = true }
local _Vector2 = Vector2.new(320, 320)

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseLocalizationFunction (copy), UseAudioStoreFunction (copy), GetFFlagAudioPreviewLuaFunction (copy), UseSignalStateFunction (copy), UseSignalBindingFunction (copy), GetFFlagAudioPlayerCanSkipTracksFunction (copy), GetAudioPlaybackStoreFunction (copy), UseCallbackFunction (copy), SendAudioPlayerAnalyticsModule (copy), AnalyticActionsModule (copy), UseRefFunction (copy), UseStopSongOnPageNavigationModule (copy), UsePreviousFunction (copy), UseEffectFunction (copy), ReactModule (copy), FoundationModule (copy), _Vector2 (copy), AudioPlaybackTimelineModule (copy), RoundIconButtonModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseLocalizationResult = UseLocalizationFunction({ songPreview = "Feature.SongDetails.Label.SongPreview" })
	local UseAudioStoreResult = UseAudioStoreFunction(JoinResult.audio.assetId, if GetFFlagAudioPreviewLuaFunction() then JoinResult.audio.isPrivate else nil)
	local UseSignalStateResult = UseSignalStateFunction(UseAudioStoreResult.getIsPlaying)
	local UseSignalStateResult1 = UseSignalStateFunction(UseAudioStoreResult.getIsElapsed)
	local UseSignalStateResult2 = UseSignalStateFunction(UseAudioStoreResult.getDuration)
	local UseSignalBindingResult = UseSignalBindingFunction(UseAudioStoreResult.getElapsed)
	local UseSignalStateResult3 = if GetFFlagAudioPlayerCanSkipTracksFunction() then UseSignalStateFunction(GetAudioPlaybackStoreFunction) else nil
	local UseSignalStateResult4 = if GetFFlagAudioPlayerCanSkipTracksFunction() then UseSignalStateFunction(UseSignalStateResult3.hasNextSong) else nil
	local UseSignalStateResult5 = if GetFFlagAudioPlayerCanSkipTracksFunction() then UseSignalStateFunction(UseSignalStateResult3.hasPrevSong) else nil
	local UseSignalStateResult4_1 = UseSignalStateResult4 or UseSignalStateResult5
	local UseCallbackResult = UseCallbackFunction(function(Action)
		-- upvalues: JoinResult (copy), SendAudioPlayerAnalyticsModule (upval), UseSignalBindingResult (copy)
		SendAudioPlayerAnalyticsModule({
			action = Action,
			songId = JoinResult.audio.assetId:gsub("rbxassetid://", ""),
			thumbnailId = (if JoinResult.audio.thumbnailAssetId then JoinResult.audio.thumbnailAssetId:gsub("rbxassetid://", "") else nil) or "-1",
			source = JoinResult.analyticsSource,
			listenDurationSeconds = UseSignalBindingResult:getValue()
		})
	end, {
		JoinResult.audio.assetId,
		JoinResult.audio.thumbnail,
		JoinResult.analyticsSource,
		UseSignalBindingResult
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseCallbackResult (copy), AnalyticActionsModule (upval)
		UseCallbackResult(AnalyticActionsModule.AudioElapsed)
		UseCallbackResult(AnalyticActionsModule.AudioStopped)
	end, { UseCallbackResult })
	local UseRefResult = UseRefFunction(false)
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult (copy), UseAudioStoreResult (copy)
		UseRefResult.current = UseSignalStateResult
		UseAudioStoreResult.pause()
	end, { UseAudioStoreResult.pause, UseSignalStateResult })
	local UseCallbackResult3 = UseCallbackFunction(function(p2)
		-- upvalues: UseAudioStoreResult (copy), UseSignalStateResult2 (copy)
		UseAudioStoreResult.seek(UseSignalStateResult2 * p2)
	end, { UseAudioStoreResult.seek, UseSignalStateResult2 })
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseAudioStoreResult (copy)
		if UseRefResult.current then
			UseAudioStoreResult.play()
		end
	end, { UseAudioStoreResult.play })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult (copy), UseCallbackResult (copy), AnalyticActionsModule (upval), UseAudioStoreResult (copy), GetFFlagAudioPlayerCanSkipTracksFunction (upval), UseSignalStateResult3 (copy), GetAudioPlaybackStoreFunction (upval)
		if UseSignalStateResult then
			UseCallbackResult(AnalyticActionsModule.AudioPause)
			UseCallbackResult(AnalyticActionsModule.AudioStopped)
			UseAudioStoreResult.pause()
			
			return
		end
		UseCallbackResult(AnalyticActionsModule.AudioPlay)
		
		if GetFFlagAudioPlayerCanSkipTracksFunction() then
			UseSignalStateResult3.pauseAll()
		else
			GetAudioPlaybackStoreFunction(false).pauseAll()
		end
		UseAudioStoreResult.play()
	end, {
		UseAudioStoreResult.play,
		UseAudioStoreResult.pause,
		UseSignalStateResult,
		if GetFFlagAudioPlayerCanSkipTracksFunction() then UseSignalStateResult3 else nil
	})
	UseStopSongOnPageNavigationModule(JoinResult.isNavigationFocus, (UseCallbackFunction(function()
		-- upvalues: UseCallbackResult (copy), AnalyticActionsModule (upval)
		UseCallbackResult(AnalyticActionsModule.AudioStopped)
	end, { UseCallbackResult })))
	local UsePreviousResult = UsePreviousFunction(UseSignalStateResult1)
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult1 (copy), UsePreviousResult (copy), UseCallbackResult1 (copy)
		if UseSignalStateResult1 and not UsePreviousResult then
			UseCallbackResult1()
		end
	end, { UseSignalStateResult1 })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy col align-x-center gap-large",
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		AudioDetails = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y col align-x-center gap-xlarge" }, {
			AlbumArt = ReactModule.createElement(FoundationModule.Image, {
				tag = "size-full shrink bg-surface-100 radius-medium",
				aspectRatio = 1,
				sizeConstraint = { MaxSize = _Vector2 },
				Image = JoinResult.audio.thumbnail,
				LayoutOrder = NextOrder()
			}),
			Info = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y grow col align-x-center gap-medium",
				LayoutOrder = NextOrder()
			}, {
				Title = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = JoinResult.audio.title,
					LayoutOrder = NextOrder()
				}),
				Artist = if GetFFlagAudioPreviewLuaFunction() then nil else ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-body-large content-default text-truncate-end",
					Text = JoinResult.audio.artist,
					LayoutOrder = NextOrder()
				}),
				ArtistRow = if GetFFlagAudioPreviewLuaFunction() then ReactModule.createElement(FoundationModule.View, {
					tag = "row align-x-center align-y-center gap-xsmall auto-xy",
					LayoutOrder = NextOrder()
				}, {
					Artist = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-body-large text-truncate-end content-default",
						LayoutOrder = 1,
						Text = JoinResult.audio.artist
					}),
					SongPreviewSeparator = if JoinResult.audio.isPrivate then ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						Text = "·",
						LayoutOrder = 2
					}) else nil,
					SongPreviewLabel = if JoinResult.audio.isPrivate then ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-body-large content-default",
						LayoutOrder = 3,
						Text = UseLocalizationResult.songPreview
					}) else nil
				}) else nil
			})
		}),
		PlaybackProgress = ReactModule.createElement(AudioPlaybackTimelineModule, {
			LayoutOrder = NextOrder(),
			duration = UseSignalStateResult2,
			elapsed = UseSignalBindingResult,
			onDragTimeline = UseCallbackResult3,
			onDragTimelineStart = UseCallbackResult2,
			onDragTimelineEnd = UseCallbackResult4
		}),
		PlaybackControls = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy row gap-medium align-y-center",
			LayoutOrder = NextOrder()
		}, {
			PrevButton = if GetFFlagAudioPlayerCanSkipTracksFunction() and UseSignalStateResult4_1 then ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.SkipStartLarge,
				isDisabled = not UseSignalStateResult5,
				onActivated = UseSignalStateResult3.playPrevSong,
				LayoutOrder = NextOrder()
			}) else nil,
			PlaybackToggleButton = if GetFFlagAudioPlayerCanSkipTracksFunction() then ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				icon = if UseSignalStateResult then FoundationModule.Enums.IconName.PauseLarge else FoundationModule.Enums.IconName.PlayLarge,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis,
				onActivated = UseCallbackResult5,
				LayoutOrder = NextOrder()
			}) else ReactModule.createElement(RoundIconButtonModule, {
				icon = if UseSignalStateResult then "icons/controls/media-pause-medium" else "icons/controls/media-play-medium",
				onActivated = UseCallbackResult5,
				LayoutOrder = NextOrder()
			}),
			NextButton = if GetFFlagAudioPlayerCanSkipTracksFunction() and UseSignalStateResult4_1 then ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.SkipEndLarge,
				isDisabled = not UseSignalStateResult4,
				onActivated = UseSignalStateResult3.playNextSong,
				LayoutOrder = NextOrder()
			}) else nil
		})
	})
end