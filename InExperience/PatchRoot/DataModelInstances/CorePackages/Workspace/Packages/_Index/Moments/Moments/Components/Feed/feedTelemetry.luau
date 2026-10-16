local _ = require(script.Parent.FeedTypes)

return {
	createNoopTelemetry = function() --[[ Line: 19 ]]
		return {
			logView = function(_, _) --[[ Line: 21 ]] end,
			logAction = function(_, _, _) --[[ Line: 22 ]]
				return nil
			end
		}
	end,
	createRecordingTelemetry = function() --[[ Line: 56 ]]
		local Views = {}
		local Actions = {}
		
		return {
			views = Views,
			actions = Actions,
			logView = function(Attribution, Info) --[[ Line: 63 ]]
				-- upvalues: Views (copy)
				table.insert(Views, { attribution = Attribution, info = Info })
			end,
			logAction = function(ActionType, Attribution, Payload) --[[ Line: 66 ]]
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