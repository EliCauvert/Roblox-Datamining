local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local uDim = UDim.new(0, -8)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), uDim (ref), image (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy)
		return if p1.desiredFirstUserId and cryoModule.List.find(p1.userIds, p1.desiredFirstUserId) then p1.desiredFirstUserId else p1.userIds[1]
	end, { p1.userIds, p1.desiredFirstUserId })
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1.userIds[2] or nil
	end, { p1.userIds })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = uDim
		}),
		FirstUser = if var2 then reactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundColor3 = var1.Inverse.Surface.Surface_300.Color3,
			Size = UDim2.fromOffset(25, 25),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			FirstUserFace = reactModule.createElement(image, {
				ZIndex = 4,
				tag = "radius-circle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(var2),
				backgroundStyle = {
					Transparency = 0,
					Color3 = var1.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil,
		SecondUser = if var3 then reactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundColor3 = var1.Inverse.Surface.Surface_300.Color3,
			Size = UDim2.fromOffset(25, 25),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			SecondUserFace = reactModule.createElement(image, {
				ZIndex = 2,
				tag = "radius-circle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(var3),
				backgroundStyle = {
					Transparency = 0,
					Color3 = var1.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil
	})
end