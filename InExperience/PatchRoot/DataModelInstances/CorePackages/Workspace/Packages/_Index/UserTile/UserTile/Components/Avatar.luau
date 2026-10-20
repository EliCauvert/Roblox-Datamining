local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UserPresence = FoundationModule.Enums.UserPresence
local Image = FoundationModule.Image
local View = FoundationModule.View
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local FFlagUserTileShowShimmerWhenLoadingModule = require(UserTile.Flags.FFlagUserTileShowShimmerWhenLoading)
local FFlagAddBackplateSupportToUserTile = require(Parent.SharedFlags).FFlagAddBackplateSupportToUserTile
local FFlagUserTileUseProfileFrameThumbnailModule = require(UserTile.Flags.FFlagUserTileUseProfileFrameThumbnail)
local FFlagUserTileIncludeProfileFramePropModule = require(UserTile.Flags.FFlagUserTileIncludeProfileFrameProp)

return function(p1)
	-- upvalues: FFlagUserTileUseProfileFrameThumbnailModule (copy), FFlagUserTileIncludeProfileFramePropModule (copy), FFlagUserTileShowShimmerWhenLoadingModule (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), FFlagAddBackplateSupportToUserTile (copy), Image (copy), UserPresence (copy)
	local IncludeProfileFrame = FFlagUserTileUseProfileFrameThumbnailModule
	
	if FFlagUserTileIncludeProfileFramePropModule and p1.includeProfileFrame ~= nil then
		IncludeProfileFrame = IncludeProfileFrame and p1.includeProfileFrame
	end
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "aspect-1-1 position-center-center anchor-center-center size-full-full",
		ZIndex = p1.ZIndex,
		LayoutOrder = p1.layoutOrder
	}, {
		Backplate = if FFlagAddBackplateSupportToUserTile and p1.backplateStyle then ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center radius-circle",
			ZIndex = 0,
			backgroundStyle = p1.backplateStyle,
			Size = UDim2.new(1, 14, 1, 14)
		}) else nil,
		AvatarThumbnail = ReactModule.createElement(View, {
			tag = "size-full position-center-center anchor-center-center"
		}, {
			AvatarImage = ReactModule.createElement(Image, {
				LayoutOrder = 1,
				tag = "size-full aspect-1-1 radius-circle align-x-center align-y-center row position-center-center anchor-center-center",
				ZIndex = 3,
				backgroundStyle = if p1.hover then UseTokensResult.Color.Shift.Shift_400 else UseTokensResult.Color.Shift.Shift_300,
				Image = if FFlagUserTileShowShimmerWhenLoadingModule and p1.avatarThumbnailUrl then p1.avatarThumbnailUrl else GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.userId, IncludeProfileFrame)
			})
		}),
		Icon = if p1.userPresenceType == UserPresence.Active or p1.userPresenceType == UserPresence.InExperience then ReactModule.createElement(Image, {
			tag = "bg-surface-100 radius-circle auto-xy position-absolute",
			Image = "component_assets/circle_16",
			Size = UDim2.new(0.125, 4, 0.125, 4),
			Position = UDim2.new(0.8536, UseTokensResult.Stroke.Thicker, 0.8536, UseTokensResult.Stroke.Thicker),
			AnchorPoint = Vector2.new(0.5, 0.5),
			stroke = {
				Thickness = UseTokensResult.Stroke.Thicker,
				Color = UseTokensResult.Color.Surface.Surface_100.Color3
			},
			imageStyle = UseTokensResult.Color.System.Success
		}) else nil
	})
end