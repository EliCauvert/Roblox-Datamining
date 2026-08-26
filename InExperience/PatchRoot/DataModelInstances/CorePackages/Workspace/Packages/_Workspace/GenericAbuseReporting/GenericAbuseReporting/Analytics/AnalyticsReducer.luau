local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.Cryo).Dictionary
local var1 = require(genericAbuseReporting.Logger):new("AbuseReport Analytics")

return {
	reducer = roduxModule.createReducer({}, {
		[require(genericAbuseReporting.Analytics.Actions.OnFormLoaded).name] = function(p1, p2)
			-- upvalues: var1 (ref), dictionary (ref)
			var1:trace("OnFormLoaded")
			
			return dictionary.union(p1, {
				context = p2.context,
				place_id = p2.place_id,
				accumulated_time_ms = p2.accumulated_time_ms
			})
		end,
		[require(genericAbuseReporting.Analytics.Actions.OnFormReasonSelected).name] = function(p1, p2)
			-- upvalues: var1 (ref), dictionary (ref)
			var1:trace("OnFormReasonSelected - reason_selection: {}", p2.reason_selection)
			
			return dictionary.union(p1, {
				reason_selection = p2.reason_selection,
				reason_change_count = p1.reason_change_count + 1
			})
		end,
		[require(genericAbuseReporting.Analytics.Actions.OnFormCommentUpdated).name] = function(p1, p2)
			-- upvalues: var1 (ref), dictionary (ref)
			var1:trace("OnFormCommentUpdated - comment_added: {}", p2.comment_added)
			
			return dictionary.union(p1, { comment_added = p2.comment_added })
		end
	}),
	initialState = {
		interaction_type = 0,
		context = "Unknown",
		event_type = "GenericAbuseReportWithReasonAndComment",
		place_id = 0,
		accumulated_time_ms = 0,
		reason_selection = "",
		reason_change_count = 0,
		comment_added = false
	}
}