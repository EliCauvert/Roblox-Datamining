local AppMusicPlayer = script:FindFirstAncestor("AppMusicPlayer")
local CryoModule = require(AppMusicPlayer.Parent.Cryo)
local FoundationModule = require(AppMusicPlayer.Parent.Foundation)
local ReactModule = require(AppMusicPlayer.Parent.React)
local SongAttributionVariantModule = require(AppMusicPlayer.Enums.SongAttributionVariant)
local CreateNextOrderFunction = require(AppMusicPlayer.Parent.ReactUtils).createNextOrder
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	isLoading = false,
	variant = SongAttributionVariantModule.Expanded
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), CreateNextOrderFunction (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), SongAttributionVariantModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local NextOrder = CreateNextOrderFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = "song-attribution-root",
		tag = {
			["auto-xy row shrink flex-between align-y-center"] = true,
			["gap-medium"] = JoinResult.variant == SongAttributionVariantModule.Expanded,
			["gap-small"] = JoinResult.variant == SongAttributionVariantModule.Compact
		},
		LayoutOrder = JoinResult.LayoutOrder
	}, {
		AlbumArt = if JoinResult.isLoading then ReactModule.createElement(FoundationModule.Skeleton, {
			testId = "song-attribution-album-art-skeleton",
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_1600, UseTokensResult.Size.Size_1600)
		}) else ReactModule.createElement(FoundationModule.Image, {
			testId = "song-attribution-album-art",
			tag = {
				["bg-surface-100 radius-medium"] = true,
				["size-1600-1600"] = JoinResult.variant == SongAttributionVariantModule.Expanded,
				["size-800-800"] = JoinResult.variant == SongAttributionVariantModule.Compact
			},
			Image = JoinResult.albumArt,
			LayoutOrder = NextOrder(),
			onActivated = JoinResult.onActivated
		}),
		Attribution = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy shrink col gap-xsmall",
			LayoutOrder = NextOrder()
		}, {
			Title = if JoinResult.isLoading then ReactModule.createElement(FoundationModule.Skeleton, {
				testId = "song-attribution-song-title-skeleton",
				Size = UDim2.new(1, 0, 0, UseTokensResult.FontSize.FontSize_300)
			}) else ReactModule.createElement(FoundationModule.Text, {
				tag = {
					["auto-xy text-truncate-end content-emphasis"] = true,
					["text-title-medium"] = JoinResult.variant == SongAttributionVariantModule.Expanded,
					["text-title-small"] = JoinResult.variant == SongAttributionVariantModule.Compact
				},
				Text = JoinResult.title,
				LayoutOrder = NextOrder(),
				onActivated = JoinResult.onActivated
			}),
			Artist = if JoinResult.isLoading then ReactModule.createElement(FoundationModule.Skeleton, {
				testId = "song-attribution-artist-name-skeleton",
				Size = UDim2.new(0.5, 0, 0, UseTokensResult.FontSize.FontSize_300)
			}) else ReactModule.createElement(FoundationModule.Text, {
				tag = {
					["auto-xy text-truncate-end content-muted"] = true,
					["text-body-medium"] = JoinResult.variant == SongAttributionVariantModule.Expanded,
					["text-body-small"] = JoinResult.variant == SongAttributionVariantModule.Compact
				},
				Text = JoinResult.artist,
				LayoutOrder = NextOrder(),
				onActivated = JoinResult.onActivated
			})
		})
	})
end