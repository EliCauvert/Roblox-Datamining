local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local sharedFlagsModule = require(parent.SharedFlags)
local expChatSharedModule = require(parent.ExpChatShared)
local clientSettingsModule = require(expChat.ClientSettings)
local mapStateToPropsModule = require(script.Parent.mapStateToProps)
local mapDispatchToPropsModule = require(script.Parent.mapDispatchToProps)
local bubbleChatModule = require(script.Parent.Parent.BubbleChat)
local appLayoutModule = require(script.Parent.Parent.AppLayout)
local isChatRegionLockedModule = require(expChat.isChatRegionLocked)
local textChatService = game:GetService("TextChatService")
local getFFlagChatTranslationShowFTUXModule = require(expChat.Flags.getFFlagChatTranslationShowFTUX)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatNewInputBarModule = require(expChat.Flags.FFlagExpChatNewInputBar)
local getFFlagExpChatAlwaysRunTCS = sharedFlagsModule.getFFlagExpChatAlwaysRunTCS
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore

function getChatWindowEnabled()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		return if chatWindowConfiguration == nil then false else chatWindowConfiguration.Enabled
	end)
	
	return ok and status
end

function getChatTranslationEnabled()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationEnabled
	end)
	
	return ok and status
end

function getChatTranslationToggleEnabled()
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function()
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationToggleEnabled
	end)
	
	return ok and status
end

function shouldShowChatTranslationFTUX()
	-- upvalues: textChatService (ref)
	if game:GetEngineFeature("TextChatServiceSettingsSaved") then
		local ok, status = pcall(function()
			-- upvalues: textChatService (copy)
			return textChatService.ChatTranslationFTUXShown
		end)
		
		return not (ok and status)
	end
	return true
end

local var1 = shouldShowChatTranslationFTUX()
local chatTranslationFTUXModule = require(script.Parent.Parent.ChatTranslationFTUX)
local appContainer = roactModule.PureComponent:extend("AppContainer")
appContainer.defaultProps = {
	isChatInputBarVisible = true,
	isChatWindowVisible = true,
	isChannelBarVisible = false,
	onSendChat = nil,
	onSendGlobalChat = nil,
	mutedUserIds = nil,
	textTimer = nil,
	timer = nil,
	textChatService = textChatService,
	chat = game:GetService("Chat")
}
local var2 = nil

function appContainer.init(p1)
	p1:setState({
		showTranslationButton = false,
		isTextChatServiceEnabled = false
	})
end

function appContainer.willUnmount(_)
	-- upvalues: var2 (write)
	var2:Disconnect()
end

function appContainer.didMount(p1)
	-- upvalues: textChatService (ref), var2 (write), getFFlagExpChatAlwaysRunTCS (ref)
	p1.migrationConnection = p1.props.chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function()
		-- upvalues: p1 (ref)
		if p1.props.chat.IsAutoMigrated then
			p1:setState({ isTextChatServiceEnabled = true })
		end
	end)
	
	local function onTextChatServicePropertyChanged(p2)
		-- upvalues: textChatService (copy), p1 (ref)
		if p2 == "ChatTranslationEnabled" then
			local ok, status = pcall(function()
				-- upvalues: textChatService (copy)
				return textChatService.ChatTranslationEnabled
			end)
			
			if ok then
				p1.props.onToggleTranslation(status)
				p1:setState({
					showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
				})
				
				return
			end
		elseif p2 == "ChatTranslationToggleEnabled" then
			local ok, _ = pcall(function()
				-- upvalues: textChatService (copy)
				return textChatService.ChatTranslationToggleEnabled
			end)
			local ok_1, status = pcall(function()
				-- upvalues: textChatService (copy)
				return textChatService.ChatTranslationEnabled
			end)
			
			if ok then
				if ok_1 then
					p1.props.onToggleTranslation(status)
				end
				p1:setState({
					showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled()
				})
			end
		end
	end
	
	if not var2 then
		var2 = textChatService.Changed:Connect(onTextChatServicePropertyChanged)
	end
	p1:setState({
		showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled(),
		isTextChatServiceEnabled = if p1.props.textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then getFFlagExpChatAlwaysRunTCS() else true
	})
end

function appContainer.render(p1)
	-- upvalues: roactModule (ref), bubbleChatModule (ref), clientSettingsModule (ref), appLayoutModule (ref), fFlagExpChatUseMessagesStore (ref), isChatRegionLockedModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatNewInputBarModule (ref), getFFlagChatTranslationShowFTUXModule (ref), var1 (ref), chatTranslationFTUXModule (ref)
	local isTextChatServiceEnabled = p1.state.isTextChatServiceEnabled
	local var3 = roactModule.createElement(bubbleChatModule, {
		getIconVoiceIndicator = p1.props.getIconVoiceIndicator,
		onClickedVoiceIndicator = p1.props.onClickedVoiceIndicator,
		onClickedCameraIndicator = p1.props.onClickedCameraIndicator,
		selfViewListenerChanged = p1.props.selfViewListenerChanged,
		getPermissions = p1.props.getPermissions,
		displayCameraDeniedToast = p1.props.displayCameraDeniedToast,
		isCamEnabledForUserAndPlace = p1.props.isCamEnabledForUserAndPlace,
		isCameraOnlyUser = p1.props.isCameraOnlyUser,
		isTextChatServiceOn = isTextChatServiceEnabled,
		isVoiceServiceInitialized = p1.props.isVoiceServiceInitialized
	})
	
	return if isTextChatServiceEnabled then roactModule.createElement(clientSettingsModule.Provider, { value = p1.props.clientSettings }, {
		app = roactModule.createFragment({
			appLayout = roactModule.createElement(appLayoutModule, {
				canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p1.props.canLocalUserChat,
				isChatInputBarVisible = not isChatRegionLockedModule() and p1.props.isChatInputBarVisible,
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
				showTranslationButton = p1.state.showTranslationButton,
				isSpatialUIEnabled = p1.props.isSpatialUIEnabled,
				targetTextChannel = if fFlagExpChatPresetChatEnabled or fFlagExpChatNewInputBarModule then p1.props.targetTextChannel else nil
			}),
			bubbleChat = var3,
			ChatTranslationFTUX = if getFFlagChatTranslationShowFTUXModule() and var1 and (getChatTranslationEnabled() and getChatWindowEnabled()) then roactModule.createElement(chatTranslationFTUXModule, {}) else nil
		})
	}) else roactModule.createElement(clientSettingsModule.Provider, { value = p1.props.clientSettings }, { bubbleChat = var3 })
end

return roactRoduxModule.connect(mapStateToPropsModule, mapDispatchToPropsModule)(appContainer)