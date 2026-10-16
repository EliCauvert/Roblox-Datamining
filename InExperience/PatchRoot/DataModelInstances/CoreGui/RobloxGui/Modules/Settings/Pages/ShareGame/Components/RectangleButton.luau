local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ThemeModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Theme)
local RectangleButton = RoactModule.PureComponent:extend("RectangleButton")
RectangleButton.defaultProps = { visible = true }

function RectangleButton.init(p1) --[[ Line: 12 ]]
	p1.state = { isHovering = false }
end

function RectangleButton.render(p1) --[[ Line: 18 ]]
	-- upvalues: RoactModule (copy), ThemeModule (copy)
	local Size = p1.props.size
	local Position = p1.props.position
	local AnchorPoint = p1.props.anchorPoint
	local LayoutOrder = p1.props.layoutOrder
	local ZIndex = p1.props.zIndex
	local OnClickFunction = p1.props.onClick
	local Visible = p1.props.visible
	local Prop = p1.props[RoactModule.Children] or {}
	Prop.Border = RoactModule.createElement("UIStroke", {
		Color = ThemeModule.color("DefaultButtonStroke"),
		Transparency = ThemeModule.transparency("DefaultButtonStroke"),
		Thickness = ThemeModule.DefaultStokeThickness
	})
	Prop.UICorner = RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.DefaultCornerRadius })
	
	return RoactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Image = "",
		Selectable = false,
		Size = Size,
		Position = Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder,
		ZIndex = ZIndex,
		Visible = Visible,
		[RoactModule.Event.InputBegan] = function() --[[ Line: 51 ]]
			-- upvalues: p1 (copy)
			p1:setState({ isHovering = true })
		end,
		[RoactModule.Event.InputEnded] = function() --[[ Line: 54 ]]
			-- upvalues: p1 (copy)
			p1:setState({ isHovering = false })
		end,
		[RoactModule.Event.Activated] = function() --[[ Line: 58 ]]
			-- upvalues: OnClickFunction (copy), p1 (copy)
			if OnClickFunction then
				p1:setState({ isHovering = false })
				OnClickFunction()
			end
		end
	}, {
		ButtonBackgroundUIBlox = RoactModule.createElement("ImageLabel", {
			BackgroundColor3 = ThemeModule.color(if p1.state.isHovering then "DefaultButtonHover" else "DefaultButton"),
			BackgroundTransparency = ThemeModule.transparency(if p1.state.isHovering then "DefaultButtonHover" else "DefaultButton"),
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = ZIndex
		}, Prop)
	})
end

return RectangleButton