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
local getFFlagExpChatEnableChannelTabsUIModule = require(expChat.Flags.getFFlagExpChatEnableChannelTabsUI)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatUseChannelTabsStore = sharedFlagsModule.FFlagExpChatUseChannelTabsStore
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatUseChatConfigStore = sharedFlagsModule.FFlagExpChatUseChatConfigStore
local fFlagExpChatLogGlobalChatTabClickedModule = require(expChat.Flags.FFlagExpChatLogGlobalChatTabClicked)
local getChatConfigurationStoreModule = require(expChat.Stores.GetChatConfigurationStore)
local getChannelTabsStoreModule = require(expChat.Stores.GetChannelTabsStore)
local createEffect = require(parent.Signals).createEffect
local channelBarModule = require(script.Parent.UI.ChannelBar)
local channelBarApp = roactModule.Component:extend("ChannelBarApp")

if fFlagExpChatUseChatConfigStore then
	function channelBarApp.init(p0) --[[ line: 33 ]]
		-- upvalues: getChatConfigurationStoreModule (ref)
		p0.chatConfigStore = getChatConfigurationStoreModule(false)
		p0.state = {
			channelTabsSettings = p0.chatConfigStore.getChannelTabsSettings(false)
		}
	end
	
	function channelBarApp.didMount(p1) --[[ line: 40 ]]
		-- upvalues: createEffect (ref)
		p1.updateChannelTabsSettingsEffect = createEffect(function(p2) --[[ line: 42 ]]
			-- upvalues: p1 (ref)
			p1:setState({
				channelTabsSettings = p1.chatConfigStore.getChannelTabsSettings(p2)
			})
		end)
	end
	
	function channelBarApp.willUnmount(p3) --[[ line: 50 ]]
		p3.updateChannelTabsSettingsEffect()
		p3.updateChannelTabsSettingsEffect = nil
	end
end
function channelBarApp.render(p4) --[[ line: 56 ]]
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), reactModule (ref), channelBarModule (ref), fFlagExpChatChannelTabRefactor (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatLogGlobalChatTabClickedModule (ref), analytics (ref)
	return reactModule.createElement(channelBarModule, {
		channelTabsSettings = if fFlagExpChatUseChatConfigStore then p4.state.channelTabsSettings else p4.props.channelTabsSettings,
		chatWindowSettings = p4.props.chatWindowSettings,
		allChannelTabs = p4.props.allChannelTabs,
		allTextChannels = p4.props.allTextChannels,
		selectedTabName = p4.props.selectedTabName,
		onTabSelected = function(value, p5, p6, p7) --[[ line: 72 ]]
			-- upvalues: fFlagExpChatChannelTabRefactor (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatLogGlobalChatTabClickedModule (copy), p4 (ref), analytics (copy)
			local isUniverseChat
			if fFlagExpChatChannelTabRefactor then
				isUniverseChat = p7 == "UniverseChat"
				isUniverseChat = nil
			else
				isUniverseChat = if getFFlagTextChatEnableUniverseChatTabs() then not value else false
			end
			if isUniverseChat and fFlagExpChatLogGlobalChatTabClickedModule and p6 ~= p4.props.selectedTabName then
				local cloned = table.clone(analytics.DefaultStandardizedFields)
				table.insert(cloned, "addPlaceInstanceId")
				analytics:TelemetryLogEvent(analytics.ExpChatGlobalChatTabClickedConfig, { channelName = p6 }, cloned)
			end
			p4.props.onTabSelected(value, p5, p6, p7)
		end,
		onHovered = p4.props.onHovered,
		onUnhovered = p4.props.onUnhovered,
		visible = p4.props.visible,
		transparencyValue = p4.props.transparencyValue,
		topBorderRef = p4.props.topBorderRef
	})
end

return roactRoduxModule.connect(function(p8) --[[ line: 100 ]]
	-- upvalues: fFlagExpChatUseChatConfigStore (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), configModule (ref)
	return {
		channelTabsSettings = if fFlagExpChatUseChatConfigStore then nil elseif getFFlagExpChatEnableChannelTabsUIModule() then p8.ChatLayout.ChannelTabsSettings else {
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
		allChannelTabs = if getFFlagExpChatEnableChannelTabsUIModule() then p8.ChannelTabs.allChannelTabs else {},
		selectedTabName = if getFFlagExpChatEnableChannelTabsUIModule() then p8.ChannelTabs.selectedTabName else "",
		allTextChannels = p8.TextChannels.allTextChannels
	}
end, function(p9) --[[ line: 119 ]]
	-- upvalues: fFlagExpChatChannelTabRefactor (ref), universeChatChannelSelected (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatChannelSelected (ref), targetTextChannelPropertyChanged (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatEnableChannelTabsUIModule (ref), fFlagExpChatUseChannelTabsStore (ref), getChannelTabsStoreModule (ref)
	return {
		onTabSelected = function(value, p10, p11, p12) --[[ line: 122 ]]
			-- upvalues: fFlagExpChatChannelTabRefactor (copy), p9 (ref), universeChatChannelSelected (copy), fFlagExpChatEnableFriendsTab (copy), friendsChatChannelSelected (copy), targetTextChannelPropertyChanged (copy), getFFlagTextChatEnableUniverseChatTabs (copy), getFFlagExpChatEnableChannelTabsUIModule (copy), fFlagExpChatUseChannelTabsStore (copy), getChannelTabsStoreModule (copy)
			if fFlagExpChatChannelTabRefactor then
				if p12 == "UniverseChat" then
					p9(universeChatChannelSelected(p11))
				elseif fFlagExpChatEnableFriendsTab and p12 == "FriendsChat" then
					p9(friendsChatChannelSelected(p11))
				elseif value then
					p9(targetTextChannelPropertyChanged(value, p10))
				end
			elseif getFFlagTextChatEnableUniverseChatTabs() then
				if value then
					p9(targetTextChannelPropertyChanged(value, p10))
				else
					p9(universeChatChannelSelected(p11))
				end
			elseif getFFlagExpChatEnableChannelTabsUIModule() then
				p9(targetTextChannelPropertyChanged(value, p10))
			end
			if fFlagExpChatUseChannelTabsStore then
				if fFlagExpChatChannelTabRefactor then
					getChannelTabsStoreModule(false).setTargetChannel(p11, p10)
					
					return
				elseif getFFlagTextChatEnableUniverseChatTabs() then
					getChannelTabsStoreModule(false).setTargetChannel(p11 or value and value.Name, p10)
					
					return
				elseif getFFlagExpChatEnableChannelTabsUIModule() then
					getChannelTabsStoreModule(false).setTargetChannel(value and value.Name, p10)
				end
			end
		end
	}
end)(channelBarApp)