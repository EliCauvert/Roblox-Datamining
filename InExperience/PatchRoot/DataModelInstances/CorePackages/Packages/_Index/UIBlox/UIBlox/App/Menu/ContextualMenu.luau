local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local otterModule = require(parent_1.Otter)
local withStyleModule = require(parent.Core.Style.withStyle)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local baseMenuModule = require(script.Parent.BaseMenu)
local menuDirectionModule = require(script.Parent.MenuDirection)
local validateButtonPropsModule = require(script.Parent.validateButtonProps)
local validateMotorOptionPropsModule = require(script.Parent.validateMotorOptionProps)
local t = {
	open = {
		targetValue = 1,
		springParams = { frequency = 4, dampingRatio = 1 }
	},
	close = {
		targetValue = 0,
		springParams = { frequency = 2.6, dampingRatio = 1 }
	}
}
local contextualMenu = roactModule.PureComponent:extend("ContextualMenu")
contextualMenu.validateProps = tModule.strictInterface({
	buttonProps = validateButtonPropsModule,
	zIndex = tModule.optional(tModule.integer),
	open = tModule.boolean,
	menuDirection = tModule.optional(menuDirectionModule.isEnumValue),
	openPositionY = tModule.UDim,
	closeBackgroundVisible = tModule.optional(tModule.boolean),
	screenSize = tModule.Vector2,
	stayOnActivated = tModule.optional(tModule.boolean),
	onDismiss = tModule.optional(tModule.callback),
	setFrameRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	setFirstItemRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	motorOverrideOptions = tModule.optional(tModule.strictInterface({
		motorCallback = tModule.callback,
		open = validateMotorOptionPropsModule,
		close = validateMotorOptionPropsModule
	})),
	horizontalAlignment = tModule.optional(tModule.enum(Enum.HorizontalAlignment)),
	openPositionX = tModule.optional(tModule.UDim),
	contextMenuWidthOverride = tModule.optional(tModule.UDim),
	anchorPointOverride = tModule.optional(tModule.Vector2),
	topElementRounded = tModule.optional(tModule.boolean),
	bottomElementRounded = tModule.optional(tModule.boolean),
	isElementBackgroundVisible = tModule.optional(tModule.boolean),
	isElementDividerVisible = tModule.optional(tModule.boolean),
	elementHeight = tModule.optional(tModule.number),
	borderCornerRadius = tModule.optional(tModule.integer),
	background = tModule.optional(validateColorInfoModule),
	enableTokenOverride = tModule.optional(tModule.boolean),
	renderHeader = tModule.optional(tModule.callback),
	headerHeight = tModule.optional(tModule.number),
	showDropShadow = tModule.optional(tModule.boolean),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
contextualMenu.defaultProps = {
	zIndex = 2,
	closeBackgroundVisible = true,
	menuDirection = menuDirectionModule.Up,
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	openPositionX = UDim.new(0, 0)
}

function contextualMenu.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	p0.wasDismissed = false
	local var12, var13 = roactModule.createBinding(0)
	p0.positionPercentBinding = var12
	p0.positionPercentBindingUpdate = var13
	p0.motor = otterModule.createSingleMotor(0)
	p0.motor:onStep(p0.positionPercentBindingUpdate)
	p0.motor:onComplete(function()
		-- upvalues: p0 (ref)
		if p0.wasDismissed then
			p0.wasDismissed = false
			
			if p0.props.onDismiss then
				p0.props.onDismiss()
			end
		end
	end)
	p0.motorType = otterModule.spring
	p0.motorOptions = t
	
	if p0.props.motorOverrideOptions then
		p0.motorType = p0.props.motorOverrideOptions.motorCallback
		p0.motorOptions = p0.props.motorOverrideOptions
	end
	p0.state = {
		absoluteSize = Vector2.new(0, 0),
		absolutePosition = Vector2.new(0, 0)
	}
	p0.visibleBinding = p0.positionPercentBinding:map(function(p1)
		return p1 ~= 0
	end)
end

function contextualMenu.render(p2)
	-- upvalues: withStyleModule (ref), menuDirectionModule (ref), guiService (ref), roactModule (ref), baseMenuModule (ref)
	return withStyleModule(function(p3)
		-- upvalues: p2 (ref), menuDirectionModule (copy), guiService (copy), roactModule (copy), baseMenuModule (copy)
		local var14 = 0.5
		local uDim = UDim.new(1, -24)
		local uDim_1 = UDim.new(0, 0)
		local var17 = p2.state.absoluteSize.X > 640
		
		if var17 then
			uDim = UDim.new(0, 300)
			uDim_1 = p2.props.openPositionX
			
			if p2.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
				var14 = 0
			elseif p2.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
				var14 = 1
			end
		end
		local var18 = if p2.props.menuDirection == menuDirectionModule.Up then 1 else 0
		local var19 = if not p2.props.closeBackgroundVisible then 1 else p3.Theme.Overlay.Transparency
		uDim = p2.props.contextMenuWidthOverride or uDim
		local anchorPointOverride = p2.props.anchorPointOverride or Vector2.new(var14, var18)
		local guiInset, _ = guiService:GetGuiInset()
		local var22 = p2.state.absolutePosition + guiInset
		
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p2.visibleBinding,
			ZIndex = p2.props.zIndex,
			[roactModule.Change.AbsoluteSize] = function(p4)
				-- upvalues: p2 (copy)
				p2:setState({ absoluteSize = p4.AbsoluteSize })
			end,
			[roactModule.Change.AbsolutePosition] = function(p5)
				-- upvalues: p2 (copy)
				p2:setState({ absolutePosition = p5.AbsolutePosition })
			end
		}, {
			Background = roactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p3.Theme.Overlay.Color,
				BackgroundTransparency = var19,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-var22.X, -var22.Y),
				Size = UDim2.fromOffset(p2.props.screenSize.X, p2.props.screenSize.Y),
				[roactModule.Event.Activated] = function()
					-- upvalues: p2 (copy)
					if not p2.wasDismissed then
						p2.wasDismissed = true
						p2.motor:setGoal(p2.motorType(p2.motorOptions.close.targetValue, p2.motorOptions.close.springParams))
					end
				end
			}),
			PositionFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(uDim_1.Scale, uDim_1.Offset, p2.props.openPositionY.Scale, p2.props.openPositionY.Offset)
			}, {
				BaseMenu = roactModule.createElement(baseMenuModule, {
					buttonProps = p2.props.buttonProps,
					setFirstItemRef = p2.props.setFirstItemRef,
					setFrameRef = p2.props.setFrameRef,
					width = uDim,
					position = p2.positionPercentBinding:map(function(p6)
						-- upvalues: var17 (ref), p2 (copy), menuDirectionModule (copy)
						local var23 = 0.5
						
						if var17 or p2.props.anchorPointOverride then
							if p2.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
								var23 = 0
							elseif p2.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
								var23 = 1
							end
						end
						return if p2.props.menuDirection == menuDirectionModule.Down then UDim2.fromScale(var23, p6 - 1) else UDim2.fromScale(var23, 1 - p6)
					end),
					anchorPoint = anchorPointOverride,
					topElementRounded = p2.props.topElementRounded,
					bottomElementRounded = p2.props.bottomElementRounded,
					isElementBackgroundVisible = p2.props.isElementBackgroundVisible,
					isElementDividerVisible = p2.props.isElementDividerVisible,
					elementHeight = p2.props.elementHeight,
					borderCornerRadius = p2.props.borderCornerRadius,
					background = p2.props.background,
					enableTokenOverride = p2.props.enableTokenOverride,
					renderHeader = p2.props.renderHeader,
					headerHeight = p2.props.headerHeight,
					showDropShadow = p2.props.showDropShadow,
					isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled
				})
			})
		})
	end)
end

function contextualMenu.didMount(p7)
	if p7.props.open then
		p7.wasDismissed = false
		p7.motor:setGoal(p7.motorType(p7.motorOptions.open.targetValue, p7.motorOptions.open.springParams))
	end
end

function contextualMenu.didUpdate(p8, p9, _)
	if p8.props.open ~= p9.open then
		if p8.props.open then
			p8.wasDismissed = false
			p8.motor:setGoal(p8.motorType(p8.motorOptions.open.targetValue, p8.motorOptions.open.springParams))
			
			return
		end
		p8.motor:setGoal(p8.motorType(p8.motorOptions.close.targetValue, p8.motorOptions.close.springParams))
	end
end

function contextualMenu.willUnmount(p10)
	p10.motor:destroy()
end

return contextualMenu