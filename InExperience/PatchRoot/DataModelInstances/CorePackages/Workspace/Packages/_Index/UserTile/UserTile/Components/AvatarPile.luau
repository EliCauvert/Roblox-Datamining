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

return function(p0)
	-- upvalues: useTokens (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), useCumulativeBackground (ref), reactModule (ref), view (ref), image (ref), userPresence (ref)
	local var3 = useTokens()
	local var4 = useCumulativeBackground(p0.altSurfaceBackground or var3.Color.Surface.Surface_0, if p0.hover then var3.Color.Shift.Shift_400 else var3.Color.Shift.Shift_300)
	
	return reactModule.createElement(view, {
		tag = "aspect-1-1 position-center-center anchor-center-center size-full-full",
		ZIndex = p0.ZIndex,
		LayoutOrder = p0.layoutOrder
	}, {
		AvatarImage1 = reactModule.createElement(image, {
			LayoutOrder = 1,
			ZIndex = 2,
			backgroundStyle = var4,
			tag = {
				["aspect-1-1 radius-circle row position-bottom-left anchor-bottom-left"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = getStandardSizeAvatarHeadShotRbxthumb(p0.primaryUserId)
		}),
		AvatarImage2 = reactModule.createElement(image, {
			LayoutOrder = 2,
			ZIndex = 1,
			backgroundStyle = var4,
			tag = {
				["aspect-1-1 radius-circle row position-top-right anchor-top-right"] = true
			},
			Size = UDim2.fromScale(0.7, 0.7),
			Image = getStandardSizeAvatarHeadShotRbxthumb(p0.secondUserId)
		}),
		Icon = if p0.userPresenceType == userPresence.Active or p0.userPresenceType == userPresence.InExperience then reactModule.createElement(image, {
			tag = "bg-surface-100 radius-circle auto-xy position-absolute",
			Image = "component_assets/circle_16",
			Size = UDim2.new(0.125, 4, 0.125, 4),
			Position = UDim2.new(0.8536, var3.Stroke.Thicker, 0.8536, var3.Stroke.Thicker),
			AnchorPoint = Vector2.new(0.5, 0.5),
			stroke = {
				Thickness = var3.Stroke.Thicker,
				Color = var3.Color.Surface.Surface_100.Color3
			},
			imageStyle = var3.Color.System.Success
		}) else nil
	})
end