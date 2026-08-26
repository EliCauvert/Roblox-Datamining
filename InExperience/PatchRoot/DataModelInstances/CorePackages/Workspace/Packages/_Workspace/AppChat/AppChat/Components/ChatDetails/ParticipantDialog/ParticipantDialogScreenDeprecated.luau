local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local socialCommonModule = require(parent.SocialCommon)
local genericDialogTypeModule = require(script.Parent.Parent.Dialogs.GenericDialogType)
local loggerModule = require(script.Parent.Logger)
local participantDialogContainerDeprecatedModule = require(script.Parent.ParticipantDialogContainerDeprecated)
local connectAnalyticsModule = require(appChat.LegacyAnalytics.connectAnalytics)
local roactChatAnalyticsModule = require(appChat.LegacyAnalytics.RoactChatAnalytics)
local createConversationModule = require(appChat.Conversations.Thunks.createConversation)
local parseCreateConversationErrorsModule = require(appChat.Conversations.Thunks.parseCreateConversationErrors)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPoint = require(appChat.Actions).EnteredChatFromEntryPoint
local fFlagDisableBlockAndReport = require(parent.SharedFlags).FFlagDisableBlockAndReport
local fFlagEnableChatDetailsOpenChatModule = require(appChat.Flags.FFlagEnableChatDetailsOpenChat)
local participantDialogScreenDeprecated = reactModule.PureComponent:extend("ParticipantDialogScreenDeprecated")
participantDialogScreenDeprecated.defaultProps = { navigation = nil }

function participantDialogScreenDeprecated.init(p1)
	-- upvalues: loggerModule (ref), genericDialogTypeModule (ref), enumScreensModule (ref), roactChatAnalyticsModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref)
	function p0.onDismiss()
		-- upvalues: p1 (ref)
		p1.props.navigation.goBack()
	end
	
	function p0.openRemoveUserDialog(p2, p3)
		-- upvalues: loggerModule (copy), p1 (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p2, p3)
		p1.props.navigation.replace(genericDialogTypeModule.RemoveUserDialog, { conversationId = p3, participantId = p2 })
	end
	
	function p0.openViewProfile(p2)
		-- upvalues: p1 (ref), enumScreensModule (copy), loggerModule (copy), roactChatAnalyticsModule (copy)
		local viewUserProfile = p1.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			loggerModule:info("Navigate To UserProfile from {screen}")
			p1.props.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
			viewUserProfile(p2, {})
			
			return
		end
		loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p0.openChat(p2)
		-- upvalues: loggerModule (copy), p1 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), createConversationModule (copy), enumScreensModule (copy), parseCreateConversationErrorsModule (copy)
		loggerModule:info("User activated openChat | userId: {}", p2)
		p1.props.dispatch(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
		p1.props.navigation.goBack()
		p1.props.dispatch(createConversationModule("one_to_one", { tostring(p2) })):andThen(function(p3)
			-- upvalues: p1 (copy), enumScreensModule (copy)
			p1.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p3.id })
		end):catch(function(p3)
			-- upvalues: loggerModule (copy), p2 (ref), parseCreateConversationErrorsModule (copy), p1 (copy), enumScreensModule (copy)
			loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p2, tostring(p3))
			p1.props.navigation.navigate(enumScreensModule.RoactChatToast, {
				toastProps = {
					toastContent = {
						toastTitle = if parseCreateConversationErrorsModule(p3) == "participant_chat_disabled" then "Feature.Chat.Message.PartyUnavailableWithUser" else "Feature.Toast.NetworkingError.SomethingIsWrong"
					}
				}
			})
		end)
	end
	
	function p0.openReportUser(p2, p3)
		-- upvalues: p1 (ref), enumScreensModule (copy)
		p1.props.navigation.replace(enumScreensModule.AppChatReportAbuse, { participantId = p2, conversationId = p3 })
	end
	
	function p0.openBlockingModal(p2, p3)
		-- upvalues: p1 (ref), enumScreensModule (copy), fFlagDisableBlockAndReport (copy)
		p1.props.navigation.replace(enumScreensModule.BlockingModal, {
			navProps = {
				userId = p2,
				openReportUser = function()
					-- upvalues: p1 (copy), enumScreensModule (copy), p2 (ref), p3 (ref)
					p1.props.navigation.pop()
					p1.props.navigation.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p2, conversationId = p3 })
				end,
				disableReportOption = fFlagDisableBlockAndReport
			}
		})
	end
end

function participantDialogScreenDeprecated.render(p1)
	-- upvalues: loggerModule (ref), reactModule (ref), participantDialogContainerDeprecatedModule (ref), fFlagEnableChatDetailsOpenChatModule (ref)
	local navigation = p1.props.navigation
	assert(type(navigation) ~= "nil", "ParticipantDialogScreenDeprecated should be wrapped with navigation")
	local conversationId = navigation.getParam("conversationId", nil)
	local participantId = navigation.getParam("participantId", nil)
	local showRemoveUserButton = navigation.getParam("showRemoveUserButton", false)
	local wideMode = navigation.getScreenProps("wideMode", false)
	
	if conversationId == nil or participantId == nil then
		loggerModule:warning("ConversationId and participantId are required to open {screen}")
		
		return nil
	end
	return reactModule.createElement(participantDialogContainerDeprecatedModule, {
		conversationId = conversationId,
		participantId = participantId,
		showRemoveUserButton = showRemoveUserButton,
		isWideMode = wideMode,
		onDismiss = p1.onDismiss,
		openRemoveUserDialog = p1.openRemoveUserDialog,
		openReportUser = p1.openReportUser,
		openViewProfile = p1.openViewProfile,
		openChat = if fFlagEnableChatDetailsOpenChatModule then p1.openChat else nil,
		openBlockingModal = p1.openBlockingModal
	})
end

function participantDialogScreenDeprecated.didMount(_)
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return roactRoduxModule.connect(nil, function(p1)
	return { dispatch = p1 }
end)(connectAnalyticsModule(function(p1)
	return { analytics = p1 }
end)(participantDialogScreenDeprecated))