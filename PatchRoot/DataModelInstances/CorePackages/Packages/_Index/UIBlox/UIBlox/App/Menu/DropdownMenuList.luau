-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:56 2026 Pacific Standard Time.

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

function dropdownMenuList.init(p0) --[[ line: 50 ]]
	p0:setState({ visible = false, absolutePosition = Vector2.new(0, 0) })
	
	function p0.setAbsolutePosition(p1) --[[ line: 56 ]]
		-- upvalues: p0 (ref)
		p0:setState({ absolutePosition = p1.AbsolutePosition })
	end
	
	function p0.dismissMenu() --[[ line: 62 ]]
		-- upvalues: p0 (ref)
		if p0.state.visible then
			p0:setState({ visible = false })
			p0.props.onDismiss()
		end
	end
end

function dropdownMenuList.render(p2) --[[ line: 72 ]]
	-- upvalues: withStyleModule (ref), guiService (ref), roactModule (ref), baseMenuModule (ref)
	return withStyleModule(function(p3) --[[ line: 73 ]]
		-- upvalues: guiService (copy), p2 (ref), roactModule (copy), baseMenuModule (copy)
		local guiInset, guiInset_1 = guiService:GetGuiInset()
		local var8 = p2.state.absolutePosition + guiInset
		local var9 = 0
		local var10 = 1
		local y = p2.props.buttonSize.Y
		local x = p2.props.buttonSize.X
		
		if p2.props.screenSize.Y / 2 < p2.state.absolutePosition.Y then
			var9 = 1
			var10 = -1
			y = UDim.new(0, 0)
		end
		local var11 = if var10 == 1 then y + p2.props.openPositionY else y - p2.props.openPositionY
		local uDim2 = UDim2.new(0, 0, var11.Scale, var11.Offset)
		
		if p2.props.screenSize.X < 640 and not p2.props.menuPositionFixed then
			var9 = 1
			uDim2 = UDim2.new(-p2.props.buttonSize.X.Scale / 2, -var8.X + p2.props.screenSize.X / 2 - p2.props.buttonSize.X.Offset / 2, 0, p2.props.screenSize.Y - var8.Y - guiInset_1.Y - 24)
		end
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p2.state.visible,
			ZIndex = p2.props.zIndex,
			[roactModule.Change.AbsolutePosition] = p2.setAbsolutePosition
		}, {
			Background = roactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p3.Theme.Overlay.Color,
				BackgroundTransparency = if not p2.props.closeBackgroundVisible then 1 else p3.Theme.Overlay.Transparency,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-var8.X, -var8.Y),
				Size = UDim2.fromOffset(p2.props.screenSize.X, p2.props.screenSize.Y),
				[roactModule.Event.Activated] = p2.dismissMenu
			}),
			PositionFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = uDim2
			}, {
				BaseMenu = roactModule.createElement(baseMenuModule, {
					buttonProps = p2.props.buttonProps,
					showDropShadow = p2.props.showDropShadow,
					fixedListHeight = p2.props.fixedListHeight,
					width = x,
					position = UDim2.fromScale(0, 0),
					anchorPoint = Vector2.new(0, var9),
					background = p2.props.menuListBackground,
					enableTokenOverride = p2.props.enableTokenOverride,
					selectionOrder = p2.props.selectionOrder
				})
			})
		})
	end)
end

function dropdownMenuList.didMount(p4) --[[ line: 155 ]]
	if p4.props.open then
		p4:setState({ visible = true })
	end
end

function dropdownMenuList.didUpdate(p5, p6, _) --[[ line: 163 ]]
	if p5.props.open ~= p6.open then
		if p5.props.open then
			p5:setState({ visible = true })
			
			return
		end
		p5:setState({ visible = false })
	end
end

return dropdownMenuList