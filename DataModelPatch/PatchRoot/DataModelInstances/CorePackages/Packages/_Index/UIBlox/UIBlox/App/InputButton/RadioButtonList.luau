local Parent = script.Parent.Parent.Parent.Parent
local UIBlox = Parent.UIBlox
local RoactModule = require(Parent.Roact)
local RoactGamepadModule = require(Parent.RoactGamepad)
local TModule = require(Parent.t)
local RadioButtonModule = require(script.Parent.RadioButton)
local CryoModule = require(Parent.Cryo)
local UseCursorByTypeModule = require(UIBlox.App.SelectionCursor.useCursorByType)
local CursorTypeModule = require(UIBlox.App.SelectionCursor.CursorType)
local RadioButtonList = RoactModule.PureComponent:extend("RadioButtonList")
RadioButtonList.validateProps = TModule.strictInterface({
	radioButtons = TModule.array(TModule.union(TModule.string, (TModule.strictInterface({
		label = TModule.string,
		isDisabled = TModule.optional(TModule.boolean)
	})))),
	onActivated = TModule.callback,
	elementSize = TModule.UDim2,
	initialValue = TModule.optional(TModule.number),
	currentValue = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number),
	padding = TModule.optional(TModule.UDim),
	automaticSize = TModule.optional(TModule.boolean),
	cursor = TModule.table,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
RadioButtonList.defaultProps = { isRoactGamepadEnabled = true }

function RadioButtonList.init(p1)
	-- upvalues: RoactGamepadModule (copy)
	p1.state = { currentValue = p1.props.initialValue or 0 }
	local DisabledIndices = {}
	
	for i, radioButton in ipairs(p1.props.radioButtons) do
		DisabledIndices[i] = type(radioButton) == "table" and radioButton.isDisabled or false
	end
	p1.state.disabledIndices = DisabledIndices
	
	function p1.doLogic(CurrentValue)
		-- upvalues: p1 (copy)
		if not p1.state.disabledIndices[CurrentValue] then
			p1:setState({ currentValue = CurrentValue })
			p1.props.onActivated(CurrentValue)
			
			return
		end
	end
	
	p1.gamepadRefs = p1.props.isRoactGamepadEnabled and RoactGamepadModule.createRefCache() or {}
end

function RadioButtonList.renderWithProviders(p2, _, SelectionImageObject)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), RadioButtonModule (copy)
	local config = {
		layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p2.props.padding
		})
	}
	
	for CurrentValue, radioButton in ipairs(p2.props.radioButtons) do
		if not p2.props.isRoactGamepadEnabled then
			p2.gamepadRefs[CurrentValue] = p2.gamepadRefs[CurrentValue] or RoactModule.createRef()
		end
		config["RadioButton" .. CurrentValue] = RoactModule.createElement(if p2.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[RadioButtonModule] else RadioButtonModule, {
			text = type(radioButton) == "table" and radioButton.label or radioButton,
			isSelected = if p2.props.currentValue == nil then CurrentValue == p2.state.currentValue else CurrentValue == p2.props.currentValue,
			isDisabled = p2.state.disabledIndices[CurrentValue],
			onActivated = p2.doLogic,
			size = p2.props.elementSize,
			layoutOrder = CurrentValue,
			id = CurrentValue,
			isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled,
			[RoactModule.Ref] = p2.gamepadRefs[CurrentValue],
			NextSelectionUp = CurrentValue > 1 and p2.gamepadRefs[CurrentValue - 1] or nil,
			NextSelectionDown = CurrentValue < #p2.props.radioButtons and p2.gamepadRefs[CurrentValue + 1] or nil,
			SelectionImageObject = SelectionImageObject,
			inputBindings = if p2.props.isRoactGamepadEnabled then {
				OnActivatedButton = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function()
					-- upvalues: p2 (copy), CurrentValue (copy)
					p2.doLogic(CurrentValue)
				end)
			} else nil
		})
	end
	return RoactModule.createElement(if p2.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
		Size = if p2.props.automaticSize then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1),
		AutomaticSize = if p2.props.automaticSize then Enum.AutomaticSize.Y else nil,
		BackgroundTransparency = 1,
		LayoutOrder = p2.props.layoutOrder,
		[RoactModule.Ref] = p2.props.forwardRef,
		NextSelectionLeft = p2.props.NextSelectionLeft,
		NextSelectionRight = p2.props.NextSelectionRight,
		NextSelectionDown = p2.props.NextSelectionDown,
		NextSelectionUp = p2.props.NextSelectionUp
	}, config)
end

function RadioButtonList.render(p3)
	return p3:renderWithProviders(nil, p3.props.cursor)
end

return RoactModule.forwardRef(function(p3, ForwardRef)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), RadioButtonList (copy), CryoModule (copy)
	return RoactModule.createElement(RadioButtonList, CryoModule.Dictionary.join(p3, {
		forwardRef = ForwardRef,
		cursor = UseCursorByTypeModule(CursorTypeModule.RoundedRect)
	}))
end)