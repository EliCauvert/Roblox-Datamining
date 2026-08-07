-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

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

return function(p0, p1, p2, p3) --[[ line: 197 ]]
	-- upvalues: t (ref), thumbnailSizeModule (ref), getAssetIdAsNumericModule (ref), thumbnailTypeModule (ref)
	local var5 = t[p0][p2 or thumbnailSizeModule.Medium]
	local var6 = getAssetIdAsNumericModule(p1)
	
	if not var5 then
		warn(`Unsupported size {p2} for media type: {p0}, defaulting to {thumbnailSizeModule.Medium}`)
		var5 = t[p0][thumbnailSizeModule.Medium]
	end
	local var7 = `rbxthumb://type={p0}&id={var6}&w={var5.X}&h={var5.Y}`
	
	if p0 == thumbnailTypeModule.AvatarHeadShot and p3 and p3.includeProfileFrame then
		var7 ..= "&includeprofileframe=true"
	end
	return var7
end