local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local cryoModule = require(parent_1.Cryo)
local bindingValidatorModule = require(parent.Core.Utility.bindingValidator)
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local interactableListItemModule = require(script.Parent.InteractableListItem)
local selectionModeModule = require(script.Parent.Enum.SelectionMode)
local interactableList = roactModule.PureComponent:extend("InteractableList")
interactableList.validateProps = tModule.strictInterface({
	itemList = tModule.table,
	renderItem = tModule.callback,
	renderList = tModule.optional(tModule.callback),
	selection = tModule.optional(tModule.table),
	selectionMode = tModule.optional(selectionModeModule.isEnumValue),
	onSelectionChanged = tModule.optional(tModule.callback),
	size = tModule.optional(tModule.UDim2),
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.integer),
	padding = tModule.optional(tModule.UDim),
	fillDirection = tModule.optional(tModule.enum(Enum.FillDirection)),
	horizontalAlignment = tModule.optional(tModule.enum(Enum.HorizontalAlignment)),
	verticalAlignment = tModule.optional(tModule.enum(Enum.VerticalAlignment)),
	sortOrder = tModule.optional(tModule.enum(Enum.SortOrder)),
	automaticSize = tModule.optional(tModule.enum(Enum.AutomaticSize)),
	itemSize = tModule.optional(tModule.union(tModule.UDim2, bindingValidatorModule(tModule.UDim2)))
})
interactableList.defaultProps = {
	renderList = function(p1, p2, p3)
		-- upvalues: roactModule (ref)
		local list = {
			roactModule.createElement("UIListLayout", {
				key = "$layout",
				Padding = p3.padding,
				FillDirection = p3.fillDirection,
				HorizontalAlignment = p3.horizontalAlignment,
				VerticalAlignment = p3.verticalAlignment,
				SortOrder = p3.sortOrder
			})
		}
		
		for i in pairs(p1) do
			table.insert(list, p2(i))
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = p3.size,
			Position = p3.position,
			AutomaticSize = p3.automaticSize
		}, list)
	end,
	size = UDim2.fromScale(1, 1),
	itemSize = UDim2.fromScale(1, 1),
	selectionMode = selectionModeModule.Single
}

function interactableList.init(p4)
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	local t = { interactable = {}, selection = {} }
	
	if p4.props.selectionMode == selectionModeModule.Single then
		local var1 = next(p4.props.itemList)
		
		if var1 ~= nil then
			t.selection = { var1 }
		end
	end
	p4:setState(t)
	
	function p3.setInteractableState(p5, p6)
		-- upvalues: p4 (ref), cryoModule (copy)
		p4:setState(function(p7)
			-- upvalues: cryoModule (copy), p5 (ref), p6 (ref)
			return {
				interactable = cryoModule.Dictionary.join(p7.interactable, { [p5] = p6 })
			}
		end)
	end
	
	function p3.setSelection(p5)
		-- upvalues: p4 (ref)
		p4:setState({ selection = p5 })
	end
end

function interactableList.getSelection(p4)
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	if p4.props.selection then
		return p4.props.selection
	elseif p4.props.selectionMode == selectionModeModule.None then
		return {}
	end
	local var1 = cryoModule.List.filter(p4.state.selection, function(p5)
		-- upvalues: p4 (ref)
		return p4.props.itemList[p5] ~= nil
	end)
	
	if p4.props.selectionMode ~= selectionModeModule.Single then
		return var1
	end
	local var2 = var1[#var1]
	
	if var2 == nil then
		var2 = next(p4.props.itemList)
	end
	return if var2 == nil then {} else { var2 }
end

function interactableList.didMount(p4)
	if p4.props.selection == nil and p4.props.onSelectionChanged then
		p4.props.onSelectionChanged(p4:getSelection())
	end
end

function interactableList.render(p4)
	-- upvalues: controlStateModule (ref), roactModule (ref), interactableListItemModule (ref)
	return p4.props.renderList(p4.props.itemList, function(p5)
		-- upvalues: p4 (ref), controlStateModule (copy), roactModule (copy), interactableListItemModule (copy)
		return roactModule.createElement(interactableListItemModule, {
			id = p5,
			item = p4.props.itemList[p5],
			interactableState = p4.state.interactable[p5] or controlStateModule.Default,
			selection = p4:getSelection(),
			renderItem = p4.props.renderItem,
			itemSize = if p4.props.itemList[p5] then p4.props.itemList[p5].itemSize else p4.props.itemSize,
			selectionMode = p4.props.selectionMode,
			onSelectionChanged = p4.props.onSelectionChanged,
			setInteractableState = p4.setInteractableState,
			setSelection = p4.setSelection,
			key = tostring(p5)
		})
	end, p4.props)
end

return interactableList