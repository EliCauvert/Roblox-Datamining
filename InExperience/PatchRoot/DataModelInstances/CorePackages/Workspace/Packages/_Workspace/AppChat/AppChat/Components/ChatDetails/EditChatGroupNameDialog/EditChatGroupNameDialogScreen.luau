local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local editChatGroupNameDialogContainerModule = require(script.Parent.EditChatGroupNameDialogContainer)
local loggerModule = require(script.Parent.Logger)
local editChatGroupNameDialogScreen = roactModule.PureComponent:extend("EditChatGroupNameDialogScreen")
editChatGroupNameDialogScreen.defaultProps = { navigation = nil }

function editChatGroupNameDialogScreen.init(p0) --[[ line: 14 ]]
	function p0.onEditChatGroupNameDialogClose() --[[ line: 15 ]]
		-- upvalues: p0 (ref)
		p0.props.navigation.goBack()
	end
end

function editChatGroupNameDialogScreen.render(p1) --[[ line: 20 ]]
	-- upvalues: loggerModule (ref), roactModule (ref), editChatGroupNameDialogContainerModule (ref)
	local navigation = p1.props.navigation
	assert(type(navigation) ~= "nil", "EditChatGroupNameDialogScreen should be wrapped with Roact Navigation")
	local conversationId = navigation.getParam("conversationId", nil)
	
	if conversationId == nil then
		loggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	end
	return roactModule.createElement(editChatGroupNameDialogContainerModule, {
		conversationId = conversationId,
		onModalClose = p1.onEditChatGroupNameDialogClose
	})
end

function editChatGroupNameDialogScreen.didMount(_) --[[ line: 36 ]]
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return editChatGroupNameDialogScreen