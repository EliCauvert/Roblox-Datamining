local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local BaseMenuModule = require(script.Parent.BaseMenu)
local DropdownMenuList = RoactModule.PureComponent:extend("DropdownMenuList")
DropdownMenuList.validateProps = TModule.strictInterface({
	buttonProps = require(script.Parent.validateButtonProps),
	zIndex = TModule.optional(TModule.integer),
	open = TModule.boolean,
	showDropShadow = TModule.boolean,
	fixedListHeight = TModule.optional(TModule.number),
	openPositionY = TModule.UDim,
	closeBackgroundVisible = TModule.optional(TModule.boolean),
	screenSize = TModule.Vector2,
	onDismiss = TModule.optional(TModule.callback),
	buttonSize = TModule.UDim2,
	menuListBackground = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo))),
	enableTokenOverride = TModule.optional(TModule.boolean),
	selectionOrder = TModule.optional(TModule.number),
	menuPositionFixed = TModule.optional(TModule.boolean)
})
DropdownMenuList.defaultProps = {
	zIndex = 2,
	closeBackgroundVisible = false,
	showDropShadow = false,
	fixedListHeight = nil,
	menuListBackground = nil,
	enableTokenOverride = false,
	menuPositionFixed = false
}

function DropdownMenuList.init(p1)
	p1:setState({ visible = false, absolutePosition = Vector2.new(0, 0) })
	
	function p1.setAbsolutePosition(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ absolutePosition = Frame.AbsolutePosition })
	end
	
	function p1.dismissMenu()
		-- upvalues: p1 (copy)
		if p1.state.visible then
			p1:setState({ visible = false })
			p1.props.onDismiss()
		end
	end
end

function DropdownMenuList.render(p1)
	-- upvalues: WithStyleModule (copy), GuiService (copy), RoactModule (copy), BaseMenuModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: GuiService (upval), p1 (copy), RoactModule (upval), BaseMenuModule (upval)
		local GuiInset, GuiInset2 = GuiService:GetGuiInset()
		local NewAbsolutePosition = p1.state.absolutePosition + GuiInset
		local Y = 0
		local v1 = 1
		local Y1 = p1.props.buttonSize.Y
		local X = p1.props.buttonSize.X
		
		if p1.props.screenSize.Y / 2 < p1.state.absolutePosition.Y then
			Y = 1
			v1 = -1
			Y1 = UDim.new(0, 0)
		end
		local NewY: UDim = if v1 == 1 then Y1 + p1.props.openPositionY else Y1 - p1.props.openPositionY
		local _UDim2 = UDim2.new(0, 0, NewY.Scale, NewY.Offset)
		
		if p1.props.screenSize.X < 640 and not p1.props.menuPositionFixed then
			Y = 1
			_UDim2 = UDim2.new(-p1.props.buttonSize.X.Scale / 2, -NewAbsolutePosition.X + p1.props.screenSize.X / 2 - p1.props.buttonSize.X.Offset / 2, 0, p1.props.screenSize.Y - NewAbsolutePosition.Y - GuiInset2.Y - 24)
		end
		return RoactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p1.state.visible,
			ZIndex = p1.props.zIndex,
			[RoactModule.Change.AbsolutePosition] = p1.setAbsolutePosition
		}, {
			Background = RoactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = if p1.props.closeBackgroundVisible then p2.Theme.Overlay.Transparency else 1,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-NewAbsolutePosition.X, -NewAbsolutePosition.Y),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				[RoactModule.Event.Activated] = p1.dismissMenu
			}),
			PositionFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = _UDim2
			}, {
				BaseMenu = RoactModule.createElement(BaseMenuModule, {
					buttonProps = p1.props.buttonProps,
					showDropShadow = p1.props.showDropShadow,
					fixedListHeight = p1.props.fixedListHeight,
					width = X,
					position = UDim2.fromScale(0, 0),
					anchorPoint = Vector2.new(0, Y),
					background = p1.props.menuListBackground,
					enableTokenOverride = p1.props.enableTokenOverride,
					selectionOrder = p1.props.selectionOrder
				})
			})
		})
	end)
end

function DropdownMenuList.didMount(p1)
	if p1.props.open then
		p1:setState({ visible = true })
	end
end

function DropdownMenuList.didUpdate(p1, p2, _)
	if p1.props.open ~= p2.open then
		if p1.props.open then
			p1:setState({ visible = true })
			
			return
		end
		p1:setState({ visible = false })
	end
end

return DropdownMenuList