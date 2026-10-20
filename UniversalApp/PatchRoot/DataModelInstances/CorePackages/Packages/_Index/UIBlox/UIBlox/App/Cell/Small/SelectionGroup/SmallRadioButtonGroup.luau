local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local RoactGamepadModule = require(Parent2.RoactGamepad)
local TModule = require(Parent2.t)
local CursorTypeModule = require(Parent.SelectionCursor.CursorType)
local UseCursorByTypeModule = require(Parent.SelectionCursor.useCursorByType)
local SmallRadioButtonCellModule = require(Parent1.App.Cell.Small.SelectionGroup.SmallRadioButtonCell)
local SmallRadioButtonGroup = RoactModule.PureComponent:extend("SmallRadioButtonGroup")
SmallRadioButtonGroup.validateProps = TModule.strictInterface({
	items = TModule.optional(TModule.array(TModule.tuple((TModule.strictInterface({
		text = TModule.string,
		id = TModule.string,
		isDisabled = TModule.optional(TModule.boolean)
	}))))),
	selectedValue = TModule.optional(TModule.string),
	cursor = TModule.optional(TModule.table),
	onActivated = TModule.callback,
	layoutOrder = TModule.optional(TModule.number),
	useDefaultControlState = TModule.optional(TModule.boolean),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
SmallRadioButtonGroup.defaultProps = { selectedValue = nil, isRoactGamepadEnabled = true }

function SmallRadioButtonGroup.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.gamepadRefs = p1.props.isRoactGamepadEnabled and RoactGamepadModule.createRefCache() or {}
end

function SmallRadioButtonGroup.renderButtonCell(p1, p2, LayoutOrder: number, IsRoactGamepadEnabled)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), SmallRadioButtonCellModule (copy)
	return RoactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[SmallRadioButtonCellModule] else SmallRadioButtonCellModule, {
		id = p2.id,
		text = p2.text,
		onActivated = p1.props.onActivated,
		isSelected = p1.props.selectedValue == p2.id,
		isDisabled = p2.isDisabled,
		layoutOrder = LayoutOrder,
		useDefaultControlState = p1.props.useDefaultControlState,
		[RoactModule.Ref] = p1.gamepadRefs[LayoutOrder],
		NextSelectionUp = LayoutOrder > 1 and p1.gamepadRefs[LayoutOrder - 1] or nil,
		NextSelectionDown = LayoutOrder < #p1.props.items and p1.gamepadRefs[LayoutOrder + 1] or nil,
		SelectionImageObject = p1.props.cursor
	})
end

function SmallRadioButtonGroup.render(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy)
	assert(p1.validateProps(p1.props))
	local config = {
		layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	local IsRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	
	for i, item in ipairs(p1.props.items) do
		if not IsRoactGamepadEnabled then
			p1.gamepadRefs[i] = p1.gamepadRefs[i] or RoactModule.createRef()
		end
		config["smallRadioButtonCell" .. item.id] = p1:renderButtonCell(item, i, IsRoactGamepadEnabled)
	end
	local v1: boolean = IsRoactGamepadEnabled and (p1.props.items and #p1.props.items > 0)
	
	return RoactModule.createElement(if v1 then RoactGamepadModule.Focusable.Frame else "Frame", {
		defaultChild = if v1 then p1.gamepadRefs[1] else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionDown = p1.props.NextSelectionDown,
		NextSelectionUp = p1.props.NextSelectionUp,
		[RoactModule.Ref] = p1.props.frameRef
	}, config)
end

return RoactModule.forwardRef(function(p2, FrameRef)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), SmallRadioButtonGroup (copy), CryoModule (copy)
	return RoactModule.createElement(SmallRadioButtonGroup, CryoModule.Dictionary.join(p2, {
		frameRef = FrameRef,
		cursor = UseCursorByTypeModule(CursorTypeModule.SelectionCell)
	}))
end)