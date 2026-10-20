local MessageGroupShapeModule = require(script:FindFirstAncestor("AppChat").Components.ChatConversation.Grouping.MessageGroupShape)

return function(p1, p2, p3, p4)
	-- upvalues: MessageGroupShapeModule (copy)
	return {
		direction = if p4 then MessageGroupShapeModule.Direction.Incoming else MessageGroupShapeModule.Direction.Outgoing,
		position = if p1 and p2 then MessageGroupShapeModule.Position.Only elseif p3 then MessageGroupShapeModule.Position.Only elseif p1 then MessageGroupShapeModule.Position.First elseif p2 then MessageGroupShapeModule.Position.Last else MessageGroupShapeModule.Position.Middle
	}
end