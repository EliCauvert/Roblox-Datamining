local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local RoactModule = require(Parent2.Roact)
local BindingValidatorModule = require(Core.Utility.bindingValidator)
local WithStyleModule = require(Core.Style.withStyle)
local WithSelectionCursorProviderModule = require(Parent.SelectionImage.withSelectionCursorProvider)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local Cell = RoactModule.PureComponent:extend("Cell")
Cell.debugProps = require(Parent2.enumerate)("debugProps", { "controlState" })
Cell.validateProps = TModule.strictInterface({
	head = TModule.table,
	tail = TModule.optional(TModule.table),
	background = TModule.optional(TModule.table),
	layoutOrder = TModule.optional(TModule.union(TModule.integer, BindingValidatorModule(TModule.number))),
	size = TModule.optional(TModule.UDim2),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	horizontalPadding = TModule.optional(TModule.number),
	selectable = TModule.optional(TModule.boolean),
	layoutWraps = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onStateChanged = TModule.optional(TModule.callback),
	onActivated = TModule.optional(TModule.callback),
	onTouchTapped = TModule.optional(TModule.callback),
	[Cell.debugProps.controlState] = TModule.optional(ControlStateModule.isEnumValue),
	[RoactModule.Change.AbsolutePosition] = TModule.optional(TModule.callback),
	[RoactModule.Ref] = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	forwardRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	selectionCursor = TModule.optional(TModule.any)
})
Cell.defaultProps = {
	isDisabled = false,
	userInteractionEnabled = true,
	horizontalPadding = 24
}

function Cell.init(p1) --[[ Line: 79 ]]
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	p1.stateStyleMap = {
		[ControlStateModule.Default] = "BackgroundDefault",
		[ControlStateModule.Hover] = "BackgroundOnHover",
		[ControlStateModule.Pressed] = "BackgroundOnPress"
	}
	
	function p1.getBackgroundStyle(Prop, p2) --[[ Line: 90 ]]
		-- upvalues: p1 (copy), ControlStateModule (upval)
		local StateStyle = p1.stateStyleMap[Prop] or p1.stateStyleMap[ControlStateModule.Default]
		local config = {
			Color = p2.Theme[StateStyle].Color,
			Transparency = p2.Theme[StateStyle].Transparency
		}
		
		if Prop == ControlStateModule.Disabled then
			config.Transparency = 1
		end
		return config
	end
	
	function p1.onStateChanged(p2, ControlState) --[[ Line: 106 ]]
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

function Cell.render(p1) --[[ Line: 116 ]]
	-- upvalues: WithStyleModule (copy), WithSelectionCursorProviderModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 117 ]]
		-- upvalues: WithSelectionCursorProviderModule (upval), p1 (copy)
		return WithSelectionCursorProviderModule(function(p3) --[[ Line: 118 ]]
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function Cell.renderWithProviders(p1, p2, _) --[[ Line: 124 ]]
	-- upvalues: Cell (copy), RoactModule (copy), InteractableModule (copy), ControlStateModule (copy)
	local Size = p1.props.size or UDim2.fromScale(1, 1)
	local Tail = p1.props.tail
	local Prop = p1.props[Cell.debugProps.controlState] or p1.state.controlState
	local BackgroundStyle = p1.getBackgroundStyle(Prop, p2)
	
	return RoactModule.createElement(InteractableModule, {
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = Size,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Selectable = p1.props.selectable,
		SelectionImageObject = p1.props.selectionCursor,
		isDisabled = p1.props.isDisabled,
		onStateChanged = p1.onStateChanged,
		[RoactModule.Event.Activated] = if p1.props.onActivated then function(...) --[[ Line: 139 ]]
			-- upvalues: p1 (copy)
			if p1.props.tail and p1.props.userInteractionEnabled and p1.props.onActivated then
				p1.props.onActivated(...)
			end
		end else p1.props.onActivated,
		[RoactModule.Event.TouchTap] = p1.props.onTouchTapped,
		[RoactModule.Change.AbsolutePosition] = p1.props[RoactModule.Change.AbsolutePosition],
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		CellBackground = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = -1,
			Size = Size,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Background = p1.props.background or RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = BackgroundStyle.Color,
				BackgroundTransparency = BackgroundStyle.Transparency
			}),
			CellContent = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
					Wraps = p1.props.layoutWraps
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, p1.props.horizontalPadding),
					PaddingRight = UDim.new(0, p1.props.horizontalPadding)
				}),
				CellHead = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.fromScale(0, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY
				}, { Head = p1.props.head }),
				CellTail = Tail and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.fromScale(1, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY
				}, { Tail = Tail }) or nil
			})
		}),
		DisabledMask = Prop == ControlStateModule.Disabled and RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = BackgroundStyle.Color
		}) or nil
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 233 ]]
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), CryoModule (copy), RoactModule (copy), Cell (copy)
	return RoactModule.createElement(Cell, CryoModule.Dictionary.join(CryoModule.Dictionary.join({
		selectionCursor = UseCursorByTypeModule(CursorTypeModule.RoundedRectNoInset)
	}, p1), { forwardRef = ForwardRef }))
end)