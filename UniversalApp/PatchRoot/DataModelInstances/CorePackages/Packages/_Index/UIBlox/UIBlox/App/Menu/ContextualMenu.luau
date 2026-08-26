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

function contextualMenu.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t (ref)
	p1.wasDismissed = false
	local var1, var2 = roactModule.createBinding(0)
	p1.positionPercentBinding = var1
	p1.positionPercentBindingUpdate = var2
	p1.motor = otterModule.createSingleMotor(0)
	p1.motor:onStep(p1.positionPercentBindingUpdate)
	p1.motor:onComplete(function()
		-- upvalues: p1 (ref)
		if p1.wasDismissed then
			p1.wasDismissed = false
			
			if p1.props.onDismiss then
				p1.props.onDismiss()
			end
		end
	end)
	p1.motorType = otterModule.spring
	p1.motorOptions = t
	
	if p1.props.motorOverrideOptions then
		p1.motorType = p1.props.motorOverrideOptions.motorCallback
		p1.motorOptions = p1.props.motorOverrideOptions
	end
	p1.state = {
		absoluteSize = Vector2.new(0, 0),
		absolutePosition = Vector2.new(0, 0)
	}
	p1.visibleBinding = p1.positionPercentBinding:map(function(p2)
		return p2 ~= 0
	end)
end

function contextualMenu.render(p1)
	-- upvalues: withStyleModule (ref), menuDirectionModule (ref), guiService (ref), roactModule (ref), baseMenuModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), menuDirectionModule (copy), guiService (copy), roactModule (copy), baseMenuModule (copy)
		local var1 = 0.5
		local uDim = UDim.new(1, -24)
		local uDim_1 = UDim.new(0, 0)
		local var2 = p1.state.absoluteSize.X > 640
		
		if var2 then
			uDim = UDim.new(0, 300)
			uDim_1 = p1.props.openPositionX
			
			if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
				var1 = 0
			elseif p1.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
				var1 = 1
			end
		end
		local var3 = if p1.props.menuDirection == menuDirectionModule.Up then 1 else 0
		local var4 = if not p1.props.closeBackgroundVisible then 1 else p2.Theme.Overlay.Transparency
		uDim = p1.props.contextMenuWidthOverride or uDim
		local anchorPointOverride = p1.props.anchorPointOverride or Vector2.new(var1, var3)
		local guiInset, _ = guiService:GetGuiInset()
		local var5 = p1.state.absolutePosition + guiInset
		
		return roactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p1.visibleBinding,
			ZIndex = p1.props.zIndex,
			[roactModule.Change.AbsoluteSize] = function(p3)
				-- upvalues: p1 (copy)
				p1:setState({ absoluteSize = p3.AbsoluteSize })
			end,
			[roactModule.Change.AbsolutePosition] = function(p3)
				-- upvalues: p1 (copy)
				p1:setState({ absolutePosition = p3.AbsolutePosition })
			end
		}, {
			Background = roactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = var4,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-var5.X, -var5.Y),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				[roactModule.Event.Activated] = function()
					-- upvalues: p1 (copy)
					if not p1.wasDismissed then
						p1.wasDismissed = true
						p1.motor:setGoal(p1.motorType(p1.motorOptions.close.targetValue, p1.motorOptions.close.springParams))
					end
				end
			}),
			PositionFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(uDim_1.Scale, uDim_1.Offset, p1.props.openPositionY.Scale, p1.props.openPositionY.Offset)
			}, {
				BaseMenu = roactModule.createElement(baseMenuModule, {
					buttonProps = p1.props.buttonProps,
					setFirstItemRef = p1.props.setFirstItemRef,
					setFrameRef = p1.props.setFrameRef,
					width = uDim,
					position = p1.positionPercentBinding:map(function(p3)
						-- upvalues: var2 (ref), p1 (copy), menuDirectionModule (copy)
						local var6 = 0.5
						
						if var2 or p1.props.anchorPointOverride then
							if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
								var6 = 0
							elseif p1.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
								var6 = 1
							end
						end
						return if p1.props.menuDirection == menuDirectionModule.Down then UDim2.fromScale(var6, p3 - 1) else UDim2.fromScale(var6, 1 - p3)
					end),
					anchorPoint = anchorPointOverride,
					topElementRounded = p1.props.topElementRounded,
					bottomElementRounded = p1.props.bottomElementRounded,
					isElementBackgroundVisible = p1.props.isElementBackgroundVisible,
					isElementDividerVisible = p1.props.isElementDividerVisible,
					elementHeight = p1.props.elementHeight,
					borderCornerRadius = p1.props.borderCornerRadius,
					background = p1.props.background,
					enableTokenOverride = p1.props.enableTokenOverride,
					renderHeader = p1.props.renderHeader,
					headerHeight = p1.props.headerHeight,
					showDropShadow = p1.props.showDropShadow,
					isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
				})
			})
		})
	end)
end

function contextualMenu.didMount(p1)
	if p1.props.open then
		p1.wasDismissed = false
		p1.motor:setGoal(p1.motorType(p1.motorOptions.open.targetValue, p1.motorOptions.open.springParams))
	end
end

function contextualMenu.didUpdate(p1, p2, _)
	if p1.props.open ~= p2.open then
		if p1.props.open then
			p1.wasDismissed = false
			p1.motor:setGoal(p1.motorType(p1.motorOptions.open.targetValue, p1.motorOptions.open.springParams))
			
			return
		end
		p1.motor:setGoal(p1.motorType(p1.motorOptions.close.targetValue, p1.motorOptions.close.springParams))
	end
end

function contextualMenu.willUnmount(p1)
	p1.motor:destroy()
end

return contextualMenu