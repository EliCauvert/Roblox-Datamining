local userTile = script:FindFirstAncestor("UserTile")
local parent = userTile.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userLibModule = require(parent.UserLib)
local useTokens = foundationModule.Hooks.useTokens
local userPresence = foundationModule.Enums.UserPresence
local image = foundationModule.Image
local view = foundationModule.View
local getStandardSizeAvatarHeadShotRbxthumb = userLibModule.Utils.getStandardSizeAvatarHeadShotRbxthumb
local fFlagUserTileShowShimmerWhenLoadingModule = require(userTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local fFlagAddBackplateSupportToUserTile = require(parent.SharedFlags).FFlagAddBackplateSupportToUserTile
local fFlagUserTileUseProfileFrameThumbnailModule = require(userTile.Flags.FFlagUserTileUseProfileFrameThumbnail)
local fFlagUserTileIncludeProfileFramePropModule = require(userTile.Flags.FFlagUserTileIncludeProfileFrameProp)

return function(p0)
	-- upvalues: fFlagUserTileUseProfileFrameThumbnailModule (ref), fFlagUserTileIncludeProfileFramePropModule (ref), fFlagUserTileShowShimmerWhenLoadingModule (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), useTokens (ref), reactModule (ref), view (ref), fFlagAddBackplateSupportToUserTile (ref), image (ref), userPresence (ref)
	local var7 = fFlagUserTileUseProfileFrameThumbnailModule
	
	if fFlagUserTileIncludeProfileFramePropModule and p0.includeProfileFrame ~= nil then
		var7 = var7 and p0.includeProfileFrame
	end
	local var8 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "aspect-1-1 position-center-center anchor-center-center size-full-full",
		ZIndex = p0.ZIndex,
		LayoutOrder = p0.layoutOrder
	}, {
		Backplate = if fFlagAddBackplateSupportToUserTile and p0.backplateStyle then reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center radius-circle",
			ZIndex = 0,
			backgroundStyle = p0.backplateStyle,
			Size = UDim2.new(1, 14, 1, 14)
		}) else nil,
		AvatarThumbnail = reactModule.createElement(view, {
			tag = "size-full position-center-center anchor-center-center"
		}, {
			AvatarImage = reactModule.createElement(image, {
				LayoutOrder = 1,
				tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center row position-center-center anchor-center-center",
				ZIndex = 3,
				backgroundStyle = if p0.hover then var8.Color.Shift.Shift_400 else var8.Color.Shift.Shift_300,
				Image = if fFlagUserTileShowShimmerWhenLoadingModule and p0.avatarThumbnailUrl then p0.avatarThumbnailUrl else getStandardSizeAvatarHeadShotRbxthumb(p0.userId, var7)
			})
		}),
		Icon = if p0.userPresenceType == userPresence.Active or p0.userPresenceType == userPresence.InExperience then reactModule.createElement(image, {
			tag = "bg-surface-100 radius-circle auto-xy position-absolute",
			Image = "component_assets/circle_16",
			Size = UDim2.new(0.125, 4, 0.125, 4),
			Position = UDim2.new(0.8536, var8.Stroke.Thicker, 0.8536, var8.Stroke.Thicker),
			AnchorPoint = Vector2.new(0.5, 0.5),
			stroke = {
				Thickness = var8.Stroke.Thicker,
				Color = var8.Color.Surface.Surface_100.Color3
			},
			imageStyle = var8.Color.System.Success
		}) else nil
	})
end