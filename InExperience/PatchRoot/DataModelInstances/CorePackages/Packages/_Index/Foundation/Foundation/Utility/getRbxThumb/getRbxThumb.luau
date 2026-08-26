local foundation = script:FindFirstAncestor("Foundation")
local thumbnailTypeModule = require(foundation.Enums.ThumbnailType)
local thumbnailSizeModule = require(foundation.Enums.ThumbnailSize)
local getAssetIdAsNumericModule = require(foundation.Utility.getAssetIdAsNumeric)
local t = {
	[thumbnailTypeModule.Asset] = {
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[thumbnailTypeModule.Avatar] = {
		[thumbnailSizeModule.Small] = Vector2.new(48, 48),
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420),
		[thumbnailSizeModule.XLarge] = Vector2.new(720, 720)
	},
	[thumbnailTypeModule.AvatarBust] = {
		[thumbnailSizeModule.Small] = Vector2.new(50, 50),
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[thumbnailTypeModule.AvatarHeadShot] = {
		[thumbnailSizeModule.Small] = Vector2.new(48, 48),
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[thumbnailTypeModule.BadgeIcon] = { [thumbnailSizeModule.Medium] = Vector2.new(150, 150) },
	[thumbnailTypeModule.BundleThumbnail] = {
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[thumbnailTypeModule.FontFamily] = { [thumbnailSizeModule.Medium] = Vector2.new(1200, 80) },
	[thumbnailTypeModule.GameIcon] = {
		[thumbnailSizeModule.Small] = Vector2.new(50, 50),
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150)
	},
	[thumbnailTypeModule.GamePass] = { [thumbnailSizeModule.Medium] = Vector2.new(150, 150) },
	[thumbnailTypeModule.GameThumbnail] = {
		[thumbnailSizeModule.Small] = Vector2.new(256, 144),
		[thumbnailSizeModule.Medium] = Vector2.new(384, 216),
		[thumbnailSizeModule.Large] = Vector2.new(480, 270),
		[thumbnailSizeModule.XLarge] = Vector2.new(768, 432)
	},
	[thumbnailTypeModule.GroupIcon] = {
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[thumbnailTypeModule.Outfit] = {
		[thumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[thumbnailSizeModule.Large] = Vector2.new(420, 420)
	}
}

return function(p1, p2, p3, p4)
	-- upvalues: t (ref), thumbnailSizeModule (ref), getAssetIdAsNumericModule (ref), thumbnailTypeModule (ref)
	local var1 = t[p1][p3 or thumbnailSizeModule.Medium]
	local var2 = getAssetIdAsNumericModule(p2)
	
	if not var1 then
		warn(`Unsupported size {p3} for media type: {p1}, defaulting to {thumbnailSizeModule.Medium}`)
		var1 = t[p1][thumbnailSizeModule.Medium]
	end
	local var3 = `rbxthumb://type={p1}&id={var2}&w={var1.X}&h={var1.Y}`
	
	if p1 == thumbnailTypeModule.AvatarHeadShot and p4 and p4.includeProfileFrame then
		var3 ..= "&includeprofileframe=true"
	end
	return var3
end