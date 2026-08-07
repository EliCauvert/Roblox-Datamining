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

function getChatWindowEnabled() --[[ line: 25 ]]
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function() --[[ line: 26 ]]
		-- upvalues: textChatService (copy)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		return if chatWindowConfiguration == nil then false else chatWindowConfiguration.Enabled
	end)
	
	return ok and status
end

function getChatTranslationEnabled() --[[ line: 38 ]]
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function() --[[ line: 39 ]]
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationEnabled
	end)
	
	return ok and status
end

function getChatTranslationToggleEnabled() --[[ line: 46 ]]
	-- upvalues: textChatService (ref)
	local ok, status = pcall(function() --[[ line: 47 ]]
		-- upvalues: textChatService (copy)
		return textChatService.ChatTranslationToggleEnabled
	end)
	
	return ok and status
end

function shouldShowChatTranslationFTUX() --[[ line: 54 ]]
	-- upvalues: textChatService (ref)
	if game:GetEngineFeature("TextChatServiceSettingsSaved") then
		local ok, status = pcall(function() --[[ line: 56 ]]
			-- upvalues: textChatService (copy)
			return textChatService.ChatTranslationFTUXShown
		end)
		
		return not (ok and status)
	end
	return true
end

local var14 = shouldShowChatTranslationFTUX()
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
local var17 = nil

function appContainer.init(p0) --[[ line: 86 ]]
	p0:setState({
		showTranslationButton = false,
		isTextChatServiceEnabled = false
	})
end

function appContainer.willUnmount(_) --[[ line: 93 ]]
	-- upvalues: var17 (write)
	var17:Disconnect()
end

function appContainer.didMount(p1) --[[ line: 97 ]]
	-- upvalues: textChatService (ref), var17 (write), getFFlagExpChatAlwaysRunTCS (ref)
	p1.migrationConnection = p1.props.chat:GetPropertyChangedSignal("IsAutoMigrated"):Connect(function() --[[ line: 98 ]]
		-- upvalues: p1 (ref)
		if p1.props.chat.IsAutoMigrated then
			p1:setState({ isTextChatServiceEnabled = true })
		end
	end)
	
	local function onTextChatServicePropertyChanged(p2) --[[ line: 106 ]]
		-- upvalues: textChatService (copy), p1 (ref)
		if p2 == "ChatTranslationEnabled" then
			local ok, status = pcall(function() --[[ line: 108 ]]
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
			local ok, _ = pcall(function() --[[ line: 120 ]]
				-- upvalues: textChatService (copy)
				return textChatService.ChatTranslationToggleEnabled
			end)
			local ok_1, status = pcall(function() --[[ line: 124 ]]
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
	
	if not var17 then
		var17 = textChatService.Changed:Connect(onTextChatServicePropertyChanged)
	end
	p1:setState({
		showTranslationButton = getChatTranslationEnabled() and getChatTranslationToggleEnabled(),
		isTextChatServiceEnabled = if p1.props.textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService then getFFlagExpChatAlwaysRunTCS() else true
	})
end

function appContainer.render(p3) --[[ line: 152 ]]
	-- upvalues: roactModule (ref), bubbleChatModule (ref), clientSettingsModule (ref), appLayoutModule (ref), fFlagExpChatUseMessagesStore (ref), isChatRegionLockedModule (ref), fFlagExpChatPresetChatEnabled (ref), fFlagExpChatNewInputBarModule (ref), getFFlagChatTranslationShowFTUXModule (ref), var14 (ref), chatTranslationFTUXModule (ref)
	local isTextChatServiceEnabled = p3.state.isTextChatServiceEnabled
	local var20 = roactModule.createElement(bubbleChatModule, {
		getIconVoiceIndicator = p3.props.getIconVoiceIndicator,
		onClickedVoiceIndicator = p3.props.onClickedVoiceIndicator,
		onClickedCameraIndicator = p3.props.onClickedCameraIndicator,
		selfViewListenerChanged = p3.props.selfViewListenerChanged,
		getPermissions = p3.props.getPermissions,
		displayCameraDeniedToast = p3.props.displayCameraDeniedToast,
		isCamEnabledForUserAndPlace = p3.props.isCamEnabledForUserAndPlace,
		isCameraOnlyUser = p3.props.isCameraOnlyUser,
		isTextChatServiceOn = isTextChatServiceEnabled,
		isVoiceServiceInitialized = p3.props.isVoiceServiceInitialized
	})
	
	return if isTextChatServiceEnabled then roactModule.createElement(clientSettingsModule.Provider, { value = p3.props.clientSettings }, {
		app = roactModule.createFragment({
			appLayout = roactModule.createElement(appLayoutModule, {
				canLocalUserChat = if fFlagExpChatUseMessagesStore then nil else p3.props.canLocalUserChat,
				isChatInputBarVisible = not isChatRegionLockedModule() and p3.props.isChatInputBarVisible,
				isChatWindowVisible = p3.props.isChatWindowVisible,
				isChannelBarVisible = p3.props.isChannelBarVisible,
				chatTopBarVisibility = p3.props.chatTopBarVisibility,
				mutedUserIds = p3.props.mutedUserIds,
				onSendChat = p3.props.onSendChat,
				onSendGlobalChat = p3.props.onSendGlobalChat,
				timer = p3.props.timer,
				textTimer = p3.props.textTimer,
				activateWhisperMode = p3.props.activateWhisperMode,
				resetTargetChannel = p3.props.resetTargetChannel,
				isTextBoxFocused = p3.props.isTextBoxFocused,
				onHovered = p3.props.onHovered,
				onUnhovered = p3.props.onUnhovered,
				chatLayoutAlignment = p3.props.chatLayoutAlignment,
				chatWindowSettings = p3.props.chatWindowSettings,
				clientSettings = p3.props.clientSettings,
				selectedTabType = p3.props.selectedTabType,
				showTranslationButton = p3.state.showTranslationButton,
				isSpatialUIEnabled = p3.props.isSpatialUIEnabled,
				targetTextChannel = if fFlagExpChatPresetChatEnabled or fFlagExpChatNewInputBarModule then p3.props.targetTextChannel else nil
			}),
			bubbleChat = var20,
			ChatTranslationFTUX = if getFFlagChatTranslationShowFTUXModule() and var14 and (getChatTranslationEnabled() and getChatWindowEnabled()) then roactModule.createElement(chatTranslationFTUXModule, {}) else nil
		})
	}) else roactModule.createElement(clientSettingsModule.Provider, { value = p3.props.clientSettings }, { bubbleChat = var20 })
end

return roactRoduxModule.connect(mapStateToPropsModule, mapDispatchToPropsModule)(appContainer)