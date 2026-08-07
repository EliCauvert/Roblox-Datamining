local appChat = script:FindFirstAncestor("AppChat")
local enumScreensModule = require(appChat.EnumScreens)
local roactModule = require(appChat.Parent.Roact)
local leaveGroupDialogContainerModule = require(script.Parent.LeaveGroupDialogContainer)
local loggerModule = require(script.Parent.Logger)
local leaveGroupDialogScreen = roactModule.PureComponent:extend("LeaveGroupDialogScreen")
leaveGroupDialogScreen.defaultProps = { navigation = nil }

function leaveGroupDialogScreen.init(p0) --[[ line: 16 ]]
	-- upvalues: loggerModule (ref), enumScreensModule (ref)
	function p0.onLeaveGroupDialogClose() --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		p0.props.navigation.goBack()
	end
	
	function p0.onLeaveGroupSuccess() --[[ line: 21 ]]
		-- upvalues: p0 (ref), loggerModule (copy), enumScreensModule (copy)
		local navigation = p0.props.navigation
		
		if navigation.getScreenProps("wideMode", false) then
			loggerModule:info("Navigate To ChatLanding with EmptyConversation from {screen}")
			navigation.navigate(enumScreensModule.EmptyConversation)
			
			return
		end
		loggerModule:info("Navigate To ChatLanding from {screen}")
		navigation.navigate(enumScreensModule.ChatLanding)
	end
end

function leaveGroupDialogScreen.render(p1) --[[ line: 34 ]]
	-- upvalues: loggerModule (ref), roactModule (ref), leaveGroupDialogContainerModule (ref)
	local navigation = p1.props.navigation
	assert(type(navigation) ~= "nil", "LeaveGroupDialogScreen should be wrapped with Roact Navigation")
	local conversationId = navigation.getParam("conversationId", nil)
	
	if conversationId == nil then
		loggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	end
	return roactModule.createElement(leaveGroupDialogContainerModule, {
		conversationId = conversationId,
		onModalClose = p1.onLeaveGroupDialogClose,
		onLeaveSuccess = p1.onLeaveGroupSuccess
	})
end

function leaveGroupDialogScreen.didMount(_) --[[ line: 51 ]]
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return leaveGroupDialogScreen