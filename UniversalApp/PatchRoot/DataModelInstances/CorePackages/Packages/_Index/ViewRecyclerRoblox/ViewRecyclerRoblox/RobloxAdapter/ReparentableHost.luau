local slotGeometryModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.SlotGeometry)
local guiService = game:GetService("GuiService")
local t = {
	clearSelection = function(p0)
		-- upvalues: guiService (ref)
		local selectedObject = guiService.SelectedObject
		
		if selectedObject ~= nil and (selectedObject == p0 or selectedObject:IsDescendantOf(p0)) then
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
	place = function(p2, p3)
		-- upvalues: slotGeometryModule (ref)
		p2.AutomaticSize = p3.automaticSize
		p2.Size = slotGeometryModule.getHostSize(p3.automaticSize)
		p2.Parent = p3.placeholder
	end
}

function t.detach(p4)
	-- upvalues: t (ref)
	t.clearSelection(p4)
	p4.Parent = nil
end

function t.destroy(p5)
	-- upvalues: t (ref)
	t.detach(p5)
	p5:Destroy()
end

return t