local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local cryoModule = require(verifiedBadges.Parent.Cryo)
local reactModule = require(verifiedBadges.Parent.React)
local reactRobloxModule = require(verifiedBadges.Parent.ReactRoblox)
local t = {
	anchorPoint = Vector2.new(),
	position = UDim2.new(),
	color = Color3.fromHex("#fff"),
	font = Enum.Font.Gotham,
	size = UDim2.fromScale(1, 0),
	automaticSize = Enum.AutomaticSize.XY,
	verticalAlignment = Enum.VerticalAlignment.Center
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactRobloxModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	
	if var1.children then
		assert(reactModule.Children.count(var1.children) <= 1, "EmojiWrapper can only contain one child")
	end
	if var1.emoji == "" then
		return var1.children
	end
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(-1)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var1.layoutOrder,
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		Size = var1.size,
		AutomaticSize = var1.automaticSize
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = var1.horizontalAlignment,
			VerticalAlignment = var1.verticalAlignment,
			Padding = UDim.new(0, -var2)
		}),
		ChildrenWrapper = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[reactRobloxModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var1 (ref), var4 (ref), var5 (ref), var2 (ref), var3 (ref)
				local var6 = if var1.maximumEmojiSize then math.min(p2.AbsoluteSize.Y, var1.maximumEmojiSize) else p2.AbsoluteSize.Y
				
				if var6 ~= var4 then
					var5(var2)
					var3(var6)
				end
			end, { var2, var4 })
		}, {
			Padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var2) }),
			Children = reactModule.createElement(reactModule.Fragment, nil, var1.children)
		}),
		Emoji = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = var1.emoji,
			Font = var1.font,
			TextColor3 = var1.color,
			TextSize = var2,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.fromOffset(var2, var2)
		}, {
			Button = p1.onActivated and reactModule.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[reactRobloxModule.Event.Activated] = p1.onActivated
			}),
			UITextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MinTextSize = 0, MaxTextSize = math.max(var2, 1) })
		})
	})
end