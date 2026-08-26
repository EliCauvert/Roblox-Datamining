local parent = script:FindFirstAncestor("UserTile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userLibModule = require(parent.UserLib)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useCumulativeBackground = foundationModule.Hooks.useCumulativeBackground
local userPresence = foundationModule.Enums.UserPresence
local getStandardSizeAvatarHeadShotRbxthumb = userLibModule.Utils.getStandardSizeAvatarHeadShotRbxthumb

return function(p1)
	-- upvalues: useTokens (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), useCumulativeBackground (ref), reactModule (ref), view (ref), image (ref), userPresence (ref)
	local var1 = useTokens()
	local var2 = useCumulativeBackground(p1.altSurfaceBackground or var1.Color.Surface.Surface_0, if p1.hover then var1.Color.Shift.Shift_400 else var1.Color.Shift.Shift_300)
	
	return reactModule.createElement(view, {
		tag = "aspect-1-1 position-center-center anchor-center-center size-full-full",
		ZIndex = p1.ZIndex,
		LayoutOrder = p1.layoutOrder
	}, {
		AvatarImage1 = reactModule.createElement(image, {
			LayoutOrder = 1,
			ZIndex = 2,
			backgroundStyle = var2,
			tag = {
				["aspect-1-1 radius-circle row position-bottom-left anchor-bottom-left"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = getStandardSizeAvatarHeadShotRbxthumb(p1.primaryUserId)
		}),
		AvatarImage2 = reactModule.createElement(image, {
			LayoutOrder = 2,
			ZIndex = 1,
			backgroundStyle = var2,
			tag = {
				["aspect-1-1 radius-circle row position-top-right anchor-top-right"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = getStandardSizeAvatarHeadShotRbxthumb(p1.secondUserId)
		}),
		Icon = if p1.userPresenceType == userPresence.Active or p1.userPresenceType == userPresence.InExperience then reactModule.createElement(image, {
			tag = "bg-surface-100 radius-circle auto-xy position-absolute",
			Image = "component_assets/circle_16",
			Size = UDim2.new(0.125, 4, 0.125, 4),
			Position = UDim2.new(0.8536, var1.Stroke.Thicker, 0.8536, var1.Stroke.Thicker),
			AnchorPoint = Vector2.new(0.5, 0.5),
			stroke = {
				Thickness = var1.Stroke.Thicker,
				Color = var1.Color.Surface.Surface_100.Color3
			},
			imageStyle = var1.Color.System.Success
		}) else nil
	})
end