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
local fFlagExpChatChannelTabSizingUpdateModule = require(expChat.Flags.FFlagExpChatChannelTabSizingUpdate)
local fFlagExpChatEnableTabsImpressionAnalyticsModule = require(expChat.Flags.FFlagExpChatEnableTabsImpressionAnalytics)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local var10 = if fFlagExpChatChannelTabSizingUpdateModule then game:GetService("TextService") else nil
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local getUnreadIndicatorLayoutModule = require(script.Parent.getUnreadIndicatorLayout)
local useTabImpressionModule = require(script.Parent.useTabImpression)
local unreachable = expChatSharedModule.TabTypes.unreachable
local var15 = if fFlagExpChatChannelTabSizingUpdateModule then 12 else 20
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

local function createUnreadDot(vectorA, vectorB) --[[ line: 70 ]]
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

return function(p0) --[[ line: 85 | named "ChannelTab" ]]
	-- upvalues: dictionary (ref), t (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), useTabImpressionModule (ref), localizationModule (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), fFlagExpChatEnableFriendsTab (ref), unreachable (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatChannelTabSizingUpdateModule (ref), var10 (ref), getUnreadIndicatorLayoutModule (ref), var15 (ref), interactable (ref), createUnreadDot (ref), color (ref), configModule (ref)
	local var19 = dictionary.join(t, p0)
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		useTabImpressionModule({
			enabled = var19.isLayoutReady,
			name = var19.channelName,
			tabType = var19.tabType,
			index = var19.tabIndex,
			inOverflow = var19.isTabCollapsed,
			visible = var19.isTabVisibleToUser,
			hasUnreadMessages = var19.hasUnreadMessages
		})
	end
	local channelName = var19.channelName
	local var20 = localizationModule.useLocalization({
		yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
		moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
		friends = "CoreScripts.TextChat.ChannelTabs.Friends",
		system = "CoreScripts.TextChat.ChannelTabs.System",
		team = "CoreScripts.TextChat.ChannelTabs.Team"
	})
	local tabType = var19.tabType
	
	if tabType == "TextChat" then
		local channelName_1 = var19.channelName
		
		if string.find(channelName_1, "RBXGeneral") then
			channelName = var20.yourServer
		elseif string.find(channelName_1, "RBXSystem") then
			channelName = var20.system
		elseif string.find(channelName_1, "^RBXTeam") then
			channelName = var20.team
		elseif string.find(channelName_1, "^RBXWhisper") and var19.textChannel and playersService.LocalPlayer then
			local var21 = getOtherDisplayNameInWhisperChannelModule(var19.textChannel, playersService.LocalPlayer)
			
			if var21 then
				channelName = var21
			end
		end
	elseif tabType == "UniverseChat" then
		if string.find(var19.channelName, "RBXGlobal") then
			channelName = var20.moreServers
		end
	elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
		channelName = var20.friends
	else
		unreachable(tabType)
	end
	local var22, var23 = reactModule.useState(var19.channelTabsSettings.BackgroundColor3)
	local var24 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var25 = fFlagExpChatChannelTabSizingUpdateModule and (var19.hasUnreadMessages and not var19.isTabCollapsed)
	local var26 = nil
	local var27 = nil
	local var28 = nil
	
	if fFlagExpChatChannelTabSizingUpdateModule then
		local var29, var30 = reactModule.useBinding(nil)
		local var31, var32 = reactModule.useBinding(nil)
		
		var26 = function(p1) --[[ line: 149 ]]
			-- upvalues: var32 (ref)
			var32(p1.AbsoluteSize.X)
		end
		
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: var30 (ref), var19 (ref), channelName (ref), var10 (copy)
			var30(nil)
			
			if var19.hasUnreadMessages and not var19.isTabCollapsed then
				local var34 = false
				task.spawn(function() --[[ line: 161 ]]
					-- upvalues: channelName (copy), var19 (copy), var10 (copy), var34 (write), var30 (copy)
					local getTextBoundsParams = Instance.new("GetTextBoundsParams")
					getTextBoundsParams.Text = channelName
					getTextBoundsParams.Font = var19.channelTabsSettings.FontFace
					getTextBoundsParams.Size = var19.channelTabsSettings.TextSize
					getTextBoundsParams.Width = 1e999
					local ok, status = pcall(function() --[[ line: 168 ]]
						-- upvalues: var10 (copy), getTextBoundsParams (ref)
						return var10:GetTextBoundsAsync(getTextBoundsParams)
					end)
					
					if ok and not var34 then
						var30(math.ceil(status.X))
					end
				end)
				
				return function() --[[ line: 176 ]]
					-- upvalues: var34 (write)
					var34 = true
				end
			end
		end, {
			var19.channelTabsSettings.FontFace,
			var19.channelTabsSettings.TextSize,
			var19.hasUnreadMessages,
			var19.isTabCollapsed,
			channelName
		})
		
		if var25 then
			local var33 = reactModule.joinBindings({ naturalTextWidth = var29, tabWidth = var31 }):map(function(p2) --[[ line: 193 ]]
				-- upvalues: getUnreadIndicatorLayoutModule (copy), var19 (ref), var15 (copy)
				return getUnreadIndicatorLayoutModule(var19.hasUnreadMessages, var19.isTabCollapsed, p2.tabWidth, p2.naturalTextWidth, var15, 8, 8)
			end)
			var27 = var33:map(function(p3) --[[ line: 204 ]]
				-- upvalues: var15 (copy)
				return if p3 then UDim2.new(0, p3.textWidth, 1, 0) else UDim2.new(1, -(var15 * 2 + 8 + 8), 1, 0)
			end)
			var28 = var33:map(function(p4) --[[ line: 209 ]]
				-- upvalues: var15 (copy)
				return if p4 then UDim2.fromOffset(p4.textLeft, 0) else UDim2.fromOffset(var15 + 8 + 8, 0)
			end)
		end
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var19.isTabCollapsed and var19.setTransparency(var19.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = if var19.isTabCollapsed then var22 else var19.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = var24,
		onStateChanged = function() --[[ line: 225 ]] end,
		[reactModule.Change.AbsoluteSize] = var26,
		[reactModule.Event.Activated] = var19.onTabSelected,
		[reactModule.Event.MouseEnter] = function() --[[ line: 228 ]]
			-- upvalues: var19 (ref), var23 (ref)
			if var19.isTabCollapsed then
				var23(var19.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 233 ]]
			-- upvalues: var19 (ref), var23 (ref)
			if var19.isTabCollapsed then
				var23(var19.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var27 or UDim2.fromScale(1, 1),
			Position = var28,
			Text = channelName,
			FontFace = var19.channelTabsSettings.FontFace,
			TextSize = var19.channelTabsSettings.TextSize,
			TextColor3 = if var19.isTabSelected then var19.channelTabsSettings.SelectedTabTextColor3 else var19.channelTabsSettings.TextColor3,
			TextTransparency = var19.setTransparency(0),
			TextStrokeColor3 = var19.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = var19.setTransparency(var19.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if var25 then Enum.TextXAlignment.Left elseif var19.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = if var25 then nil else reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var15 + (if var19.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, var15)
			}),
			UnreadDot = var25 and createUnreadDot(UDim2.new(0, -8, 0.5, 0), var19.setTransparency(0))
		}),
		UnreadDot = var19.hasUnreadMessages and (not var25 and createUnreadDot(UDim2.new(0, var15 - 2, 0.5, 0), var19.setTransparency(0))),
		Highlight = var19.isTabSelected and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = color,
			BackgroundTransparency = var19.setTransparency(0)
		}),
		Divider = var19.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = var19.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = var19.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = var19.isTabCollapsed and UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, configModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = var19.setTransparency(configModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = configModule.ChannelTabsSettings.DividerColor3
		})
	})
end