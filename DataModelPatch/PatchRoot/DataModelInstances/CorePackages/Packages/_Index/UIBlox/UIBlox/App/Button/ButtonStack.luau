local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local TModule = require(Parent2.t)
local ButtonModule = require(Parent.Button)
local ButtonTypeModule = require(Parent.Enum.ButtonType)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local FitFrameOnAxis = require(Parent2.FitFrame).FitFrameOnAxis
local ButtonStack = RoactModule.PureComponent:extend("ButtonStack")
ButtonStack.validateProps = TModule.strictInterface({
	buttons = TModule.array(TModule.strictInterface({
		buttonType = TModule.optional(ButtonTypeModule.isEnumValue),
		props = ButtonModule.validateProps,
		isDefaultChild = TModule.optional(TModule.boolean)
	})),
	buttonHeight = TModule.optional(TModule.numberMin(0)),
	forcedFillDirection = TModule.optional(TModule.enum(Enum.FillDirection)),
	marginBetween = TModule.optional(TModule.numberMin(0)),
	minHorizontalButtonPadding = TModule.optional(TModule.numberMin(0)),
	disableRoactGamepadButtonSelection = TModule.optional(TModule.boolean),
	disableGamepadRefs = TModule.optional(TModule.boolean),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
ButtonStack.defaultProps = {
	buttonHeight = 36,
	marginBetween = 12,
	minHorizontalButtonPadding = 8,
	isRoactGamepadEnabled = true
}

function ButtonStack.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.buttonRefs = RoactGamepadModule.createRefCache()
	p1.state = { frameWidth = 0 }
	
	function p1.updateFrameSize(Frame)
		-- upvalues: p1 (copy)
		local X = Frame.AbsoluteSize.X
		
		if X ~= p1.state.frameWidth then
			p1:setState({ frameWidth = X })
		end
	end
end

function ButtonStack.render(p1)
	-- upvalues: WithStyleModule (copy), GetTextSizeModule (copy), ButtonTypeModule (copy), CryoModule (copy), RoactModule (copy), ButtonModule (copy), RoactGamepadModule (copy), FitFrameOnAxis (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), GetTextSizeModule (upval), ButtonTypeModule (upval), CryoModule (upval), RoactModule (upval), ButtonModule (upval), RoactGamepadModule (upval), FitFrameOnAxis (upval)
		local _Font = p2.Font
		local ScaledRelativeSize = _Font.Body.RelativeSize * _Font.BaseSize
		local IsRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
		local Buttons = p1.props.buttons
		local MarginBetween = #Buttons > 1 and p1.props.marginBetween or 0
		local FrameWidthDelta = p1.state.frameWidth / #Buttons - MarginBetween * (#Buttons - 1) / #Buttons
		local IsForcedFillDirectionMatch = false
		local v1: number? = nil
		local ForcedFillDirection = nil
		
		if p1.props.forcedFillDirection then
			IsForcedFillDirectionMatch = p1.props.forcedFillDirection == Enum.FillDirection.Vertical
			ForcedFillDirection = p1.props.forcedFillDirection
		else
			for _, button in ipairs(Buttons) do
				if FrameWidthDelta - 2 * p1.props.minHorizontalButtonPadding < GetTextSizeModule(button.props.text or "", ScaledRelativeSize, _Font.Body.Font, Vector2.new(p1.state.frameWidth, p1.props.buttonHeight), if button.props.buttonTextOverride then button.props.buttonTextOverride.RichText else false).X then
					IsForcedFillDirectionMatch = true
					break
				end
			end
			ForcedFillDirection = IsForcedFillDirectionMatch and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal
		end
		local _UDim2: UDim2 = IsForcedFillDirectionMatch and UDim2.new(1, 0, 0, p1.props.buttonHeight) or UDim2.new(0, FrameWidthDelta, 0, p1.props.buttonHeight)
		local Elements = {}
		
		for i, button1 in ipairs(Buttons) do
			local JoinResult = CryoModule.Dictionary.join({
				key = tostring(i),
				layoutOrder = IsForcedFillDirectionMatch and #Buttons - i or i,
				size = _UDim2,
				buttonType = button1.buttonType or ButtonTypeModule.Secondary,
				isRoactGamepadEnabled = IsRoactGamepadEnabled
			}, button1.props)
			
			if button1.isDefaultChild then
				v1 = i
			end
			if not p1.props.disableGamepadRefs and IsRoactGamepadEnabled then
				JoinResult = CryoModule.Dictionary.join(JoinResult, if p1.props.disableRoactGamepadButtonSelection then { [RoactModule.Ref] = p1.buttonRefs[i] } else {
					[RoactModule.Ref] = p1.buttonRefs[i],
					NextSelectionUp = IsForcedFillDirectionMatch and i > 1 and p1.buttonRefs[i - 1] or nil,
					NextSelectionDown = IsForcedFillDirectionMatch and i < #Buttons and p1.buttonRefs[i + 1] or nil,
					NextSelectionLeft = if IsForcedFillDirectionMatch or i <= 1 then nil else p1.buttonRefs[i - 1] or nil,
					NextSelectionRight = if IsForcedFillDirectionMatch or i >= #Buttons then nil else p1.buttonRefs[i + 1] or nil
				})
			end
			table.insert(Elements, RoactModule.createElement(ButtonModule, JoinResult))
		end
		return RoactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[FitFrameOnAxis] else FitFrameOnAxis, {
			BackgroundTransparency = 1,
			contentPadding = UDim.new(0, MarginBetween),
			FillDirection = ForcedFillDirection,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			LayoutOrder = 3,
			minimumSize = UDim2.new(1, 0, 0, p1.props.buttonHeight),
			[RoactModule.Ref] = p1.props.frameRef,
			[RoactModule.Change.AbsoluteSize] = p1.updateFrameSize,
			NextSelectionLeft = if IsRoactGamepadEnabled then p1.props.NextSelectionLeft else nil,
			NextSelectionRight = if IsRoactGamepadEnabled then p1.props.NextSelectionRight else nil,
			NextSelectionUp = if IsRoactGamepadEnabled then p1.props.NextSelectionUp else nil,
			NextSelectionDown = if IsRoactGamepadEnabled then p1.props.NextSelectionDown else nil,
			defaultChild = IsRoactGamepadEnabled and (v1 and p1.buttonRefs[v1]) or nil
		}, Elements)
	end)
end

local ForwardRefResult = RoactModule.forwardRef(function(p3, FrameRef)
	-- upvalues: RoactModule (copy), ButtonStack (copy), CryoModule (copy)
	return RoactModule.createElement(ButtonStack, CryoModule.Dictionary.join(p3, { frameRef = FrameRef }))
end)
ForwardRefResult.validateProps = ButtonStack.validateProps

return ForwardRefResult