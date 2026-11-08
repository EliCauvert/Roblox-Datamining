local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize

return function(p1)
	-- upvalues: ReactModule (copy), Image (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy)
	local IsBanner = p1.slot == "Banner"
	
	return ReactModule.createElement(Image, {
		Image = if IsBanner then GetRbxThumbFunction(ThumbnailType.Avatar, p1.userId, ThumbnailSize.Large) else GetRbxThumbFunction(ThumbnailType.AvatarHeadShot, p1.userId, ThumbnailSize.Medium),
		ScaleType = Enum.ScaleType.Fit,
		tag = {
			["size-full"] = true,
			["radius-small bg-surface-200"] = not IsBanner
		}
	}, {
		BottomFade = if IsBanner then ReactModule.createElement("UIGradient", {
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(0.7, 0),
				NumberSequenceKeypoint.new(1, 1)
			})
		}) else nil
	})
end