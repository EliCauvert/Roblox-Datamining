local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.Cryo).Dictionary
local var2 = require(genericAbuseReporting.Logger):new("AbuseReport Analytics")

return {
	reducer = roduxModule.createReducer({}, {
		[require(genericAbuseReporting.Analytics.Actions.OnFormLoaded).name] = function(p0, p1)
			-- upvalues: var2 (ref), dictionary (ref)
			var2:trace("OnFormLoaded")
			
			return dictionary.union(p0, {
				context = p1.context,
				place_id = p1.place_id,
				accumulated_time_ms = p1.accumulated_time_ms
			})
		end,
		[require(genericAbuseReporting.Analytics.Actions.OnFormReasonSelected).name] = function(p2, p3)
			-- upvalues: var2 (ref), dictionary (ref)
			var2:trace("OnFormReasonSelected - reason_selection: {}", p3.reason_selection)
			
			return dictionary.union(p2, {
				reason_selection = p3.reason_selection,
				reason_change_count = p2.reason_change_count + 1
			})
		end,
		[require(genericAbuseReporting.Analytics.Actions.OnFormCommentUpdated).name] = function(p4, p5)
			-- upvalues: var2 (ref), dictionary (ref)
			var2:trace("OnFormCommentUpdated - comment_added: {}", p5.comment_added)
			
			return dictionary.union(p4, { comment_added = p5.comment_added })
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