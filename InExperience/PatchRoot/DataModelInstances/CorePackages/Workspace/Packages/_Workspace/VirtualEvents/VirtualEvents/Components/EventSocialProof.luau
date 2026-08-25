local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens
local uDim = UDim.new(0, -8)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), uDim (ref), image (ref)
	local var5 = useTokens()
	local var6 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), cryoModule (copy)
		return if p0.desiredFirstUserId and cryoModule.List.find(p0.userIds, p0.desiredFirstUserId) then p0.desiredFirstUserId else p0.userIds[1]
	end, { p0.userIds, p0.desiredFirstUserId })
	local var7 = reactModule.useMemo(function()
		-- upvalues: p0 (ref)
		return p0.userIds[2] or nil
	end, { p0.userIds })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = uDim
		}),
		FirstUser = if var6 then reactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundColor3 = var5.Inverse.Surface.Surface_300.Color3,
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
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(var6),
				backgroundStyle = {
					Transparency = 0,
					Color3 = var5.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil,
		SecondUser = if var7 then reactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundColor3 = var5.Inverse.Surface.Surface_300.Color3,
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
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(var7),
				backgroundStyle = {
					Transparency = 0,
					Color3 = var5.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil
	})
end