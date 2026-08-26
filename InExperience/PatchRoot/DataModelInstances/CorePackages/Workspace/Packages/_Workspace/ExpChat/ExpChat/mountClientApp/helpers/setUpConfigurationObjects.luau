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
local var1 = nil

local function _(p1)
	-- upvalues: userInputService (ref)
	local var2 = userInputService:GetStringForKeyCode(p1)
	
	if var2 == nil or var2 == "" or p1 == Enum.KeyCode.None then
		warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(p1))
		
		return false
	end
	return true
end

local function shouldReorderTabs(value, p1)
	-- upvalues: textChatService (ref), configModule (ref)
	if p1 == nil or value[p1.Name] == nil then
		return false
	end
	local var2 = 0
	
	for i in pairs(value) do
		var2 += 1
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	
	if channelTabsConfiguration then
		local x = channelTabsConfiguration.AbsoluteSize.X
		
		return (if not (x < var2 * configModule.ChannelTabsSettings.MinTabWidth) then var2 else math.floor((x - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)) < value[p1.Name].TabIndex
	end
	return false
end

return function(p2, p3)
	-- upvalues: analytics (ref), textChatService (ref), getTransparencyStoreModule (ref), chatInputBarConfigurationEnabledModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), shouldReorderTabs (ref), targetTextChannelPropertyChanged (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), devTextBoxEnabledChangedModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), userInputService (ref), guiService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), chatInputBarSettingsChangedModule (ref), chatWindowConfigurationEnabledModule (ref), chatLayoutHorizontalAlignmentChangedModule (ref), chatLayoutVerticalAlignmentChangedModule (ref), chatWindowSettingsChangedModule (ref), bubbleChatSettingsChangedModule (ref), setUpBubbleChatConfigurationChildrenModule (ref), playersService (ref), localTextChannelParticipantAddedModule (ref), fFlagExpChatEnableFriendsTab (ref), var1 (write), syncFriendsTabVisibilityModule (ref), channelTabsConfigurationEnabledModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getMessagesStoreModule (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), channelTabsSettingsChangedModule (ref), configurationObjectsLoadedModule (ref)
	if p3.analytics then
		analytics.with(p3.analytics)
	end
	local var3 = function(p4, p5, p6)
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
	
	local var4 = function()
		-- upvalues: textChatService (copy), getTransparencyStoreModule (copy), p2 (ref), chatInputBarConfigurationEnabledModule (copy), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), p3 (ref), devTextBoxEnabledChangedModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), userInputService (copy), var3 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local t = {}
		
		if not chatInputBarConfiguration then
			return {}
		end
		local var5 = getTransparencyStoreModule(false)
		p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
		
		if chatInputBarConfiguration.Enabled then
			var5.resetAllTransparency()
		end
		chatInputBarConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), chatInputBarConfigurationEnabledModule (copy), chatInputBarConfiguration (ref), var5 (ref)
			p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
			
			if chatInputBarConfiguration.Enabled then
				var5.resetAllTransparency()
			end
		end)
		chatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(function()
			-- upvalues: chatInputBarConfiguration (ref), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), p2 (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
			local targetTextChannel = chatInputBarConfiguration.TargetTextChannel
			local var6 = if getFFlagExpChatEnableChannelTabsUIModule() then shouldReorderTabs(p2:getState().ChannelTabs.allChannelTabs, targetTextChannel) else false
			p2:dispatch(targetTextChannelPropertyChanged(targetTextChannel, var6))
			
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setTargetChannel(targetTextChannel and targetTextChannel.Name, var6)
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
		p2.changed:connect(function(p4, p5)
			-- upvalues: chatInputBarConfiguration (ref)
			if p4.TextChannels ~= p5.TextChannels and p4.TextChannels.targetTextChannel ~= p5.TextChannels.targetTextChannel then
				chatInputBarConfiguration.TargetTextChannel = p4.TextChannels.targetTextChannel
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
				local var6 = chatInputBarConfiguration[v]
				
				if v == "KeyboardKeyCode" then
					local var7
					local var8 = userInputService:GetStringForKeyCode(var6)
					
					if var8 == nil or var8 == "" or var6 == Enum.KeyCode.None then
						warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var6))
						var7 = false
					else
						var7 = true
					end
					if var7 then
						t[v] = var6
						var3("ChatInputBarConfigurationLoaded", v, var6)
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
		chatInputBarConfiguration.Changed:Connect(function(p4)
			-- upvalues: chatInputBarConfiguration (ref), userInputService (copy), p2 (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy), var3 (copy)
			local var9 = chatInputBarConfiguration[p4]
			
			if p4 == "KeyboardKeyCode" then
				local var10
				local var11 = userInputService:GetStringForKeyCode(var9)
				
				if var11 == nil or var11 == "" or var9 == Enum.KeyCode.None then
					warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var9))
					var10 = false
				else
					var10 = true
				end
				if not var10 then
					chatInputBarConfiguration.KeyboardKeyCode = p2:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode
					
					return
				elseif fFlagExpChatUseChatConfigStore then
					getChatConfigurationStoreModule(false).setChatInputBarProperty(p4, var9)
				else
					p2:dispatch(chatInputBarSettingsChangedModule(p4, var9))
				end
				var3("ChatInputBarConfigurationChanged", p4, var9)
			end
		end)
		
		return t
	end
	
	local var9 = function()
		-- upvalues: textChatService (copy), p2 (ref), chatWindowConfigurationEnabledModule (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatLayoutVerticalAlignmentChangedModule (copy), var3 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatWindowSettingsChangedModule (copy)
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
				local var10 = chatWindowConfiguration[v]
				t[v] = var10
				var3("ChatWindowConfigurationLoaded", v, var10)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatWindowConfiguration.Changed:Connect(function(p4)
			-- upvalues: chatWindowConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), chatWindowSettingsChangedModule (copy), var3 (copy)
			local var11 = chatWindowConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChatWindowProperty(p4, var11)
			else
				p2:dispatch(chatWindowSettingsChangedModule(p4, var11))
			end
			var3("ChatWindowConfigurationChanged", p4, var11)
		end)
		
		return t
	end
	
	local var11 = function()
		-- upvalues: textChatService (copy), var3 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (ref), bubbleChatSettingsChangedModule (copy), setUpBubbleChatConfigurationChildrenModule (copy)
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
				local var12 = bubbleChatConfiguration[v]
				t[v] = var12
				var3("BubbleChatConfigurationLoaded", v, var12)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		bubbleChatConfiguration.Changed:Connect(function(p4)
			-- upvalues: bubbleChatConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), bubbleChatSettingsChangedModule (copy), var3 (copy)
			local var13 = bubbleChatConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setBubbleChatProperty(p4, var13)
			else
				p2:dispatch(bubbleChatSettingsChangedModule(p4, var13))
			end
			var3("BubbleChatConfigurationChanged", p4, var13)
		end)
		local var13 = setUpBubbleChatConfigurationChildrenModule(p2)
		
		for i_1, v_1 in pairs(var13) do
			if v_1 then
				t[i_1] = var13[i_1]
			end
		end
		return t
	end
	
	local var14 = function()
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
	
	local var15 = function()
		-- upvalues: textChatService (copy), fFlagExpChatEnableFriendsTab (copy), var1 (copy), syncFriendsTabVisibilityModule (copy), p2 (ref), channelTabsConfigurationEnabledModule (copy), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var14 (ref), var3 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), channelTabsSettingsChangedModule (copy)
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local t = {}
		
		if fFlagExpChatEnableFriendsTab then
			if var1 then
				var1()
			end
			var1 = syncFriendsTabVisibilityModule(p2)
		end
		if not channelTabsConfiguration then
			return {}
		end
		p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
		
		if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
			local var16 = getMessagesStoreModule(false)
			
			if var16 then
				var16.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
			end
		end
		channelTabsConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), channelTabsConfigurationEnabledModule (copy), channelTabsConfiguration (ref), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var14 (copy)
			p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
			
			if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
				local var17 = getMessagesStoreModule(false)
				
				if var17 then
					var17.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
				end
			end
			if getFFlagExpChatFixChannelTabsMidExperienceToggleModule() and getFFlagTextChatEnableUniverseChatTabs() and channelTabsConfiguration.Enabled then
				var14()
			end
		end)
		
		for i, v in ipairs({
			"BackgroundTransparency", "BackgroundColor3", "HoverBackgroundColor3",
			"FontFace", "TextSize", "TextColor3", "SelectedTabTextColor3",
			"TextStrokeColor3", "TextStrokeTransparency"
		}) do
			if channelTabsConfiguration[v] then
				local var17 = channelTabsConfiguration[v]
				t[v] = var17
				var3("ChannelTabsConfigurationLoaded", v, var17)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		channelTabsConfiguration.Changed:Connect(function(p4)
			-- upvalues: channelTabsConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), channelTabsSettingsChangedModule (copy), var3 (copy)
			local var18 = channelTabsConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChannelTabsProperty(p4, var18)
			else
				p2:dispatch(channelTabsSettingsChangedModule(p4, var18))
			end
			var3("ChannelTabsConfigurationChanged", p4, var18)
		end)
		
		return t
	end
	
	local var18 = var9()
	local var19 = var11()
	local var20 = var4()
	local var21 = if getFFlagExpChatEnableChannelTabsUIModule() then var15() else {}
	
	if fFlagExpChatUseChatConfigStore then
		local var22 = getChatConfigurationStoreModule(false)
		var22.mergeBubbleChatSettings(var19)
		var22.mergeChatWindowSettings(var18)
		var22.mergeChatInputBarSettings(var20)
		var22.mergeChannelTabsSettings(var21)
		
		return
	end
	p2:dispatch(configurationObjectsLoadedModule({
		bubbleChatSettings = var19,
		chatWindowSettings = var18,
		chatInputBarSettings = var20,
		channelTabsSettings = var21
	}))
end