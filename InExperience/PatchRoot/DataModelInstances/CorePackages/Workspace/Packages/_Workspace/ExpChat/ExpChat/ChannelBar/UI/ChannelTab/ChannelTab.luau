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
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local var9 = if fFlagExpChatChannelTabSizingUpdateModule then game:GetService("TextService") else nil
local gameLocalizationModule = require(expChat.GameLocalization)
local localizationModule = require(expChat.Localization)
local getOtherDisplayNameInWhisperChannelModule = require(expChat.getOtherDisplayNameInWhisperChannel)
local getUnreadIndicatorLayoutModule = require(script.Parent.getUnreadIndicatorLayout)
local unreachable = expChatSharedModule.TabTypes.unreachable
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagEnableExpChatUniverseChatTabNames = expChatSharedModule.Flags.GetFFlagEnableExpChatUniverseChatTabNames
local var14 = if fFlagExpChatChannelTabSizingUpdateModule then 12 else 20
local color = Color3.fromRGB(255, 255, 255)
local t = {
	channelName = "",
	hasUnreadMessages = false,
	isDividerVisible = false,
	isTabCollapsed = false,
	isTabSelected = false,
	onTabSelected = nil,
	setTransparency = nil
}

local function createUnreadDot(vectorA, vectorB) --[[ line: 65 ]]
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

return gameLocalizationModule.connect(function(p5) --[[ line: 287 ]]
	-- upvalues: fFlagExpChatChannelTabRefactor (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	local channelName = p5.channelName
	
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
		if p5.textChannel and playersService.LocalPlayer then
			local var36 = getOtherDisplayNameInWhisperChannelModule(p5.textChannel, playersService.LocalPlayer)
			
			if var36 then
				channelName = var36
			end
		end
	elseif getFFlagTextChatEnableUniverseChatTabs() and string.find(channelName, "RBXGlobal") then
		if getFFlagEnableExpChatUniverseChatTabNames() then
			return {}
		end
		channelName = "Global"
	end
	return { channelName = channelName }
end)(function(p0) --[[ line: 80 | named "ChannelTab" ]]
	-- upvalues: dictionary (ref), t (ref), fFlagExpChatChannelTabRefactor (ref), getFFlagEnableExpChatUniverseChatTabNames (ref), localizationModule (ref), playersService (ref), getOtherDisplayNameInWhisperChannelModule (ref), fFlagExpChatEnableFriendsTab (ref), unreachable (ref), getFFlagTextChatEnableUniverseChatTabs (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatChannelTabSizingUpdateModule (ref), var9 (ref), getUnreadIndicatorLayoutModule (ref), var14 (ref), interactable (ref), createUnreadDot (ref), color (ref), configModule (ref)
	local var18 = dictionary.join(t, p0)
	local channelName = var18.channelName
	
	if fFlagExpChatChannelTabRefactor or getFFlagEnableExpChatUniverseChatTabNames() then
		local var19 = localizationModule.useLocalization({
			yourServer = "CoreScripts.TextChat.ChannelTabs.Here",
			moreServers = "CoreScripts.TextChat.ChannelTabs.Global2",
			friends = "CoreScripts.TextChat.ChannelTabs.Friends"
		})
		
		if fFlagExpChatChannelTabRefactor then
			local tabType = var18.tabType
			
			if tabType == "TextChat" then
				local channelName_1 = var18.channelName
				
				if string.find(channelName_1, "RBXGeneral") then
					channelName = var19.yourServer
				elseif string.find(channelName_1, "RBXSystem") then
					channelName = "System"
				elseif string.find(channelName_1, "^RBXTeam") then
					channelName = "Team"
				elseif string.find(channelName_1, "^RBXWhisper") and var18.textChannel and playersService.LocalPlayer then
					local var20 = getOtherDisplayNameInWhisperChannelModule(var18.textChannel, playersService.LocalPlayer)
					
					if var20 then
						channelName = var20
					end
				end
			elseif tabType == "UniverseChat" then
				if string.find(var18.channelName, "RBXGlobal") then
					channelName = var19.moreServers
				end
			elseif fFlagExpChatEnableFriendsTab and tabType == "FriendsChat" then
				channelName = var19.friends
			else
				unreachable(tabType)
			end
		elseif getFFlagEnableExpChatUniverseChatTabNames() then
			if string.find(var18.channelName, "RBXGeneral") then
				channelName = var19.yourServer
			elseif getFFlagTextChatEnableUniverseChatTabs() and string.find(var18.channelName, "RBXGlobal") then
				channelName = var19.moreServers
			end
		end
	end
	local var21 = if fFlagExpChatChannelTabRefactor or getFFlagEnableExpChatUniverseChatTabNames() then channelName else var18.channelName
	local var22, var23 = reactModule.useState(var18.channelTabsSettings.BackgroundColor3)
	local var24 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var25 = fFlagExpChatChannelTabSizingUpdateModule and (var18.hasUnreadMessages and not var18.isTabCollapsed)
	local var26 = nil
	local var27 = nil
	local var28 = nil
	
	if fFlagExpChatChannelTabSizingUpdateModule then
		local var29, var30 = reactModule.useBinding(nil)
		local var31, var32 = reactModule.useBinding(nil)
		
		var26 = function(p1) --[[ line: 146 ]]
			-- upvalues: var32 (ref)
			var32(p1.AbsoluteSize.X)
		end
		
		reactModule.useEffect(function() --[[ line: 151 ]]
			-- upvalues: var30 (ref), var18 (ref), var21 (ref), var9 (copy)
			var30(nil)
			
			if var18.hasUnreadMessages and not var18.isTabCollapsed then
				local var34 = false
				task.spawn(function() --[[ line: 158 ]]
					-- upvalues: var21 (copy), var18 (copy), var9 (copy), var34 (write), var30 (copy)
					local getTextBoundsParams = Instance.new("GetTextBoundsParams")
					getTextBoundsParams.Text = var21
					getTextBoundsParams.Font = var18.channelTabsSettings.FontFace
					getTextBoundsParams.Size = var18.channelTabsSettings.TextSize
					getTextBoundsParams.Width = 1e999
					local ok, status = pcall(function() --[[ line: 165 ]]
						-- upvalues: var9 (copy), getTextBoundsParams (ref)
						return var9:GetTextBoundsAsync(getTextBoundsParams)
					end)
					
					if ok and not var34 then
						var30(math.ceil(status.X))
					end
				end)
				
				return function() --[[ line: 173 ]]
					-- upvalues: var34 (write)
					var34 = true
				end
			end
		end, {
			var18.channelTabsSettings.FontFace,
			var18.channelTabsSettings.TextSize,
			var18.hasUnreadMessages,
			var18.isTabCollapsed,
			var21
		})
		
		if var25 then
			local var33 = reactModule.joinBindings({ naturalTextWidth = var29, tabWidth = var31 }):map(function(p2) --[[ line: 190 ]]
				-- upvalues: getUnreadIndicatorLayoutModule (copy), var18 (ref), var14 (copy)
				return getUnreadIndicatorLayoutModule(var18.hasUnreadMessages, var18.isTabCollapsed, p2.tabWidth, p2.naturalTextWidth, var14, 8, 8)
			end)
			var27 = var33:map(function(p3) --[[ line: 201 ]]
				-- upvalues: var14 (copy)
				return if p3 then UDim2.new(0, p3.textWidth, 1, 0) else UDim2.new(1, -(var14 * 2 + 8 + 8), 1, 0)
			end)
			var28 = var33:map(function(p4) --[[ line: 206 ]]
				-- upvalues: var14 (copy)
				return if p4 then UDim2.fromOffset(p4.textLeft, 0) else UDim2.fromOffset(var14 + 8 + 8, 0)
			end)
		end
	end
	return reactModule.createElement(interactable, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = var18.isTabCollapsed and var18.setTransparency(var18.channelTabsSettings.BackgroundTransparency) or 1,
		BackgroundColor3 = if var18.isTabCollapsed then var22 else var18.channelTabsSettings.BackgroundColor3,
		BorderSizePixel = 0,
		SelectionImageObject = var24,
		onStateChanged = function() --[[ line: 222 ]] end,
		[reactModule.Change.AbsoluteSize] = var26,
		[reactModule.Event.Activated] = var18.onTabSelected,
		[reactModule.Event.MouseEnter] = function() --[[ line: 225 ]]
			-- upvalues: var18 (ref), var23 (ref)
			if var18.isTabCollapsed then
				var23(var18.channelTabsSettings.HoverBackgroundColor3)
			end
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 230 ]]
			-- upvalues: var18 (ref), var23 (ref)
			if var18.isTabCollapsed then
				var23(var18.channelTabsSettings.BackgroundColor3)
			end
		end
	}, {
		TextLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = var27 or UDim2.fromScale(1, 1),
			Position = var28,
			Text = var21,
			FontFace = var18.channelTabsSettings.FontFace,
			TextSize = var18.channelTabsSettings.TextSize,
			TextColor3 = if var18.isTabSelected then var18.channelTabsSettings.SelectedTabTextColor3 else var18.channelTabsSettings.TextColor3,
			TextTransparency = var18.setTransparency(0),
			TextStrokeColor3 = var18.channelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = var18.setTransparency(var18.channelTabsSettings.TextStrokeTransparency),
			TextXAlignment = if var25 then Enum.TextXAlignment.Left elseif var18.isTabCollapsed then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UIPadding = if var25 then nil else reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var14 + (if var18.isTabCollapsed then 4 else 0)),
				PaddingRight = UDim.new(0, var14)
			}),
			UnreadDot = var25 and createUnreadDot(UDim2.new(0, -8, 0.5, 0), var18.setTransparency(0))
		}),
		UnreadDot = var18.hasUnreadMessages and (not var25 and createUnreadDot(UDim2.new(0, var14 - 2, 0.5, 0), var18.setTransparency(0))),
		Highlight = var18.isTabSelected and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 4),
			Position = UDim2.new(0, 0, 1, -4),
			BackgroundColor3 = color,
			BackgroundTransparency = var18.setTransparency(0)
		}),
		Divider = var18.isDividerVisible and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = var18.isTabCollapsed and Vector2.new(0, 1) or Vector2.new(0, 0.5),
			Position = var18.isTabCollapsed and UDim2.fromScale(0, 1) or UDim2.fromScale(1, 0.5),
			Size = var18.isTabCollapsed and UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.DividerSize) or UDim2.new(0, configModule.ChannelTabsSettings.DividerSize, 0.8, 0),
			BackgroundTransparency = var18.setTransparency(configModule.ChannelTabsSettings.DividerTransparency),
			BackgroundColor3 = configModule.ChannelTabsSettings.DividerColor3
		})
	})
end)