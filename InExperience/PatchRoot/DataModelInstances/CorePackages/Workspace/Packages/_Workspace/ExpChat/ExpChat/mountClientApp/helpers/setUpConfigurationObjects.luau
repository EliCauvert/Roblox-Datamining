local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local expChatSharedModule = require(expChat.Parent.ExpChatShared)
local analytics = expChatSharedModule.Analytics
local configModule = require(expChat.Config)
local actions = expChat.Actions
local configurationObjectsLoadedModule = require(actions.ConfigurationObjectsLoaded)
local chatInputBarConfigurationEnabledModule = require(actions.ChatInputBarConfigurationEnabled)
local chatWindowConfigurationEnabledModule = require(actions.ChatWindowConfigurationEnabled)
local channelTabsConfigurationEnabledModule = require(actions.ChannelTabsConfigurationEnabled)
local localTextChannelParticipantAddedModule = require(actions.LocalTextChannelParticipantAdded)
local targetTextChannelPropertyChanged = expChatSharedModule.Actions.TargetTextChannelPropertyChanged
local bubbleChatSettingsChangedModule = require(actions.BubbleChatSettingsChanged)
local chatLayoutVerticalAlignmentChangedModule = require(actions.ChatLayoutVerticalAlignmentChanged)
local chatLayoutHorizontalAlignmentChangedModule = require(actions.ChatLayoutHorizontalAlignmentChanged)
local chatWindowSettingsChangedModule = require(actions.ChatWindowSettingsChanged)
local chatInputBarSettingsChangedModule = require(actions.ChatInputBarSettingsChanged)
local channelTabsSettingsChangedModule = require(actions.ChannelTabsSettingsChanged)
local devTextBoxEnabledChangedModule = require(actions.DevTextBoxEnabledChanged)
local setUpBubbleChatConfigurationChildrenModule = require(script.Parent.setUpBubbleChatConfigurationChildren)
local syncFriendsTabVisibilityModule = require(script.Parent.syncFriendsTabVisibility)
local getEnableChatInputBarConfigurationAutocompleteEnabledModule = require(expChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local getFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(expChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local getTransparencyStoreModule = require(expChat.Stores.GetTransparencyStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getMessagesStoreModule = require(expChat.Stores.GetMessagesStore)
local parent = expChat.Parent
local getFFlagTextChatEnableUniverseChatTabs = require(parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local var29 = nil

local function _(p0)
	-- upvalues: userInputService (ref)
	local var31 = userInputService:GetStringForKeyCode(p0)
	
	if var31 == nil or var31 == "" or p0 == Enum.KeyCode.None then
		warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(p0))
		
		return false
	end
	return true
end

local function shouldReorderTabs(value, p1)
	-- upvalues: textChatService (ref), configModule (ref)
	if p1 == nil or value[p1.Name] == nil then
		return false
	end
	local var32 = 0
	
	for i in pairs(value) do
		var32 += 1
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	
	if channelTabsConfiguration then
		local x = channelTabsConfiguration.AbsoluteSize.X
		
		return (if not (x < var32 * configModule.ChannelTabsSettings.MinTabWidth) then var32 else math.floor((x - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)) < value[p1.Name].TabIndex
	end
	return false
end

return function(p2, p3)
	-- upvalues: analytics (ref), textChatService (ref), getTransparencyStoreModule (ref), chatInputBarConfigurationEnabledModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), shouldReorderTabs (ref), targetTextChannelPropertyChanged (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), devTextBoxEnabledChangedModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), userInputService (ref), guiService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), chatInputBarSettingsChangedModule (ref), chatWindowConfigurationEnabledModule (ref), chatLayoutHorizontalAlignmentChangedModule (ref), chatLayoutVerticalAlignmentChangedModule (ref), chatWindowSettingsChangedModule (ref), bubbleChatSettingsChangedModule (ref), setUpBubbleChatConfigurationChildrenModule (ref), playersService (ref), localTextChannelParticipantAddedModule (ref), fFlagExpChatEnableFriendsTab (ref), var29 (write), syncFriendsTabVisibilityModule (ref), channelTabsConfigurationEnabledModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getMessagesStoreModule (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), channelTabsSettingsChangedModule (ref), configurationObjectsLoadedModule (ref)
	if p3.analytics then
		analytics.with(p3.analytics)
	end
	local var34 = function(p4, p5, p6)
		-- upvalues: analytics (copy)
		local text = nil
		
		if type(p6) == "number" or type(p6) == "boolean" or typeof(p6) == "EnumItem" then
			text = tostring(p6)
		elseif typeof(p6) == "Color3" then
			text = p6:ToHex()
		elseif typeof(p6) == "Font" then
			text = tostring(string.gsub(p6.Family, "rbxasset://fonts/families/", "")) .. " " .. tostring(p6.Weight) .. " " .. tostring(p6.Style)
		else
			return
		end
		assert(text, "should exist")
		analytics.FireClientAnalyticsWithEventName(p4, { [p5] = text })
	end
	
	local var35 = function()
		-- upvalues: textChatService (copy), getTransparencyStoreModule (copy), p2 (ref), chatInputBarConfigurationEnabledModule (copy), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), p3 (ref), devTextBoxEnabledChangedModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), userInputService (copy), var34 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local t = {}
		
		if not chatInputBarConfiguration then
			return {}
		end
		local var48 = getTransparencyStoreModule(false)
		p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
		
		if chatInputBarConfiguration.Enabled then
			var48.resetAllTransparency()
		end
		chatInputBarConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), chatInputBarConfigurationEnabledModule (copy), chatInputBarConfiguration (ref), var48 (ref)
			p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
			
			if chatInputBarConfiguration.Enabled then
				var48.resetAllTransparency()
			end
		end)
		chatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(function()
			-- upvalues: chatInputBarConfiguration (ref), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), p2 (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
			local targetTextChannel = chatInputBarConfiguration.TargetTextChannel
			local var53 = if getFFlagExpChatEnableChannelTabsUIModule() then shouldReorderTabs(p2:getState().ChannelTabs.allChannelTabs, targetTextChannel) else false
			p2:dispatch(targetTextChannelPropertyChanged(targetTextChannel, var53))
			
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setTargetChannel(targetTextChannel and targetTextChannel.Name, var53)
			end
		end)
		
		if p3.defaultTargetTextChannel then
			chatInputBarConfiguration.TargetTextChannel = p3.defaultTargetTextChannel
		elseif textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function()
				-- upvalues: textChatService (copy), chatInputBarConfiguration (ref)
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				
				if RBXGeneral and RBXGeneral:IsA("TextChannel") then
					chatInputBarConfiguration.TargetTextChannel = RBXGeneral
				end
			end)
		end
		p2:dispatch(devTextBoxEnabledChangedModule(chatInputBarConfiguration.TextBox ~= nil))
		chatInputBarConfiguration:GetPropertyChangedSignal("TextBox"):Connect(function()
			-- upvalues: p2 (copy), devTextBoxEnabledChangedModule (copy), chatInputBarConfiguration (ref)
			p2:dispatch(devTextBoxEnabledChangedModule(chatInputBarConfiguration.TextBox ~= nil))
		end)
		p2.changed:connect(function(p7, p8)
			-- upvalues: chatInputBarConfiguration (ref)
			if p7.TextChannels ~= p8.TextChannels and p7.TextChannels.targetTextChannel ~= p8.TextChannels.targetTextChannel then
				chatInputBarConfiguration.TargetTextChannel = p7.TextChannels.targetTextChannel
			end
		end)
		local list = {
			"BackgroundTransparency", "BackgroundColor3", "TextSize", "TextColor3",
			"TextStrokeColor3", "TextStrokeTransparency", "FontFace", "PlaceholderColor3",
			"KeyboardKeyCode"
		}
		
		if getEnableChatInputBarConfigurationAutocompleteEnabledModule() and chatInputBarConfiguration.AutocompleteEnabled ~= nil then
			table.insert(list, "AutocompleteEnabled")
		end
		for i, v in ipairs(list) do
			if chatInputBarConfiguration[v] then
				local var50 = chatInputBarConfiguration[v]
				
				if v == "KeyboardKeyCode" then
					local var52
					local var51 = userInputService:GetStringForKeyCode(var50)
					
					if var51 == nil or var51 == "" or var50 == Enum.KeyCode.None then
						warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var50))
						var52 = false
					else
						var52 = true
					end
					if var52 then
						t[v] = var50
						var34("ChatInputBarConfigurationLoaded", v, var50)
					else
						chatInputBarConfiguration.KeyboardKeyCode = Enum.KeyCode.Slash
						t[v] = Enum.KeyCode.Slash
					end
				end
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatInputBarConfiguration.Changed:Connect(function(p9)
			-- upvalues: chatInputBarConfiguration (ref), userInputService (copy), p2 (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy), var34 (copy)
			local var55 = chatInputBarConfiguration[p9]
			
			if p9 == "KeyboardKeyCode" then
				local var57
				local var56 = userInputService:GetStringForKeyCode(var55)
				
				if var56 == nil or var56 == "" or var55 == Enum.KeyCode.None then
					warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var55))
					var57 = false
				else
					var57 = true
				end
				if not var57 then
					chatInputBarConfiguration.KeyboardKeyCode = p2:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode
					
					return
				elseif fFlagExpChatUseChatConfigStore then
					getChatConfigurationStoreModule(false).setChatInputBarProperty(p9, var55)
				else
					p2:dispatch(chatInputBarSettingsChangedModule(p9, var55))
				end
				var34("ChatInputBarConfigurationChanged", p9, var55)
			end
		end)
		
		return t
	end
	
	local var36 = function()
		-- upvalues: textChatService (copy), p2 (ref), chatWindowConfigurationEnabledModule (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatLayoutVerticalAlignmentChangedModule (copy), var34 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatWindowSettingsChangedModule (copy)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local t = {}
		
		if not chatWindowConfiguration then
			return {}
		end
		p2:dispatch(chatWindowConfigurationEnabledModule(chatWindowConfiguration.Enabled))
		chatWindowConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), chatWindowConfigurationEnabledModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatWindowConfigurationEnabledModule(chatWindowConfiguration.Enabled))
		end)
		p2:dispatch(chatLayoutHorizontalAlignmentChangedModule(chatWindowConfiguration.HorizontalAlignment))
		chatWindowConfiguration:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function()
			-- upvalues: p2 (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatLayoutHorizontalAlignmentChangedModule(chatWindowConfiguration.HorizontalAlignment))
		end)
		p2:dispatch(chatLayoutVerticalAlignmentChangedModule(chatWindowConfiguration.VerticalAlignment))
		chatWindowConfiguration:GetPropertyChangedSignal("VerticalAlignment"):Connect(function()
			-- upvalues: p2 (copy), chatLayoutVerticalAlignmentChangedModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatLayoutVerticalAlignmentChangedModule(chatWindowConfiguration.VerticalAlignment))
		end)
		
		for i, v in ipairs({
			"BackgroundColor3", "BackgroundTransparency", "FontFace", "TextColor3",
			"TextSize", "TextStrokeColor3", "TextStrokeTransparency", "HeightScale",
			"WidthScale", "HorizontalAlignment", "VerticalAlignment"
		}) do
			if chatWindowConfiguration[v] then
				local var60 = chatWindowConfiguration[v]
				t[v] = var60
				var34("ChatWindowConfigurationLoaded", v, var60)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatWindowConfiguration.Changed:Connect(function(p10)
			-- upvalues: chatWindowConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), chatWindowSettingsChangedModule (copy), var34 (copy)
			local var61 = chatWindowConfiguration[p10]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChatWindowProperty(p10, var61)
			else
				p2:dispatch(chatWindowSettingsChangedModule(p10, var61))
			end
			var34("ChatWindowConfigurationChanged", p10, var61)
		end)
		
		return t
	end
	
	local var37 = function()
		-- upvalues: textChatService (copy), var34 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (ref), bubbleChatSettingsChangedModule (copy), setUpBubbleChatConfigurationChildrenModule (copy)
		local bubbleChatConfiguration = textChatService:FindFirstChildOfClass("BubbleChatConfiguration")
		local t = {}
		
		if not bubbleChatConfiguration then
			return {}
		end
		for i, v in ipairs({
			"Enabled", "AdorneeName", "BubbleDuration", "BubblesSpacing",
			"VerticalStudsOffset", "LocalPlayerStudsOffset", "MinimizeDistance",
			"MaxDistance", "BackgroundColor3", "TextColor3", "TextSize", "FontFace",
			"MaxBubbles", "TailVisible", "BackgroundTransparency"
		}) do
			if bubbleChatConfiguration[v] ~= nil then
				local var65 = bubbleChatConfiguration[v]
				t[v] = var65
				var34("BubbleChatConfigurationLoaded", v, var65)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		bubbleChatConfiguration.Changed:Connect(function(p11)
			-- upvalues: bubbleChatConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), bubbleChatSettingsChangedModule (copy), var34 (copy)
			local var66 = bubbleChatConfiguration[p11]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setBubbleChatProperty(p11, var66)
			else
				p2:dispatch(bubbleChatSettingsChangedModule(p11, var66))
			end
			var34("BubbleChatConfigurationChanged", p11, var66)
		end)
		local var64 = setUpBubbleChatConfigurationChildrenModule(p2)
		
		for i_1, v_1 in pairs(var64) do
			if v_1 then
				t[i_1] = var64[i_1]
			end
		end
		return t
	end
	
	local var38 = function()
		-- upvalues: playersService (copy), textChatService (copy), p2 (ref), localTextChannelParticipantAddedModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		for i, v in textChatService:GetDescendants() do
			if v:IsA("TextSource") and v.UserId == localPlayer.UserId then
				local parent = v.Parent
				
				if parent and parent:IsA("TextChannel") then
					p2:dispatch(localTextChannelParticipantAddedModule(parent))
				end
			end
		end
	end
	
	local var39 = function()
		-- upvalues: textChatService (copy), fFlagExpChatEnableFriendsTab (copy), var29 (copy), syncFriendsTabVisibilityModule (copy), p2 (ref), channelTabsConfigurationEnabledModule (copy), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var38 (ref), var34 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), channelTabsSettingsChangedModule (copy)
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local t = {}
		
		if fFlagExpChatEnableFriendsTab then
			if var29 then
				var29()
			end
			var29 = syncFriendsTabVisibilityModule(p2)
		end
		if not channelTabsConfiguration then
			return {}
		end
		p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
		
		if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
			local var69 = getMessagesStoreModule(false)
			
			if var69 then
				var69.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
			end
		end
		channelTabsConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), channelTabsConfigurationEnabledModule (copy), channelTabsConfiguration (ref), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var38 (copy)
			p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
			
			if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
				local var71 = getMessagesStoreModule(false)
				
				if var71 then
					var71.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
				end
			end
			if getFFlagExpChatFixChannelTabsMidExperienceToggleModule() and getFFlagTextChatEnableUniverseChatTabs() and channelTabsConfiguration.Enabled then
				var38()
			end
		end)
		
		for i, v in ipairs({
			"BackgroundTransparency", "BackgroundColor3", "HoverBackgroundColor3",
			"FontFace", "TextSize", "TextColor3", "SelectedTabTextColor3",
			"TextStrokeColor3", "TextStrokeTransparency"
		}) do
			if channelTabsConfiguration[v] then
				local var70 = channelTabsConfiguration[v]
				t[v] = var70
				var34("ChannelTabsConfigurationLoaded", v, var70)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		channelTabsConfiguration.Changed:Connect(function(p12)
			-- upvalues: channelTabsConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), channelTabsSettingsChangedModule (copy), var34 (copy)
			local var72 = channelTabsConfiguration[p12]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChannelTabsProperty(p12, var72)
			else
				p2:dispatch(channelTabsSettingsChangedModule(p12, var72))
			end
			var34("ChannelTabsConfigurationChanged", p12, var72)
		end)
		
		return t
	end
	
	local var40 = var36()
	local var41 = var37()
	local var42 = var35()
	local var43 = if getFFlagExpChatEnableChannelTabsUIModule() then var39() else {}
	
	if fFlagExpChatUseChatConfigStore then
		local var44 = getChatConfigurationStoreModule(false)
		var44.mergeBubbleChatSettings(var41)
		var44.mergeChatWindowSettings(var40)
		var44.mergeChatInputBarSettings(var42)
		var44.mergeChannelTabsSettings(var43)
		
		return
	end
	p2:dispatch(configurationObjectsLoadedModule({
		bubbleChatSettings = var41,
		chatWindowSettings = var40,
		chatInputBarSettings = var42,
		channelTabsSettings = var43
	}))
end