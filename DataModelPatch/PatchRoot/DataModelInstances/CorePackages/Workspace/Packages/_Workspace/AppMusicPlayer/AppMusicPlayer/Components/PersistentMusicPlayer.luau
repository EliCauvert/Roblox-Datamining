local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local ExperienceService = require(AppMusicPlayer.Parent.ExperienceService).ExperienceService
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local MediaPlaybackModule = require(AppMusicPlayer.Parent.MediaPlayback)
local MotionModule = require(AppMusicPlayer.Parent.Motion)
local ReactModule = require(AppMusicPlayer.Parent.React)
local ReactRobloxModule = require(AppMusicPlayer.Parent.ReactRoblox)
local ResponsiveModule = require(AppMusicPlayer.Parent.Responsive)
local RobloxAppEnumsModule = require(AppMusicPlayer.Parent.RobloxAppEnums)
local SignalsReactModule = require(AppMusicPlayer.Parent.SignalsReact)
local SongbirdModule = require(AppMusicPlayer.Parent.Songbird)
local CompactMusicPlayerModule = require(AppMusicPlayer.Components.CompactMusicPlayer)
local ExpandedMusicPlayerModule = require(AppMusicPlayer.Components.ExpandedMusicPlayer)
local SongDetailsSheetModule = require(AppMusicPlayer.Components.SongDetailsSheet)
local UseMusicTop100PlaylistModule = require(AppMusicPlayer.Hooks.useMusicTop100Playlist)
local UseAudioMetadataFunction = SongbirdModule.useAudioMetadata
local UseSongAlbumArtFunction = SongbirdModule.useSongAlbumArt
local UseAssetFavoritingFunction = require(AppMusicPlayer.Parent.AssetFavorites).useAssetFavoriting
local UseNavigationFunction = require(AppMusicPlayer.Parent.Navigation).useNavigation
local UseLastPlayedAudioStoreFunction = MediaPlaybackModule.useLastPlayedAudioStore
local GetAudioPlaybackStoreFunction = MediaPlaybackModule.getAudioPlaybackStore
local UseRefFunction = ReactModule.useRef
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseSignalBindingFunction = SignalsReactModule.useSignalBinding
local UseOverlayFunction = FoundationModule.Hooks.useOverlay

return ReactModule.memo(function(Frame)
	-- upvalues: UseNavigationFunction (copy), UseOverlayFunction (copy), UseRefFunction (copy), UseStateFunction (copy), ResponsiveModule (copy), UseMemoFunction (copy), UseMusicTop100PlaylistModule (copy), GetAudioPlaybackStoreFunction (copy), UseSignalStateFunction (copy), UseLastPlayedAudioStoreFunction (copy), UseSignalBindingFunction (copy), UseAssetFavoritingFunction (copy), UseAudioMetadataFunction (copy), UseSongAlbumArtFunction (copy), MotionModule (copy), UseCallbackFunction (copy), RobloxAppEnumsModule (copy), UseEffectFunction (copy), ExperienceService (copy), ReactModule (copy), FoundationModule (copy), CompactMusicPlayerModule (copy), ExpandedMusicPlayerModule (copy), SongDetailsSheetModule (copy), ReactRobloxModule (copy), SongbirdModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseOverlayResult = UseOverlayFunction()
	local UseRefResult = UseRefFunction(false)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(true)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(false)
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.BreakpointConfig.Enum.Small)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseBreakpointXOrSmallerResult (copy), UseStateResult3 (copy)
		return UseBreakpointXOrSmallerResult or not UseStateResult3
	end, { UseStateResult3, UseBreakpointXOrSmallerResult })
	local UseMusicTop100PlaylistModuleResult = UseMusicTop100PlaylistModule()
	local AudioPlaybackStore = GetAudioPlaybackStoreFunction(false)
	local UseSignalStateResult = UseSignalStateFunction(AudioPlaybackStore.hasNextSong)
	local UseSignalStateResult1 = UseSignalStateFunction(AudioPlaybackStore.hasPrevSong)
	local UseSignalStateResult2 = UseSignalStateFunction(AudioPlaybackStore.getIsMuted)
	local UseSignalStateResult3 = UseSignalStateFunction(AudioPlaybackStore.getGlobalVolume)
	local UseLastPlayedAudioStoreResult = UseLastPlayedAudioStoreFunction()
	local UseSignalStateResult4 = UseSignalStateFunction(UseLastPlayedAudioStoreResult.getDuration)
	local UseSignalBindingResult = UseSignalBindingFunction(UseLastPlayedAudioStoreResult.getElapsed)
	local UseSignalStateResult5 = UseSignalStateFunction(UseLastPlayedAudioStoreResult.getIsPlaying)
	local UseSignalStateResult6 = UseSignalStateFunction(UseLastPlayedAudioStoreResult.getIsLoaded)
	local Number: number? = tonumber(UseLastPlayedAudioStoreResult.assetId)
	local UseAssetFavoritingResult = UseAssetFavoritingFunction(if Number then { Number } else {})
	local ByAssetId = if Number then UseAssetFavoritingResult.getByAssetId(Number) else false
	local UseAudioMetadataResult = UseAudioMetadataFunction({ UseLastPlayedAudioStoreResult.assetId })
	local UseSongAlbumArtResult = UseSongAlbumArtFunction(UseLastPlayedAudioStoreResult.assetId)
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: MotionModule (upval)
		return {
			expanded = MotionModule.createState({
				expandedPlayerPosition = UDim2.fromScale(0, 0),
				compactPlayerPosition = UDim2.fromScale(1, 1)
			}),
			collapsed = MotionModule.createState({
				expandedPlayerPosition = UDim2.fromScale(0, 1),
				compactPlayerPosition = UDim2.fromScale(1, 0)
			}),
			closed = MotionModule.createState({
				expandedPlayerPosition = UDim2.fromScale(0, 1),
				compactPlayerPosition = UDim2.fromScale(1, 1)
			})
		}
	end, {})
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(UseMemoResult1.expanded)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseSignalStateResult5 (copy), UseLastPlayedAudioStoreResult (copy)
		UseRefResult.current = UseSignalStateResult5
		UseLastPlayedAudioStoreResult.pause()
	end, {
		UseLastPlayedAudioStoreResult.pause,
		UseSignalStateResult5
	})
	local UseCallbackResult1 = UseCallbackFunction(function(p1)
		-- upvalues: UseLastPlayedAudioStoreResult (copy), UseSignalStateResult4 (copy)
		UseLastPlayedAudioStoreResult.seek(UseSignalStateResult4 * p1)
	end, {
		UseLastPlayedAudioStoreResult.seek,
		UseSignalStateResult4
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseLastPlayedAudioStoreResult (copy)
		if UseRefResult.current then
			UseLastPlayedAudioStoreResult.play()
		end
	end, { UseLastPlayedAudioStoreResult.play })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult5 (copy), UseLastPlayedAudioStoreResult (copy)
		if UseSignalStateResult5 then
			UseLastPlayedAudioStoreResult.pause()
			
			return
		else
			UseLastPlayedAudioStoreResult.play()
		end
	end, {
		UseSignalStateResult5,
		UseLastPlayedAudioStoreResult.play,
		UseLastPlayedAudioStoreResult.pause
	})
	local UseCallbackResult4 = UseCallbackFunction(function()
		-- upvalues: AudioPlaybackStore (copy)
		AudioPlaybackStore.playPrevSong()
	end, {})
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: AudioPlaybackStore (copy)
		AudioPlaybackStore.playNextSong()
	end, {})
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: UseSignalStateResult2 (copy), AudioPlaybackStore (copy)
		if UseSignalStateResult2 then
			AudioPlaybackStore.unmute()
			
			return
		else
			AudioPlaybackStore.mute()
		end
	end, {
		UseSignalStateResult2,
		AudioPlaybackStore.unmute,
		AudioPlaybackStore.mute
	})
	local UseCallbackResult7 = UseCallbackFunction(function()
		-- upvalues: Number (copy), UseAssetFavoritingResult (copy)
		if Number then
			UseAssetFavoritingResult.toggleFavorite(Number)
		end
	end, { UseAssetFavoritingResult.toggleFavorite, Number })
	local UseCallbackResult8 = UseCallbackFunction(function()
		-- upvalues: AudioPlaybackStore (copy), UseStateResult2_1 (copy)
		AudioPlaybackStore.stopAll()
		UseStateResult2_1(true)
	end, { AudioPlaybackStore })
	local UseCallbackResult9 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(true)
	end, {})
	local UseCallbackResult10 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseCallbackResult11 = UseCallbackFunction(function()
		-- upvalues: UseNavigationResult (copy), RobloxAppEnumsModule (upval), UseLastPlayedAudioStoreResult (copy)
		UseNavigationResult.navigate(RobloxAppEnumsModule.AppPage.SongDetail, { songId = UseLastPlayedAudioStoreResult.assetId })
	end, { UseLastPlayedAudioStoreResult.assetId })
	local UseCallbackResult12 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseCallbackResult13 = UseCallbackFunction(function()
		-- upvalues: AudioPlaybackStore (copy), UseStateResult2_3 (copy), UseStateResult2 (copy)
		AudioPlaybackStore.pauseAll()
		UseStateResult2_3(false)
		UseStateResult2(true)
	end, { AudioPlaybackStore })
	local UseCallbackResult14 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(true)
	end, {})
	local UseCallbackResult15 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseMusicTop100PlaylistModuleResult (copy), AudioPlaybackStore (copy)
		if #UseMusicTop100PlaylistModuleResult > 0 then
			AudioPlaybackStore.setPlaylist(UseMusicTop100PlaylistModuleResult)
		end
	end, { UseMusicTop100PlaylistModuleResult })
	UseEffectFunction(function()
		-- upvalues: UseStateResult1 (copy), UseMotionResult2 (copy), UseMemoResult1 (copy), UseMemoResult (copy)
		if UseStateResult1 then
			UseMotionResult2(UseMemoResult1.closed)
			
			return
		end
		if UseMemoResult then
			UseMotionResult2(UseMemoResult1.collapsed)
			
			return
		else
			UseMotionResult2(UseMemoResult1.expanded)
		end
	end, { UseStateResult1, UseMemoResult })
	UseEffectFunction(function()
		-- upvalues: UseSignalStateResult5 (copy), UseStateResult2_1 (copy)
		if UseSignalStateResult5 then
			UseStateResult2_1(false)
		end
	end, { UseSignalStateResult5 })
	UseEffectFunction(function()
		-- upvalues: ExperienceService (upval), AudioPlaybackStore (copy)
		local RegisterForExperienceJoinResult = ExperienceService:RegisterForExperienceJoin(function(...)
			-- upvalues: AudioPlaybackStore (upval)
			AudioPlaybackStore.stopAll()
		end)
		
		return function()
			-- upvalues: RegisterForExperienceJoinResult (copy)
			if RegisterForExperienceJoinResult then
				RegisterForExperienceJoinResult:Disconnect()
			end
		end
	end, { AudioPlaybackStore })
	
	if UseSignalStateResult6 then
		local ByAssetId1 = UseAudioMetadataResult.getByAssetId(UseLastPlayedAudioStoreResult.assetId)
		local IsOk: boolean = ByAssetId1 ~= nil and UseSongAlbumArtResult.status == "ok"
		local Title = if ByAssetId1 then ByAssetId1.Title else ""
		local Artist = if ByAssetId1 then ByAssetId1.Artist else ""
		
		return ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-2000 clip",
			LayoutOrder = Frame.LayoutOrder
		}, {
			Compact = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(1, 0),
				Position = UseMotionResult.compactPlayerPosition
			}, {
				CompactMusicPlayer = ReactModule.createElement(CompactMusicPlayerModule, {
					title = Title,
					artist = Artist,
					albumArt = UseSongAlbumArtResult.value,
					isLoading = not IsOk,
					duration = UseSignalStateResult4,
					elapsed = UseSignalBindingResult,
					isPlaying = UseSignalStateResult5,
					onOpenSongDetails = UseCallbackResult14,
					onTogglePlayback = UseCallbackResult3,
					onExpand = UseCallbackResult9,
					onToggleLike = UseCallbackResult7
				})
			}),
			Expanded = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full",
				ZIndex = 2,
				Position = UseMotionResult.expandedPlayerPosition
			}, {
				ExpandedMusicPlayer = ReactModule.createElement(ExpandedMusicPlayerModule, {
					albumArt = UseSongAlbumArtResult.value,
					artist = Artist,
					duration = UseSignalStateResult4,
					elapsed = UseSignalBindingResult,
					hasNextSong = UseSignalStateResult,
					hasPrevSong = UseSignalStateResult1,
					isLiked = ByAssetId,
					isLoading = not IsOk,
					isPlaying = UseSignalStateResult5,
					title = Title,
					volume = UseSignalStateResult3,
					assetId = UseLastPlayedAudioStoreResult.assetId,
					analyticsSource = Frame.analyticsSource,
					onClose = UseCallbackResult8,
					onCollapse = UseCallbackResult10,
					onDragTimeline = UseCallbackResult1,
					onDragTimelineEnd = UseCallbackResult2,
					onDragTimelineStart = UseCallbackResult,
					onOpenSongDetails = UseCallbackResult11,
					onPlayNextTrack = UseCallbackResult5,
					onPlayPrevTrack = UseCallbackResult4,
					onToggleLike = UseCallbackResult7,
					onToggleMute = UseCallbackResult6,
					onVolumeChanged = AudioPlaybackStore.setGlobalVolume,
					onTogglePlayback = UseCallbackResult3,
					onReport = UseCallbackResult13
				})
			}),
			SongDetailsSheet = ReactModule.createElement(SongDetailsSheetModule, {
				title = Title,
				artist = Artist,
				isLiked = ByAssetId,
				isOpen = UseStateResult4,
				albumArt = UseSongAlbumArtResult.value,
				assetId = UseLastPlayedAudioStoreResult.assetId,
				onClose = UseCallbackResult15,
				onLike = UseCallbackResult7,
				onUnlike = UseCallbackResult7,
				onReport = UseCallbackResult13
			}),
			ReportDialog = if UseStateResult and UseOverlayResult then ReactRobloxModule.createPortal(ReactModule.createElement(FoundationModule.View, {
				tag = "size-full row align-y-center align-x-center bg-over-media-100",
				stateLayer = {
					affordance = FoundationModule.Enums.StateLayerAffordance.None
				},
				onActivated = UseCallbackResult12
			}, {
				Dialog = ReactModule.createElement(SongbirdModule.ReportSongDialog, {
					audio = {
						thumbnailAssetId = "-1",
						assetId = UseLastPlayedAudioStoreResult.assetId
					},
					analyticsSource = Frame.analyticsSource or "unknown",
					onClose = UseCallbackResult12
				})
			}), UseOverlayResult) else nil
		})
	else
		return nil
	end
end)