local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local isTenFootInterface = require(expChat.Parent.AppCommonLib).isTenFootInterface
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
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local isGlobalTabFirstModule = require(expChat.isGlobalTabFirst)
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
local fFlagExpChatTabShortcutNav = sharedFlagsModule.FFlagExpChatTabShortcutNav
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
	-- upvalues: textChatService (ref), configModule (ref), fFlagExpChatUseChannelTabsStore (ref)
	local var2 = if p1 then value[p1.Name] else nil
	
	if var2 == nil then
		return false
	end
	local var3 = 0
	
	for i in pairs(value) do
		var3 += 1
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	
	if channelTabsConfiguration then
		local x = channelTabsConfiguration.AbsoluteSize.X
		
		return (if not (x < var3 * configModule.ChannelTabsSettings.MinTabWidth) then var3 else math.floor((x - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)) < (if fFlagExpChatUseChannelTabsStore then var2.tabIndex else var2.TabIndex)
	end
	return false
end

return function(p2, p3)
	-- upvalues: analytics (ref), textChatService (ref), getTransparencyStoreModule (ref), chatInputBarConfigurationEnabledModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), shouldReorderTabs (ref), fFlagExpChatTabShortcutNav (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref), targetTextChannelPropertyChanged (ref), devTextBoxEnabledChangedModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), userInputService (ref), isTenFootInterface (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), chatInputBarSettingsChangedModule (ref), chatWindowConfigurationEnabledModule (ref), chatLayoutHorizontalAlignmentChangedModule (ref), chatLayoutVerticalAlignmentChangedModule (ref), chatWindowSettingsChangedModule (ref), bubbleChatSettingsChangedModule (ref), setUpBubbleChatConfigurationChildrenModule (ref), playersService (ref), localTextChannelParticipantAddedModule (ref), fFlagExpChatEnableFriendsTab (ref), var1 (write), syncFriendsTabVisibilityModule (ref), channelTabsConfigurationEnabledModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getMessagesStoreModule (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), channelTabsSettingsChangedModule (ref), configurationObjectsLoadedModule (ref)
	if p3.analytics then
		analytics.with(p3.analytics)
	end
	local var4 = function(p4, p5, p6)
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
	
	local var5 = false
	
	local var6 = function()
		-- upvalues: textChatService (copy), getTransparencyStoreModule (copy), p2 (ref), chatInputBarConfigurationEnabledModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), shouldReorderTabs (copy), fFlagExpChatTabShortcutNav (copy), fFlagExpChatGlobalTabDefaultModule (copy), var5 (write), isGlobalTabFirstModule (copy), targetTextChannelPropertyChanged (copy), p3 (ref), devTextBoxEnabledChangedModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), userInputService (copy), var4 (ref), isTenFootInterface (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local t = {}
		
		if not chatInputBarConfiguration then
			return {}
		end
		local var7 = getTransparencyStoreModule(false)
		p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
		
		if chatInputBarConfiguration.Enabled then
			var7.resetAllTransparency()
		end
		chatInputBarConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), chatInputBarConfigurationEnabledModule (copy), chatInputBarConfiguration (ref), var7 (ref)
			p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
			
			if chatInputBarConfiguration.Enabled then
				var7.resetAllTransparency()
			end
		end)
		chatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(function()
			-- upvalues: chatInputBarConfiguration (ref), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), p2 (copy), shouldReorderTabs (copy), fFlagExpChatTabShortcutNav (copy), fFlagExpChatGlobalTabDefaultModule (copy), var5 (copy), isGlobalTabFirstModule (copy), targetTextChannelPropertyChanged (copy)
			local targetTextChannel = chatInputBarConfiguration.TargetTextChannel
			local var8 = shouldReorderTabs(if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false).getChannelTabsState(false).allChannelTabs else p2:getState().ChannelTabs.allChannelTabs, targetTextChannel)
			
			if fFlagExpChatTabShortcutNav and var8 and (targetTextChannel ~= nil and (if fFlagExpChatUseChannelTabsStore then getChannelTabsStoreModule(false).getChannelTabsState(false).selectedTabName else p2:getState().ChannelTabs.selectedTabName) == targetTextChannel.Name) then
				var8 = false
			end
			if fFlagExpChatGlobalTabDefaultModule and var5 and isGlobalTabFirstModule() then
				local hasUserSelectedTab, selectedTabName
				var5 = false
				local _ = nil
				local _ = nil
				
				if fFlagExpChatUseChannelTabsStore then
					local channelTabsState = getChannelTabsStoreModule(false).getChannelTabsState(false)
					hasUserSelectedTab = channelTabsState.hasUserSelectedTab
					selectedTabName = channelTabsState.selectedTabName
				else
					local channelTabs = p2:getState().ChannelTabs
					hasUserSelectedTab = channelTabs ~= nil and channelTabs.hasUserSelectedTab
					selectedTabName = if channelTabs ~= nil then nil else channelTabs.selectedTabName
				end
				if not hasUserSelectedTab and selectedTabName == "RBXGlobal" then return end
			end
			p2:dispatch(targetTextChannelPropertyChanged(targetTextChannel, var8))
			
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setTargetChannel(targetTextChannel and targetTextChannel.Name, var8)
			end
		end)
		
		if p3.defaultTargetTextChannel then
			chatInputBarConfiguration.TargetTextChannel = p3.defaultTargetTextChannel
		elseif textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function()
				-- upvalues: textChatService (copy), fFlagExpChatGlobalTabDefaultModule (copy), var5 (copy), chatInputBarConfiguration (ref)
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				
				if RBXGeneral and RBXGeneral:IsA("TextChannel") then
					if fFlagExpChatGlobalTabDefaultModule then
						var5 = true
					end
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
				local var8 = chatInputBarConfiguration[v]
				
				if v == "KeyboardKeyCode" then
					local var9
					local var10 = userInputService:GetStringForKeyCode(var8)
					
					if var10 == nil or var10 == "" or var8 == Enum.KeyCode.None then
						warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var8))
						var9 = false
					else
						var9 = true
					end
					if var9 then
						t[v] = var8
						var4("ChatInputBarConfigurationLoaded", v, var8)
					else
						chatInputBarConfiguration.KeyboardKeyCode = Enum.KeyCode.Slash
						t[v] = Enum.KeyCode.Slash
					end
				end
			end
		end
		if isTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatInputBarConfiguration.Changed:Connect(function(p4)
			-- upvalues: chatInputBarConfiguration (ref), userInputService (copy), p2 (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy), var4 (copy)
			local var11 = chatInputBarConfiguration[p4]
			
			if p4 == "KeyboardKeyCode" then
				local var12
				local var13 = userInputService:GetStringForKeyCode(var11)
				
				if var13 == nil or var13 == "" or var11 == Enum.KeyCode.None then
					warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var11))
					var12 = false
				else
					var12 = true
				end
				if not var12 then
					chatInputBarConfiguration.KeyboardKeyCode = p2:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode
					
					return
				elseif fFlagExpChatUseChatConfigStore then
					getChatConfigurationStoreModule(false).setChatInputBarProperty(p4, var11)
				else
					p2:dispatch(chatInputBarSettingsChangedModule(p4, var11))
				end
				var4("ChatInputBarConfigurationChanged", p4, var11)
			end
		end)
		
		return t
	end
	
	local var11 = function()
		-- upvalues: textChatService (copy), p2 (ref), chatWindowConfigurationEnabledModule (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatLayoutVerticalAlignmentChangedModule (copy), var4 (ref), isTenFootInterface (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatWindowSettingsChangedModule (copy)
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
				local var12 = chatWindowConfiguration[v]
				t[v] = var12
				var4("ChatWindowConfigurationLoaded", v, var12)
			end
		end
		if isTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatWindowConfiguration.Changed:Connect(function(p4)
			-- upvalues: chatWindowConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), chatWindowSettingsChangedModule (copy), var4 (copy)
			local var13 = chatWindowConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChatWindowProperty(p4, var13)
			else
				p2:dispatch(chatWindowSettingsChangedModule(p4, var13))
			end
			var4("ChatWindowConfigurationChanged", p4, var13)
		end)
		
		return t
	end
	
	local var13 = function()
		-- upvalues: textChatService (copy), var4 (ref), isTenFootInterface (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (ref), bubbleChatSettingsChangedModule (copy), setUpBubbleChatConfigurationChildrenModule (copy)
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
				local var14 = bubbleChatConfiguration[v]
				t[v] = var14
				var4("BubbleChatConfigurationLoaded", v, var14)
			end
		end
		if isTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		bubbleChatConfiguration.Changed:Connect(function(p4)
			-- upvalues: bubbleChatConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), bubbleChatSettingsChangedModule (copy), var4 (copy)
			local var15 = bubbleChatConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setBubbleChatProperty(p4, var15)
			else
				p2:dispatch(bubbleChatSettingsChangedModule(p4, var15))
			end
			var4("BubbleChatConfigurationChanged", p4, var15)
		end)
		local var15 = setUpBubbleChatConfigurationChildrenModule(p2)
		
		for i_1, v_1 in pairs(var15) do
			if v_1 then
				t[i_1] = var15[i_1]
			end
		end
		return t
	end
	
	local var16 = function()
		-- upvalues: playersService (copy), textChatService (copy), p2 (ref), localTextChannelParticipantAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		for i, v in textChatService:GetDescendants() do
			if v:IsA("TextSource") and v.UserId == localPlayer.UserId then
				local parent = v.Parent
				
				if parent and parent:IsA("TextChannel") then
					p2:dispatch(localTextChannelParticipantAddedModule(parent))
					
					if fFlagExpChatUseChannelTabsStore then
						getChannelTabsStoreModule(false).handleLocalTextChannelParticipantAdded(parent)
					end
				end
			end
		end
	end
	
	local var17 = function()
		-- upvalues: textChatService (copy), fFlagExpChatEnableFriendsTab (copy), var1 (copy), syncFriendsTabVisibilityModule (copy), p2 (ref), channelTabsConfigurationEnabledModule (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var16 (ref), var4 (ref), isTenFootInterface (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), channelTabsSettingsChangedModule (copy)
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
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local var18 = getMessagesStoreModule(false)
			
			if var18 then
				var18.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
			end
		end
		if fFlagExpChatUseChannelTabsStore then
			getChannelTabsStoreModule(false).setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
		end
		channelTabsConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p2 (copy), channelTabsConfigurationEnabledModule (copy), channelTabsConfiguration (ref), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var16 (copy)
			p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				local var19 = getMessagesStoreModule(false)
				
				if var19 then
					var19.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
				end
			end
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
			end
			if getFFlagExpChatFixChannelTabsMidExperienceToggleModule() and getFFlagTextChatEnableUniverseChatTabs() and channelTabsConfiguration.Enabled then
				var16()
			end
		end)
		
		for i, v in ipairs({
			"BackgroundTransparency", "BackgroundColor3", "HoverBackgroundColor3",
			"FontFace", "TextSize", "TextColor3", "SelectedTabTextColor3",
			"TextStrokeColor3", "TextStrokeTransparency"
		}) do
			if channelTabsConfiguration[v] then
				local var19 = channelTabsConfiguration[v]
				t[v] = var19
				var4("ChannelTabsConfigurationLoaded", v, var19)
			end
		end
		if isTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		channelTabsConfiguration.Changed:Connect(function(p4)
			-- upvalues: channelTabsConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), channelTabsSettingsChangedModule (copy), var4 (copy)
			local var20 = channelTabsConfiguration[p4]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChannelTabsProperty(p4, var20)
			else
				p2:dispatch(channelTabsSettingsChangedModule(p4, var20))
			end
			var4("ChannelTabsConfigurationChanged", p4, var20)
		end)
		
		return t
	end
	
	local var20 = var11()
	local var21 = var13()
	local var22 = var6()
	local var23 = var17()
	
	if fFlagExpChatUseChatConfigStore then
		local var24 = getChatConfigurationStoreModule(false)
		var24.mergeBubbleChatSettings(var21)
		var24.mergeChatWindowSettings(var20)
		var24.mergeChatInputBarSettings(var22)
		var24.mergeChannelTabsSettings(var23)
	else
		p2:dispatch(configurationObjectsLoadedModule({
			bubbleChatSettings = var21,
			chatWindowSettings = var20,
			chatInputBarSettings = var22,
			channelTabsSettings = var23
		}))
	end
end