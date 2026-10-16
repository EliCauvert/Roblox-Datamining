local Foundation = script:FindFirstAncestor("Foundation")
local ThumbnailTypeModule = require(Foundation.Enums.ThumbnailType)
local ThumbnailSizeModule = require(Foundation.Enums.ThumbnailSize)
local GetAssetIdAsNumericModule = require(Foundation.Utility.getAssetIdAsNumeric)
local config = {
	[ThumbnailTypeModule.Asset] = {
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[ThumbnailTypeModule.Avatar] = {
		[ThumbnailSizeModule.Small] = Vector2.new(48, 48),
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420),
		[ThumbnailSizeModule.XLarge] = Vector2.new(720, 720)
	},
	[ThumbnailTypeModule.AvatarBust] = {
		[ThumbnailSizeModule.Small] = Vector2.new(50, 50),
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[ThumbnailTypeModule.AvatarHeadShot] = {
		[ThumbnailSizeModule.Small] = Vector2.new(48, 48),
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[ThumbnailTypeModule.BadgeIcon] = { [ThumbnailSizeModule.Medium] = Vector2.new(150, 150) },
	[ThumbnailTypeModule.BundleThumbnail] = {
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[ThumbnailTypeModule.FontFamily] = { [ThumbnailSizeModule.Medium] = Vector2.new(1200, 80) },
	[ThumbnailTypeModule.GameIcon] = {
		[ThumbnailSizeModule.Small] = Vector2.new(50, 50),
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150)
	},
	[ThumbnailTypeModule.GamePass] = { [ThumbnailSizeModule.Medium] = Vector2.new(150, 150) },
	[ThumbnailTypeModule.GameThumbnail] = {
		[ThumbnailSizeModule.Small] = Vector2.new(256, 144),
		[ThumbnailSizeModule.Medium] = Vector2.new(384, 216),
		[ThumbnailSizeModule.Large] = Vector2.new(480, 270),
		[ThumbnailSizeModule.XLarge] = Vector2.new(768, 432)
	},
	[ThumbnailTypeModule.GroupIcon] = {
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	},
	[ThumbnailTypeModule.Outfit] = {
		[ThumbnailSizeModule.Medium] = Vector2.new(150, 150),
		[ThumbnailSizeModule.Large] = Vector2.new(420, 420)
	}
}

return function(AvatarHeadShot, p1, p2, p3): string --[[ Line: 197 ]]
	-- upvalues: config (copy), ThumbnailSizeModule (copy), GetAssetIdAsNumericModule (copy), ThumbnailTypeModule (copy)
	local Entry = config[AvatarHeadShot][p2 or ThumbnailSizeModule.Medium]
	local AssetIdAsNumericModule = GetAssetIdAsNumericModule(p1)
	
	if not Entry then
		warn(`Unsupported size {p2} for media type: {AvatarHeadShot}, defaulting to {ThumbnailSizeModule.Medium}`)
		Entry = config[AvatarHeadShot][ThumbnailSizeModule.Medium]
	end
	local RbxthumbName: string = `rbxthumb://type={AvatarHeadShot}&id={AssetIdAsNumericModule}&w={Entry.X}&h={Entry.Y}`
	
	if AvatarHeadShot == ThumbnailTypeModule.AvatarHeadShot and p3 and p3.includeProfileFrame then
		RbxthumbName ..= "&includeprofileframe=true"
	end
	return RbxthumbName
end