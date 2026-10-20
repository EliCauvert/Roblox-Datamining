local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local TutilsModule = require(Parent.tutils)
local SharedFlagsModule = require(Parent.SharedFlags)
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local ClientSettingsModule = require(ExpChat.ClientSettings)
local MapStateToPropsModule = require(script.Parent.mapStateToProps)
local MapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local BubbleChatModule = require(script.Parent.Parent.BubbleChat)
local AppLayoutModule = require(script.Parent.Parent.AppLayout)
local IsChatRegionLockedModule = require(ExpChat.isChatRegionLocked)
local TextChatService = game:GetService("TextChatService")
local GetFFlagChatTranslationShowFTUXModule = require(ExpChat.Flags.getFFlagChatTranslationShowFTUX)
local FFlagExpChatPresetChatEnabled = require(Parent.ExpChatShared).Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatNewInputBarModule = require(ExpChat.Flags.FFlagExpChatNewInputBar)
local GetFFlagExpChatAlwaysRunTCSFunction = SharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local FFlagExpChatUseChannelTabsStore = SharedFlagsModule.FFlagExpChatUseChannelTabsStore
local GetChannelTabsStoreModule = if FFlagExpChatUseChannelTabsStore then require(ExpChat.Stores.GetChannelTabsStore) else nil

function getChatWindowEnabled()
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextChatService (upval)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		return ChatWindowConfiguration ~= nil and ChatWindowConfiguration.Enabled
	end)
	
	return Success and Result
end

function getChatTranslationEnabled()
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextChatService (upval)
		return TextChatService.ChatTranslationEnabled
	end)
	
	return Success and Result
end

function getChatTranslationToggleEnabled()
	-- upvalues: TextChatService (copy)
	local Success, Result = pcall(function()
		-- upvalues: TextChatService (upval)
		return TextChatService.ChatTranslationToggleEnabled
	end)
	
	return Success and Result
end

function shouldShowChatTranslationFTUX(): boolean
	-- upvalues: TextChatService (copy)
	if game:GetEngineFeature("TextChatServiceSettingsSaved") then
		local Success, Result = pcall(function()
			-- upvalues: TextChatService (upval)
			return TextChatService.ChatTranslationFTUXShown
		end)
		
		return not (Success and Result)
	else
		return true
	end
end

local ShouldShowChatTranslationFTUX1 = shouldShowChatTranslationFTUX()
local ChatTranslationFTUXModule = require(script.Parent.Parent.ChatTranslationFTUX)
local AppContainer = RoactModule.PureComponent:extend("AppContainer")
AppContainer.defaultProps = {
	isChatInputBarVisible = true,
	isChatWindowVisible = true,
	isChannelBarVisible = false,
	onSendChat = nil,
	onSendGlobalChat = nil,
	mutedUserIds = nil,
	textTimer = nil,
	timer = nil,
	textChatService = TextChatService,
	chat = game:GetService("Chat")
}
local ChangedConnection = nil

function AppContainer.init(p1)
	p1:setState({
		showTranslationButton = false,
		isTextChatServiceEnabled = false
	})
end

function AppContainer:willUnmount()
	-- upvalues: ChangedConnection (ref)
	ChangedConnection:Disconnect()
end

function AppContainer.didMount(p1)
	-- upvalues: TextChatService (copy), ChangedConnection (ref), GetFFlagExpChatAlwaysRunTCSFunction (copy)
	p1.migrationConnection = p1.props.chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function()
		-- upvalues: p1 (copy)
		if p1.props.chat.IsAutoMigrated then
			p1:setState({ isTextChatServiceEnabled = true })
		end
	end)
	
	local function onTextChatServicePropertyChanged(p2)
		-- upvalues: TextChatService (upval), p1 (copy)
		if p2 == "ChatTranslationEnabled" then
			local Success, Result = pcall(function()
				-- upvalues: TextChatService (upval)
				return TextChatService.ChatTranslationEnabled
			end)
			
			if Success then
				p1.props.onToggleTranslation(Result)
				p1:setState({
					showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
				})
				
				return
			end
		elseif p2 == "ChatTranslationToggleEnabled" then
			local Success1, _ = pcall(function()
				-- upvalues: TextChatService (upval)
				return TextChatService.ChatTranslationToggleEnabled
			end)
			local Success2, Result1 = pcall(function()
				-- upvalues: TextChatService (upval)
				return TextChatService.ChatTranslationEnabled
			end)
			
			if Success1 then
				if Success2 then
					p1.props.onToggleTranslation(Result1)
				end
				p1:setState({
					showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
				})
			end
		end
	end
	
	if not ChangedConnection then
		ChangedConnection = TextChatService.Changed:Connect(onTextChatServicePropertyChanged)
	end
	p1:setState({
		showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled(),
		isTextChatServiceEnabled = p1.props.textChatService.ChatVersion == Enum.ChatVersion.TextChatService or GetFFlagExpChatAlwaysRunTCSFunction()
	})
end

function AppContainer.render(p1)
	-- upvalues: RoactModule (copy), BubbleChatModule (copy), ClientSettingsModule (copy), AppLayoutModule (copy), IsChatRegionLockedModule (copy), FFlagExpChatPresetChatEnabled (copy), FFlagExpChatNewInputBarModule (copy), GetFFlagChatTranslationShowFTUXModule (copy), ShouldShowChatTranslationFTUX1 (copy), ChatTranslationFTUXModule (copy)
	local IsTextChatServiceEnabled = p1.state.isTextChatServiceEnabled
	local Element = RoactModule.createElement(BubbleChatModule, {
		getIconVoiceIndicator = p1.props.getIconVoiceIndicator,
		onClickedVoiceIndicator = p1.props.onClickedVoiceIndicator,
		onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
		selfViewListenerChanged = p1.props.selfViewListenerChanged,
		getPermissions = p1.props.getPermissions,
		displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
		isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
		isCameraOnlyUser = p1.props.isCameraOnlyUser,
		isTextChatServiceOn = IsTextChatServiceEnabled,
		isVoiceServiceInitialized = p1.props.isVoiceServiceInitialized
	})
	
	return if IsTextChatServiceEnabled then RoactModule.createElement(ClientSettingsModule.Provider, { value = p1.props.clientSettings }, {
		app = RoactModule.createFragment({
			appLayout = RoactModule.createElement(AppLayoutModule, {
				isChatInputBarVisible = not IsChatRegionLockedModule() and p1.props.isChatInputBarVisible,
				isChatWindowVisible = p1.props.isChatWindowVisible,
				isChannelBarVisible = p1.props.isChannelBarVisible,
				chatTopBarVisibility = p1.props.chatTopBarVisibility,
				mutedUserIds = p1.props.mutedUserIds,
				onSendChat = p1.props.onSendChat,
				onSendGlobalChat = p1.props.onSendGlobalChat,
				timer = p1.props.timer,
				textTimer = p1.props.textTimer,
				activateWhisperMode = p1.props.activateWhisperMode,
				resetTargetChannel = p1.props.resetTargetChannel,
				isTextBoxFocused = p1.props.isTextBoxFocused,
				onHovered = p1.props.onHovered,
				onUnhovered = p1.props.onUnhovered,
				chatLayoutAlignment = p1.props.chatLayoutAlignment,
				chatWindowSettings = p1.props.chatWindowSettings,
				clientSettings = p1.props.clientSettings,
				selectedTabType = p1.props.selectedTabType,
				renderingFriends = p1.props.renderingFriends,
				isExperienceChatRendered = p1.props.isExperienceChatRendered,
				showTranslationButton = p1.state.showTranslationButton,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				targetTextChannel = if FFlagExpChatPresetChatEnabled or FFlagExpChatNewInputBarModule then p1.props.targetTextChannel else nil
			}),
			bubbleChat = Element,
			ChatTranslationFTUX = if GetFFlagChatTranslationShowFTUXModule() and ShouldShowChatTranslationFTUX1 and getChatTranslationEnabled() and getChatWindowEnabled() then RoactModule.createElement(ChatTranslationFTUXModule, {}) else nil
		})
	}) else RoactModule.createElement(ClientSettingsModule.Provider, { value = p1.props.clientSettings }, { bubbleChat = Element })
end

local v1 = RoactRoduxModule.connect(MapStateToPropsModule, MapDispatchToPropsModule)(AppContainer)

local function AppContainerWithSignals(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetChannelTabsStoreModule (copy), FriendsChatTabNameModule (copy), TutilsModule (copy), SignalsReactModule (copy), v1 (ref), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, (SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetChannelTabsStoreModule (upval), FriendsChatTabNameModule (upval), TutilsModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetChannelTabsStoreModule (upval), FriendsChatTabNameModule (upval)
			local ChannelTabsState = GetChannelTabsStoreModule(false).getChannelTabsState(p2)
			local AllChannelTab = if ChannelTabsState.selectedTabName then ChannelTabsState.allChannelTabs[ChannelTabsState.selectedTabName] else nil
			
			return {
				isGlobalTabSelected = ChannelTabsState.selectedTabName == "RBXGlobal",
				selectedTabType = AllChannelTab and AllChannelTab.type or nil,
				hasGlobalChannelTab = ChannelTabsState.allChannelTabs.RBXGlobal ~= nil,
				hasFriendsChannelTab = ChannelTabsState.allChannelTabs[FriendsChatTabNameModule] ~= nil
			}
		end, TutilsModule.deepEqual)
	end, {}))))))
end

return if FFlagExpChatUseChannelTabsStore then AppContainerWithSignals else v1