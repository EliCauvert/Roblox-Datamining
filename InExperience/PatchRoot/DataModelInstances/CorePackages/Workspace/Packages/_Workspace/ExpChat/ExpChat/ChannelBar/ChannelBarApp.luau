local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local analytics = require(parent.ExpChatShared).Analytics
local configModule = require(expChat.Config)
local fFlagExpChatUseChatConfigStore = require(parent.SharedFlags).FFlagExpChatUseChatConfigStore
local fFlagExpChatLogGlobalChatTabClickedModule = require(expChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local selectTabByTypeModule = require(expChat.TabNavigation.selectTabByType)
local fFlagDebugFriendsChatModule = require(parent.FriendsChat.FFlagDebugFriendsChat)
local localTextChannelParticipantAddedModule = require(expChat.Actions.LocalTextChannelParticipantAdded)
local channelTabsConfigurationEnabledModule = require(expChat.Actions.ChannelTabsConfigurationEnabled)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local createEffect = require(parent.Signals).createEffect
local channelBarModule = require(script.Parent.UI.ChannelBar)
local channelBarApp = roactModule.Component:extend("ChannelBarApp")

if fFlagExpChatUseChatConfigStore then
	function channelBarApp.init(p1)
		-- upvalues: getChatConfigurationStoreModule (ref)
		p1.chatConfigStore = getChatConfigurationStoreModule(false)
		p1.state = {
			channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(false)
		}
	end
end
function channelBarApp.didMount(p1)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), createEffect (ref), fFlagDebugFriendsChatModule (ref), userInputService (ref)
	if fFlagExpChatUseChatConfigStore then
		p1.updateChannelTabsSettingsEffect = createEffect(function(p2)
			-- upvalues: p1 (ref)
			p1:setState({
				channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(p2)
			})
		end)
	end
	if fFlagDebugFriendsChatModule then
		p1.debugAddTabsConnection = userInputService.InputBegan:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p3 then return end
			if p2.KeyCode == Enum.KeyCode.J and p2:IsModifierKeyDown(Enum.ModifierKey.Ctrl) and p1.props.debugAddFakeTabs then
				p1.props.debugAddFakeTabs(3)
			end
		end)
	end
end

function channelBarApp.willUnmount(p1)
	if p1.updateChannelTabsSettingsEffect then
		p1.updateChannelTabsSettingsEffect()
		p1.updateChannelTabsSettingsEffect = nil
	end
	if p1.debugAddTabsConnection then
		p1.debugAddTabsConnection:Disconnect()
		p1.debugAddTabsConnection = nil
	end
end

function channelBarApp.render(p1)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), reactModule (ref), channelBarModule (ref), fFlagExpChatLogGlobalChatTabClickedModule (ref), analytics (ref), fFlagGlobalTextChatAddPlaySessionFieldModule (ref)
	return reactModule.createElement(channelBarModule, {
		channelTabsSettings = if fFlagExpChatUseChatConfigStore then p1.state.channelTabsSettings else p1.props.channelTabsSettings,
		chatWindowSettings = p1.props.chatWindowSettings,
		allChannelTabs = p1.props.allChannelTabs,
		allTextChannels = p1.props.allTextChannels,
		selectedTabName = p1.props.selectedTabName,
		onTabSelected = function(value, p2, p3, p4)
			-- upvalues: fFlagExpChatLogGlobalChatTabClickedModule (copy), p1 (ref), analytics (copy), fFlagGlobalTextChatAddPlaySessionFieldModule (copy)
			if p4 == "UniverseChat" and fFlagExpChatLogGlobalChatTabClickedModule and p3 ~= p1.props.selectedTabName then
				local cloned = table.clone(analytics.DefaultStandardizedFields)
				table.insert(cloned, "addPlaceInstanceId")
				
				if fFlagGlobalTextChatAddPlaySessionFieldModule then
					table.insert(cloned, "addPlaySessionId")
				end
				analytics:TelemetryLogEvent(analytics.ExpChatGlobalChatTabClickedConfig, { channelName = p3 }, cloned)
			end
			p1.props.onTabSelected(value, p2, p3, p4)
		end,
		onHovered = p1.props.onHovered,
		onUnhovered = p1.props.onUnhovered,
		visible = p1.props.visible,
		transparencyValue = p1.props.transparencyValue,
		topBorderRef = p1.props.topBorderRef
	})
end

return roactRoduxModule.connect(function(p1)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), configModule (ref)
	return {
		channelTabsSettings = if fFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChannelTabsSettings or {
			BackgroundTransparency = configModule.ChannelTabsSettings.BackgroundTransparency,
			BackgroundColor3 = configModule.ChannelTabsSettings.BackgroundColor3,
			HoverBackgroundColor3 = configModule.ChannelTabsSettings.HoverBackgroundColor3,
			FontFace = configModule.ChannelTabsSettings.FontFace,
			TextSize = configModule.ChannelTabsSettings.TextSize,
			TextColor3 = configModule.ChannelTabsSettings.TextColor3,
			SelectedTabTextColor3 = configModule.ChannelTabsSettings.SelectedTabTextColor3,
			TextStrokeColor3 = configModule.ChannelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = configModule.ChannelTabsSettings.TextStrokeTransparency
		},
		allChannelTabs = p1.ChannelTabs.allChannelTabs or {},
		selectedTabName = p1.ChannelTabs.selectedTabName or "",
		allTextChannels = p1.TextChannels.allTextChannels
	}
end, function(p1)
	-- upvalues: selectTabByTypeModule (ref), fFlagDebugFriendsChatModule (ref), channelTabsConfigurationEnabledModule (ref), getChannelTabsStoreModule (ref), localTextChannelParticipantAddedModule (ref)
	return {
		onTabSelected = function(value, p2, p3, p4)
			-- upvalues: selectTabByTypeModule (copy), p1 (ref)
			selectTabByTypeModule(p1, {
				channelName = p3,
				tabType = p4,
				shouldReorderTabs = p2,
				textChannel = value
			})
		end,
		debugAddFakeTabs = if fFlagDebugFriendsChatModule then function(p2)
			-- upvalues: p1 (ref), channelTabsConfigurationEnabledModule (copy), getChannelTabsStoreModule (copy), localTextChannelParticipantAddedModule (copy)
			p1(channelTabsConfigurationEnabledModule(true))
			local var1 = getChannelTabsStoreModule(false)
			
			for i = 1, p2 do
				local text = "D" .. tostring(i)
				local textChannel = Instance.new("TextChannel")
				textChannel.Name = text
				p1(localTextChannelParticipantAddedModule(textChannel))
				var1.addChannelTab({ type = "TextChat", name = text }, nil)
			end
		end else nil
	}
end)(channelBarApp)