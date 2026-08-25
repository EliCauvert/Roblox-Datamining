local parent = script.Parent.Parent.Parent.Parent
local UIBlox = parent.UIBlox
local roactModule = require(parent.Roact)
local roactGamepadModule = require(parent.RoactGamepad)
local tModule = require(parent.t)
local radioButtonModule = require(script.Parent.RadioButton)
local cryoModule = require(parent.Cryo)
local useCursorByTypeModule = require(UIBlox.App.SelectionCursor.useCursorByType)
local cursorTypeModule = require(UIBlox.App.SelectionCursor.CursorType)
local radioButtonList = roactModule.PureComponent:extend("RadioButtonList")
radioButtonList.validateProps = tModule.strictInterface({
	radioButtons = tModule.array(tModule.union(tModule.string, tModule.strictInterface({
		label = tModule.string,
		isDisabled = tModule.optional(tModule.boolean)
	}))),
	onActivated = tModule.callback,
	elementSize = tModule.UDim2,
	initialValue = tModule.optional(tModule.number),
	currentValue = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.number),
	padding = tModule.optional(tModule.UDim),
	automaticSize = tModule.optional(tModule.boolean),
	cursor = tModule.table,
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	forwardRef = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
radioButtonList.defaultProps = { isRoactGamepadEnabled = true }

function radioButtonList.init(p0)
	-- upvalues: roactGamepadModule (ref)
	p0.state = { currentValue = p0.props.initialValue or 0 }
	local t = {}
	
	for i, v in ipairs(p0.props.radioButtons) do
		t[i] = type(v) == "table" and v.isDisabled
	end
	p0.state.disabledIndices = t
	
	function p0.doLogic(p1)
		-- upvalues: p0 (ref)
		if p0.state.disabledIndices[p1] then
			return
		end
		p0:setState({ currentValue = p1 })
		p0.props.onActivated(p1)
	end
	
	p0.gamepadRefs = p0.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
end

function radioButtonList.renderWithProviders(p2, _, p3)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), radioButtonModule (ref)
	local t = {
		layout = roactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p2.props.padding
		})
	}
	
	for i, v in ipairs(p2.props.radioButtons) do
		if not p2.props.isRoactGamepadEnabled then
			p2.gamepadRefs[i] = p2.gamepadRefs[i] or roactModule.createRef()
		end
		local var13
		local text = "RadioButton" .. i
		local createElement = roactModule.createElement
		local var11 = if p2.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[radioButtonModule] else radioButtonModule
		local t_1 = { text = if type(v) == "table" then v.label else v }
		
		if p2.props.currentValue == nil then
			var13 = i == p2.state.currentValue
		else
			var13 = i == p2.props.currentValue
			var13 = nil
		end
		t_1.isSelected = var13
		t_1.isDisabled = p2.state.disabledIndices[i]
		t_1.onActivated = p2.doLogic
		t_1.size = p2.props.elementSize
		t_1.layoutOrder = i
		t_1.id = i
		t_1.isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled
		t_1[roactModule.Ref] = p2.gamepadRefs[i]
		t_1.NextSelectionUp = if i > 1 then p2.gamepadRefs[i - 1] else nil
		t_1.NextSelectionDown = if i < #p2.props.radioButtons then p2.gamepadRefs[i + 1] else nil
		t_1.SelectionImageObject = p3
		t_1.inputBindings = if p2.props.isRoactGamepadEnabled then {
			OnActivatedButton = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
				-- upvalues: p2 (ref), i (ref)
				p2.doLogic(i)
			end)
		} else nil
		t[text] = createElement(var11, t_1)
	end
	return roactModule.createElement(if p2.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
		Size = if p2.props.automaticSize then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1),
		AutomaticSize = if p2.props.automaticSize then Enum.AutomaticSize.Y else nil,
		BackgroundTransparency = 1,
		LayoutOrder = p2.props.layoutOrder,
		[roactModule.Ref] = p2.props.forwardRef,
		NextSelectionLeft = p2.props.NextSelectionLeft,
		NextSelectionRight = p2.props.NextSelectionRight,
		NextSelectionDown = p2.props.NextSelectionDown,
		NextSelectionUp = p2.props.NextSelectionUp
	}, t)
end

function radioButtonList.render(p4)
	return p4:renderWithProviders(nil, p4.props.cursor)
end

return roactModule.forwardRef(function(p5, p6)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), radioButtonList (ref), cryoModule (ref)
	return roactModule.createElement(radioButtonList, cryoModule.Dictionary.join(p5, {
		forwardRef = p6,
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRect)
	}))
end)