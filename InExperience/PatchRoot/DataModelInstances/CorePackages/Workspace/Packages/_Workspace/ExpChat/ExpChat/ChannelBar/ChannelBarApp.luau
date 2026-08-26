local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local expChatSharedModule = require(parent.ExpChatShared)
local analytics = expChatSharedModule.Analytics
local configModule = require(expChat.Config)
local targetTextChannelPropertyChanged = expChatSharedModule.Actions.TargetTextChannelPropertyChanged
local universeChatChannelSelected = expChatSharedModule.Actions.UniverseChatChannelSelected
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local textChatChannelSelected = expChatSharedModule.Actions.TextChatChannelSelected
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatSelectTextChatTabByName = sharedFlagsModule.FFlagExpChatSelectTextChatTabByName
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatLogGlobalChatTabClickedModule = require(expChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
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
	
	function channelBarApp.didMount(p1)
		-- upvalues: createEffect (ref)
		p1.updateChannelTabsSettingsEffect = createEffect(function(p2)
			-- upvalues: p1 (ref)
			p1:setState({
				channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(p2)
			})
		end)
	end
	
	function channelBarApp.willUnmount(p1)
		p1.updateChannelTabsSettingsEffect()
		p1.updateChannelTabsSettingsEffect = nil
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
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), configModule (ref)
	return {
		channelTabsSettings = if fFlagExpChatUseChatConfigStore then nil elseif getFFlagExpChatEnableChannelTabsUIModule() then p1.ChatLayout.ChannelTabsSettings else {
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
		allChannelTabs = if getFFlagExpChatEnableChannelTabsUIModule() then p1.ChannelTabs.allChannelTabs else {},
		selectedTabName = if getFFlagExpChatEnableChannelTabsUIModule() then p1.ChannelTabs.selectedTabName else "",
		allTextChannels = p1.TextChannels.allTextChannels
	}
end, function(p1)
	-- upvalues: universeChatChannelSelected (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatChannelSelected (ref), fFlagExpChatSelectTextChatTabByName (ref), textChatChannelSelected (ref), targetTextChannelPropertyChanged (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	return {
		onTabSelected = function(value, p2, p3, p4)
			-- upvalues: p1 (ref), universeChatChannelSelected (copy), fFlagExpChatEnableFriendsTab (copy), friendsChatChannelSelected (copy), fFlagExpChatSelectTextChatTabByName (copy), textChatChannelSelected (copy), targetTextChannelPropertyChanged (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
			if p4 == "UniverseChat" then
				p1(universeChatChannelSelected(p3))
			elseif fFlagExpChatEnableFriendsTab and p4 == "FriendsChat" then
				p1(friendsChatChannelSelected(p3))
			elseif fFlagExpChatSelectTextChatTabByName and p4 == "TextChat" then
				p1(textChatChannelSelected(p3, p2))
			elseif value then
				p1(targetTextChannelPropertyChanged(value, p2))
			end
			if fFlagExpChatUseChannelTabsStore then
				getChannelTabsStoreModule(false).setTargetChannel(p3, p2)
			end
		end
	}
end)(channelBarApp)