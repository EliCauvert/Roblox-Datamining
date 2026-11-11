local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local _UDim = UDim.new(0, 12)

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), _UDim (copy)
	local ImageLabels = {}
	
	for LayoutOrder, value in ReactModule.useMemo(function()
		-- upvalues: p1 (copy), CryoModule (upval)
		if p1.desiredFirstUserId then
			local FindResult = CryoModule.List.find(p1.userIds, p1.desiredFirstUserId)
			
			if FindResult then
				local Copy = table.clone(p1.userIds)
				table.remove(Copy, FindResult)
				table.insert(Copy, 1, p1.desiredFirstUserId)
				
				return Copy
			end
		end
		return p1.userIds
	end, { p1.userIds, p1.desiredFirstUserId }) do
		ImageLabels[value] = ReactModule.createElement("ImageLabel", {
			LayoutOrder = LayoutOrder,
			BackgroundColor3 = Color3.fromRGB(209, 209, 209),
			Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(value),
			Size = UDim2.fromOffset(36, 36)
		}, {
			BorderRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = _UDim
		}),
		Faces = ReactModule.createElement(ReactModule.Fragment, nil, ImageLabels)
	})
end