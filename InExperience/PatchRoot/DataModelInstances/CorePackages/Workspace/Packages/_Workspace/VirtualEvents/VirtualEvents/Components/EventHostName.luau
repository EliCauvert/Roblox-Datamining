local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local EmojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local Emoji = UIBloxModule.App.Emoji.Enum.Emoji

return function(p1) --[[ Line: 19 | Named "EventHostName" ]]
	-- upvalues: UseStyleFunction (copy), Emoji (copy), ReactModule (copy), EmojiTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local Verified = if p1.host.hasVerifiedBadge then Emoji.Verified else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UserImage = ReactModule.createElement("ImageLabel", {
			LayoutOrder = 1,
			BackgroundColor3 = UseStyleResult.Theme.Badge.Color,
			BackgroundTransparency = UseStyleResult.Theme.Badge.Transparency,
			Image = string.format("rbxthumb://type=%s&id=%i&w=150&h=150", if p1.host.hostType == "group" then "GroupIcon" else "AvatarHeadShot", p1.host.hostId),
			Size = if p1.changeHostImageSize then UDim2.fromOffset(32, 32) else UDim2.fromOffset(UseStateResult, UseStateResult)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		EmojiName = ReactModule.createElement(EmojiTextLabel, {
			Text = p1.host.hostName,
			LayoutOrder = 2,
			emoji = Verified,
			fontStyle = UseStyleResult.Font.Header2,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Label) --[[ Line: 25 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Label.TextSize)
			end, { UseStateResult2 })
		}),
		EmojiToArrowMargin = if Verified then ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(UseStateResult - 4, 0)
		}) else nil
	})
end