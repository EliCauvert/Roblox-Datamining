local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local FitChildrenModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.FitChildren)
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway
local MorePageScrollingFrame = RoactModule.PureComponent:extend("MorePageScrollingFrame")
MorePageScrollingFrame.defaultProps = { maxWidth = 1e999 }

function MorePageScrollingFrame.render(p1)
	-- upvalues: FFlagAppIaScrollAway (copy), RoactModule (copy), FitChildrenModule (copy), AppNavBarModule (copy)
	local TopBarHeight = if FFlagAppIaScrollAway then p1.props.topBarHeight else nil
	
	return RoactModule.createElement(FitChildrenModule.FitScrollingFrame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 0,
		Selectable = false,
		Position = p1.props.Position,
		Size = p1.props.Size,
		CanvasSize = UDim2.new(1, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		fitFields = { CanvasSize = FitChildrenModule.FitAxis.Height }
	}, {
		RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then UDim2.new(0.5, 0, 0, TopBarHeight) else UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(p1.props.maxWidth, 1e999) }),
			RoactModule.createFragment(p1.props[RoactModule.Children])
		})
	})
end

if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
	MorePageScrollingFrame = RoactRoduxModule.connect(function(p1, _)
		return { topBarHeight = p1.TopBar.topBarHeight }
	end)(MorePageScrollingFrame)
end
return MorePageScrollingFrame