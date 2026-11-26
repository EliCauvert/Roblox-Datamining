local FFlagMomentsCreatorFollowPreferenceModule = require(script:FindFirstAncestor("Moments").Flags.FFlagMomentsCreatorFollowPreference)
local _ = require(script.Parent.FeedTypes)

return {
	createNoopTelemetry = function()
		-- upvalues: FFlagMomentsCreatorFollowPreferenceModule (copy)
		return {
			logView = function(_, _) end,
			logAction = function(_, _, _)
				return nil
			end,
			logPreference = if FFlagMomentsCreatorFollowPreferenceModule then function(_, _) end else nil
		}
	end,
	createRecordingTelemetry = function()
		-- upvalues: FFlagMomentsCreatorFollowPreferenceModule (copy)
		local Views = {}
		local Actions = {}
		local T = if FFlagMomentsCreatorFollowPreferenceModule then {} else nil
		
		return {
			views = Views,
			actions = Actions,
			preferences = T,
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
			end,
			logPreference = if FFlagMomentsCreatorFollowPreferenceModule then function(PreferenceType, Attribution)
				-- upvalues: T (copy)
				table.insert(assert(T, "Expected preference records when preferences are enabled"), {
					preferenceType = PreferenceType,
					attribution = Attribution
				})
			end else nil
		}
	end
}