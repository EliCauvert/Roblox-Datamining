local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local EditChatGroupNameDialogContainerModule = require(script.Parent.EditChatGroupNameDialogContainer)
local LoggerModule = require(script.Parent.Logger)
local EditChatGroupNameDialogScreen = RoactModule.PureComponent:extend("EditChatGroupNameDialogScreen")
EditChatGroupNameDialogScreen.defaultProps = { navigation = nil }

function EditChatGroupNameDialogScreen.init(p1)
	function p1.onEditChatGroupNameDialogClose()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
end

function EditChatGroupNameDialogScreen.render(p1)
	-- upvalues: LoggerModule (copy), RoactModule (copy), EditChatGroupNameDialogContainerModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "EditChatGroupNameDialogScreen should be wrapped with Roact Navigation")
	local ConversationIdParam = Navigation.getParam("conversationId", nil)
	
	if ConversationIdParam == nil then
		LoggerModule:warning("ConversationId is required to open {screen}")
		
		return nil
	else
		return RoactModule.createElement(EditChatGroupNameDialogContainerModule, {
			conversationId = ConversationIdParam,
			onModalClose = p1.onEditChatGroupNameDialogClose
		})
	end
end

function EditChatGroupNameDialogScreen:didMount()
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("{screen} mounted")
end

return EditChatGroupNameDialogScreen