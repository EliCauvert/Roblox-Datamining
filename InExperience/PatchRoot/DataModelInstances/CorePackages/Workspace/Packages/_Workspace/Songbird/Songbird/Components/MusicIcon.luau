local Songbird = script:FindFirstAncestor("Songbird")
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local CreateNextOrderFunction = require(Songbird.Parent.ReactUtils).createNextOrder
local GetFFlagSongbirdMusicIconThumbnailModule = require(Songbird.Flags.getFFlagSongbirdMusicIconThumbnail)

return function(p1) --[[ Line: 17 | Named "MusicIcon" ]]
	-- upvalues: CreateNextOrderFunction (copy), FoundationModule (copy), GetFFlagSongbirdMusicIconThumbnailModule (copy), ReactModule (copy)
	local NextOrder = CreateNextOrderFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Size900 = UseTokensResult.Size.Size_900
	local ThumbnailUrl = GetFFlagSongbirdMusicIconThumbnailModule() and p1.thumbnailUrl
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.fromOffset(Size900, Size900),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ClipsDescendants = if ThumbnailUrl then true else nil,
		backgroundStyle = if ThumbnailUrl then nil else { Transparency = 0, Color3 = Color3.fromRGB(43, 45, 50) },
		cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
		LayoutOrder = if GetFFlagSongbirdMusicIconThumbnailModule() then p1.layoutOrder else nil,
		ZIndex = NextOrder()
	}, {
		Thumbnail = if ThumbnailUrl then ReactModule.createElement(FoundationModule.Image, {
			tag = "size-full",
			Image = p1.thumbnailUrl,
			ZIndex = NextOrder()
		}) else nil,
		Icon = if ThumbnailUrl then nil else ReactModule.createElement(FoundationModule.Icon, {
			name = "icons/common/music",
			size = FoundationModule.Enums.IconSize.Medium,
			Position = UDim2.new(0.5, -1, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = NextOrder()
		})
	})
end