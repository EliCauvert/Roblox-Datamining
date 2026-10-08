local slotGeometryModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.SlotGeometry)
local guiService = game:GetService("GuiService")
local t = {
	clearSelection = function(p1)
		-- upvalues: guiService (ref)
		local selectedObject = guiService.SelectedObject
		
		if selectedObject ~= nil and (selectedObject == p1 or selectedObject:IsDescendantOf(p1)) then
			guiService.SelectedObject = nil
		end
	end,
	create = function(p1)
		local frame = Instance.new("Frame")
		frame.Name = p1
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new()
		frame.Size = UDim2.new()
		
		return frame
	end,
	place = function(p1, p2)
		-- upvalues: slotGeometryModule (ref)
		p1.AutomaticSize = p2.automaticSize
		p1.Size = slotGeometryModule.getHostSize(p2.automaticSize)
		p1.Parent = p2.placeholder
	end
}

function t.detach(p1)
	-- upvalues: t (ref)
	t.clearSelection(p1)
	p1.Parent = nil
end

function t.destroy(p1)
	-- upvalues: t (ref)
	t.detach(p1)
	p1:Destroy()
end

return t