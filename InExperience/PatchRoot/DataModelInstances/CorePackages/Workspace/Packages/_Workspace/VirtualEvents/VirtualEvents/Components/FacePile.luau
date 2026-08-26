local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local uDim = UDim.new(0, 12)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), uDim (ref)
	local t = {}
	
	for i, v in reactModule.useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy)
		if p1.desiredFirstUserId then
			local var1 = cryoModule.List.find(p1.userIds, p1.desiredFirstUserId)
			
			if var1 then
				local cloned = table.clone(p1.userIds)
				table.remove(cloned, var1)
				table.insert(cloned, 1, p1.desiredFirstUserId)
				
				return cloned
			end
		end
		return p1.userIds
	end, { p1.userIds, p1.desiredFirstUserId }) do
		t[v] = reactModule.createElement("ImageLabel", {
			LayoutOrder = i,
			BackgroundColor3 = Color3.fromRGB(209, 209, 209),
			Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(v),
			Size = UDim2.fromOffset(36, 36)
		}, {
			BorderRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = uDim
		}),
		Faces = reactModule.createElement(reactModule.Fragment, nil, t)
	})
end