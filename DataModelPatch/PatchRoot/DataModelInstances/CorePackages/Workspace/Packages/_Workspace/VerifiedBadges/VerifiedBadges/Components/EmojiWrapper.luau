local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local CryoModule = require(VerifiedBadges.Parent.Cryo)
local ReactModule = require(VerifiedBadges.Parent.React)
local ReactRobloxModule = require(VerifiedBadges.Parent.ReactRoblox)
local config = {
	anchorPoint = Vector2.new(),
	position = UDim2.new(),
	color = Color3.fromHex("#fff"),
	font = Enum.Font.Gotham,
	size = UDim2.fromScale(1, 0),
	automaticSize = Enum.AutomaticSize.XY,
	verticalAlignment = Enum.VerticalAlignment.Center
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), ReactRobloxModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	if JoinResult.children then
		assert(ReactModule.Children.count(JoinResult.children) <= 1, "EmojiWrapper can only contain one child")
	end
	if JoinResult.emoji == "" then
		return JoinResult.children
	else
		local UseStateResult, UseStateResult2 = ReactModule.useState(0)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(-1)
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = JoinResult.layoutOrder,
			AnchorPoint = JoinResult.anchorPoint,
			Position = JoinResult.position,
			Size = JoinResult.size,
			AutomaticSize = JoinResult.automaticSize
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = JoinResult.horizontalAlignment,
				VerticalAlignment = JoinResult.verticalAlignment,
				Padding = UDim.new(0, -UseStateResult)
			}),
			ChildrenWrapper = ReactModule.createElement("Frame", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				[ReactRobloxModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame: Frame)
					-- upvalues: JoinResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult (copy), UseStateResult2 (copy)
					local Smallest = if JoinResult.maximumEmojiSize then math.min(Frame.AbsoluteSize.Y, JoinResult.maximumEmojiSize) else Frame.AbsoluteSize.Y
					
					if Smallest ~= UseStateResult1 then
						UseStateResult2_1(UseStateResult)
						UseStateResult2(Smallest)
					end
				end, { UseStateResult, UseStateResult1 })
			}, {
				Padding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, UseStateResult) }),
				Children = ReactModule.createElement(ReactModule.Fragment, nil, JoinResult.children)
			}),
			Emoji = ReactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Text = JoinResult.emoji,
				Font = JoinResult.font,
				TextColor3 = JoinResult.color,
				TextSize = UseStateResult,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextXAlignment = Enum.TextXAlignment.Center,
				Size = UDim2.fromOffset(UseStateResult, UseStateResult)
			}, {
				Button = p1.onActivated and ReactModule.createElement("ImageButton", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					[ReactRobloxModule.Event.Activated] = p1.onActivated
				}),
				UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
					MinTextSize = 0,
					MaxTextSize = math.max(UseStateResult, 1)
				})
			})
		})
	end
end