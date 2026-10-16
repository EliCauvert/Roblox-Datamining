local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local RemoveUserDialogContainerModule = require(script.Parent.RemoveUserDialogContainer)
local LoggerModule = require(script.Parent.Logger)
local RemoveUserDialog = RoactModule.PureComponent:extend("RemoveUserDialog")
RemoveUserDialog.defaultProps = { navigation = nil }

function RemoveUserDialog.init(p1) --[[ Line: 14 ]]
	function p1.onRemoveUserDialogClose() --[[ Line: 15 ]]
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
end

function RemoveUserDialog.render(p1) --[[ Line: 20 ]]
	-- upvalues: LoggerModule (copy), RoactModule (copy), RemoveUserDialogContainerModule (copy)
	local Navigation = p1.props.navigation
	assert(type(Navigation) ~= "nil", "RemoveUserDialog should be wrapped with Roact Navigation")
	local ConversationIdParam = Navigation.getParam("conversationId", nil)
	local ParticipantIdParam = Navigation.getParam("participantId", nil)
	
	if ConversationIdParam == nil or ParticipantIdParam == nil then
		LoggerModule:warning("ConversationId and participantId are required to open {screen}")
		
		return nil
	else
		return RoactModule.createElement(RemoveUserDialogContainerModule, {
			conversationId = ConversationIdParam,
			participantId = ParticipantIdParam,
			onModalClose = p1.onRemoveUserDialogClose
		})
	end
end

function RemoveUserDialog:didMount() --[[ Line: 38 ]]
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("{screen} mounted")
end

return RemoveUserDialog