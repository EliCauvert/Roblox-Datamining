local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreensModule = require(AppChat.EnumScreens)
local GetFFlagAppChatEnableRootedNavigationModule = require(AppChat.Flags.getFFlagAppChatEnableRootedNavigation)
local RoactModule = require(AppChat.Parent.Roact)
local LeaveGroupDialogContainerModule = require(script.Parent.LeaveGroupDialogContainer)
local LoggerModule = require(script.Parent.Logger)
local LeaveGroupDialogScreen = RoactModule.PureComponent:extend("LeaveGroupDialogScreen")
LeaveGroupDialogScreen.defaultProps = { navigation = nil }

function LeaveGroupDialogScreen.init(p1)
	-- upvalues: GetFFlagAppChatEnableRootedNavigationModule (copy), LoggerModule (copy), EnumScreensModule (copy)
	function p1.onLeaveGroupDialogClose()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.onLeaveGroupSuccess()
		-- upvalues: p1 (copy), GetFFlagAppChatEnableRootedNavigationModule (upval), LoggerModule (upval), EnumScreensModule (upval)
		local Navigation = p1.props.navigation
		
		if GetFFlagAppChatEnableRootedNavigationModule() and Navigation.getParam("isRooted", false) then
			LoggerModule:info("Close rooted ChatDetails after leave from {screen}")
			local NavigateToRootStackScreenProps: () -> () = Navigation.getScreenProps("navigateToRootStack", nil)
			
			if NavigateToRootStackScreenProps then
				NavigateToRootStackScreenProps()
				
				return
			end
			if Navigation.isFocused() then
				Navigation.goBack()
			end
			return
		elseif Navigation.getScreenProps("wideMode", false) then
			LoggerModule:info("Navigate To ChatLanding with EmptyConversation from {screen}")
			Navigation.navigate(EnumScreensModule.EmptyConversation)
			
			return
		else
			LoggerModule:info("Navigate To ChatLanding from {screen}")
			Navigation.navigate(EnumScreensModule.ChatLanding)
		end
	end
end

function LeaveGroupDialogScreen.render(p1)
	-- upvalues: LoggerModule (copy), GetFFlagAppChatEnableRootedNavigationModule (copy), RoactModule (copy), LeaveGroupDialogContainerModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "LeaveGroupDialogScreen should be wrapped with Roact Navigation")
	local ConversationIdParam = Navigation.getParam("conversationId", nil)
	
	if ConversationIdParam == nil then
		LoggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	else
		return RoactModule.createElement(LeaveGroupDialogContainerModule, {
			conversationId = ConversationIdParam,
			isRooted = GetFFlagAppChatEnableRootedNavigationModule() and Navigation.getParam("isRooted", false),
			onModalClose = p1.onLeaveGroupDialogClose,
			onLeaveSuccess = p1.onLeaveGroupSuccess
		})
	end
end

function LeaveGroupDialogScreen:didMount()
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("{screen} mounted")
end

return LeaveGroupDialogScreen