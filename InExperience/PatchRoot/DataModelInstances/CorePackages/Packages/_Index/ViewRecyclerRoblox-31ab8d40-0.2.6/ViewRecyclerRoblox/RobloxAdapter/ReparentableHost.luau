local SlotGeometryModule = require(script:FindFirstAncestor("ViewRecyclerRoblox").RobloxAdapter.SlotGeometry)
local GuiService = game:GetService("GuiService")
local ReparentableHostModule = {
	clearSelection = function(Ancestor) --[[ Line: 13 ]]
		-- upvalues: GuiService (copy)
		local SelectedObject = GuiService.SelectedObject
		
		if SelectedObject ~= nil and (SelectedObject == Ancestor or SelectedObject:IsDescendantOf(Ancestor)) then
			GuiService.SelectedObject = nil
		end
	end,
	create = function(Name) --[[ Line: 20 ]]
		local Frame = Instance.new("Frame")
		Frame.Name = Name
		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new()
		Frame.Size = UDim2.new()
		
		return Frame
	end,
	place = function(p1, p2) --[[ Line: 30 ]]
		-- upvalues: SlotGeometryModule (copy)
		p1.AutomaticSize = p2.automaticSize
		p1.Size = SlotGeometryModule.getHostSize(p2.automaticSize)
		p1.Parent = p2.placeholder
	end
}

function ReparentableHostModule.detach(p1) --[[ Line: 36 ]]
	-- upvalues: ReparentableHostModule (copy)
	ReparentableHostModule.clearSelection(p1)
	p1.Parent = nil
end

function ReparentableHostModule.destroy(Object) --[[ Line: 41 ]]
	-- upvalues: ReparentableHostModule (copy)
	ReparentableHostModule.detach(Object)
	Object:Destroy()
end

return ReparentableHostModule