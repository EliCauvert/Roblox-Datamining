local songbird = script:FindFirstAncestor("Songbird")
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder
local getFFlagSongbirdMusicIconThumbnailModule = require(songbird.Flags.getFFlagSongbirdMusicIconThumbnail)

return function(p1)
	-- upvalues: createNextOrder (ref), foundationModule (ref), getFFlagSongbirdMusicIconThumbnailModule (ref), reactModule (ref)
	local var1 = createNextOrder()
	local var2 = foundationModule.Hooks.useTokens()
	local size900 = var2.Size.Size_900
	local thumbnailUrl = getFFlagSongbirdMusicIconThumbnailModule() and p1.thumbnailUrl
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromOffset(size900, size900),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ClipsDescendants = if thumbnailUrl then true else nil,
		backgroundStyle = if not thumbnailUrl then { Transparency = 0, Color3 = Color3.fromRGB(43, 45, 50) } else nil,
		cornerRadius = UDim.new(0, var2.Radius.Medium),
		LayoutOrder = if getFFlagSongbirdMusicIconThumbnailModule() then p1.layoutOrder else nil,
		ZIndex = var1()
	}, {
		Thumbnail = if thumbnailUrl then reactModule.createElement(foundationModule.Image, {
			tag = "size-full",
			Image = p1.thumbnailUrl,
			ZIndex = var1()
		}) else nil,
		Icon = if not thumbnailUrl then reactModule.createElement(foundationModule.Icon, {
			name = "icons/common/music",
			size = foundationModule.Enums.IconSize.Medium,
			Position = UDim2.new(0.5, -1, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = var1()
		}) else nil
	})
end