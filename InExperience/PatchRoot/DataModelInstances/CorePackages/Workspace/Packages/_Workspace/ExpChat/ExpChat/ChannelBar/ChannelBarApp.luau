local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local SignalsReactModule = require(Parent.SignalsReact)
local Analytics = require(Parent.ExpChatShared).Analytics
local ConfigModule = require(ExpChat.Config)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatLogGlobalChatTabClickedModule = require(ExpChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local FFlagGlobalTextChatAddPlaySessionFieldModule = require(ExpChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local SelectTabByTypeModule = require(ExpChat.TabNavigation.selectTabByType)
local FFlagDebugFriendsChatModule = require(Parent.FriendsChat.FFlagDebugFriendsChat)
local LocalTextChannelParticipantAddedModule = require(ExpChat.Actions.LocalTextChannelParticipantAdded)
local ChannelTabsConfigurationEnabledModule = require(ExpChat.Actions.ChannelTabsConfigurationEnabled)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local SignalsModule = require(Parent.Signals)
local CreateEffectFunction = SignalsModule.createEffect
local ChannelBarModule = require(script.Parent.UI.ChannelBar)
local ChannelBarApp = require(Parent.Roact).Component:extend("ChannelBarApp")

if FFlagExpChatUseChatConfigStore then
	function ChannelBarApp.init(p1)
		-- upvalues: GetChatConfigurationStoreModule (copy)
		p1.chatConfigStore = GetChatConfigurationStoreModule(false)
		p1.state = {
			channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(false)
		}
	end
end
function ChannelBarApp.didMount(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), CreateEffectFunction (copy), FFlagDebugFriendsChatModule (copy), UserInputService (copy)
	if FFlagExpChatUseChatConfigStore then
		p1.updateChannelTabsSettingsEffect = CreateEffectFunction(function(p2)
			-- upvalues: p1 (copy)
			p1:setState({
				channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(p2)
			})
		end)
	end
	if FFlagDebugFriendsChatModule then
		p1.debugAddTabsConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed)
			-- upvalues: p1 (copy)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.J and Input:IsModifierKeyDown(Enum.ModifierKey.Ctrl) and p1.props.debugAddFakeTabs then
				p1.props.debugAddFakeTabs(3)
			end
		end)
	end
end

function ChannelBarApp.willUnmount(p1)
	if p1.updateChannelTabsSettingsEffect then
		p1.updateChannelTabsSettingsEffect()
		p1.updateChannelTabsSettingsEffect = nil
	end
	if p1.debugAddTabsConnection then
		p1.debugAddTabsConnection:Disconnect()
		p1.debugAddTabsConnection = nil
	end
end

function ChannelBarApp.render(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), ReactModule (copy), ChannelBarModule (copy), FFlagExpChatLogGlobalChatTabClickedModule (copy), Analytics (copy), FFlagGlobalTextChatAddPlaySessionFieldModule (copy)
	return ReactModule.createElement(ChannelBarModule, {
		channelTabsSettings = if FFlagExpChatUseChatConfigStore then p1.state.channelTabsSettings else p1.props.channelTabsSettings,
		chatWindowSettings = p1.props.chatWindowSettings,
		allChannelTabs = p1.props.allChannelTabs,
		allTextChannels = p1.props.allTextChannels,
		selectedTabName = p1.props.selectedTabName,
		onTabSelected = function(p2, p3, ChannelName, p4)
			-- upvalues: FFlagExpChatLogGlobalChatTabClickedModule (upval), p1 (copy), Analytics (upval), FFlagGlobalTextChatAddPlaySessionFieldModule (upval)
			if p4 == "UniverseChat" and FFlagExpChatLogGlobalChatTabClickedModule and ChannelName ~= p1.props.selectedTabName then
				local Copy = table.clone(Analytics.DefaultStandardizedFields)
				table.insert(Copy, "addPlaceInstanceId")
				
				if FFlagGlobalTextChatAddPlaySessionFieldModule then
					table.insert(Copy, "addPlaySessionId")
				end
				Analytics:TelemetryLogEvent(Analytics.ExpChatGlobalChatTabClickedConfig, { channelName = ChannelName }, Copy)
			end
			p1.props.onTabSelected(p2, p3, ChannelName, p4)
		end,
		onHovered = p1.props.onHovered,
		onUnhovered = p1.props.onUnhovered,
		visible = p1.props.visible,
		transparencyValue = p1.props.transparencyValue,
		topBorderRef = p1.props.topBorderRef
	})
end

local v1 = RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), ConfigModule (copy), FFlagExpChatUseChannelTabsStore (copy)
	return {
		channelTabsSettings = if FFlagExpChatUseChatConfigStore then nil else p1.ChatLayout.ChannelTabsSettings or {
			BackgroundTransparency = ConfigModule.ChannelTabsSettings.BackgroundTransparency,
			BackgroundColor3 = ConfigModule.ChannelTabsSettings.BackgroundColor3,
			HoverBackgroundColor3 = ConfigModule.ChannelTabsSettings.HoverBackgroundColor3,
			FontFace = ConfigModule.ChannelTabsSettings.FontFace,
			TextSize = ConfigModule.ChannelTabsSettings.TextSize,
			TextColor3 = ConfigModule.ChannelTabsSettings.TextColor3,
			SelectedTabTextColor3 = ConfigModule.ChannelTabsSettings.SelectedTabTextColor3,
			TextStrokeColor3 = ConfigModule.ChannelTabsSettings.TextStrokeColor3,
			TextStrokeTransparency = ConfigModule.ChannelTabsSettings.TextStrokeTransparency
		},
		allChannelTabs = if FFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs.allChannelTabs or {},
		selectedTabName = if FFlagExpChatUseChannelTabsStore then nil else p1.ChannelTabs.selectedTabName or "",
		allTextChannels = p1.TextChannels.allTextChannels
	}
end, function(Callback)
	-- upvalues: SelectTabByTypeModule (copy), FFlagDebugFriendsChatModule (copy), ChannelTabsConfigurationEnabledModule (copy), GetChannelTabsStoreModule (copy), TextChatService (copy), LocalTextChannelParticipantAddedModule (copy)
	return {
		onTabSelected = function(TextChannel, ShouldReorderTabs, ChannelName, TabType)
			-- upvalues: SelectTabByTypeModule (upval), Callback (copy)
			SelectTabByTypeModule(Callback, {
				channelName = ChannelName,
				tabType = TabType,
				shouldReorderTabs = ShouldReorderTabs,
				textChannel = TextChannel
			})
		end,
		debugAddFakeTabs = if FFlagDebugFriendsChatModule then function(p1)
			-- upvalues: Callback (copy), ChannelTabsConfigurationEnabledModule (upval), GetChannelTabsStoreModule (upval), TextChatService (upval), LocalTextChannelParticipantAddedModule (upval)
			Callback(ChannelTabsConfigurationEnabledModule(true))
			local ChannelTabsStoreModule = GetChannelTabsStoreModule(false)
			ChannelTabsStoreModule.setChannelTabsConfigurationEnabled(true)
			
			for i = 1, p1 do
				local Text = "D" .. tostring(i)
				local TextChannel = Instance.new("TextChannel")
				TextChannel.Name = Text
				TextChannel.Parent = TextChatService:FindFirstChild("TextChannels") or TextChatService
				Callback(LocalTextChannelParticipantAddedModule(TextChannel))
				ChannelTabsStoreModule.addChannelTab({ type = "TextChat", name = Text }, nil)
			end
		end else nil
	}
end)(ChannelBarApp)

local function areChannelTabsEqual(AllChannelTabs, AllChannelTabs1): boolean
	if AllChannelTabs == AllChannelTabs1 then
		return true
	end
	for i, allChannelTab in AllChannelTabs do
		local AllChannelTab = AllChannelTabs1[i]
		
		if AllChannelTab == nil or AllChannelTab.tabIndex ~= allChannelTab.tabIndex or AllChannelTab.type ~= allChannelTab.type or AllChannelTab.HasUnreadMessages ~= allChannelTab.HasUnreadMessages then
			return false
		end
	end
	for i1 in AllChannelTabs1 do
		if AllChannelTabs[i1] == nil then
			return false
		end
	end
	return true
end

local function ChannelBarAppWithSignals(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), areChannelTabsEqual (copy), SignalsReactModule (copy), v1 (ref), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval), areChannelTabsEqual (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetChannelTabsStoreModule (upval)
			local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(p2)
			
			return {
				allChannelTabs = ChannelTabsState.allChannelTabs,
				selectedTabName = ChannelTabsState.selectedTabName or ""
			}
		end, function(p2, p3)
			-- upvalues: areChannelTabsEqual (upval)
			return p2.selectedTabName == p3.selectedTabName and areChannelTabsEqual(p2.allChannelTabs, p3.allChannelTabs)
		end)
	end, {}))))))
end

return if FFlagExpChatUseChannelTabsStore then ReactModule.memo(ChannelBarAppWithSignals) else v1