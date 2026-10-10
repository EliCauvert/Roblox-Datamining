local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local cryoModule = require(parent.Cryo)
local signalsReactModule = require(parent.SignalsReact)
local analytics = require(parent.ExpChatShared).Analytics
local configModule = require(expChat.Config)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatLogGlobalChatTabClickedModule = require(expChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local selectTabByTypeModule = require(expChat.TabNavigation.selectTabByType)
local fFlagDebugFriendsChatModule = require(parent.FriendsChat.FFlagDebugFriendsChat)
local localTextChannelParticipantAddedModule = require(expChat.Actions.LocalTextChannelParticipantAdded)
local channelTabsConfigurationEnabledModule = require(expChat.Actions.ChannelTabsConfigurationEnabled)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local signalsModule = require(parent.Signals)
local createEffect = signalsModule.createEffect
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

channelBarApp = roactRoduxModule.connect(function(p1)
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), configModule (ref), fFlagExpChatUseChannelTabsStore (ref)
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
		allChannelTabs = if fFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs.allChannelTabs or {},
		selectedTabName = if fFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs.selectedTabName or "",
		allTextChannels = p1.TextChannels.allTextChannels
	}
end, function(p1)
	-- upvalues: selectTabByTypeModule (ref), fFlagDebugFriendsChatModule (ref), channelTabsConfigurationEnabledModule (ref), getChannelTabsStoreModule (ref), textChatService (ref), localTextChannelParticipantAddedModule (ref)
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
			-- upvalues: p1 (ref), channelTabsConfigurationEnabledModule (copy), getChannelTabsStoreModule (copy), textChatService (copy), localTextChannelParticipantAddedModule (copy)
			p1(channelTabsConfigurationEnabledModule(true))
			local var1 = getChannelTabsStoreModule(false)
			var1.setChannelTabsConfigurationEnabled(true)
			
			for i = 1, p2 do
				local text = "D" .. tostring(i)
				local textChannel = Instance.new("TextChannel")
				textChannel.Name = text
				textChannel.Parent = textChatService:FindFirstChild("TextChannels") or textChatService
				p1(localTextChannelParticipantAddedModule(textChannel))
				var1.addChannelTab({ type = "TextChat", name = text }, nil)
			end
		end else nil
	}
end)(channelBarApp)

local function areChannelTabsEqual(value, p2)
	if value == p2 then
		return true
	end
	for i, v in value do
		local var1 = p2[i]
		
		if var1 == nil or var1.tabIndex ~= v.tabIndex or (var1.type ~= v.type or var1.HasUnreadMessages ~= v.HasUnreadMessages) then
			return false
		end
	end
	for i_1 in p2 do
		if value[i_1] == nil then
			return false
		end
	end
	return true
end

return if fFlagExpChatUseChannelTabsStore then reactModule.memo(function(value)
	-- upvalues: reactModule (ref), signalsModule (ref), getChannelTabsStoreModule (ref), areChannelTabsEqual (ref), signalsReactModule (ref), channelBarApp (write), cryoModule (ref)
	return reactModule.createElement(channelBarApp, cryoModule.Dictionary.union(value, signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getChannelTabsStoreModule (copy), areChannelTabsEqual (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: getChannelTabsStoreModule (copy)
			local channelTabsState = getChannelTabsStoreModule(false).getChannelTabsState(p3)
			
			return {
				allChannelTabs = channelTabsState.allChannelTabs,
				selectedTabName = channelTabsState.selectedTabName or ""
			}
		end, function(p3, p4)
			-- upvalues: areChannelTabsEqual (copy)
			return p3.selectedTabName == p4.selectedTabName and areChannelTabsEqual(p3.allChannelTabs, p4.allChannelTabs)
		end)
	end, {}))))
end) else channelBarApp