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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactRobloxModule (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	
	if var5.children then
		assert(reactModule.Children.count(var5.children) <= 1, "EmojiWrapper can only contain one child")
	end
	if var5.emoji == "" then
		return var5.children
	end
	local var6, var7 = reactModule.useState(0)
	local var8, var9 = reactModule.useState(-1)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var5.layoutOrder,
		AnchorPoint = var5.anchorPoint,
		Position = var5.position,
		Size = var5.size,
		AutomaticSize = var5.automaticSize
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = var5.horizontalAlignment,
			VerticalAlignment = var5.verticalAlignment,
			Padding = UDim.new(0, -var6)
		}),
		ChildrenWrapper = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[reactRobloxModule.Change.AbsoluteSize] = reactModule.useCallback(function(p1)
				-- upvalues: var5 (ref), var8 (ref), var9 (ref), var6 (ref), var7 (ref)
				local var10 = if var5.maximumEmojiSize then math.min(p1.AbsoluteSize.Y, var5.maximumEmojiSize) else p1.AbsoluteSize.Y
				
				if var10 ~= var8 then
					var9(var6)
					var7(var10)
				end
			end, { var6, var8 })
		}, {
			Padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var6) }),
			Children = reactModule.createElement(reactModule.Fragment, nil, var5.children)
		}),
		Emoji = reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = var5.emoji,
			Font = var5.font,
			TextColor3 = var5.color,
			TextSize = var6,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextXAlignment = Enum.TextXAlignment.Center,
			Size = UDim2.fromOffset(var6, var6)
		}, {
			Button = p0.onActivated and reactModule.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[reactRobloxModule.Event.Activated] = p0.onActivated
			}),
			UITextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MinTextSize = 0, MaxTextSize = math.max(var6, 1) })
		})
	})
end