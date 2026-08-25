local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local useStyle = UIBloxModule.Core.Style.useStyle
local emojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local emoji = UIBloxModule.App.Emoji.Enum.Emoji

return function(p0)
	-- upvalues: useStyle (ref), emoji (ref), reactModule (ref), emojiTextLabel (ref)
	local var3 = useStyle()
	local var4 = if p0.host.hasVerifiedBadge then emoji.Verified else nil
	local var5, var6 = reactModule.useState(0)
	
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
			BackgroundColor3 = var3.Theme.Badge.Color,
			BackgroundTransparency = var3.Theme.Badge.Transparency,
			Image = string.format("rbxthumb://type=%s&id=%i&w=150&h=150", if p0.host.hostType == "group" then "GroupIcon" else "AvatarHeadShot", p0.host.hostId),
			Size = if p0.changeHostImageSize then UDim2.fromOffset(32, 32) else UDim2.fromOffset(var5, var5)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		EmojiName = reactModule.createElement(emojiTextLabel, {
			Text = p0.host.hostName,
			LayoutOrder = 2,
			emoji = var4,
			fontStyle = var3.Font.Header2,
			colorStyle = var3.Theme.TextEmphasis,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p1)
				-- upvalues: var6 (ref)
				var6(p1.TextSize)
			end, { var6 })
		}),
		EmojiToArrowMargin = if var4 then reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(var5 - 4, 0)
		}) else nil
	})
end