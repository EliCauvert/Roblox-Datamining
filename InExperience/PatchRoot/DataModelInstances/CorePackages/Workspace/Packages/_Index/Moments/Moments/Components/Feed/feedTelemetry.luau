local _ = require(script.Parent.FeedTypes)

return {
	createNoopTelemetry = function()
		return {
			logView = function(_, _) end,
			logAction = function(_, _, _)
				return nil
			end
		}
	end,
	createRecordingTelemetry = function()
		local Views = {}
		local Actions = {}
		
		return {
			views = Views,
			actions = Actions,
			logView = function(Attribution, Info)
				-- upvalues: Views (copy)
				table.insert(Views, { attribution = Attribution, info = Info })
			end,
			logAction = function(ActionType, Attribution, Payload)
				-- upvalues: Actions (copy)
				table.insert(Actions, {
					actionType = ActionType,
					attribution = Attribution,
					payload = Payload
				})
				
				return nil
			end
		}
	end
}