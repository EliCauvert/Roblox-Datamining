local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local CryoModule = require(AppMusicPlayer.Parent.Cryo)
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local ReactModule = require(AppMusicPlayer.Parent.React)
local SongbirdModule = require(AppMusicPlayer.Parent.Songbird)
local SongAttributionModule = require(AppMusicPlayer.Components.SongAttribution)
local CreateNextOrderFunction = require(AppMusicPlayer.Parent.ReactUtils).createNextOrder
local UseLocalizationFunction = require(AppMusicPlayer.Parent.Localization).Hooks.useLocalization
local UseRefFunction = ReactModule.useRef
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState
local _Vector2 = Vector2.new(300, 1e999)
local config = { isLoading = false, analyticsSource = "unknown" }

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseRefFunction (copy), UseStateFunction (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), UseMemoFunction (copy), FoundationModule (copy), ReactModule (copy), _Vector2 (copy), SongAttributionModule (copy), SongbirdModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseLocalizationResult = UseLocalizationFunction({
		report = "Feature.MusicPlayer.Action.Report",
		goToSongDetails = "Feature.MusicPlayer.Action.GoToSongDetails"
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseLocalizationResult (copy), FoundationModule (upval), UseStateResult2 (copy), JoinResult (copy)
		return {
			{
				id = "report",
				isChecked = false,
				isDisabled = false,
				text = UseLocalizationResult.report,
				icon = FoundationModule.Enums.IconName.Flag,
				onActivated = function()
					-- upvalues: UseStateResult2 (upval), JoinResult (upval)
					UseStateResult2(false)
					JoinResult.onReport()
				end
			},
			{
				id = "view-details",
				isChecked = false,
				isDisabled = false,
				text = UseLocalizationResult.goToSongDetails,
				icon = FoundationModule.Enums.IconName.MusicNote,
				onActivated = function()
					-- upvalues: UseStateResult2 (upval), JoinResult (upval)
					UseStateResult2(false)
					JoinResult.onOpenSongDetails()
				end
			}
		}
	end, { JoinResult.onReport, JoinResult.onOpenSongDetails })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-2000 row flex-between gap-medium bg-surface-200 align-y-center padding-small"
	}, {
		SongAttributionWrapper = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y shrink row align-y-center gap-medium",
			sizeConstraint = { MaxSize = _Vector2 },
			LayoutOrder = NextOrder()
		}, {
			SongAttribution = ReactModule.createElement(SongAttributionModule, {
				title = JoinResult.title,
				artist = JoinResult.artist,
				albumArt = JoinResult.albumArt,
				isLoading = JoinResult.isLoading,
				onActivated = JoinResult.onOpenSongDetails,
				LayoutOrder = NextOrder()
			}),
			LikeButton = ReactModule.createElement(FoundationModule.IconButton, {
				icon = {
					name = FoundationModule.Enums.IconName.Star,
					variant = if JoinResult.isLiked then FoundationModule.Enums.IconVariant.Filled else nil
				},
				onActivated = JoinResult.onToggleLike,
				LayoutOrder = NextOrder()
			})
		}),
		PlaybackControls = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy shrink-3 col align-x-center align-y-center",
			LayoutOrder = NextOrder()
		}, {
			ButtonCluster = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy row gap-small align-x-center" }, {
				PrevButton = ReactModule.createElement(FoundationModule.IconButton, {
					icon = FoundationModule.Enums.IconName.SkipStartLarge,
					isDisabled = not JoinResult.hasPrevSong,
					onActivated = JoinResult.onPlayPrevTrack,
					LayoutOrder = NextOrder()
				}),
				PlaybackToggleButton = ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					icon = if JoinResult.isPlaying then FoundationModule.Enums.IconName.PauseLarge else FoundationModule.Enums.IconName.PlayLarge,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = JoinResult.onTogglePlayback,
					LayoutOrder = NextOrder()
				}),
				NextButton = ReactModule.createElement(FoundationModule.IconButton, {
					icon = FoundationModule.Enums.IconName.SkipEndLarge,
					isDisabled = not JoinResult.hasNextSong,
					onActivated = JoinResult.onPlayNextTrack,
					LayoutOrder = NextOrder()
				})
			}),
			AudioPlaybackTimelineWrapper = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", sizeConstraint = { MaxSize = _Vector2 } }, {
				AudioPlaybackTimeline = ReactModule.createElement(SongbirdModule.AudioPlaybackTimeline, {
					duration = JoinResult.duration,
					elapsed = JoinResult.elapsed,
					onDragTimeline = JoinResult.onDragTimeline,
					onDragTimelineStart = JoinResult.onDragTimelineStart,
					onDragTimelineEnd = JoinResult.onDragTimelineEnd,
					LayoutOrder = NextOrder()
				})
			})
		}),
		Actions = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y shrink row gap-small align-x-right",
			sizeConstraint = { MaxSize = _Vector2 },
			LayoutOrder = NextOrder()
		}, {
			VolumeControl = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy row align-y-center",
				LayoutOrder = NextOrder()
			}, {
				VolumeButton = ReactModule.createElement(FoundationModule.IconButton, {
					icon = if JoinResult.volume == 0 then FoundationModule.Enums.IconName.SpeakerSlash else FoundationModule.Enums.IconName.Speaker,
					onActivated = JoinResult.onToggleMute,
					LayoutOrder = NextOrder()
				})
			}),
			CollapseButton = ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.TwoArrowsToCenter,
				onActivated = JoinResult.onCollapse,
				LayoutOrder = NextOrder()
			}),
			OverflowButton = ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.ThreeDotsVertical,
				onActivated = if UseStateResult then UseCallbackResult else UseCallbackResult1,
				ref = UseRefResult,
				LayoutOrder = NextOrder()
			}),
			CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.X,
				onActivated = JoinResult.onClose,
				LayoutOrder = NextOrder()
			})
		}),
		OverflowMenu = UseStateResult and ReactModule.createElement(FoundationModule.Menu, {
			isOpen = true,
			items = UseMemoResult,
			side = FoundationModule.Enums.PopoverSide.Top,
			anchorRef = UseRefResult,
			onPressedOutside = UseCallbackResult
		})
	})
end)