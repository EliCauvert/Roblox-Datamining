local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local Dictionary = require(Parent.Cryo).Dictionary
local AbuseReportAnalytics = require(GenericAbuseReporting.Logger):new("AbuseReport Analytics")

return {
	reducer = require(Parent.Rodux).createReducer({}, {
		[require(GenericAbuseReporting.Analytics.Actions.OnFormLoaded).name] = function(p1, p2)
			-- upvalues: AbuseReportAnalytics (copy), Dictionary (copy)
			AbuseReportAnalytics:trace("OnFormLoaded")
			
			return Dictionary.union(p1, {
				context = p2.context,
				place_id = p2.place_id,
				accumulated_time_ms = p2.accumulated_time_ms
			})
		end,
		[require(GenericAbuseReporting.Analytics.Actions.OnFormReasonSelected).name] = function(p1, p2)
			-- upvalues: AbuseReportAnalytics (copy), Dictionary (copy)
			AbuseReportAnalytics:trace("OnFormReasonSelected - reason_selection: {}", p2.reason_selection)
			
			return Dictionary.union(p1, {
				reason_selection = p2.reason_selection,
				reason_change_count = p1.reason_change_count + 1
			})
		end,
		[require(GenericAbuseReporting.Analytics.Actions.OnFormCommentUpdated).name] = function(p1, p2)
			-- upvalues: AbuseReportAnalytics (copy), Dictionary (copy)
			AbuseReportAnalytics:trace("OnFormCommentUpdated - comment_added: {}", p2.comment_added)
			
			return Dictionary.union(p1, { comment_added = p2.comment_added })
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