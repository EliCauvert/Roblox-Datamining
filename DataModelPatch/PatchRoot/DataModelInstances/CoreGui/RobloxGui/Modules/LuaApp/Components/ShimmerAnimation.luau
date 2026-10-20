local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local TextureScrollerModule = require(Modules.LuaApp.Components.TextureScroller)
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local ShimmerAnimation = RoactModule.PureComponent:extend("ShimmerAnimation")
ShimmerAnimation.defaultProps = { shimmerSpeed = 2, shimmerScale = 2 }

function ShimmerAnimation.render(p1)
	-- upvalues: RoactModule (copy), TextureScrollerModule (copy)
	local AppTheme = p1.props.appTheme
	local ShimmerScale: number = p1.props.shimmerScale
	local ShimmerSpeed = p1.props.shimmerSpeed
	
	return RoactModule.createElement(TextureScrollerModule, {
		Size = p1.props.Size,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		LayoutOrder = p1.props.LayoutOrder,
		Image = AppTheme and AppTheme.ShimmerAnimation.Image or "rbxasset://textures/ui/LuaApp/graphic/shimmer.png",
		imageSize = UDim2.new((AppTheme and AppTheme.ShimmerAnimation.AspectRatio or 0.876) * ShimmerScale, 0, ShimmerScale, 0),
		ImageTransparency = AppTheme and AppTheme.ShimmerAnimation.Transparency or 0.65,
		imageAnchorPoint = Vector2.new(0, 0.5),
		imagePositionStart = UDim2.new(-ShimmerScale, 0, 0.5, 0),
		imagePositionEnd = UDim2.new(1, 0, 0.5, 0),
		imageScrollCycleTime = if ShimmerSpeed == 0 then 0 else (ShimmerScale + 1) / ShimmerSpeed
	})
end

return (WithThemeDEPRECATEDModule(ShimmerAnimation))