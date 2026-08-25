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

function participantDialogScreenDeprecated.init(p0)
	-- upvalues: loggerModule (ref), genericDialogTypeModule (ref), enumScreensModule (ref), roactChatAnalyticsModule (ref), enteredChatFromEntryPoint (ref), chatEntryPointNames (ref), createConversationModule (ref), parseCreateConversationErrorsModule (ref), fFlagDisableBlockAndReport (ref)
	function p0.onDismiss()
		-- upvalues: p0 (ref)
		p0.props.navigation.goBack()
	end
	
	function p0.openRemoveUserDialog(p1, p2)
		-- upvalues: loggerModule (copy), p0 (ref), genericDialogTypeModule (copy)
		loggerModule:info("User activated removeFromGroup | userId: {}, conversationId: {}", p1, p2)
		p0.props.navigation.replace(genericDialogTypeModule.RemoveUserDialog, { conversationId = p2, participantId = p1 })
	end
	
	function p0.openViewProfile(p3)
		-- upvalues: p0 (ref), enumScreensModule (copy), loggerModule (copy), roactChatAnalyticsModule (copy)
		local viewUserProfile = p0.props.navigation.getScreenProps("navigateToLuaAppPages", {})[enumScreensModule.ViewUserProfile]
		
		if viewUserProfile then
			loggerModule:info("Navigate To UserProfile from {screen}")
			p0.props.analytics:navigate(roactChatAnalyticsModule.NavigationEvents.ChatDetailsProfile)
			viewUserProfile(p3, {})
			
			return
		end
		loggerModule:warning("UserProfile page was not set in navigateToLuaAppPages screenProps")
	end
	
	function p0.openChat(p4)
		-- upvalues: loggerModule (copy), p0 (ref), enteredChatFromEntryPoint (copy), chatEntryPointNames (copy), createConversationModule (copy), enumScreensModule (copy), parseCreateConversationErrorsModule (copy)
		loggerModule:info("User activated openChat | userId: {}", p4)
		p0.props.dispatch(enteredChatFromEntryPoint(chatEntryPointNames.ChatDetailsParticipantDialog))
		p0.props.navigation.goBack()
		p0.props.dispatch(createConversationModule("one_to_one", { tostring(p4) })):andThen(function(p6)
			-- upvalues: p0 (copy), enumScreensModule (copy)
			p0.props.navigation.navigate(enumScreensModule.ChatConversation, { conversationId = p6.id })
		end):catch(function(p5)
			-- upvalues: loggerModule (copy), p4 (ref), parseCreateConversationErrorsModule (copy), p0 (copy), enumScreensModule (copy)
			loggerModule:warning("Error creating 1:1 conversation for userId {}: {}", p4, tostring(p5))
			p0.props.navigation.navigate(enumScreensModule.RoactChatToast, {
				toastProps = {
					toastContent = {
						toastTitle = if parseCreateConversationErrorsModule(p5) == "participant_chat_disabled" then "Feature.Chat.Message.PartyUnavailableWithUser" else "Feature.Toast.NetworkingError.SomethingIsWrong"
					}
				}
			})
		end)
	end
	
	function p0.openReportUser(p7, p8)
		-- upvalues: p0 (ref), enumScreensModule (copy)
		p0.props.navigation.replace(enumScreensModule.AppChatReportAbuse, { participantId = p7, conversationId = p8 })
	end
	
	function p0.openBlockingModal(p9, p10)
		-- upvalues: p0 (ref), enumScreensModule (copy), fFlagDisableBlockAndReport (copy)
		p0.props.navigation.replace(enumScreensModule.BlockingModal, {
			navProps = {
				userId = p9,
				openReportUser = function()
					-- upvalues: p0 (copy), enumScreensModule (copy), p9 (ref), p10 (ref)
					p0.props.navigation.pop()
					p0.props.navigation.navigate(enumScreensModule.AppChatReportAbuse, { participantId = p9, conversationId = p10 })
				end,
				disableReportOption = fFlagDisableBlockAndReport
			}
		})
	end
end

function participantDialogScreenDeprecated.render(p11)
	-- upvalues: loggerModule (ref), reactModule (ref), participantDialogContainerDeprecatedModule (ref), fFlagEnableChatDetailsOpenChatModule (ref)
	local navigation = p11.props.navigation
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
		onDismiss = p11.onDismiss,
		openRemoveUserDialog = p11.openRemoveUserDialog,
		openReportUser = p11.openReportUser,
		openViewProfile = p11.openViewProfile,
		openChat = if fFlagEnableChatDetailsOpenChatModule then p11.openChat else nil,
		openBlockingModal = p11.openBlockingModal
	})
end

function participantDialogScreenDeprecated.didMount(_)
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return roactRoduxModule.connect(nil, function(p13)
	return { dispatch = p13 }
end)(connectAnalyticsModule(function(p12)
	return { analytics = p12 }
end)(participantDialogScreenDeprecated))