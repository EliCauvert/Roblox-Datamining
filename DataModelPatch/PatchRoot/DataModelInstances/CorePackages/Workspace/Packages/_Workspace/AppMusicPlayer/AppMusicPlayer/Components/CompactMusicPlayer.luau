local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local CryoModule = require(AppMusicPlayer.Parent.Cryo)
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local ReactModule = require(AppMusicPlayer.Parent.React)
local ResponsiveModule = require(AppMusicPlayer.Parent.Responsive)
local SongAttributionModule = require(AppMusicPlayer.Components.SongAttribution)
local SongAttributionVariantModule = require(AppMusicPlayer.Enums.SongAttributionVariant)
local CreateNextOrderFunction = require(AppMusicPlayer.Parent.ReactUtils).createNextOrder
local config = { isLoading = false }

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), ResponsiveModule (copy), ReactModule (copy), FoundationModule (copy), SongAttributionModule (copy), SongAttributionVariantModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseBreakpointXOrSmallerResult = ResponsiveModule.useBreakpointXOrSmaller(ResponsiveModule.BreakpointConfig.Enum.Small)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy col bg-surface-200 radius-medium",
		sizeConstraint = { MaxSize = Vector2.new(300, 1e999) },
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		ProgressBar = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-50 bg-action-standard",
			LayoutOrder = NextOrder()
		}, {
			Fill = ReactModule.createElement(FoundationModule.View, {
				tag = "size-0-full bg-action-emphasis",
				testId = "compact-music-player-progress-bar-fill",
				Size = JoinResult.elapsed:map(function(p2): UDim2
					-- upvalues: JoinResult (copy)
					return UDim2.fromScale(p2 / JoinResult.duration, 1)
				end)
			})
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy row flex-between gap-medium align-y-center padding-small",
			LayoutOrder = NextOrder()
		}, {
			SongAttributionWrapper = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y shrink",
				LayoutOrder = NextOrder()
			}, {
				SongAttribution = ReactModule.createElement(SongAttributionModule, {
					title = JoinResult.title,
					artist = JoinResult.artist,
					albumArt = JoinResult.albumArt,
					isLoading = JoinResult.isLoading,
					variant = SongAttributionVariantModule.Compact,
					onActivated = JoinResult.onOpenSongDetails,
					LayoutOrder = NextOrder()
				})
			}),
			CollapseButton = if UseBreakpointXOrSmallerResult then nil else ReactModule.createElement(FoundationModule.IconButton, {
				icon = FoundationModule.Enums.IconName.TwoArrowsFromCenter,
				size = FoundationModule.Enums.ButtonSize.Small,
				onActivated = JoinResult.onExpand,
				LayoutOrder = NextOrder()
			}),
			PlaybackToggleButton = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				icon = if JoinResult.isPlaying then FoundationModule.Enums.IconName.PauseLarge else FoundationModule.Enums.IconName.PlayLarge,
				variant = FoundationModule.Enums.ButtonVariant.Emphasis,
				size = FoundationModule.Enums.ButtonSize.Small,
				onActivated = JoinResult.onTogglePlayback,
				LayoutOrder = NextOrder()
			})
		})
	})
end)