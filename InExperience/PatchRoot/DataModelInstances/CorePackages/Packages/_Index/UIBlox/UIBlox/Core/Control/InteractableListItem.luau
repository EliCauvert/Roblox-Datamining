local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local interactableModule = require(parent.Core.Control.Interactable)
local selectionModeModule = require(script.Parent.Enum.SelectionMode)
local interactableListItem = roactModule.PureComponent:extend("InteractableListItem")

function interactableListItem.init(p1)
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	function p0.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1.props.setInteractableState(p1.props.id, p2)
	end
	
	function p0.onActivated()
		-- upvalues: p1 (ref), selectionModeModule (copy), cryoModule (copy)
		local selection = p1.props.selection
		local list = { p1.props.id }
		
		if p1.props.selectionMode == selectionModeModule.Multiple then
			list = cryoModule.List.filter(selection, function(p2)
				-- upvalues: p1 (copy)
				return p2 ~= p1.props.id
			end)
			
			if #list == #selection then
				table.insert(list, p1.props.id)
			end
		end
		if p1.props.onSelectionChanged then
			p1.props.onSelectionChanged(list, selection)
		end
		if p1.props.selectionMode ~= selectionModeModule.None then
			p1.props.setSelection(list)
		end
	end
end

function interactableListItem.render(p1)
	-- upvalues: cryoModule (ref), roactModule (ref), interactableModule (ref)
	local var1, var2 = p1.props.renderItem(p1.props.item, p1.props.interactableState, cryoModule.List.find(p1.props.selection, p1.props.id) ~= nil, p1.props.id)
	
	return roactModule.createElement(interactableModule, cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.itemSize
	}, var2 or {}, {
		onStateChanged = p1.onStateChanged,
		[roactModule.Event.Activated] = p1.onActivated
	}), var1)
end

return interactableListItem