-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local interactableModule = require(parent.Core.Control.Interactable)
local selectionModeModule = require(script.Parent.Enum.SelectionMode)
local interactableListItem = roactModule.PureComponent:extend("InteractableListItem")

function interactableListItem.init(p0) --[[ line: 20 ]]
	-- upvalues: selectionModeModule (ref), cryoModule (ref)
	function p0.onStateChanged(_, p1) --[[ line: 21 ]]
		-- upvalues: p0 (ref)
		p0.props.setInteractableState(p0.props.id, p1)
	end
	
	function p0.onActivated() --[[ line: 24 ]]
		-- upvalues: p0 (ref), selectionModeModule (copy), cryoModule (copy)
		local selection = p0.props.selection
		local list = { p0.props.id }
		
		if p0.props.selectionMode == selectionModeModule.Multiple then
			list = cryoModule.List.filter(selection, function(p2) --[[ line: 28 ]]
				-- upvalues: p0 (copy)
				return p2 ~= p0.props.id
			end)
			
			if #list == #selection then
				table.insert(list, p0.props.id)
			end
		end
		if p0.props.onSelectionChanged then
			p0.props.onSelectionChanged(list, selection)
		end
		if p0.props.selectionMode ~= selectionModeModule.None then
			p0.props.setSelection(list)
		end
	end
end

function interactableListItem.render(p3) --[[ line: 44 ]]
	-- upvalues: cryoModule (ref), roactModule (ref), interactableModule (ref)
	local var6, var7 = p3.props.renderItem(p3.props.item, p3.props.interactableState, cryoModule.List.find(p3.props.selection, p3.props.id) ~= nil, p3.props.id)
	
	return roactModule.createElement(interactableModule, cryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p3.props.itemSize
	}, var7 or {}, {
		onStateChanged = p3.onStateChanged,
		[roactModule.Event.Activated] = p3.onActivated
	}), var6)
end

return interactableListItem