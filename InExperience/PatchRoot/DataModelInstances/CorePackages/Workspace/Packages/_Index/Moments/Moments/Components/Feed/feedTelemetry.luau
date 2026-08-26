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
		local t = {}
		local t_1 = {}
		
		return {
			views = t,
			actions = t_1,
			logView = function(p1, p2)
				-- upvalues: t (ref)
				table.insert(t, { attribution = p1, info = p2 })
			end,
			logAction = function(p1, p2, p3)
				-- upvalues: t_1 (ref)
				table.insert(t_1, { actionType = p1, attribution = p2, payload = p3 })
				
				return nil
			end
		}
	end
}