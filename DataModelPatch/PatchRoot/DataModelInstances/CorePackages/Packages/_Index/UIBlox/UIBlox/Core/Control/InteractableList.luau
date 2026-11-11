local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local CryoModule = require(Parent1.Cryo)
local ControlStateModule = require(Parent.Core.Control.Enum.ControlState)
local InteractableListItemModule = require(script.Parent.InteractableListItem)
local SelectionModeModule = require(script.Parent.Enum.SelectionMode)
local InteractableList = RoactModule.PureComponent:extend("InteractableList")
InteractableList.validateProps = TModule.strictInterface({
	itemList = TModule.table,
	renderItem = TModule.callback,
	renderList = TModule.optional(TModule.callback),
	selection = TModule.optional(TModule.table),
	selectionMode = TModule.optional(SelectionModeModule.isEnumValue),
	onSelectionChanged = TModule.optional(TModule.callback),
	size = TModule.optional(TModule.UDim2),
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.integer),
	padding = TModule.optional(TModule.UDim),
	fillDirection = TModule.optional(TModule.enum(Enum.FillDirection)),
	horizontalAlignment = TModule.optional(TModule.enum(Enum.HorizontalAlignment)),
	verticalAlignment = TModule.optional(TModule.enum(Enum.VerticalAlignment)),
	sortOrder = TModule.optional(TModule.enum(Enum.SortOrder)),
	automaticSize = TModule.optional(TModule.enum(Enum.AutomaticSize)),
	itemSize = TModule.optional(TModule.union(TModule.UDim2, require(Parent.Core.Utility.bindingValidator)(TModule.UDim2)))
})
InteractableList.defaultProps = {
	renderList = function(List, Callback, p1)
		-- upvalues: RoactModule (copy)
		local List1 = {
			RoactModule.createElement("UIListLayout", {
				key = "$layout",
				Padding = p1.padding,
				FillDirection = p1.fillDirection,
				HorizontalAlignment = p1.horizontalAlignment,
				VerticalAlignment = p1.verticalAlignment,
				SortOrder = p1.sortOrder
			})
		}
		
		for i in pairs(List) do
			table.insert(List1, Callback(i))
		end
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = p1.size,
			Position = p1.position,
			AutomaticSize = p1.automaticSize
		}, List1)
	end,
	size = UDim2.fromScale(1, 1),
	itemSize = UDim2.fromScale(1, 1),
	selectionMode = SelectionModeModule.Single
}

function InteractableList.init(p2)
	-- upvalues: SelectionModeModule (copy), CryoModule (copy)
	local config = { interactable = {}, selection = {} }
	
	if p2.props.selectionMode == SelectionModeModule.Single then
		local NextEntry = next(p2.props.itemList)
		
		if NextEntry ~= nil then
			config.selection = { NextEntry }
		end
	end
	p2:setState(config)
	
	function p2.setInteractableState(p3, p4)
		-- upvalues: p2 (copy), CryoModule (upval)
		p2:setState(function(p5)
			-- upvalues: CryoModule (upval), p3 (copy), p4 (copy)
			return {
				interactable = CryoModule.Dictionary.join(p5.interactable, { [p3] = p4 })
			}
		end)
	end
	
	function p2.setSelection(Selection)
		-- upvalues: p2 (copy)
		p2:setState({ selection = Selection })
	end
end

function InteractableList.getSelection(p2)
	-- upvalues: SelectionModeModule (copy), CryoModule (copy)
	if p2.props.selection then
		return p2.props.selection
	end
	if p2.props.selectionMode == SelectionModeModule.None then
		return {}
	end
	local FilterResult = CryoModule.List.filter(p2.state.selection, function(p3): boolean
		-- upvalues: p2 (copy)
		return p2.props.itemList[p3] ~= nil
	end)
	
	if p2.props.selectionMode ~= SelectionModeModule.Single then
		return FilterResult
	end
	local FilterResultEntry = FilterResult[#FilterResult]
	
	if FilterResultEntry == nil then
		FilterResultEntry = next(p2.props.itemList)
	end
	return if FilterResultEntry == nil then {} else { FilterResultEntry }
end

function InteractableList.didMount(p2)
	if p2.props.selection == nil and p2.props.onSelectionChanged then
		p2.props.onSelectionChanged(p2:getSelection())
	end
end

function InteractableList.render(p2)
	-- upvalues: ControlStateModule (copy), RoactModule (copy), InteractableListItemModule (copy)
	return p2.props.renderList(p2.props.itemList, function(Id)
		-- upvalues: p2 (copy), ControlStateModule (upval), RoactModule (upval), InteractableListItemModule (upval)
		return RoactModule.createElement(InteractableListItemModule, {
			id = Id,
			item = p2.props.itemList[Id],
			interactableState = p2.state.interactable[Id] or ControlStateModule.Default,
			selection = p2:getSelection(),
			renderItem = p2.props.renderItem,
			itemSize = p2.props.itemList[Id] and p2.props.itemList[Id].itemSize or p2.props.itemSize,
			selectionMode = p2.props.selectionMode,
			onSelectionChanged = p2.props.onSelectionChanged,
			setInteractableState = p2.setInteractableState,
			setSelection = p2.setSelection,
			key = tostring(Id)
		})
	end, p2.props)
end

return InteractableList