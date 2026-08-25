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

function cell.init(p0)
	-- upvalues: controlStateModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	p0.stateStyleMap = {
		[controlStateModule.Default] = "BackgroundDefault",
		[controlStateModule.Hover] = "BackgroundOnHover",
		[controlStateModule.Pressed] = "BackgroundOnPress"
	}
	
	function p0.getBackgroundStyle(p1, p2)
		-- upvalues: p0 (ref), controlStateModule (copy)
		local var12 = p0.stateStyleMap[p1] or p0.stateStyleMap[controlStateModule.Default]
		local t = {
			Color = p2.Theme[var12].Color,
			Transparency = p2.Theme[var12].Transparency
		}
		
		if p1 == controlStateModule.Disabled then
			t.Transparency = 1
		end
		return t
	end
	
	function p0.onStateChanged(p3, p4)
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p4 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p3, p4)
		end
	end
end

function cell.render(p5)
	-- upvalues: withStyleModule (ref), withSelectionCursorProviderModule (ref)
	return withStyleModule(function(p6)
		-- upvalues: withSelectionCursorProviderModule (copy), p5 (ref)
		return withSelectionCursorProviderModule(function(p7)
			-- upvalues: p5 (copy), p6 (ref)
			return p5:renderWithProviders(p6, p7)
		end)
	end)
end

function cell.renderWithProviders(p8, p9, _)
	-- upvalues: cell (ref), roactModule (ref), interactableModule (ref), controlStateModule (ref)
	local anchorPoint = p8.props.anchorPoint
	local layoutOrder = p8.props.layoutOrder
	local position = p8.props.position
	local size = p8.props.size or UDim2.fromScale(1, 1)
	local head = p8.props.head
	local tail = p8.props.tail
	local background = p8.props.background
	local isDisabled = p8.props.isDisabled
	local var15 = if p8.props.onActivated then function(...)
		-- upvalues: p8 (ref)
		if p8.props.tail and p8.props.userInteractionEnabled and p8.props.onActivated then
			p8.props.onActivated(...)
		end
	end else p8.props.onActivated
	local onTouchTapped = p8.props.onTouchTapped
	local controlState = p8.props[cell.debugProps.controlState] or p8.state.controlState
	local backgroundStyle = p8.getBackgroundStyle(controlState, p9)
	
	return roactModule.createElement(interactableModule, {
		AnchorPoint = anchorPoint,
		LayoutOrder = layoutOrder,
		Position = position,
		Size = size,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		AutoButtonColor = false,
		Selectable = p8.props.selectable,
		SelectionImageObject = p8.props.selectionCursor,
		isDisabled = isDisabled,
		onStateChanged = p8.onStateChanged,
		[roactModule.Event.Activated] = var15,
		[roactModule.Event.TouchTap] = onTouchTapped,
		[roactModule.Change.AbsolutePosition] = p8.props[roactModule.Change.AbsolutePosition],
		[roactModule.Ref] = p8.props.forwardRef
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
					Wraps = p8.props.layoutWraps
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, p8.props.horizontalPadding),
					PaddingRight = UDim.new(0, p8.props.horizontalPadding)
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

return roactModule.forwardRef(function(p10, p11)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), cryoModule (ref), roactModule (ref), cell (ref)
	return roactModule.createElement(cell, cryoModule.Dictionary.join(cryoModule.Dictionary.join({
		selectionCursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}, p10), { forwardRef = p11 }))
end)