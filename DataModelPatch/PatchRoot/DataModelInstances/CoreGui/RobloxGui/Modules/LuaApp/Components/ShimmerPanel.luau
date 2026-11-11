local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local ThemeContextDEPRECATEDModule = require(Modules.LuaApp.ThemeContext_DEPRECATED)
local ShimmerPanel = RoactModule.PureComponent:extend("ShimmerPanel")

function ShimmerPanel.render(p1)
	-- upvalues: RoactModule (copy), ThemeContextDEPRECATEDModule (copy), ShimmerAnimationModule (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	
	return RoactModule.createElement(ThemeContextDEPRECATEDModule.Consumer, {
		render = function(p2)
			-- upvalues: RoactModule (upval), Size (copy), Position (copy), LayoutOrder (copy), ShimmerAnimationModule (upval)
			return RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = Size,
				Position = Position,
				BackgroundColor3 = p2.ShimmerPanel.Color,
				BackgroundTransparency = p2.ShimmerPanel.Transparency,
				LayoutOrder = LayoutOrder
			}, {
				RoactModule.createElement(ShimmerAnimationModule, {
					shimmerScale = 4,
					shimmerSpeed = 2.5,
					Size = UDim2.new(1, 0, 1, 0)
				})
			})
		end
	})
end

return ShimmerPanel