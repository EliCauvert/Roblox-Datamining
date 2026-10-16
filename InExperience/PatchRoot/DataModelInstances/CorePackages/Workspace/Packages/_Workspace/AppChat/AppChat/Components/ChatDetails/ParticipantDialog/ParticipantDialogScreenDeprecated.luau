local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local EnumScreensModule = require(AppChat.EnumScreens)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local GenericDialogTypeModule = require(script.Parent.Parent.Dialogs.GenericDialogType)
local LoggerModule = require(script.Parent.Logger)
local ParticipantDialogContainerDeprecatedModule = require(script.Parent.ParticipantDialogContainerDeprecated)
local ConnectAnalyticsModule = require(AppChat.LegacyAnalytics.connectAnalytics)
local RoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.RoactChatAnalytics)
local CreateConversationModule = require(AppChat.Conversations.Thunks.createConversation)
local ParseCreateConversationErrorsModule = require(AppChat.Conversations.Thunks.parseCreateConversationErrors)
local ChatEntryPointNames = require(Parent.SocialCommon).Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = require(AppChat.Actions).EnteredChatFromEntryPoint
local FFlagDisableBlockAndReport = require(Parent.SharedFlags).FFlagDisableBlockAndReport
local FFlagEnableChatDetailsOpenChatModule = require(AppChat.Flags.FFlagEnableChatDetailsOpenChat)
local ParticipantDialogScreenDeprecated = ReactModule.PureComponent:extend("ParticipantDialogScreenDeprecated")
ParticipantDialogScreenDeprecated.defaultProps = { navigation = nil }

function ParticipantDialogScreenDeprecated.init(p1) --[[ Line: 32 ]]
	-- upvalues: LoggerModule (copy), GenericDialogTypeModule (copy), EnumScreensModule (copy), RoactChatAnalyticsModule (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), CreateConversationModule (copy), ParseCreateConversationErrorsModule (copy), FFlagDisableBlockAndReport (copy)
	function p1.onDismiss() --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.openRemoveUserDialog(ParticipantId, ConversationId) --[[ Line: 36 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), GenericDialogTypeModule (upval)
		LoggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", ParticipantId, ConversationId)
		p1.props.navigation.replace(GenericDialogTypeModule.RemoveUserDialog, {
			conversationId = ConversationId,
			participantId = ParticipantId
		})
	end
	
	function p1.openViewProfile(p2) --[[ Line: 44 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval), LoggerModule (upval), RoactChatAnalyticsModule (upval)
		local NavigateToLuaAppPagesScreenProp: (any, any) -> () = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreensModule.ViewUserProfile]
		
		if NavigateToLuaAppPagesScreenProp then
			LoggerModule:info("Navigate To UserProfile from {screen}")
			p1.props.analytics:navigate(RoactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
			NavigateToLuaAppPagesScreenProp(p2, {})
			
			return
		else
			LoggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
		end
	end
	
	function p1.openChat(p2) --[[ Line: 56 ]]
		-- upvalues: LoggerModule (upval), p1 (copy), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), CreateConversationModule (upval), EnumScreensModule (upval), ParseCreateConversationErrorsModule (upval)
		LoggerModule:info("User activated openChat | userId: {}", p2)
		p1.props.dispatch(EnteredChatFromEntryPointFunction(ChatEntryPointNames.ChatDetailsParticipantDialog))
		p1.props.navigation.goBack()
		p1.props.dispatch(CreateConversationModule("one_to_one", { (tostring(p2)) })):andThen(function(Result) --[[ Line: 62 ]]
			-- upvalues: p1 (upval), EnumScreensModule (upval)
			p1.props.navigation.navigate(EnumScreensModule.ChatConversation, { conversationId = Result.id })
		end):catch(function(Err) --[[ Line: 67 ]]
			-- upvalues: LoggerModule (upval), p2 (copy), ParseCreateConversationErrorsModule (upval), p1 (upval), EnumScreensModule (upval)
			LoggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p2, (tostring(Err)))
			p1.props.navigation.navigate(EnumScreensModule.RoactChatToast, {
				toastProps = {
					toastContent = {
						toastTitle = if ParseCreateConversationErrorsModule(Err) == "participant_chat_disabled" then "Feature.Chat.Message.PartyUnavailableWithUser" else "Feature.Toast.NetworkingError.SomethingIsWrong"
					}
				}
			})
		end)
	end
	
	function p1.openReportUser(ParticipantId, ConversationId) --[[ Line: 82 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigation.replace(EnumScreensModule.AppChatReportAbuse, {
			participantId = ParticipantId,
			conversationId = ConversationId
		})
	end
	
	function p1.openBlockingModal(ParticipantId, ConversationId) --[[ Line: 89 ]]
		-- upvalues: p1 (copy), EnumScreensModule (upval), FFlagDisableBlockAndReport (upval)
		p1.props.navigation.replace(EnumScreensModule.BlockingModal, {
			navProps = {
				userId = ParticipantId,
				openReportUser = function() --[[ Line: 90 ]]
					-- upvalues: p1 (upval), EnumScreensModule (upval), ParticipantId (copy), ConversationId (copy)
					p1.props.navigation.pop()
					p1.props.navigation.navigate(EnumScreensModule.AppChatReportAbuse, {
						participantId = ParticipantId,
						conversationId = ConversationId
					})
				end,
				disableReportOption = FFlagDisableBlockAndReport
			}
		})
	end
end

function ParticipantDialogScreenDeprecated.render(p1) --[[ Line: 108 ]]
	-- upvalues: LoggerModule (copy), ReactModule (copy), ParticipantDialogContainerDeprecatedModule (copy), FFlagEnableChatDetailsOpenChatModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "ParticipantDialogScreenDeprecated should be wrapped with navigation")
	local ConversationIdParam = Navigation.getParam("conversationId", nil)
	local ParticipantIdParam = Navigation.getParam("participantId", nil)
	local ShowRemoveUserButtonParam = Navigation.getParam("showRemoveUserButton", false)
	local WideModeScreenProps = Navigation.getScreenProps("wideMode", false)
	
	if ConversationIdParam == nil or ParticipantIdParam == nil then
		LoggerModule:warning("ConversationId and participantId are required to open {screen}")
		
		return nil
	else
		return ReactModule.createElement(ParticipantDialogContainerDeprecatedModule, {
			conversationId = ConversationIdParam,
			participantId = ParticipantIdParam,
			showRemoveUserButton = ShowRemoveUserButtonParam,
			isWideMode = WideModeScreenProps,
			onDismiss = p1.onDismiss,
			openRemoveUserDialog = p1.openRemoveUserDialog,
			openReportUser = p1.openReportUser,
			openViewProfile = p1.openViewProfile,
			openChat = if FFlagEnableChatDetailsOpenChatModule then p1.openChat else nil,
			openBlockingModal = p1.openBlockingModal
		})
	end
end

function ParticipantDialogScreenDeprecated:didMount() --[[ Line: 137 ]]
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("{screen} mounted")
end

return (RoactRoduxModule.connect(nil, function(Dispatch) --[[ Line: 145 ]]
	return { dispatch = Dispatch }
end)((ConnectAnalyticsModule(function(Analytics) --[[ Line: 141 ]]
	return { analytics = Analytics }
end)(ParticipantDialogScreenDeprecated))))