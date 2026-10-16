local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim = UDim.new(0, -8)

return function(p1) --[[ Line: 21 | Named "EventSocialProof" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CryoModule (copy), _UDim (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: p1 (copy), CryoModule (upval)
		return if p1.desiredFirstUserId and CryoModule.List.find(p1.userIds, p1.desiredFirstUserId) then p1.desiredFirstUserId else p1.userIds[1]
	end, { p1.userIds, p1.desiredFirstUserId })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy)
		return p1.userIds[2] or nil
	end, { p1.userIds })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = _UDim
		}),
		FirstUser = if UseMemoResult then ReactModule.createElement("Frame", {
			ZIndex = 3,
			BackgroundColor3 = UseTokensResult.Inverse.Surface.Surface_300.Color3,
			Size = UDim2.fromOffset(25, 25),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			FirstUserFace = ReactModule.createElement(Image, {
				ZIndex = 4,
				tag = "radius-circle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(UseMemoResult),
				backgroundStyle = {
					Transparency = 0,
					Color3 = UseTokensResult.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil,
		SecondUser = if UseMemoResult1 then ReactModule.createElement("Frame", {
			ZIndex = 1,
			BackgroundColor3 = UseTokensResult.Inverse.Surface.Surface_300.Color3,
			Size = UDim2.fromOffset(25, 25),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			SecondUserFace = ReactModule.createElement(Image, {
				ZIndex = 2,
				tag = "radius-circle",
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Image = ("rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100"):format(UseMemoResult1),
				backgroundStyle = {
					Transparency = 0,
					Color3 = UseTokensResult.Color.Shift.Shift_200.Color3
				},
				Size = UDim2.fromOffset(20, 20)
			})
		}) else nil
	})
end