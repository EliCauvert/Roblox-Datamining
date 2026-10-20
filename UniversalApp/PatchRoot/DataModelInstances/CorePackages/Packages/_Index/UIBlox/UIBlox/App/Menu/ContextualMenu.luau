local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local OtterModule = require(Parent1.Otter)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local BaseMenuModule = require(script.Parent.BaseMenu)
local MenuDirectionModule = require(script.Parent.MenuDirection)
local ValidateMotorOptionPropsModule = require(script.Parent.validateMotorOptionProps)
local MotorOptions = {
	open = {
		targetValue = 1,
		springParams = { frequency = 4, dampingRatio = 1 }
	},
	close = {
		targetValue = 0,
		springParams = { frequency = 2.6, dampingRatio = 1 }
	}
}
local ContextualMenu = RoactModule.PureComponent:extend("ContextualMenu")
ContextualMenu.validateProps = TModule.strictInterface({
	buttonProps = require(script.Parent.validateButtonProps),
	zIndex = TModule.optional(TModule.integer),
	open = TModule.boolean,
	menuDirection = TModule.optional(MenuDirectionModule.isEnumValue),
	openPositionY = TModule.UDim,
	closeBackgroundVisible = TModule.optional(TModule.boolean),
	screenSize = TModule.Vector2,
	stayOnActivated = TModule.optional(TModule.boolean),
	onDismiss = TModule.optional(TModule.callback),
	setFrameRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	setFirstItemRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	motorOverrideOptions = TModule.optional(TModule.strictInterface({
		motorCallback = TModule.callback,
		open = ValidateMotorOptionPropsModule,
		close = ValidateMotorOptionPropsModule
	})),
	horizontalAlignment = TModule.optional(TModule.enum(Enum.HorizontalAlignment)),
	openPositionX = TModule.optional(TModule.UDim),
	contextMenuWidthOverride = TModule.optional(TModule.UDim),
	anchorPointOverride = TModule.optional(TModule.Vector2),
	topElementRounded = TModule.optional(TModule.boolean),
	bottomElementRounded = TModule.optional(TModule.boolean),
	isElementBackgroundVisible = TModule.optional(TModule.boolean),
	isElementDividerVisible = TModule.optional(TModule.boolean),
	elementHeight = TModule.optional(TModule.number),
	borderCornerRadius = TModule.optional(TModule.integer),
	background = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo))),
	enableTokenOverride = TModule.optional(TModule.boolean),
	renderHeader = TModule.optional(TModule.callback),
	headerHeight = TModule.optional(TModule.number),
	showDropShadow = TModule.optional(TModule.boolean),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
ContextualMenu.defaultProps = {
	zIndex = 2,
	closeBackgroundVisible = true,
	menuDirection = MenuDirectionModule.Up,
	horizontalAlignment = Enum.HorizontalAlignment.Center,
	openPositionX = UDim.new(0, 0)
}

function ContextualMenu.init(p1)
	-- upvalues: RoactModule (copy), OtterModule (copy), MotorOptions (copy)
	p1.wasDismissed = false
	p1.positionPercentBinding, p1.positionPercentBindingUpdate = RoactModule.createBinding(0)
	p1.motor = OtterModule.createSingleMotor(0)
	p1.motor:onStep(p1.positionPercentBindingUpdate)
	p1.motor:onComplete(function()
		-- upvalues: p1 (copy)
		if p1.wasDismissed then
			p1.wasDismissed = false
			
			if p1.props.onDismiss then
				p1.props.onDismiss()
			end
		end
	end)
	p1.motorType = OtterModule.spring
	p1.motorOptions = MotorOptions
	
	if p1.props.motorOverrideOptions then
		p1.motorType = p1.props.motorOverrideOptions.motorCallback
		p1.motorOptions = p1.props.motorOverrideOptions
	end
	p1.state = {
		absoluteSize = Vector2.new(0, 0),
		absolutePosition = Vector2.new(0, 0)
	}
	p1.visibleBinding = p1.positionPercentBinding:map(function(p2): boolean
		return p2 ~= 0
	end)
end

function ContextualMenu.render(p1)
	-- upvalues: WithStyleModule (copy), MenuDirectionModule (copy), GuiService (copy), RoactModule (copy), BaseMenuModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), MenuDirectionModule (upval), GuiService (upval), RoactModule (upval), BaseMenuModule (upval)
		local X = 0.5
		local _UDim = UDim.new(1, -24)
		local _UDim1 = UDim.new(0, 0)
		local IsXAbove = p1.state.absoluteSize.X > 640
		
		if IsXAbove then
			_UDim = UDim.new(0, 300)
			_UDim1 = p1.props.openPositionX
			
			if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
				X = 0
			elseif p1.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
				X = 1
			end
		end
		local Y: number = if p1.props.menuDirection == MenuDirectionModule.Up then 1 else 0
		local Transparency = if p1.props.closeBackgroundVisible then p2.Theme.Overlay.Transparency else 1
		local ContextMenuWidthOverride = p1.props.contextMenuWidthOverride or _UDim
		local AnchorPointOverride = p1.props.anchorPointOverride or Vector2.new(X, Y)
		local GuiInset, _ = GuiService:GetGuiInset()
		local NewAbsolutePosition = p1.state.absolutePosition + GuiInset
		
		return RoactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = p1.visibleBinding,
			ZIndex = p1.props.zIndex,
			[RoactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: p1 (upval)
				p1:setState({ absoluteSize = Frame.AbsoluteSize })
			end,
			[RoactModule.Change.AbsolutePosition] = function(Frame)
				-- upvalues: p1 (upval)
				p1:setState({ absolutePosition = Frame.AbsolutePosition })
			end
		}, {
			Background = RoactModule.createElement("TextButton", {
				ZIndex = 1,
				Text = "",
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.Overlay.Color,
				BackgroundTransparency = Transparency,
				AutoButtonColor = false,
				Selectable = false,
				Position = UDim2.fromOffset(-NewAbsolutePosition.X, -NewAbsolutePosition.Y),
				Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
				[RoactModule.Event.Activated] = function()
					-- upvalues: p1 (upval)
					if not p1.wasDismissed then
						p1.wasDismissed = true
						p1.motor:setGoal(p1.motorType(p1.motorOptions.close.targetValue, p1.motorOptions.close.springParams))
					end
				end
			}),
			PositionFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.new(_UDim1.Scale, _UDim1.Offset, p1.props.openPositionY.Scale, p1.props.openPositionY.Offset)
			}, {
				BaseMenu = RoactModule.createElement(BaseMenuModule, {
					buttonProps = p1.props.buttonProps,
					setFirstItemRef = p1.props.setFirstItemRef,
					setFrameRef = p1.props.setFrameRef,
					width = ContextMenuWidthOverride,
					position = p1.positionPercentBinding:map(function(p3: number): UDim2
						-- upvalues: IsXAbove (copy), p1 (upval), MenuDirectionModule (upval)
						local XScale = 0.5
						
						if IsXAbove or p1.props.anchorPointOverride then
							if p1.props.horizontalAlignment == Enum.HorizontalAlignment.Left then
								XScale = 0
							elseif p1.props.horizontalAlignment == Enum.HorizontalAlignment.Right then
								XScale = 1
							end
						end
						return if p1.props.menuDirection == MenuDirectionModule.Down then UDim2.fromScale(XScale, p3 - 1) else UDim2.fromScale(XScale, 1 - p3)
					end),
					anchorPoint = AnchorPointOverride,
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

function ContextualMenu.didMount(p1)
	if p1.props.open then
		p1.wasDismissed = false
		p1.motor:setGoal(p1.motorType(p1.motorOptions.open.targetValue, p1.motorOptions.open.springParams))
	end
end

function ContextualMenu.didUpdate(p1, p2, _)
	if p1.props.open ~= p2.open then
		if p1.props.open then
			p1.wasDismissed = false
			p1.motor:setGoal(p1.motorType(p1.motorOptions.open.targetValue, p1.motorOptions.open.springParams))
			
			return
		else
			p1.motor:setGoal(p1.motorType(p1.motorOptions.close.targetValue, p1.motorOptions.close.springParams))
		end
	end
end

function ContextualMenu.willUnmount(p1)
	p1.motor:destroy()
end

return ContextualMenu