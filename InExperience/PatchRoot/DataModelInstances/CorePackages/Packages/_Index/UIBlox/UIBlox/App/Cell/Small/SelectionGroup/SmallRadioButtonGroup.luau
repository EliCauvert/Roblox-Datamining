local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local roactGamepadModule = require(parent_2.RoactGamepad)
local tModule = require(parent_2.t)
local cursorTypeModule = require(parent.SelectionCursor.CursorType)
local useCursorByTypeModule = require(parent.SelectionCursor.useCursorByType)
local smallRadioButtonCellModule = require(parent_1.App.Cell.Small.SelectionGroup.SmallRadioButtonCell)
local smallRadioButtonGroup = roactModule.PureComponent:extend("SmallRadioButtonGroup")
smallRadioButtonGroup.validateProps = tModule.strictInterface({
	items = tModule.optional(tModule.array(tModule.tuple(tModule.strictInterface({
		text = tModule.string,
		id = tModule.string,
		isDisabled = tModule.optional(tModule.boolean)
	})))),
	selectedValue = tModule.optional(tModule.string),
	cursor = tModule.optional(tModule.table),
	onActivated = tModule.callback,
	layoutOrder = tModule.optional(tModule.number),
	useDefaultControlState = tModule.optional(tModule.boolean),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	frameRef = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
smallRadioButtonGroup.defaultProps = { selectedValue = nil, isRoactGamepadEnabled = true }

function smallRadioButtonGroup.init(p1)
	-- upvalues: roactGamepadModule (ref)
	p1.gamepadRefs = p1.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
end

function smallRadioButtonGroup.renderButtonCell(p1, p2, p3, p4)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), smallRadioButtonCellModule (ref)
	return roactModule.createElement(if p4 then roactGamepadModule.Focusable[smallRadioButtonCellModule] else smallRadioButtonCellModule, {
		id = p2.id,
		text = p2.text,
		onActivated = p1.props.onActivated,
		isSelected = p1.props.selectedValue == p2.id,
		isDisabled = p2.isDisabled,
		layoutOrder = p3,
		useDefaultControlState = p1.props.useDefaultControlState,
		[roactModule.Ref] = p1.gamepadRefs[p3],
		NextSelectionUp = if p3 > 1 then p1.gamepadRefs[p3 - 1] else nil,
		NextSelectionDown = if p3 < #p1.props.items then p1.gamepadRefs[p3 + 1] else nil,
		SelectionImageObject = p1.props.cursor
	})
end

function smallRadioButtonGroup.render(p1)
	-- upvalues: roactModule (ref), roactGamepadModule (ref)
	assert(p1.validateProps(p1.props))
	local t = {
		layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	local isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	
	for i, v in ipairs(p1.props.items) do
		if not isRoactGamepadEnabled then
			p1.gamepadRefs[i] = p1.gamepadRefs[i] or roactModule.createRef()
		end
		t["smallRadioButtonCell" .. v.id] = p1:renderButtonCell(v, i, isRoactGamepadEnabled)
	end
	local var1 = isRoactGamepadEnabled and (p1.props.items and #p1.props.items > 0)
	
	return roactModule.createElement(if var1 then roactGamepadModule.Focusable.Frame else "Frame", {
		defaultChild = if var1 then p1.gamepadRefs[1] else nil,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionDown = p1.props.NextSelectionDown,
		NextSelectionUp = p1.props.NextSelectionUp,
		[roactModule.Ref] = p1.props.frameRef
	}, t)
end

return roactModule.forwardRef(function(p2, p3)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), smallRadioButtonGroup (ref), cryoModule (ref)
	return roactModule.createElement(smallRadioButtonGroup, cryoModule.Dictionary.join(p2, {
		frameRef = p3,
		cursor = useCursorByTypeModule(cursorTypeModule.SelectionCell)
	}))
end)