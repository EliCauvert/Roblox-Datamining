local Parent = script:FindFirstAncestor("UserTile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCumulativeBackgroundFunction = FoundationModule.Hooks.useCumulativeBackground
local UserPresence = FoundationModule.Enums.UserPresence
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p1) --[[ Line: 24 | Named "AvatarPile" ]]
	-- upvalues: UseTokensFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UseCumulativeBackgroundFunction (copy), ReactModule (copy), View (copy), Image (copy), UserPresence (copy)
	local UseTokensResult = UseTokensFunction()
	local StandardSizeAvatarHeadShotRbxthumb = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.primaryUserId)
	local StandardSizeAvatarHeadShotRbxthumb1 = GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.secondUserId)
	local UseCumulativeBackgroundResult = UseCumulativeBackgroundFunction(p1.altSurfaceBackground or UseTokensResult.Color.Surface.Surface_0, if p1.hover then UseTokensResult.Color.Shift.Shift_400 else UseTokensResult.Color.Shift.Shift_300)
	
	return ReactModule.createElement(View, {
		tag = "aspect-1-1 position-center-center anchor-center-center size-full-full",
		ZIndex = p1.ZIndex,
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarImage1 = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			ZIndex = 2,
			backgroundStyle = UseCumulativeBackgroundResult,
			tag = {
				["aspect-1-1 radius-circle row position-bottom-left anchor-bottom-left"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = StandardSizeAvatarHeadShotRbxthumb
		}),
		AvatarImage2 = ReactModule.createElement(Image, {
			LayoutOrder = 2,
			ZIndex = 1,
			backgroundStyle = UseCumulativeBackgroundResult,
			tag = {
				["aspect-1-1 radius-circle row position-top-right anchor-top-right"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = StandardSizeAvatarHeadShotRbxthumb1
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