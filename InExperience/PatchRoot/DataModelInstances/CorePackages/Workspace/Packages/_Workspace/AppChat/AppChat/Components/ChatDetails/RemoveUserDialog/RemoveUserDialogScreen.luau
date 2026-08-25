local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local removeUserDialogContainerModule = require(script.Parent.RemoveUserDialogContainer)
local loggerModule = require(script.Parent.Logger)
local removeUserDialog = roactModule.PureComponent:extend("RemoveUserDialog")
removeUserDialog.defaultProps = { navigation = nil }

function removeUserDialog.init(p0)
	function p0.onRemoveUserDialogClose()
		-- upvalues: p0 (ref)
		p0.props.navigation.goBack()
	end
end

function removeUserDialog.render(p1)
	-- upvalues: loggerModule (ref), roactModule (ref), removeUserDialogContainerModule (ref)
	local navigation = p1.props.navigation
	assert(type(navigation) ~= "nil", "RemoveUserDialog should be wrapped with Roact Navigation")
	local conversationId = navigation.getParam("conversationId", nil)
	local participantId = navigation.getParam("participantId", nil)
	
	if conversationId == nil or participantId == nil then
		loggerModule:warning("ConversationId and participantId are required to open {screen}")
		
		return nil
	end
	return roactModule.createElement(removeUserDialogContainerModule, {
		conversationId = conversationId,
		participantId = participantId,
		onModalClose = p1.onRemoveUserDialogClose
	})
end

function removeUserDialog.didMount(_)
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return removeUserDialog