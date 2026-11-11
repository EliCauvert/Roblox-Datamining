local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ConfigModule = require(ExpChat.Config)
local ReactModule = require(Parent.React)
local Dictionary = require(Parent.llama).Dictionary
local UIBloxModule = require(Parent.UIBlox)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Interactable = UIBloxModule.Core.Control.Interactable
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local FFlagExpChatFocusChannelBarSupportModule = require(ExpChat.Flags.FFlagExpChatFocusChannelBarSupport)
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local LocalizationModule = require(ExpChat.Localization)
local GetOtherDisplayNameInWhisperChannelModule = require(ExpChat.getOtherDisplayNameInWhisperChannel)
local UnreachableFunction = ExpChatSharedModule.TabTypes.unreachable
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagEnableExpChatUniverseChatTabNamesFunction = ExpChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local Offset: number = if require(ExpChat.Flags.FFlagExpChatChannelTabSizingUpdate) then 12 else 20
local _Color3 = Color3.fromRGB(255, 255, 255)
local config = {
	channelName = "",
	hasUnreadMessages = false,
	isDividerVisible = false,
	isTabCollapsed = false,
	isTabSelected = false,
	onTabSelected = nil,
	setTransparency = nil
}

return require(ExpChat.GameLocalization).connect(function(p1)
	-- upvalues: FFlagExpChatChannelTabRefactor (copy), GetFFlagEnableExpChatUniverseChatTabNamesFunction (copy), Players (copy), GetOtherDisplayNameInWhisperChannelModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	local ChannelName = p1.channelName
	
	if FFlagExpChatChannelTabRefactor then
		return {}
	end
	if string.find(ChannelName, "RBXGeneral") then
		if GetFFlagEnableExpChatUniverseChatTabNamesFunction() then
			return {}
		end
		ChannelName = "General"
	elseif string.find(ChannelName, "RBXSystem") then
		ChannelName = "System"
	elseif string.find(ChannelName, "^RBXTeam") then
		ChannelName = "Team"
	elseif string.find(ChannelName, "^RBXWhisper") then
		if p1.textChannel and Players.LocalPlayer then
			local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(p1.textChannel, Players.LocalPlayer)
			
			if OtherDisplayNameInWhisperChannelModule then
				ChannelName = OtherDisplayNameInWhisperChannelModule
			end
		end
	elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and string.find(ChannelName, "RBXGlobal") then
		if GetFFlagEnableExpChatUniverseChatTabNamesFunction() then
			return {}
		end
		ChannelName = "Global"
	end
	return { channelName = ChannelName }
end)(function(p1)
	-- upvalues: Dictionary (copy), config (copy), FFlagExpChatChannelTabRefactor (copy), GetFFlagEnableExpChatUniverseChatTabNamesFunction (copy), LocalizationModule (copy), Players (copy), GetOtherDisplayNameInWhisperChannelModule (copy), FFlagExpChatEnableFriendsTab (copy), UnreachableFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), ReactModule (copy), FFlagExpChatFocusChannelBarSupportModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), Interactable (copy), Offset (copy), ConfigModule (copy), _Color3 (copy)
	local JoinResult = Dictionary.join(config, p1)
	local ChannelName = JoinResult.channelName
	
	if FFlagExpChatChannelTabRefactor or GetFFlagEnableExpChatUniverseChatTabNamesFunction() then
		local UseLocalizationResult = LocalizationModule.useLocalization({
			yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
			moreServers = "CoreScripts.TextChat.ChannelTabs.Global2"
		})
		
		if FFlagExpChatChannelTabRefactor then
			local TabType = JoinResult.tabType
			
			if TabType == "TextChat" then
				local ChannelName1: string = JoinResult.channelName
				
				if string.find(ChannelName1, "RBXGeneral") then
					ChannelName = UseLocalizationResult.yourServer
				elseif string.find(ChannelName1, "RBXSystem") then
					ChannelName = "System"
				elseif string.find(ChannelName1, "^RBXTeam") then
					ChannelName = "Team"
				elseif string.find(ChannelName1, "^RBXWhisper") and JoinResult.textChannel and Players.LocalPlayer then
					local OtherDisplayNameInWhisperChannelModule = GetOtherDisplayNameInWhisperChannelModule(JoinResult.textChannel, Players.LocalPlayer)
					
					if OtherDisplayNameInWhisperChannelModule then
						ChannelName = OtherDisplayNameInWhisperChannelModule
					end
				end
			elseif TabType == "UniverseChat" then
				if string.find(JoinResult.channelName, "RBXGlobal") then
					ChannelName = UseLocalizationResult.moreServers
				end
			elseif FFlagExpChatEnableFriendsTab and TabType == "FriendsChat" then
				ChannelName = "Friends"
			else
				UnreachableFunction(TabType)
			end
		elseif GetFFlagEnableExpChatUniverseChatTabNamesFunction() then
			if string.find(JoinResult.channelName, "RBXGeneral") then
				ChannelName = UseLocalizationResult.yourServer
			elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and string.find(JoinResult.channelName, "RBXGlobal") then
				ChannelName = UseLocalizationResult.moreServers
			end
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(JoinResult.channelTabsSettings.BackgroundColor3)
	
	return ReactModule.createElement(Interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = JoinResult.isTabCollapsed and JoinResult.setTransparency(JoinResult.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = JoinResult.isTabCollapsed and UseStateResult or JoinResult.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = if FFlagExpChatFocusChannelBarSupportModule then UseSelectionCursorFunction(CursorKind.RoundedSlot) else nil,
		onStateChanged = function() end,
		[ReactModule.Event.Activated] = JoinResult.onTabSelected,
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: JoinResult (copy), UseStateResult2 (copy)
			if JoinResult.isTabCollapsed then
				UseStateResult2(JoinResult.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: JoinResult (copy), UseStateResult2 (copy)
			if JoinResult.isTabCollapsed then
				UseStateResult2(JoinResult.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Text = if FFlagExpChatChannelTabRefactor or GetFFlagEnableExpChatUniverseChatTabNamesFunction() then ChannelName else JoinResult.channelName,
			FontFace = JoinResult.channelTabsSettings.FontFace,
			TextSize = JoinResult.channelTabsSettings.TextSize,
			TextColor3 = JoinResult.isTabSelected and JoinResult.channelTabsSettings.SelectedTabTextColor3 or JoinResult.channelTabsSettings.TextColor3,
			TextTransparency = JoinResult.setTransparency(0),
			TextStrokeColor3 = JoinResult.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = JoinResult.setTransparency(JoinResult.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = JoinResult.isTabCollapsed and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset + (if JoinResult.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, Offset)
			})
		}),
		UnreadDot = JoinResult.hasUnreadMessages and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 8, 0, 8),
			Position = UDim2.new(0, Offset - 2, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = ConfigModule.ChannelTabsSettings.UnreadDotColor3,
			BackgroundTransparency = JoinResult.setTransparency(0)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Highlight = JoinResult.isTabSelected and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = _Color3,
			BackgroundTransparency = JoinResult.setTransparency(0)
		}),
		Divider = JoinResult.isDividerVisible and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = JoinResult.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = JoinResult.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = JoinResult.isTabCollapsed and UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, ConfigModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = JoinResult.setTransparency(ConfigModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = ConfigModule.ChannelTabsSettings.DividerColor3
		})
	})
end)