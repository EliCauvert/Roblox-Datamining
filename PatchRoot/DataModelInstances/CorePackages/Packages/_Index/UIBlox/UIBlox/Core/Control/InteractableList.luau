-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

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
	renderList = function(p0, p1, p2) --[[ line: 60 ]]
		-- upvalues: roactModule (ref)
		local list = {
			roactModule.createElement("UIListLayout", {
				key = "$layout",
				Padding = p2.padding,
				FillDirection = p2.fillDirection,
				HorizontalAlignment = p2.horizontalAlignment,
				VerticalAlignment = p2.verticalAlignment,
				SortOrder = p2.sortOrder
			})
		}
		
		for i in pairs(p0) do
			table.insert(list, p1(i))
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = p2.size,
			Position = p2.position,
			AutomaticSize = p2.automaticSize
		}, list)
	end,
	size = UDim2.fromScale(1, 1),
	itemSize = UDim2.fromScale(1, 1),
	selectionMode = selectionModeModule.Single
}

function interactableList.init(p3) --[[ line: 88 ]]
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	local t = { interactable = {}, selection = {} }
	
	if p3.props.selectionMode == selectionModeModule.Single then
		local var10 = next(p3.props.itemList)
		
		if var10 ~= nil then
			t.selection = { var10 }
		end
	end
	p3:setState(t)
	
	function p3.setInteractableState(p4, p5) --[[ line: 101 ]]
		-- upvalues: p3 (ref), cryoModule (copy)
		p3:setState(function(p6) --[[ line: 102 ]]
			-- upvalues: cryoModule (copy), p4 (ref), p5 (ref)
			return {
				interactable = cryoModule.Dictionary.join(p6.interactable, { [p4] = p5 })
			}
		end)
	end
	
	function p3.setSelection(p7) --[[ line: 110 ]]
		-- upvalues: p3 (ref)
		p3:setState({ selection = p7 })
	end
end

function interactableList.getSelection(p8) --[[ line: 117 ]]
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	if p8.props.selection then
		return p8.props.selection
	elseif p8.props.selectionMode == selectionModeModule.None then
		return {}
	end
	local var11 = cryoModule.List.filter(p8.state.selection, function(p9) --[[ line: 124 ]]
		-- upvalues: p8 (ref)
		return p8.props.itemList[p9] ~= nil
	end)
	
	if p8.props.selectionMode ~= selectionModeModule.Single then
		return var11
	end
	local var12 = var11[#var11]
	
	if var12 == nil then
		var12 = next(p8.props.itemList)
	end
	return if var12 == nil then {} else { var12 }
end

function interactableList.didMount(p10) --[[ line: 142 ]]
	if p10.props.selection == nil and p10.props.onSelectionChanged then
		p10.props.onSelectionChanged(p10:getSelection())
	end
end

function interactableList.render(p11) --[[ line: 148 ]]
	-- upvalues: controlStateModule (ref), roactModule (ref), interactableListItemModule (ref)
	return p11.props.renderList(p11.props.itemList, function(p12) --[[ line: 149 ]]
		-- upvalues: p11 (ref), controlStateModule (copy), roactModule (copy), interactableListItemModule (copy)
		return roactModule.createElement(interactableListItemModule, {
			id = p12,
			item = p11.props.itemList[p12],
			interactableState = p11.state.interactable[p12] or controlStateModule.Default,
			selection = p11:getSelection(),
			renderItem = p11.props.renderItem,
			itemSize = if p11.props.itemList[p12] then p11.props.itemList[p12].itemSize else p11.props.itemSize,
			selectionMode = p11.props.selectionMode,
			onSelectionChanged = p11.props.onSelectionChanged,
			setInteractableState = p11.setInteractableState,
			setSelection = p11.setSelection,
			key = tostring(p12)
		})
	end, p11.props)
end

return interactableList