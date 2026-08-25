local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor
local configModule = require(expChat.Config)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs

return function(p0)
	-- upvalues: useCursor (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reactModule (ref), configModule (ref)
	return reactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Font = configModule.ChatInputBarFont,
		SelectionImageObject = useCursor(),
		Size = UDim2.fromScale(0, 1),
		Text = p0.targetTextChannelDisplayName or "",
		TextColor3 = configModule.ChatInputBarTextColor3,
		TextSize = configModule.ChatInputBarTextSize,
		TextTransparency = p0.transparency or 1,
		TextWrapped = true,
		Visible = (p0.targetTextChannelDisplayName or "") ~= "" and (not p0.isChannelBarVisible or getFFlagTextChatEnableUniverseChatTabs() and not p0.developerChannelTabsEnabled),
		[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged,
		[reactModule.Event.Activated] = p0.onChannelChipActivated
	})
end