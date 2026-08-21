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
local fFlagChatAiAgentToggle = sharedFlagsModule.FFlagChatAiAgentToggle
local var10 = false
local var11 = if fFlagExpChatChannelTabSizingUpdateModule then game:GetService("TextService") else nil
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local getUnreadIndicatorLayoutModule = require(script.Parent.getUnreadIndicatorLayout)
local useTabImpressionModule = require(script.Parent.useTabImpression)
local unreachable = expChatSharedModule.TabTypes.unreachable
local var16 = if fFlagExpChatChannelTabSizingUpdateModule then 12 else 20
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

local function createUnreadDot(vectorA, vectorB) --[[ line: 74 ]]
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

return function(p0) --[[ line: 89 | named "ChannelTab" ]]
	-- upvalues: dictionary (ref), t (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), useTabImpressionModule (ref), localizationModule (ref), fFlagExpChatUseSharedChannelTabDisplayLabel (ref), channelTabDisplayLabel (ref), fFlagExpChatEnableFriendsTab (ref), unreachable (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), fFlagChatAiAgentToggle (ref), var10 (write), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatChannelTabSizingUpdateModule (ref), var11 (ref), getUnreadIndicatorLayoutModule (ref), var16 (ref), interactable (ref), createUnreadDot (ref), color (ref), configModule (ref)
	local var20 = dictionary.join(t, p0)
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		useTabImpressionModule({
			enabled = var20.isLayoutReady,
			name = var20.channelName,
			tabType = var20.tabType,
			index = var20.tabIndex,
			inOverflow = var20.isTabCollapsed,
			visible = var20.isTabVisibleToUser,
			hasUnreadMessages = var20.hasUnreadMessages
		})
	end
	local var21 = localizationModule.useLocalization(if fFlagExpChatUseSharedChannelTabDisplayLabel then channelTabDisplayLabel.LocalizationKeys else {
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	})
	local tabType = var20.tabType
	local channelName = var20.channelName
	
	if fFlagExpChatUseSharedChannelTabDisplayLabel then
		if tabType == "FriendsChat" and not fFlagExpChatEnableFriendsTab then
			unreachable(tabType)
		end
		channelName = channelTabDisplayLabel.getDisplayLabel(tabType, var20.channelName, var20.textChannel, playersService.LocalPlayer, var21)
	elseif tabType == "TextChat" then
		local channelName_1 = var20.channelName
		
		if string.find(channelName_1, "RBXGeneral") then
			channelName = var21.yourServer
		elseif string.find(channelName_1, "RBXSystem") then
			channelName = var21.system
		elseif string.find(channelName_1, "^RBXTeam") then
			channelName = var21.team
		elseif string.find(channelName_1, "^RBXWhisper") and var20.textChannel and playersService.LocalPlayer then
			local var22 = getOtherDisplayNameInWhisperChannelModule(var20.textChannel, playersService.LocalPlayer)
			
			if var22 then
				channelName = var22
			end
		end
	elseif tabType == "UniverseChat" then
		if string.find(var20.channelName, "RBXGlobal") then
			channelName = var21.moreServers
		end
	elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
		channelName = var21.friends
	else
		unreachable(tabType)
	end
	if fFlagChatAiAgentToggle and fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
		channelName = "Assistant"
		
		if not var10 then
			var10 = true
			print("[ChatAiAgent] Friends channel tab labeled Assistant (ChatAiAgentToggle ON)")
		end
	end
	local var23, var24 = reactModule.useState(var20.channelTabsSettings.BackgroundColor3)
	local var25 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var26 = fFlagExpChatChannelTabSizingUpdateModule and (var20.hasUnreadMessages and not var20.isTabCollapsed)
	local var27 = nil
	local var28 = nil
	local var29 = nil
	
	if fFlagExpChatChannelTabSizingUpdateModule then
		local var30, var31 = reactModule.useBinding(nil)
		local var32, var33 = reactModule.useBinding(nil)
		
		var27 = function(p1) --[[ line: 174 ]]
			-- upvalues: var33 (ref)
			var33(p1.AbsoluteSize.X)
		end
		
		reactModule.useEffect(function() --[[ line: 179 ]]
			-- upvalues: var31 (ref), var20 (ref), channelName (ref), var11 (copy)
			var31(nil)
			
			if var20.hasUnreadMessages and not var20.isTabCollapsed then
				local var35 = false
				task.spawn(function() --[[ line: 186 ]]
					-- upvalues: channelName (copy), var20 (copy), var11 (copy), var35 (write), var31 (copy)
					local getTextBoundsParams = Instance.new("GetTextBoundsParams")
					getTextBoundsParams.Text = channelName
					getTextBoundsParams.Font = var20.channelTabsSettings.FontFace
					getTextBoundsParams.Size = var20.channelTabsSettings.TextSize
					getTextBoundsParams.Width = 1e999
					local ok, status = pcall(function() --[[ line: 193 ]]
						-- upvalues: var11 (copy), getTextBoundsParams (ref)
						return var11:GetTextBoundsAsync(getTextBoundsParams)
					end)
					
					if ok and not var35 then
						var31(math.ceil(status.X))
					end
				end)
				
				return function() --[[ line: 201 ]]
					-- upvalues: var35 (write)
					var35 = true
				end
			end
		end, {
			var20.channelTabsSettings.FontFace,
			var20.channelTabsSettings.TextSize,
			var20.hasUnreadMessages,
			var20.isTabCollapsed,
			channelName
		})
		
		if var26 then
			local var34 = reactModule.joinBindings({ naturalTextWidth = var30, tabWidth = var32 }):map(function(p2) --[[ line: 218 ]]
				-- upvalues: getUnreadIndicatorLayoutModule (copy), var20 (ref), var16 (copy)
				return getUnreadIndicatorLayoutModule(var20.hasUnreadMessages, var20.isTabCollapsed, p2.tabWidth, p2.naturalTextWidth, var16, 8, 8)
			end)
			var28 = var34:map(function(p3) --[[ line: 229 ]]
				-- upvalues: var16 (copy)
				return if p3 then UDim2.new(0, p3.textWidth, 1, 0) else UDim2.new(1, -(var16 * 2 + 8 + 8), 1, 0)
			end)
			var29 = var34:map(function(p4) --[[ line: 234 ]]
				-- upvalues: var16 (copy)
				return if p4 then UDim2.fromOffset(p4.textLeft, 0) else UDim2.fromOffset(var16 + 8 + 8, 0)
			end)
		end
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var20.isTabCollapsed and var20.setTransparency(var20.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = if var20.isTabCollapsed then var23 else var20.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = var25,
		onStateChanged = function() --[[ line: 250 ]] end,
		[reactModule.Change.AbsoluteSize] = var27,
		[reactModule.Event.Activated] = var20.onTabSelected,
		[reactModule.Event.MouseEnter] = function() --[[ line: 253 ]]
			-- upvalues: var20 (ref), var24 (ref)
			if var20.isTabCollapsed then
				var24(var20.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 258 ]]
			-- upvalues: var20 (ref), var24 (ref)
			if var20.isTabCollapsed then
				var24(var20.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var28 or UDim2.fromScale(1, 1),
			Position = var29,
			Text = channelName,
			FontFace = var20.channelTabsSettings.FontFace,
			TextSize = var20.channelTabsSettings.TextSize,
			TextColor3 = if var20.isTabSelected then var20.channelTabsSettings.SelectedTabTextColor3 else var20.channelTabsSettings.TextColor3,
			TextTransparency = var20.setTransparency(0),
			TextStrokeColor3 = var20.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = var20.setTransparency(var20.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if var26 then Enum.TextXAlignment.Left elseif var20.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = if var26 then nil else reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var16 + (if var20.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, var16)
			}),
			UnreadDot = var26 and createUnreadDot(UDim2.new(0, -8, 0.5, 0), var20.setTransparency(0))
		}),
		UnreadDot = var20.hasUnreadMessages and (not var26 and createUnreadDot(UDim2.new(0, var16 - 2, 0.5, 0), var20.setTransparency(0))),
		Highlight = var20.isTabSelected and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = color,
			BackgroundTransparency = var20.setTransparency(0)
		}),
		Divider = var20.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = var20.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = var20.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = var20.isTabCollapsed and UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, configModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = var20.setTransparency(configModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = configModule.ChannelTabsSettings.DividerColor3
		})
	})
end