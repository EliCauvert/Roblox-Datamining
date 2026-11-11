local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local DismissMenuBackground = RoactModule.PureComponent:extend("DismissMenuBackground")
DismissMenuBackground.validateProps = TModule.strictInterface({
	Visible = TModule.union(TModule.boolean, TModule.table),
	ZIndex = TModule.number,
	onDismiss = TModule.callback,
	screenSize = TModule.Vector2
})
DismissMenuBackground.defaultProps = { ZIndex = 1 }

function DismissMenuBackground.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		Visible = p1.props.Visible,
		ZIndex = p1.props.ZIndex,
		Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
		Position = UDim2.fromOffset(0, -13),
		[RoactModule.Event.Activated] = p1.props.onDismiss
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, nil)(DismissMenuBackground))