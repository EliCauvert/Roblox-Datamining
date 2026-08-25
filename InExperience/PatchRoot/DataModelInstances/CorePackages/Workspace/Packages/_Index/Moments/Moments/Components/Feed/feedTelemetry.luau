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
			logView = function(p0, p1)
				-- upvalues: t (ref)
				table.insert(t, { attribution = p0, info = p1 })
			end,
			logAction = function(p2, p3, p4)
				-- upvalues: t_1 (ref)
				table.insert(t_1, { actionType = p2, attribution = p3, payload = p4 })
				
				return nil
			end
		}
	end
}