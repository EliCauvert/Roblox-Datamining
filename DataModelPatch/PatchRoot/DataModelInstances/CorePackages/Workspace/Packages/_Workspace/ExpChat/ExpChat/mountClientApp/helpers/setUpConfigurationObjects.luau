local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatSharedModule = require(ExpChat.Parent.ExpChatShared)
local Analytics = ExpChatSharedModule.Analytics
local ConfigModule = require(ExpChat.Config)
local Actions = ExpChat.Actions
local ConfigurationObjectsLoadedModule = require(Actions.ConfigurationObjectsLoaded)
local ChatInputBarConfigurationEnabledModule = require(Actions.ChatInputBarConfigurationEnabled)
local ChatWindowConfigurationEnabledModule = require(Actions.ChatWindowConfigurationEnabled)
local ChannelTabsConfigurationEnabledModule = require(Actions.ChannelTabsConfigurationEnabled)
local FriendsChatChannelAddedModule = require(Actions.FriendsChatChannelAdded)
local LocalTextChannelParticipantAddedModule = require(Actions.LocalTextChannelParticipantAdded)
local TargetTextChannelPropertyChangedFunction = ExpChatSharedModule.Actions.TargetTextChannelPropertyChanged
local BubbleChatSettingsChangedModule = require(Actions.BubbleChatSettingsChanged)
local ChatLayoutVerticalAlignmentChangedModule = require(Actions.ChatLayoutVerticalAlignmentChanged)
local ChatLayoutHorizontalAlignmentChangedModule = require(Actions.ChatLayoutHorizontalAlignmentChanged)
local ChatWindowSettingsChangedModule = require(Actions.ChatWindowSettingsChanged)
local ChatInputBarSettingsChangedModule = require(Actions.ChatInputBarSettingsChanged)
local ChannelTabsSettingsChangedModule = require(Actions.ChannelTabsSettingsChanged)
local DevTextBoxEnabledChangedModule = require(Actions.DevTextBoxEnabledChanged)
local SetUpBubbleChatConfigurationChildrenModule = require(script.Parent.setUpBubbleChatConfigurationChildren)
local GetEnableChatInputBarConfigurationAutocompleteEnabledModule = require(ExpChat.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled)
local GetFFlagExpChatEnableChannelTabsUIModule = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local GetFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(ExpChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local GetTransparencyStoreModule = require(ExpChat.Stores.GetTransparencyStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local Parent = ExpChat.Parent
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore

local function _(KeyCode): boolean
	-- upvalues: UserInputService (copy)
	local StringForKeyCode = UserInputService:GetStringForKeyCode(KeyCode)
	
	if StringForKeyCode == nil or StringForKeyCode == "" or KeyCode == Enum.KeyCode.Unknown then
		warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(KeyCode))
		
		return false
	else
		return true
	end
end

local function shouldReorderTabs(AllChannelTabs, TargetTextChannel): boolean
	-- upvalues: TextChatService (copy), ConfigModule (copy)
	if TargetTextChannel == nil or AllChannelTabs[TargetTextChannel.Name] == nil then
		return false
	end
	local Count = 0
	
	for _ in pairs(AllChannelTabs) do
		Count += 1
	end
	local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	
	if ChannelTabsConfiguration then
		local X = ChannelTabsConfiguration.AbsoluteSize.X
		
		return (if X < Count * ConfigModule.ChannelTabsSettings.MinTabWidth then math.floor((X - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth) else Count or math.floor((X - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth)) < AllChannelTabs[TargetTextChannel.Name].TabIndex
	else
		return false
	end
end

return function(p1, p2)
	-- upvalues: Analytics (copy), TextChatService (copy), GetTransparencyStoreModule (copy), ChatInputBarConfigurationEnabledModule (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), shouldReorderTabs (copy), TargetTextChannelPropertyChangedFunction (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy), DevTextBoxEnabledChangedModule (copy), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (copy), UserInputService (copy), GuiService (copy), FFlagExpChatUseChatConfigStore (copy), GetChatConfigurationStoreModule (copy), ChatInputBarSettingsChangedModule (copy), ChatWindowConfigurationEnabledModule (copy), ChatLayoutHorizontalAlignmentChangedModule (copy), ChatLayoutVerticalAlignmentChangedModule (copy), ChatWindowSettingsChangedModule (copy), BubbleChatSettingsChangedModule (copy), SetUpBubbleChatConfigurationChildrenModule (copy), Players (copy), LocalTextChannelParticipantAddedModule (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatChannelAddedModule (copy), ChannelTabsConfigurationEnabledModule (copy), FFlagExpChatUseMessagesStore (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetMessagesStoreModule (copy), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), ChannelTabsSettingsChangedModule (copy), ConfigurationObjectsLoadedModule (copy)
	if p2.analytics then
		Analytics.with(p2.analytics)
	end
	local function v42(p3, p4, KeyCode)
		-- upvalues: Analytics (upval)
		local Hex = nil
		
		if type(KeyCode) == "number" or type(KeyCode) == "boolean" or typeof(KeyCode) == "EnumItem" then
			Hex = tostring(KeyCode)
		elseif typeof(KeyCode) == "Color3" then
			Hex = KeyCode:ToHex()
		else
			if typeof(KeyCode) ~= "Font" then return end
			Hex = tostring((string.gsub(KeyCode.Family, "rbxasset://fonts/families/", ""))) .. " " .. tostring(KeyCode.Weight) .. " " .. tostring(KeyCode.Style)
		end
		assert(Hex, "should exist")
		Analytics.FireClientAnalyticsWithEventName(p3, { [p4] = Hex })
	end
	
	local function v43()
		-- upvalues: Players (upval), TextChatService (upval), p1 (copy), LocalTextChannelParticipantAddedModule (upval)
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then return end
		for _, TextSource in TextChatService:GetDescendants() do
			if TextSource:IsA("TextSource") and TextSource.UserId == LocalPlayer.UserId then
				local Parent = TextSource.Parent
				
				if Parent and Parent:IsA("TextChannel") then
					p1:dispatch(LocalTextChannelParticipantAddedModule(Parent))
				end
			end
		end
	end
	
	local function v44()
		-- upvalues: TextChatService (upval), FFlagExpChatEnableFriendsTab (upval), p1 (copy), FriendsChatChannelAddedModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), ChannelTabsConfigurationEnabledModule (upval), FFlagExpChatUseMessagesStore (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetMessagesStoreModule (upval), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (upval), v43 (copy), v42 (copy), GuiService (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ChannelTabsSettingsChangedModule (upval)
		local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
		local Label = {}
		
		if FFlagExpChatEnableFriendsTab then
			p1:dispatch(FriendsChatChannelAddedModule("FriendsChat", 1))
			
			if FFlagExpChatUseChannelTabsStore then
				GetChannelTabsStoreModule(false).addChannelTab({ type = "FriendsChat", name = "FriendsChat" }, nil)
			end
		end
		if not ChannelTabsConfiguration then
			return {}
		end
		p1:dispatch(ChannelTabsConfigurationEnabledModule(ChannelTabsConfiguration.Enabled))
		
		if FFlagExpChatUseMessagesStore and GetFFlagTextChatEnableUniverseChatTabsFunction() then
			local MessagesStoreModule = GetMessagesStoreModule(false)
			
			if MessagesStoreModule then
				MessagesStoreModule.setChannelTabsConfigurationEnabled(ChannelTabsConfiguration.Enabled)
			end
		end
		ChannelTabsConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p1 (upval), ChannelTabsConfigurationEnabledModule (upval), ChannelTabsConfiguration (copy), FFlagExpChatUseMessagesStore (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetMessagesStoreModule (upval), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (upval), v43 (upval)
			p1:dispatch(ChannelTabsConfigurationEnabledModule(ChannelTabsConfiguration.Enabled))
			
			if FFlagExpChatUseMessagesStore and GetFFlagTextChatEnableUniverseChatTabsFunction() then
				local MessagesStoreModule = GetMessagesStoreModule(false)
				
				if MessagesStoreModule then
					MessagesStoreModule.setChannelTabsConfigurationEnabled(ChannelTabsConfiguration.Enabled)
				end
			end
			if GetFFlagExpChatFixChannelTabsMidExperienceToggleModule() and GetFFlagTextChatEnableUniverseChatTabsFunction() and ChannelTabsConfiguration.Enabled then
				v43()
			end
		end)
		
		for _, value in ipairs({
			"BackgroundTransparency", "BackgroundColor3", "HoverBackgroundColor3",
			"FontFace", "TextSize", "TextColor3", "SelectedTabTextColor3",
			"TextStrokeColor3", "TextStrokeTransparency"
		}) do
			if ChannelTabsConfiguration[value] then
				local ChannelTabsConfigurationEntry = ChannelTabsConfiguration[value]
				Label[value] = ChannelTabsConfigurationEntry
				v42("ChannelTabsConfigurationLoaded", value, ChannelTabsConfigurationEntry)
			end
		end
		if GuiService:IsTenFootInterface() then
			Label.TextSize = math.floor(0.5 + Label.TextSize * 1.5)
		end
		ChannelTabsConfiguration.Changed:Connect(function(Property)
			-- upvalues: ChannelTabsConfiguration (copy), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), p1 (upval), ChannelTabsSettingsChangedModule (upval), v42 (upval)
			local ChannelTabsConfigurationEntry = ChannelTabsConfiguration[Property]
			
			if FFlagExpChatUseChatConfigStore then
				GetChatConfigurationStoreModule(false).setChannelTabsProperty(Property, ChannelTabsConfigurationEntry)
			else
				p1:dispatch(ChannelTabsSettingsChangedModule(Property, ChannelTabsConfigurationEntry))
			end
			v42("ChannelTabsConfigurationChanged", Property, ChannelTabsConfigurationEntry)
		end)
		
		return Label
	end
	
	local ChatWindowSettings = (function()
		-- upvalues: TextChatService (upval), p1 (copy), ChatWindowConfigurationEnabledModule (upval), ChatLayoutHorizontalAlignmentChangedModule (upval), ChatLayoutVerticalAlignmentChangedModule (upval), v42 (copy), GuiService (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ChatWindowSettingsChangedModule (upval)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local Label = {}
		
		if not ChatWindowConfiguration then
			return {}
		end
		p1:dispatch(ChatWindowConfigurationEnabledModule(ChatWindowConfiguration.Enabled))
		ChatWindowConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p1 (upval), ChatWindowConfigurationEnabledModule (upval), ChatWindowConfiguration (copy)
			p1:dispatch(ChatWindowConfigurationEnabledModule(ChatWindowConfiguration.Enabled))
		end)
		p1:dispatch(ChatLayoutHorizontalAlignmentChangedModule(ChatWindowConfiguration.HorizontalAlignment))
		ChatWindowConfiguration:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function()
			-- upvalues: p1 (upval), ChatLayoutHorizontalAlignmentChangedModule (upval), ChatWindowConfiguration (copy)
			p1:dispatch(ChatLayoutHorizontalAlignmentChangedModule(ChatWindowConfiguration.HorizontalAlignment))
		end)
		p1:dispatch(ChatLayoutVerticalAlignmentChangedModule(ChatWindowConfiguration.VerticalAlignment))
		ChatWindowConfiguration:GetPropertyChangedSignal("VerticalAlignment"):Connect(function()
			-- upvalues: p1 (upval), ChatLayoutVerticalAlignmentChangedModule (upval), ChatWindowConfiguration (copy)
			p1:dispatch(ChatLayoutVerticalAlignmentChangedModule(ChatWindowConfiguration.VerticalAlignment))
		end)
		
		for _, value in ipairs({
			"BackgroundColor3", "BackgroundTransparency", "FontFace", "TextColor3",
			"TextSize", "TextStrokeColor3", "TextStrokeTransparency", "HeightScale",
			"WidthScale", "HorizontalAlignment", "VerticalAlignment"
		}) do
			if ChatWindowConfiguration[value] then
				local ChatWindowConfigurationEntry = ChatWindowConfiguration[value]
				Label[value] = ChatWindowConfigurationEntry
				v42("ChatWindowConfigurationLoaded", value, ChatWindowConfigurationEntry)
			end
		end
		if GuiService:IsTenFootInterface() then
			Label.TextSize = math.floor(0.5 + Label.TextSize * 1.5)
		end
		ChatWindowConfiguration.Changed:Connect(function(Property)
			-- upvalues: ChatWindowConfiguration (copy), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), p1 (upval), ChatWindowSettingsChangedModule (upval), v42 (upval)
			local ChatWindowConfigurationEntry = ChatWindowConfiguration[Property]
			
			if FFlagExpChatUseChatConfigStore then
				GetChatConfigurationStoreModule(false).setChatWindowProperty(Property, ChatWindowConfigurationEntry)
			else
				p1:dispatch(ChatWindowSettingsChangedModule(Property, ChatWindowConfigurationEntry))
			end
			v42("ChatWindowConfigurationChanged", Property, ChatWindowConfigurationEntry)
		end)
		
		return Label
	end)()
	local BubbleChatSettings = (function()
		-- upvalues: TextChatService (upval), v42 (copy), GuiService (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), p1 (copy), BubbleChatSettingsChangedModule (upval), SetUpBubbleChatConfigurationChildrenModule (upval)
		local BubbleChatConfiguration = TextChatService:FindFirstChildOfClass("BubbleChatConfiguration")
		local Label = {}
		
		if not BubbleChatConfiguration then
			return {}
		end
		for _, value in ipairs({
			"Enabled", "AdorneeName", "BubbleDuration", "BubblesSpacing",
			"VerticalStudsOffset", "LocalPlayerStudsOffset", "MinimizeDistance",
			"MaxDistance", "BackgroundColor3", "TextColor3", "TextSize", "FontFace",
			"MaxBubbles", "TailVisible", "BackgroundTransparency"
		}) do
			if BubbleChatConfiguration[value] ~= nil then
				local BubbleChatConfigurationEntry = BubbleChatConfiguration[value]
				Label[value] = BubbleChatConfigurationEntry
				v42("BubbleChatConfigurationLoaded", value, BubbleChatConfigurationEntry)
			end
		end
		if GuiService:IsTenFootInterface() then
			Label.TextSize = math.floor(0.5 + Label.TextSize * 1.5)
		end
		BubbleChatConfiguration.Changed:Connect(function(Property)
			-- upvalues: BubbleChatConfiguration (copy), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), p1 (upval), BubbleChatSettingsChangedModule (upval), v42 (upval)
			local BubbleChatConfigurationEntry = BubbleChatConfiguration[Property]
			
			if FFlagExpChatUseChatConfigStore then
				GetChatConfigurationStoreModule(false).setBubbleChatProperty(Property, BubbleChatConfigurationEntry)
			else
				p1:dispatch(BubbleChatSettingsChangedModule(Property, BubbleChatConfigurationEntry))
			end
			v42("BubbleChatConfigurationChanged", Property, BubbleChatConfigurationEntry)
		end)
		local SetUpBubbleChatConfigurationChildrenModuleResult = SetUpBubbleChatConfigurationChildrenModule(p1)
		
		for i, value1 in pairs(SetUpBubbleChatConfigurationChildrenModuleResult) do
			if value1 then
				Label[i] = SetUpBubbleChatConfigurationChildrenModuleResult[i]
			end
		end
		return Label
	end)()
	local ChatInputBarSettings = (function()
		-- upvalues: TextChatService (upval), GetTransparencyStoreModule (upval), p1 (copy), ChatInputBarConfigurationEnabledModule (upval), GetFFlagExpChatEnableChannelTabsUIModule (upval), shouldReorderTabs (upval), TargetTextChannelPropertyChangedFunction (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval), p2 (copy), DevTextBoxEnabledChangedModule (upval), GetEnableChatInputBarConfigurationAutocompleteEnabledModule (upval), UserInputService (upval), v42 (copy), GuiService (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ChatInputBarSettingsChangedModule (upval)
		local ChatInputBarConfiguration = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		local Label = {}
		
		if not ChatInputBarConfiguration then
			return {}
		end
		local TransparencyStoreModule = GetTransparencyStoreModule(false)
		p1:dispatch(ChatInputBarConfigurationEnabledModule(ChatInputBarConfiguration.Enabled))
		
		if ChatInputBarConfiguration.Enabled then
			TransparencyStoreModule.resetAllTransparency()
		end
		ChatInputBarConfiguration:GetPropertyChangedSignal("Enabled"):Connect(function()
			-- upvalues: p1 (upval), ChatInputBarConfigurationEnabledModule (upval), ChatInputBarConfiguration (copy), TransparencyStoreModule (copy)
			p1:dispatch(ChatInputBarConfigurationEnabledModule(ChatInputBarConfiguration.Enabled))
			
			if ChatInputBarConfiguration.Enabled then
				TransparencyStoreModule.resetAllTransparency()
			end
		end)
		ChatInputBarConfiguration:GetPropertyChangedSignal("TargetTextChannel"):Connect(function()
			-- upvalues: ChatInputBarConfiguration (copy), GetFFlagExpChatEnableChannelTabsUIModule (upval), shouldReorderTabs (upval), p1 (upval), TargetTextChannelPropertyChangedFunction (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval)
			local TargetTextChannel = ChatInputBarConfiguration.TargetTextChannel
			local ShouldReorderTabs = if GetFFlagExpChatEnableChannelTabsUIModule() then shouldReorderTabs(p1:getState().ChannelTabs.allChannelTabs, TargetTextChannel) else false
			p1:dispatch(TargetTextChannelPropertyChangedFunction(TargetTextChannel, ShouldReorderTabs))
			
			if FFlagExpChatUseChannelTabsStore then
				GetChannelTabsStoreModule(false).setTargetChannel(TargetTextChannel and TargetTextChannel.Name, ShouldReorderTabs)
			end
		end)
		
		if p2.defaultTargetTextChannel then
			ChatInputBarConfiguration.TargetTextChannel = p2.defaultTargetTextChannel
		elseif TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function()
				-- upvalues: TextChatService (upval), ChatInputBarConfiguration (copy)
				local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
				
				if RBXGeneral and RBXGeneral:IsA("TextChannel") then
					ChatInputBarConfiguration.TargetTextChannel = RBXGeneral
				end
			end)
		end
		p1:dispatch(DevTextBoxEnabledChangedModule(ChatInputBarConfiguration.TextBox ~= nil))
		ChatInputBarConfiguration:GetPropertyChangedSignal("TextBox"):Connect(function()
			-- upvalues: p1 (upval), DevTextBoxEnabledChangedModule (upval), ChatInputBarConfiguration (copy)
			p1:dispatch(DevTextBoxEnabledChangedModule(ChatInputBarConfiguration.TextBox ~= nil))
		end)
		p1.changed:connect(function(Value, p3)
			-- upvalues: ChatInputBarConfiguration (copy)
			if Value.TextChannels ~= p3.TextChannels and Value.TextChannels.targetTextChannel ~= p3.TextChannels.targetTextChannel then
				ChatInputBarConfiguration.TargetTextChannel = Value.TextChannels.targetTextChannel
			end
		end)
		local List = {
			"BackgroundTransparency", "BackgroundColor3", "TextSize", "TextColor3",
			"TextStrokeColor3", "TextStrokeTransparency", "FontFace", "PlaceholderColor3",
			"KeyboardKeyCode"
		}
		
		if GetEnableChatInputBarConfigurationAutocompleteEnabledModule() and ChatInputBarConfiguration.AutocompleteEnabled ~= nil then
			table.insert(List, "AutocompleteEnabled")
		end
		for _, value in ipairs(List) do
			if ChatInputBarConfiguration[value] then
				local ChatInputBarConfigurationEntry = ChatInputBarConfiguration[value]
				
				if value == "KeyboardKeyCode" then
					local StringForKeyCode = UserInputService:GetStringForKeyCode(ChatInputBarConfigurationEntry)
					local Flag = nil
					
					if StringForKeyCode == nil or StringForKeyCode == "" or ChatInputBarConfigurationEntry == Enum.KeyCode.Unknown then
						warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(ChatInputBarConfigurationEntry))
						Flag = false
					else
						Flag = true
					end
					if not Flag then
						ChatInputBarConfiguration.KeyboardKeyCode = Enum.KeyCode.Slash
						Label[value] = Enum.KeyCode.Slash
						continue
					end
				end
				Label[value] = ChatInputBarConfigurationEntry
				v42("ChatInputBarConfigurationLoaded", value, ChatInputBarConfigurationEntry)
			end
		end
		if GuiService:IsTenFootInterface() then
			Label.TextSize = math.floor(0.5 + Label.TextSize * 1.5)
		end
		ChatInputBarConfiguration.Changed:Connect(function(Property)
			-- upvalues: ChatInputBarConfiguration (copy), UserInputService (upval), p1 (upval), FFlagExpChatUseChatConfigStore (upval), GetChatConfigurationStoreModule (upval), ChatInputBarSettingsChangedModule (upval), v42 (upval)
			local ChatInputBarConfigurationEntry = ChatInputBarConfiguration[Property]
			
			if Property == "KeyboardKeyCode" then
				local StringForKeyCode = UserInputService:GetStringForKeyCode(ChatInputBarConfigurationEntry)
				local Flag = nil
				
				if StringForKeyCode == nil or StringForKeyCode == "" or ChatInputBarConfigurationEntry == Enum.KeyCode.Unknown then
					warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(ChatInputBarConfigurationEntry))
					Flag = false
				else
					Flag = true
				end
				if not Flag then
					ChatInputBarConfiguration.KeyboardKeyCode = p1:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode
					
					return
				end
			end
			if FFlagExpChatUseChatConfigStore then
				GetChatConfigurationStoreModule(false).setChatInputBarProperty(Property, ChatInputBarConfigurationEntry)
			else
				p1:dispatch(ChatInputBarSettingsChangedModule(Property, ChatInputBarConfigurationEntry))
			end
			v42("ChatInputBarConfigurationChanged", Property, ChatInputBarConfigurationEntry)
		end)
		
		return Label
	end)()
	local T = if GetFFlagExpChatEnableChannelTabsUIModule() then v44() else {}
	
	if FFlagExpChatUseChatConfigStore then
		local ChatConfigurationStoreModule = GetChatConfigurationStoreModule(false)
		ChatConfigurationStoreModule.mergeBubbleChatSettings(BubbleChatSettings)
		ChatConfigurationStoreModule.mergeChatWindowSettings(ChatWindowSettings)
		ChatConfigurationStoreModule.mergeChatInputBarSettings(ChatInputBarSettings)
		ChatConfigurationStoreModule.mergeChannelTabsSettings(T)
		
		return
	else
		p1:dispatch(ConfigurationObjectsLoadedModule({
			bubbleChatSettings = BubbleChatSettings,
			chatWindowSettings = ChatWindowSettings,
			chatInputBarSettings = ChatInputBarSettings,
			channelTabsSettings = T
		}))
	end
end