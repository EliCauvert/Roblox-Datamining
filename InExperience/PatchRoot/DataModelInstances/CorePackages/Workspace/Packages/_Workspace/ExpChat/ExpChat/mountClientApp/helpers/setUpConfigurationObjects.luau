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
local friendsChatChannelAddedModule = require(actions.FriendsChatChannelAdded)
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

local function _(p0) --[[ line: 50 | named "isKeyboardKeyCodeSanitized" ]]
	-- upvalues: userInputService (ref)
	local var30 = userInputService:GetStringForKeyCode(p0)
	
	if var30 == nil or var30 == "" or p0 == Enum.KeyCode.Unknown then
		warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(p0))
		
		return false
	end
	return true
end

local function shouldReorderTabs(value, p1) --[[ line: 63 ]]
	-- upvalues: textChatService (ref), configModule (ref)
	if p1 == nil or value[p1.Name] == nil then
		return false
	end
	local var31 = 0
	
	for i in pairs(value) do
		var31 += 1
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	
	if channelTabsConfiguration then
		local x = channelTabsConfiguration.AbsoluteSize.X
		
		return (if not (x < var31 * configModule.ChannelTabsSettings.MinTabWidth) then var31 else math.floor((x - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)) < value[p1.Name].TabIndex
	end
	return false
end

return function(p2, p3) --[[ line: 89 ]]
	-- upvalues: analytics (ref), textChatService (ref), getTransparencyStoreModule (ref), chatInputBarConfigurationEnabledModule (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), shouldReorderTabs (ref), targetTextChannelPropertyChanged (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref), devTextBoxEnabledChangedModule (ref), getEnableChatInputBarConfigurationAutocompleteEnabledModule (ref), userInputService (ref), guiService (ref), fFlagExpChatUseChatConfigStore (ref), getChatConfigurationStoreModule (ref), chatInputBarSettingsChangedModule (ref), chatWindowConfigurationEnabledModule (ref), chatLayoutHorizontalAlignmentChangedModule (ref), chatLayoutVerticalAlignmentChangedModule (ref), chatWindowSettingsChangedModule (ref), bubbleChatSettingsChangedModule (ref), setUpBubbleChatConfigurationChildrenModule (ref), playersService (ref), localTextChannelParticipantAddedModule (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatChannelAddedModule (ref), channelTabsConfigurationEnabledModule (ref), fFlagExpChatUseMessagesStore (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getMessagesStoreModule (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), channelTabsSettingsChangedModule (ref), configurationObjectsLoadedModule (ref)
	if p3.analytics then
		analytics.with(p3.analytics)
	end
	local var33 = function(p4, p5, p6) --[[ line: 94 ]]
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
	
	local var34 = function() --[[ line: 113 ]]
		-- upvalues: textChatService (copy), getTransparencyStoreModule (copy), p2 (ref), chatInputBarConfigurationEnabledModule (copy), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), p3 (ref), devTextBoxEnabledChangedModule (copy), getEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), userInputService (copy), var33 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy)
		local chatInputBarConfiguration = textChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local t = {}
		
		if not chatInputBarConfiguration then
			return {}
		end
		local var47 = getTransparencyStoreModule(false)
		p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
		
		if chatInputBarConfiguration.Enabled then
			var47.resetAllTransparency()
		end
		chatInputBarConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ line: 122 ]]
			-- upvalues: p2 (copy), chatInputBarConfigurationEnabledModule (copy), chatInputBarConfiguration (ref), var47 (ref)
			p2:dispatch(chatInputBarConfigurationEnabledModule(chatInputBarConfiguration.Enabled))
			
			if chatInputBarConfiguration.Enabled then
				var47.resetAllTransparency()
			end
		end)
		chatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(function() --[[ line: 129 ]]
			-- upvalues: chatInputBarConfiguration (ref), getFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), p2 (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
			local targetTextChannel = chatInputBarConfiguration.TargetTextChannel
			local var52 = if getFFlagExpChatEnableChannelTabsUIModule() then shouldReorderTabs(p2:getState().ChannelTabs.allChannelTabs, targetTextChannel) else false
			p2:dispatch(targetTextChannelPropertyChanged(targetTextChannel, var52))
			
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setTargetChannel(targetTextChannel and targetTextChannel.Name, var52)
			end
		end)
		
		if p3.defaultTargetTextChannel then
			chatInputBarConfiguration.TargetTextChannel = p3.defaultTargetTextChannel
		elseif textChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ line: 146 ]]
				-- upvalues: textChatService (copy), chatInputBarConfiguration (ref)
				local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
				
				if RBXGeneral and RBXGeneral:IsA("TextChannel") then
					chatInputBarConfiguration.TargetTextChannel = RBXGeneral
				end
			end)
		end
		p2:dispatch(devTextBoxEnabledChangedModule(chatInputBarConfiguration.TextBox ~= nil))
		chatInputBarConfiguration:GetPropertyChangedSignal("TextBox"):Connect(function() --[[ line: 155 ]]
			-- upvalues: p2 (copy), devTextBoxEnabledChangedModule (copy), chatInputBarConfiguration (ref)
			p2:dispatch(devTextBoxEnabledChangedModule(chatInputBarConfiguration.TextBox ~= nil))
		end)
		p2.changed:connect(function(p7, p8) --[[ line: 160 ]]
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
				local var49 = chatInputBarConfiguration[v]
				
				if v == "KeyboardKeyCode" then
					local var51
					local var50 = userInputService:GetStringForKeyCode(var49)
					
					if var50 == nil or var50 == "" or var49 == Enum.KeyCode.Unknown then
						warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var49))
						var51 = false
					else
						var51 = true
					end
					if var51 then
						t[v] = var49
						var33("ChatInputBarConfigurationLoaded", v, var49)
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
		chatInputBarConfiguration.Changed:Connect(function(p9) --[[ line: 212 ]]
			-- upvalues: chatInputBarConfiguration (ref), userInputService (copy), p2 (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatInputBarSettingsChangedModule (copy), var33 (copy)
			local var54 = chatInputBarConfiguration[p9]
			
			if p9 == "KeyboardKeyCode" then
				local var56
				local var55 = userInputService:GetStringForKeyCode(var54)
				
				if var55 == nil or var55 == "" or var54 == Enum.KeyCode.Unknown then
					warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(var54))
					var56 = false
				else
					var56 = true
				end
				if not var56 then
					chatInputBarConfiguration.KeyboardKeyCode = p2:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode
					
					return
				elseif fFlagExpChatUseChatConfigStore then
					getChatConfigurationStoreModule(false).setChatInputBarProperty(p9, var54)
				else
					p2:dispatch(chatInputBarSettingsChangedModule(p9, var54))
				end
				var33("ChatInputBarConfigurationChanged", p9, var54)
			end
		end)
		
		return t
	end
	
	local var35 = function() --[[ line: 237 ]]
		-- upvalues: textChatService (copy), p2 (ref), chatWindowConfigurationEnabledModule (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatLayoutVerticalAlignmentChangedModule (copy), var33 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), chatWindowSettingsChangedModule (copy)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local t = {}
		
		if not chatWindowConfiguration then
			return {}
		end
		p2:dispatch(chatWindowConfigurationEnabledModule(chatWindowConfiguration.Enabled))
		chatWindowConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ line: 243 ]]
			-- upvalues: p2 (copy), chatWindowConfigurationEnabledModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatWindowConfigurationEnabledModule(chatWindowConfiguration.Enabled))
		end)
		p2:dispatch(chatLayoutHorizontalAlignmentChangedModule(chatWindowConfiguration.HorizontalAlignment))
		chatWindowConfiguration:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function() --[[ line: 248 ]]
			-- upvalues: p2 (copy), chatLayoutHorizontalAlignmentChangedModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatLayoutHorizontalAlignmentChangedModule(chatWindowConfiguration.HorizontalAlignment))
		end)
		p2:dispatch(chatLayoutVerticalAlignmentChangedModule(chatWindowConfiguration.VerticalAlignment))
		chatWindowConfiguration:GetPropertyChangedSignal("VerticalAlignment"):Connect(function() --[[ line: 253 ]]
			-- upvalues: p2 (copy), chatLayoutVerticalAlignmentChangedModule (copy), chatWindowConfiguration (ref)
			p2:dispatch(chatLayoutVerticalAlignmentChangedModule(chatWindowConfiguration.VerticalAlignment))
		end)
		
		for i, v in ipairs({
			"BackgroundColor3", "BackgroundTransparency", "FontFace", "TextColor3",
			"TextSize", "TextStrokeColor3", "TextStrokeTransparency", "HeightScale",
			"WidthScale", "HorizontalAlignment", "VerticalAlignment"
		}) do
			if chatWindowConfiguration[v] then
				local var59 = chatWindowConfiguration[v]
				t[v] = var59
				var33("ChatWindowConfigurationLoaded", v, var59)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		chatWindowConfiguration.Changed:Connect(function(p10) --[[ line: 290 ]]
			-- upvalues: chatWindowConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), chatWindowSettingsChangedModule (copy), var33 (copy)
			local var60 = chatWindowConfiguration[p10]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChatWindowProperty(p10, var60)
			else
				p2:dispatch(chatWindowSettingsChangedModule(p10, var60))
			end
			var33("ChatWindowConfigurationChanged", p10, var60)
		end)
		
		return t
	end
	
	local var36 = function() --[[ line: 308 ]]
		-- upvalues: textChatService (copy), var33 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (ref), bubbleChatSettingsChangedModule (copy), setUpBubbleChatConfigurationChildrenModule (copy)
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
				local var64 = bubbleChatConfiguration[v]
				t[v] = var64
				var33("BubbleChatConfigurationLoaded", v, var64)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		bubbleChatConfiguration.Changed:Connect(function(p11) --[[ line: 349 ]]
			-- upvalues: bubbleChatConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), bubbleChatSettingsChangedModule (copy), var33 (copy)
			local var65 = bubbleChatConfiguration[p11]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setBubbleChatProperty(p11, var65)
			else
				p2:dispatch(bubbleChatSettingsChangedModule(p11, var65))
			end
			var33("BubbleChatConfigurationChanged", p11, var65)
		end)
		local var63 = setUpBubbleChatConfigurationChildrenModule(p2)
		
		for i_1, v_1 in pairs(var63) do
			if v_1 then
				t[i_1] = var63[i_1]
			end
		end
		return t
	end
	
	local var37 = function() --[[ line: 374 ]]
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
	
	local var38 = function() --[[ line: 394 ]]
		-- upvalues: textChatService (copy), fFlagExpChatEnableFriendsTab (copy), p2 (ref), friendsChatChannelAddedModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy), channelTabsConfigurationEnabledModule (copy), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var37 (ref), var33 (ref), guiService (copy), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), channelTabsSettingsChangedModule (copy)
		local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local t = {}
		
		if fFlagExpChatEnableFriendsTab then
			p2:dispatch(friendsChatChannelAddedModule("FriendsChat", 1))
			
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).addChannelTab({ type = "FriendsChat", name = "FriendsChat" }, 1)
			end
		end
		if not channelTabsConfiguration then
			return {}
		end
		p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
		
		if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
			local var68 = getMessagesStoreModule(false)
			
			if var68 then
				var68.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
			end
		end
		channelTabsConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ line: 421 ]]
			-- upvalues: p2 (copy), channelTabsConfigurationEnabledModule (copy), channelTabsConfiguration (ref), fFlagExpChatUseMessagesStore (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getMessagesStoreModule (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), var37 (copy)
			p2:dispatch(channelTabsConfigurationEnabledModule(channelTabsConfiguration.Enabled))
			
			if fFlagExpChatUseMessagesStore and getFFlagTextChatEnableUniverseChatTabs() then
				local var70 = getMessagesStoreModule(false)
				
				if var70 then
					var70.setChannelTabsConfigurationEnabled(channelTabsConfiguration.Enabled)
				end
			end
			if getFFlagExpChatFixChannelTabsMidExperienceToggleModule() and getFFlagTextChatEnableUniverseChatTabs() and channelTabsConfiguration.Enabled then
				var37()
			end
		end)
		
		for i, v in ipairs({
			"BackgroundTransparency", "BackgroundColor3", "HoverBackgroundColor3",
			"FontFace", "TextSize", "TextColor3", "SelectedTabTextColor3",
			"TextStrokeColor3", "TextStrokeTransparency"
		}) do
			if channelTabsConfiguration[v] then
				local var69 = channelTabsConfiguration[v]
				t[v] = var69
				var33("ChannelTabsConfigurationLoaded", v, var69)
			end
		end
		if guiService:IsTenFootInterface() then
			t.TextSize = math.floor(0.5 + t.TextSize * 1.5)
		end
		channelTabsConfiguration.Changed:Connect(function(p12) --[[ line: 471 ]]
			-- upvalues: channelTabsConfiguration (ref), fFlagExpChatUseChatConfigStore (copy), getChatConfigurationStoreModule (copy), p2 (copy), channelTabsSettingsChangedModule (copy), var33 (copy)
			local var71 = channelTabsConfiguration[p12]
			
			if fFlagExpChatUseChatConfigStore then
				getChatConfigurationStoreModule(false).setChannelTabsProperty(p12, var71)
			else
				p2:dispatch(channelTabsSettingsChangedModule(p12, var71))
			end
			var33("ChannelTabsConfigurationChanged", p12, var71)
		end)
		
		return t
	end
	
	local var39 = var35()
	local var40 = var36()
	local var41 = var34()
	local var42 = if getFFlagExpChatEnableChannelTabsUIModule() then var38() else {}
	
	if fFlagExpChatUseChatConfigStore then
		local var43 = getChatConfigurationStoreModule(false)
		var43.mergeBubbleChatSettings(var40)
		var43.mergeChatWindowSettings(var39)
		var43.mergeChatInputBarSettings(var41)
		var43.mergeChannelTabsSettings(var42)
		
		return
	end
	p2:dispatch(configurationObjectsLoadedModule({
		bubbleChatSettings = var40,
		chatWindowSettings = var39,
		chatInputBarSettings = var41,
		channelTabsSettings = var42
	}))
end