local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local baseMenuModule = require(script.Parent.BaseMenu)
local dropdownMenuList = roactModule.PureComponent:extend("DropdownMenuList")
dropdownMenuList.validateProps = tModule.strictInterface({
	buttonProps = require(script.Parent.validateButtonProps),
	zIndex = tModule.optional(tModule.integer),
	open = tModule.boolean,
	showDropShadow = tModule.boolean,
	fixedListHeight = tModule.optional(tModule.number),
	openPositionY = tModule.UDim,
	closeBackgroundVisible = tModule.optional(tModule.boolean),
	screenSize = tModule.Vector2,
	onDismiss = tModule.optional(tModule.callback),
	buttonSize = tModule.UDim2,
	menuListBackground = tModule.optional(require(parent.Core.Style.Validator.validateColorInfo)),
	enableTokenOverride = tModule.optional(tModule.boolean),
	selectionOrder = tModule.optional(tModule.number),
	menuPositionFixed = tModule.optional(tModule.boolean)
})
dropdownMenuList.defaultProps = {
	zIndex = 2,
	closeBackgroundVisible = false,
	showDropShadow = false,
	fixedListHeight = nil,
	menuListBackground = nil,
	enableTokenOverride = false,
	menuPositionFixed = false
}

function dropdownMenuList.init(p1)
	p1:setState({ visible = false, absolutePosition = Vector2.new(0, 0) })
	
	function p0.setAbsolutePosition(p2)
		-- upvalues: p1 (ref)
		p1:setState({ absolutePosition = p2.AbsolutePosition })
	end
	
	function p0.dismissMenu()
		-- upvalues: p1 (ref)
		if p1.state.visible then
			p1:setState({ visible = false })
			p1.props.onDismiss()
		end
	end
end

function dropdownMenuList.render(p1)
	-- upvalues: withStyleModule (ref), guiService (ref), roactModule (ref), baseMenuModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: guiService (copy), p1 (ref), roactModule (copy), baseMenuModule (copy)
		local guiInset, guiInset_1 = guiService:GetGuiInset()
		local var1 = p1.state.absolutePosition + guiInset
		local var2 = 0
		local var3 = 1
		local y = p1.props.buttonSize.Y
		local x = p1.props.buttonSize.X
		
		if p1.props.screenSize.Y / 2 < p1.state.absolutePosition.Y then
			var2 = 1
			var3 = -1
			y = UDim.new(0, 0)
		end
		local var4 = if var3 == 1 then y + p1.props.openPositionY else y - p1.props.openPositionY
		local uDim2 = UDim2.new(0, 0, var4.Scale, var4.Offset)
		
		if p1.props.screenSize.X < 640 and not p1.props.menuPositionFixed then
			var2 = 1
			uDim2 = UDim2.new(-p1.props.buttonSize.X.Scale / 2, -var1.X + p1.props.screenSize.X / 2 - p1.props.buttonSize.X.Offset / 2, 0, p1.props.screenSize.Y - var1.Y - guiInset_1.Y - 24)
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p1.state.visible,
			ZIndex = p1.props.zIndex,
			[roactModule.Change.AbsolutePosition] = p1.setAbsolutePosition
		}, {
			Background = roactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = if not p1.props.closeBackgroundVisible then 1 else p2.Theme.Overlay.Transparency,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-var1.X, -var1.Y),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				[roactModule.Event.Activated] = p1.dismissMenu
			}),
			PositionFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = uDim2
			}, {
				BaseMenu = roactModule.createElement(baseMenuModule, {
					buttonProps = p1.props.buttonProps,
					showDropShadow = p1.props.showDropShadow,
					fixedListHeight = p1.props.fixedListHeight,
					width = x,
					position = UDim2.fromScale(0, 0),
					anchorPoint = Vector2.new(0, var2),
					background = p1.props.menuListBackground,
					enableTokenOverride = p1.props.enableTokenOverride,
					selectionOrder = p1.props.selectionOrder
				})
			})
		})
	end)
end

function dropdownMenuList.didMount(p1)
	if p1.props.open then
		p1:setState({ visible = true })
	end
end

function dropdownMenuList.didUpdate(p1, p2, _)
	if p1.props.open ~= p2.open then
		if p1.props.open then
			p1:setState({ visible = true })
			
			return
		end
		p1:setState({ visible = false })
	end
end

return dropdownMenuList