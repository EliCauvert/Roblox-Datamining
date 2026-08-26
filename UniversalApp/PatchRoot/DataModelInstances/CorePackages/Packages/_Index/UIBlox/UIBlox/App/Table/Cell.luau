local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local roactModule = require(parent_2.Roact)
local enumerateModule = require(parent_2.enumerate)
local bindingValidatorModule = require(core.Utility.bindingValidator)
local withStyleModule = require(core.Style.withStyle)
local withSelectionCursorProviderModule = require(parent.SelectionImage.withSelectionCursorProvider)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local cell = roactModule.PureComponent:extend("Cell")
cell.debugProps = enumerateModule("debugProps", { "controlState" })
cell.validateProps = tModule.strictInterface({
	head = tModule.table,
	tail = tModule.optional(tModule.table),
	background = tModule.optional(tModule.table),
	layoutOrder = tModule.optional(tModule.union(tModule.integer, bindingValidatorModule(tModule.number))),
	size = tModule.optional(tModule.UDim2),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	horizontalPadding = tModule.optional(tModule.number),
	selectable = tModule.optional(tModule.boolean),
	layoutWraps = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onStateChanged = tModule.optional(tModule.callback),
	onActivated = tModule.optional(tModule.callback),
	onTouchTapped = tModule.optional(tModule.callback),
	[cell.debugProps.controlState] = tModule.optional(controlStateModule.isEnumValue),
	[roactModule.Change.AbsolutePosition] = tModule.optional(tModule.callback),
	[roactModule.Ref] = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	forwardRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	selectionCursor = tModule.optional(tModule.any)
})
cell.defaultProps = {
	isDisabled = false,
	userInteractionEnabled = true,
	horizontalPadding = 24
}

function cell.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	p1.stateStyleMap = {
		[controlStateModule.Default] = "BackgroundDefault",
		[controlStateModule.Hover] = "BackgroundOnHover",
		[controlStateModule.Pressed] = "BackgroundOnPress"
	}
	
	function p0.getBackgroundStyle(p2, p3)
		-- upvalues: p1 (ref), controlStateModule (copy)
		local var1 = p1.stateStyleMap[p2] or p1.stateStyleMap[controlStateModule.Default]
		local t = {
			Color = p3.Theme[var1].Color,
			Transparency = p3.Theme[var1].Transparency
		}
		
		if p2 == controlStateModule.Disabled then
			t.Transparency = 1
		end
		return t
	end
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
end

function cell.render(p1)
	-- upvalues: withStyleModule (ref), withSelectionCursorProviderModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: withSelectionCursorProviderModule (copy), p1 (ref)
		return withSelectionCursorProviderModule(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function cell.renderWithProviders(p1, p2, _)
	-- upvalues: cell (ref), roactModule (ref), interactableModule (ref), controlStateModule (ref)
	local anchorPoint = p1.props.anchorPoint
	local layoutOrder = p1.props.layoutOrder
	local position = p1.props.position
	local size = p1.props.size or UDim2.fromScale(1, 1)
	local head = p1.props.head
	local tail = p1.props.tail
	local background = p1.props.background
	local isDisabled = p1.props.isDisabled
	local var1 = if p1.props.onActivated then function(...)
		-- upvalues: p1 (ref)
		if p1.props.tail and p1.props.userInteractionEnabled and p1.props.onActivated then
			p1.props.onActivated(...)
		end
	end else p1.props.onActivated
	local onTouchTapped = p1.props.onTouchTapped
	local controlState = p1.props[cell.debugProps.controlState] or p1.state.controlState
	local backgroundStyle = p1.getBackgroundStyle(controlState, p2)
	
	return roactModule.createElement(interactableModule, {
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		Position = position,
		Size = size,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Selectable = p1.props.selectable,
		SelectionImageObject = p1.props.selectionCursor,
		isDisabled = isDisabled,
		onStateChanged = p1.onStateChanged,
		[roactModule.Event.Activated] = var1,
		[roactModule.Event.TouchTap] = onTouchTapped,
		[roactModule.Change.AbsolutePosition] = p1.props[roactModule.Change.AbsolutePosition],
		[roactModule.Ref] = p1.props.forwardRef
	}, {
		CellBackground = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = -1,
			Size = size,
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Background = background or roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				BackgroundColor3 = backgroundStyle.Color,
				BackgroundTransparency = backgroundStyle.Transparency
			}),
			CellContent = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
					Wraps = p1.props.layoutWraps
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, p1.props.horizontalPadding),
					PaddingRight = UDim.new(0, p1.props.horizontalPadding)
				}),
				CellHead = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.fromScale(0, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY
				}, { Head = head }),
				CellTail = tail and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.fromScale(1, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY
				}, { Tail = tail }) or nil
			})
		}),
		DisabledMask = controlState == controlStateModule.Disabled and roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			ZIndex = 100,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = backgroundStyle.Color
		}) or nil
	})
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), cell (ref)
	return roactModule.createElement(cell, cryoModule.Dictionary.join(cryoModule.Dictionary.join({
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}, p1), { forwardRef = p2 }))
end)