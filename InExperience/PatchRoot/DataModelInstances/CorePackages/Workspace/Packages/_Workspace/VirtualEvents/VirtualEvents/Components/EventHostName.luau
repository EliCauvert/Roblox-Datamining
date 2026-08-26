local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local useStyle = UIBloxModule.Core.Style.useStyle
local emojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local emoji = UIBloxModule.App.Emoji.Enum.Emoji

return function(p1)
	-- upvalues: useStyle (ref), emoji (ref), reactModule (ref), emojiTextLabel (ref)
	local var1 = useStyle()
	local var2 = if p1.host.hasVerifiedBadge then emoji.Verified else nil
	local var3, var4 = reactModule.useState(0)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UserImage = reactModule.createElement("ImageLabel", {
			LayoutOrder = 1,
			BackgroundColor3 = var1.Theme.Badge.Color,
			BackgroundTransparency = var1.Theme.Badge.Transparency,
			Image = string.format("rbxthumb://type=%s&id=%i&w=150&h=150", if p1.host.hostType == "group" then "GroupIcon" else "AvatarHeadShot", p1.host.hostId),
			Size = if p1.changeHostImageSize then UDim2.fromOffset(32, 32) else UDim2.fromOffset(var3, var3)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		EmojiName = reactModule.createElement(emojiTextLabel, {
			Text = p1.host.hostName,
			LayoutOrder = 2,
			emoji = var2,
			fontStyle = var1.Font.Header2,
			colorStyle = var1.Theme.TextEmphasis,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var4 (ref)
				var4(p2.TextSize)
			end, { var4 })
		}),
		EmojiToArrowMargin = if var2 then reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var3 - 4, 0)
		}) else nil
	})
end