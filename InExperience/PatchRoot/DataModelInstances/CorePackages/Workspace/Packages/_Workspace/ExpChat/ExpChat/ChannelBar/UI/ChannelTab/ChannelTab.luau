local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary
local UIBloxModule = require(parent.UIBlox)
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local interactable = UIBloxModule.Core.Control.Interactable
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local gameLocalizationModule = require(expChat.GameLocalization)
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local unreachable = expChatSharedModule.TabTypes.unreachable
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagEnableExpChatUniverseChatTabNames = expChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local color = Color3.fromRGB(255, 255, 255)
local t = {
	channelName = "",
	isDividerVisible = false,
	isTabCollapsed = false,
	isTabSelected = false,
	onTabSelected = nil,
	setTransparency = nil
}

return gameLocalizationModule.connect(function(p1) --[[ line: 190 ]]
	-- upvalues: fFlagExpChatChannelTabRefactor (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	local channelName = p1.channelName
	
	if fFlagExpChatChannelTabRefactor then
		return {}
	elseif string.find(channelName, "RBXGeneral") then
		if getFFlagEnableExpChatUniverseChatTabNames() then
			return {}
		end
		channelName = "General"
	elseif string.find(channelName, "RBXSystem") then
		channelName = "System"
	elseif string.find(channelName, "^RBXTeam") then
		channelName = "Team"
	elseif string.find(channelName, "^RBXWhisper") then
		if p1.textChannel and playersService.LocalPlayer then
			local var18 = getOtherDisplayNameInWhisperChannelModule(p1.textChannel, playersService.LocalPlayer)
			
			if var18 then
				channelName = var18
			end
		end
	elseif getFFlagTextChatEnableUniverseChatTabs() and string.find(channelName, "RBXGlobal") then
		if getFFlagEnableExpChatUniverseChatTabNames() then
			return {}
		end
		channelName = "Global"
	end
	return { channelName = channelName }
end)(function(p0) --[[ line: 60 | named "ChannelTab" ]]
	-- upvalues: dictionary (ref), t (ref), fFlagExpChatChannelTabRefactor (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), localizationModule (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), fFlagExpChatEnableFriendsTab (ref), unreachable (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), useSelectionCursor (ref), cursorKind (ref), interactable (ref), configModule (ref), color (ref)
	local var13 = dictionary.join(t, p0)
	local channelName = var13.channelName
	
	if fFlagExpChatChannelTabRefactor or getFFlagEnableExpChatUniverseChatTabNames() then
		local var14 = localizationModule.useLocalization({
			yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
			moreServers = "CoreScripts.TextChat.ChannelTabs.Global2"
		})
		
		if fFlagExpChatChannelTabRefactor then
			local tabType = var13.tabType
			
			if tabType == "TextChat" then
				local channelName_1 = var13.channelName
				
				if string.find(channelName_1, "RBXGeneral") then
					channelName = var14.yourServer
				elseif string.find(channelName_1, "RBXSystem") then
					channelName = "System"
				elseif string.find(channelName_1, "^RBXTeam") then
					channelName = "Team"
				elseif string.find(channelName_1, "^RBXWhisper") and var13.textChannel and playersService.LocalPlayer then
					local var15 = getOtherDisplayNameInWhisperChannelModule(var13.textChannel, playersService.LocalPlayer)
					
					if var15 then
						channelName = var15
					end
				end
			elseif tabType == "UniverseChat" then
				if string.find(var13.channelName, "RBXGlobal") then
					channelName = var14.moreServers
				end
			elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
				channelName = "Friends"
			else
				unreachable(tabType)
			end
		elseif getFFlagEnableExpChatUniverseChatTabNames() then
			if string.find(var13.channelName, "RBXGeneral") then
				channelName = var14.yourServer
			elseif getFFlagTextChatEnableUniverseChatTabs() and string.find(var13.channelName, "RBXGlobal") then
				channelName = var14.moreServers
			end
		end
	end
	local var16, var17 = reactModule.useState(var13.channelTabsSettings.BackgroundColor3)
	
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var13.isTabCollapsed and var13.setTransparency(var13.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = if var13.isTabCollapsed then var16 else var13.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil,
		onStateChanged = function() --[[ line: 123 ]] end,
		[reactModule.Event.Activated] = var13.onTabSelected,
		[reactModule.Event.MouseEnter] = function() --[[ line: 125 ]]
			-- upvalues: var13 (ref), var17 (ref)
			if var13.isTabCollapsed then
				var17(var13.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 130 ]]
			-- upvalues: var13 (ref), var17 (ref)
			if var13.isTabCollapsed then
				var17(var13.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Text = if fFlagExpChatChannelTabRefactor or getFFlagEnableExpChatUniverseChatTabNames() then channelName else var13.channelName,
			FontFace = var13.channelTabsSettings.FontFace,
			TextSize = var13.channelTabsSettings.TextSize,
			TextColor3 = if var13.isTabSelected then var13.channelTabsSettings.SelectedTabTextColor3 else var13.channelTabsSettings.TextColor3,
			TextTransparency = var13.setTransparency(0),
			TextStrokeColor3 = var13.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = var13.setTransparency(var13.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if var13.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 20 + (if var13.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, 20)
			})
		}),
		UnreadDot = var13.hasUnreadMessages and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, 8, 0, 8),
			Position = UDim2.new(0, 18, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3,
			BackgroundTransparency = var13.setTransparency(0)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Highlight = var13.isTabSelected and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = color,
			BackgroundTransparency = var13.setTransparency(0)
		}),
		Divider = var13.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = var13.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = var13.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = var13.isTabCollapsed and UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, configModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = var13.setTransparency(configModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = configModule.ChannelTabsSettings.DividerColor3
		})
	})
end)