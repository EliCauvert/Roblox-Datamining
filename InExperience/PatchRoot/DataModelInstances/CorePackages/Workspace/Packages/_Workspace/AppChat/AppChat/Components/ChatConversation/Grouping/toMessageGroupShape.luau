local messageGroupShapeModule = require(script:FindFirstAncestor("AppChat").Components.ChatConversation.Grouping.MessageGroupShape)

return function(p1, p2, p3, p4)
	-- upvalues: messageGroupShapeModule (ref)
	return {
		direction = if p4 then messageGroupShapeModule.Direction.Incoming else messageGroupShapeModule.Direction.Outgoing,
		position = if p1 and p2 or p3 then messageGroupShapeModule.Position.Only elseif p1 then messageGroupShapeModule.Position.First elseif p2 then messageGroupShapeModule.Position.Last else messageGroupShapeModule.Position.Middle
	}
end