local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs

return function(p1)
	-- upvalues: useCursor (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reactModule (ref), configModule (ref)
	return reactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Font = configModule.ChatInputBarFont,
		SelectionImageObject = useCursor(),
		Size = UDim2.fromScale(0, 1),
		Text = p1.targetTextChannelDisplayName or "",
		TextColor3 = configModule.ChatInputBarTextColor3,
		TextSize = configModule.ChatInputBarTextSize,
		TextTransparency = p1.transparency or 1,
		TextWrapped = true,
		Visible = (p1.targetTextChannelDisplayName or "") ~= "" and (not p1.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p1.developerChannelTabsEnabled),
		[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		[reactModule.Event.Activated] = p1.onChannelChipActivated
	})
end