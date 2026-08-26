local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local themeModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Theme)
local rectangleButton = roactModule.PureComponent:extend("RectangleButton")
rectangleButton.defaultProps = { visible = true }

function rectangleButton.init(p1)
	p1.state = { isHovering = false }
end

function rectangleButton.render(p1)
	-- upvalues: roactModule (ref), themeModule (ref)
	local size = p1.props.size
	local position = p1.props.position
	local anchorPoint = p1.props.anchorPoint
	local layoutOrder = p1.props.layoutOrder
	local zIndex = p1.props.zIndex
	local onClick = p1.props.onClick
	local visible = p1.props.visible
	local children = p1.props[roactModule.Children] or {}
	children.Border = roactModule.createElement("UIStroke", {
		Color = themeModule.color("DefaultButtonStroke"),
		Transparency = themeModule.transparency("DefaultButtonStroke"),
		Thickness = themeModule.DefaultStokeThickness
	})
	children.UICorner = roactModule.createElement("UICorner", { CornerRadius = themeModule.DefaultCornerRadius })
	
	return roactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		Image = "",
		Selectable = false,
		Size = size,
		Position = position,
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		ZIndex = zIndex,
		Visible = visible,
		[roactModule.Event.InputBegan] = function()
			-- upvalues: p1 (ref)
			p1:setState({ isHovering = true })
		end,
		[roactModule.Event.InputEnded] = function()
			-- upvalues: p1 (ref)
			p1:setState({ isHovering = false })
		end,
		[roactModule.Event.Activated] = function()
			-- upvalues: onClick (ref), p1 (ref)
			if onClick then
				p1:setState({ isHovering = false })
				onClick()
			end
		end
	}, {
		ButtonBackgroundUIBlox = roactModule.createElement("ImageLabel", {
			BackgroundColor3 = themeModule.color(if p1.state.isHovering then "DefaultButtonHover" else "DefaultButton"),
			BackgroundTransparency = themeModule.transparency(if p1.state.isHovering then "DefaultButtonHover" else "DefaultButton"),
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ZIndex = zIndex
		}, children)
	})
end

return rectangleButton