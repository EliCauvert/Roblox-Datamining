local songbird = script:FindFirstAncestor("Songbird")
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)

return function(p0) --[[ line: 17 | named "MusicIcon" ]]
	-- upvalues: createNextOrder (ref), foundationModule (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), reactModule (ref)
	local var4 = createNextOrder()
	local var5 = foundationModule.Hooks.useTokens()
	local size900 = var5.Size.Size_900
	local thumbnailUrl = getFFlagSongbirdMusicIconThumbnailModule() and p0.thumbnailUrl
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromOffset(size900, size900),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ClipsDescendants = if thumbnailUrl then true else nil,
		backgroundStyle = if not thumbnailUrl then { Transparency = 0, Color3 = Color3.fromRGB(43, 45, 50) } else nil,
		cornerRadius = UDim.new(0, var5.Radius.Medium),
		LayoutOrder = if getFFlagSongbirdMusicIconThumbnailModule() then p0.layoutOrder else nil,
		ZIndex = var4()
	}, {
		Thumbnail = if thumbnailUrl then reactModule.createElement(foundationModule.Image, {
			tag = "size-full",
			Image = p0.thumbnailUrl,
			ZIndex = var4()
		}) else nil,
		Icon = if not thumbnailUrl then reactModule.createElement(foundationModule.Icon, {
			name = "icons/common/music",
			size = foundationModule.Enums.IconSize.Medium,
			Position = UDim2.new(0.5, -1, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = var4()
		}) else nil
	})
end