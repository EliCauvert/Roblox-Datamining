local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor
local ConfigModule = require(ExpChat.Config)
local FFlagExpChatEnableFocusNavigationModule = require(ExpChat.Flags.FFlagExpChatEnableFocusNavigation)
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs

return function(p1)
	-- upvalues: FFlagExpChatEnableFocusNavigationModule (copy), UseCursorFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), ReactModule (copy), ConfigModule (copy)
	local v1 = (p1.targetTextChannelDisplayName or "") ~= ""
	local NoDeveloperChannelTabsEnabled: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and not p1.developerChannelTabsEnabled
	
	return ReactModule.createElement("TextButton", {
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Font = ConfigModule.ChatInputBarFont,
		SelectionImageObject = if FFlagExpChatEnableFocusNavigationModule then UseCursorFunction() else nil,
		Size = UDim2.fromScale(0, 1),
		Text = p1.targetTextChannelDisplayName or "",
		TextColor3 = ConfigModule.ChatInputBarTextColor3,
		TextSize = ConfigModule.ChatInputBarTextSize,
		TextTransparency = p1.transparency or 1,
		TextWrapped = true,
		Visible = v1 and (not p1.isChannelBarVisible or NoDeveloperChannelTabsEnabled),
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		[ReactModule.Event.Activated] = p1.onChannelChipActivated
	})
end