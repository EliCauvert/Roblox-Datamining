local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local InteractableModule = require(Parent.Core.Control.Interactable)
local SelectionModeModule = require(script.Parent.Enum.SelectionMode)
local InteractableListItem = RoactModule.PureComponent:extend("InteractableListItem")

function InteractableListItem.init(p1)
	-- upvalues: SelectionModeModule (copy), CryoModule (copy)
	function p1:onStateChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.setInteractableState(p1.props.id, p2)
	end
	
	function p1.onActivated()
		-- upvalues: p1 (copy), SelectionModeModule (upval), CryoModule (upval)
		local Selection = p1.props.selection
		local FilterResult = { p1.props.id }
		
		if p1.props.selectionMode == SelectionModeModule.Multiple then
			FilterResult = CryoModule.List.filter(Selection, function(Id): boolean
				-- upvalues: p1 (upval)
				return Id ~= p1.props.id
			end)
			
			if #FilterResult == #Selection then
				table.insert(FilterResult, p1.props.id)
			end
		end
		if p1.props.onSelectionChanged then
			p1.props.onSelectionChanged(FilterResult, Selection)
		end
		if p1.props.selectionMode ~= SelectionModeModule.None then
			p1.props.setSelection(FilterResult)
		end
	end
end

function InteractableListItem.render(p1)
	-- upvalues: CryoModule (copy), RoactModule (copy), InteractableModule (copy)
	local RenderItemResult, RenderItemResult2 = p1.props.renderItem(p1.props.item, p1.props.interactableState, CryoModule.List.find(p1.props.selection, p1.props.id) ~= nil, p1.props.id)
	
	return RoactModule.createElement(InteractableModule, CryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.props.itemSize
	}, RenderItemResult2 or {}, {
		onStateChanged = p1.onStateChanged,
		[RoactModule.Event.Activated] = p1.onActivated
	}), RenderItemResult)
end

return InteractableListItem