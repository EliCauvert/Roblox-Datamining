local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local Analytics = ExpChatSharedModule.Analytics
local ConfigModule = require(ExpChat.Config)
local TargetTextChannelPropertyChangedFunction = ExpChatSharedModule.Actions.TargetTextChannelPropertyChanged
local UniverseChatChannelSelectedFunction = ExpChatSharedModule.Actions.UniverseChatChannelSelected
local FriendsChatChannelSelectedFunction = ExpChatSharedModule.Actions.FriendsChatChannelSelected
local GetFFlagExpChatEnableChannelTabsUIModule = require(ExpChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatUseChatConfigStore = SharedFlagsModule.FFlagExpChatUseChatConfigStore
local FFlagExpChatLogGlobalChatTabClickedModule = require(ExpChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local GetChatConfigurationStoreModule = require(ExpChat.Stores.GetChatConfigurationStore)
local GetChannelTabsStoreModule = require(ExpChat.Stores.GetChannelTabsStore)
local CreateEffectFunction = require(Parent.Signals).createEffect
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
	
	function ChannelBarApp.didMount(p1)
		-- upvalues: CreateEffectFunction (copy)
		p1.updateChannelTabsSettingsEffect = CreateEffectFunction(function(p2)
			-- upvalues: p1 (copy)
			p1:setState({
				channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(p2)
			})
		end)
	end
	
	function ChannelBarApp.willUnmount(p1)
		p1.updateChannelTabsSettingsEffect()
		p1.updateChannelTabsSettingsEffect = nil
	end
end
function ChannelBarApp.render(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), ReactModule (copy), ChannelBarModule (copy), FFlagExpChatChannelTabRefactor (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatLogGlobalChatTabClickedModule (copy), Analytics (copy)
	return ReactModule.createElement(ChannelBarModule, {
		channelTabsSettings = if FFlagExpChatUseChatConfigStore then p1.state.channelTabsSettings else p1.props.channelTabsSettings,
		chatWindowSettings = p1.props.chatWindowSettings,
		allChannelTabs = p1.props.allChannelTabs,
		allTextChannels = p1.props.allTextChannels,
		selectedTabName = p1.props.selectedTabName,
		onTabSelected = function(p2, p3, ChannelName, p4)
			-- upvalues: FFlagExpChatChannelTabRefactor (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatLogGlobalChatTabClickedModule (upval), p1 (copy), Analytics (upval)
			if (if FFlagExpChatChannelTabRefactor then p4 == "UniverseChat" elseif GetFFlagTextChatEnableUniverseChatTabsFunction() then not p2 else false) and FFlagExpChatLogGlobalChatTabClickedModule and ChannelName ~= p1.props.selectedTabName then
				local Copy = table.clone(Analytics.DefaultStandardizedFields)
				table.insert(Copy, "addPlaceInstanceId")
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

return RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagExpChatUseChatConfigStore (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), ConfigModule (copy)
	return {
		channelTabsSettings = if FFlagExpChatUseChatConfigStore then nil else GetFFlagExpChatEnableChannelTabsUIModule() and p1.ChatLayout.ChannelTabsSettings or {
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
		allChannelTabs = GetFFlagExpChatEnableChannelTabsUIModule() and p1.ChannelTabs.allChannelTabs or {},
		selectedTabName = GetFFlagExpChatEnableChannelTabsUIModule() and p1.ChannelTabs.selectedTabName or "",
		allTextChannels = p1.TextChannels.allTextChannels
	}
end, function(Callback)
	-- upvalues: FFlagExpChatChannelTabRefactor (copy), UniverseChatChannelSelectedFunction (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatChannelSelectedFunction (copy), TargetTextChannelPropertyChangedFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatEnableChannelTabsUIModule (copy), FFlagExpChatUseChannelTabsStore (copy), GetChannelTabsStoreModule (copy)
	return {
		onTabSelected = function(p1, p2, p3, p4)
			-- upvalues: FFlagExpChatChannelTabRefactor (upval), Callback (copy), UniverseChatChannelSelectedFunction (upval), FFlagExpChatEnableFriendsTab (upval), FriendsChatChannelSelectedFunction (upval), TargetTextChannelPropertyChangedFunction (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetFFlagExpChatEnableChannelTabsUIModule (upval), FFlagExpChatUseChannelTabsStore (upval), GetChannelTabsStoreModule (upval)
			if FFlagExpChatChannelTabRefactor then
				if p4 == "UniverseChat" then
					Callback(UniverseChatChannelSelectedFunction(p3))
				elseif FFlagExpChatEnableFriendsTab and p4 == "FriendsChat" then
					Callback(FriendsChatChannelSelectedFunction(p3))
				elseif p1 then
					Callback(TargetTextChannelPropertyChangedFunction(p1, p2))
				end
			elseif GetFFlagTextChatEnableUniverseChatTabsFunction() then
				if p1 then
					Callback(TargetTextChannelPropertyChangedFunction(p1, p2))
				else
					Callback(UniverseChatChannelSelectedFunction(p3))
				end
			elseif GetFFlagExpChatEnableChannelTabsUIModule() then
				Callback(TargetTextChannelPropertyChangedFunction(p1, p2))
			end
			if FFlagExpChatUseChannelTabsStore then
				if FFlagExpChatChannelTabRefactor then
					GetChannelTabsStoreModule(false).setTargetChannel(p3, p2)
					
					return
				end
				if GetFFlagTextChatEnableUniverseChatTabsFunction() then
					GetChannelTabsStoreModule(false).setTargetChannel(p3 or p1 and p1.Name, p2)
					
					return
				end
				if GetFFlagExpChatEnableChannelTabsUIModule() then
					GetChannelTabsStoreModule(false).setTargetChannel(p1 and p1.Name, p2)
				end
			end
		end
	}
end)(ChannelBarApp)