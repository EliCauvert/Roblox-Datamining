local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local dictionary = require(parent.llama).Dictionary
local UIBloxModule = require(parent.UIBlox)
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local channelTabDisplayLabel = expChatSharedModule.ChannelTabDisplayLabel
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local interactable = UIBloxModule.Core.Control.Interactable
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatChannelTabSizingUpdateModule = require(expChat.Flags.FFlagExpChatChannelTabSizingUpdate)
local fFlagExpChatEnableTabsImpressionAnalyticsModule = require(expChat.Flags.FFlagExpChatEnableTabsImpressionAnalytics)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatUseSharedChannelTabDisplayLabel = sharedFlagsModule.FFlagExpChatUseSharedChannelTabDisplayLabel
local var1 = if fFlagExpChatChannelTabSizingUpdateModule then game:GetService("TextService") else nil
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local getUnreadIndicatorLayoutModule = require(script.Parent.getUnreadIndicatorLayout)
local useTabImpressionModule = require(script.Parent.useTabImpression)
local unreachable = expChatSharedModule.TabTypes.unreachable
local var2 = if fFlagExpChatChannelTabSizingUpdateModule then 12 else 20
local color = Color3.fromRGB(255, 255, 255)
local t = {
	channelName = "",
	hasUnreadMessages = false,
	isDividerVisible = false,
	isTabCollapsed = false,
	isTabSelected = false,
	onTabSelected = nil,
	setTransparency = nil,
	tabIndex = if fFlagExpChatEnableTabsImpressionAnalyticsModule then 1 else nil,
	isTabVisibleToUser = if fFlagExpChatEnableTabsImpressionAnalyticsModule then true else nil,
	isLayoutReady = if fFlagExpChatEnableTabsImpressionAnalyticsModule then true else nil
}

local function createUnreadDot(vectorA, vectorB)
	-- upvalues: reactModule (ref), configModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(0, 8, 0, 8),
		Position = vectorA,
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3,
		BackgroundTransparency = vectorB
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
	})
end

return function(p1)
	-- upvalues: dictionary (ref), t (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), useTabImpressionModule (ref), localizationModule (ref), fFlagExpChatUseSharedChannelTabDisplayLabel (ref), channelTabDisplayLabel (ref), fFlagExpChatEnableFriendsTab (ref), unreachable (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatChannelTabSizingUpdateModule (ref), var1 (ref), getUnreadIndicatorLayoutModule (ref), var2 (ref), interactable (ref), createUnreadDot (ref), color (ref), configModule (ref)
	local var3 = dictionary.join(t, p1)
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		useTabImpressionModule({
			enabled = var3.isLayoutReady,
			name = var3.channelName,
			tabType = var3.tabType,
			index = var3.tabIndex,
			inOverflow = var3.isTabCollapsed,
			visible = var3.isTabVisibleToUser,
			hasUnreadMessages = var3.hasUnreadMessages
		})
	end
	local var4 = localizationModule.useLocalization(if fFlagExpChatUseSharedChannelTabDisplayLabel then channelTabDisplayLabel.LocalizationKeys else {
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	})
	local tabType = var3.tabType
	local channelName = var3.channelName
	
	if fFlagExpChatUseSharedChannelTabDisplayLabel then
		if tabType == "FriendsChat" and not fFlagExpChatEnableFriendsTab then
			unreachable(tabType)
		end
		channelName = channelTabDisplayLabel.getDisplayLabel(tabType, var3.channelName, var3.textChannel, playersService.LocalPlayer, var4)
	elseif tabType == "TextChat" then
		local channelName_1 = var3.channelName
		
		if string.find(channelName_1, "RBXGeneral") then
			channelName = var4.yourServer
		elseif string.find(channelName_1, "RBXSystem") then
			channelName = var4.system
		elseif string.find(channelName_1, "^RBXTeam") then
			channelName = var4.team
		elseif string.find(channelName_1, "^RBXWhisper") and var3.textChannel and playersService.LocalPlayer then
			local var5 = getOtherDisplayNameInWhisperChannelModule(var3.textChannel, playersService.LocalPlayer)
			
			if var5 then
				channelName = var5
			end
		end
	elseif tabType == "UniverseChat" then
		if string.find(var3.channelName, "RBXGlobal") then
			channelName = var4.moreServers
		end
	elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
		channelName = var4.friends
	else
		unreachable(tabType)
	end
	local var6, var7 = reactModule.useState(var3.channelTabsSettings.BackgroundColor3)
	local var8 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var9 = fFlagExpChatChannelTabSizingUpdateModule and (var3.hasUnreadMessages and not var3.isTabCollapsed)
	local var10 = nil
	local var11 = nil
	local var12 = nil
	
	if fFlagExpChatChannelTabSizingUpdateModule then
		local var13, var14 = reactModule.useBinding(nil)
		local var15, var16 = reactModule.useBinding(nil)
		
		var10 = function(p2)
			-- upvalues: var16 (ref)
			var16(p2.AbsoluteSize.X)
		end
		
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var3 (ref), channelName (ref), var1 (copy)
			var14(nil)
			
			if var3.hasUnreadMessages and not var3.isTabCollapsed then
				local var17 = false
				task.spawn(function()
					-- upvalues: channelName (copy), var3 (copy), var1 (copy), var17 (write), var14 (copy)
					local getTextBoundsParams = Instance.new("GetTextBoundsParams")
					getTextBoundsParams.Text = channelName
					getTextBoundsParams.Font = var3.channelTabsSettings.FontFace
					getTextBoundsParams.Size = var3.channelTabsSettings.TextSize
					getTextBoundsParams.Width = 1e999
					local ok, status = pcall(function()
						-- upvalues: var1 (copy), getTextBoundsParams (ref)
						return var1:GetTextBoundsAsync(getTextBoundsParams)
					end)
					
					if ok and not var17 then
						var14(math.ceil(status.X))
					end
				end)
				
				return function()
					-- upvalues: var17 (write)
					var17 = true
				end
			end
		end, {
			var3.channelTabsSettings.FontFace,
			var3.channelTabsSettings.TextSize,
			var3.hasUnreadMessages,
			var3.isTabCollapsed,
			channelName
		})
		
		if var9 then
			local var17 = reactModule.joinBindings({ naturalTextWidth = var13, tabWidth = var15 }):map(function(p2)
				-- upvalues: getUnreadIndicatorLayoutModule (copy), var3 (ref), var2 (copy)
				return getUnreadIndicatorLayoutModule(var3.hasUnreadMessages, var3.isTabCollapsed, p2.tabWidth, p2.naturalTextWidth, var2, 8, 8)
			end)
			var11 = var17:map(function(p2)
				-- upvalues: var2 (copy)
				return if p2 then UDim2.new(0, p2.textWidth, 1, 0) else UDim2.new(1, -(var2 * 2 + 8 + 8), 1, 0)
			end)
			var12 = var17:map(function(p2)
				-- upvalues: var2 (copy)
				return if p2 then UDim2.fromOffset(p2.textLeft, 0) else UDim2.fromOffset(var2 + 8 + 8, 0)
			end)
		end
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var3.isTabCollapsed and var3.setTransparency(var3.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = if var3.isTabCollapsed then var6 else var3.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = var8,
		onStateChanged = function() end,
		[reactModule.Change.AbsoluteSize] = var10,
		[reactModule.Event.Activated] = var3.onTabSelected,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var3 (ref), var7 (ref)
			if var3.isTabCollapsed then
				var7(var3.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var3 (ref), var7 (ref)
			if var3.isTabCollapsed then
				var7(var3.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var11 or UDim2.fromScale(1, 1),
			Position = var12,
			Text = channelName,
			FontFace = var3.channelTabsSettings.FontFace,
			TextSize = var3.channelTabsSettings.TextSize,
			TextColor3 = if var3.isTabSelected then var3.channelTabsSettings.SelectedTabTextColor3 else var3.channelTabsSettings.TextColor3,
			TextTransparency = var3.setTransparency(0),
			TextStrokeColor3 = var3.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = var3.setTransparency(var3.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if var9 then Enum.TextXAlignment.Left elseif var3.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = if var9 then nil else reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var2 + (if var3.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, var2)
			}),
			UnreadDot = var9 and createUnreadDot(UDim2.new(0, -8, 0.5, 0), var3.setTransparency(0))
		}),
		UnreadDot = var3.hasUnreadMessages and (not var9 and createUnreadDot(UDim2.new(0, var2 - 2, 0.5, 0), var3.setTransparency(0))),
		Highlight = var3.isTabSelected and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = color,
			BackgroundTransparency = var3.setTransparency(0)
		}),
		Divider = var3.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = var3.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = var3.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = var3.isTabCollapsed and UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, configModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = var3.setTransparency(configModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = configModule.ChannelTabsSettings.DividerColor3
		})
	})
end