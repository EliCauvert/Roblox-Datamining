local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local momentsCommonModule = require(parent.MomentsCommon)
local analytics = momentsCommonModule.Analytics
local fFlagMomentsRealtimeSessionTelemetry = momentsCommonModule.Flags.FFlagMomentsRealtimeSessionTelemetry
local constantsModule = require(moments.Constants)
local emitRecommendationImpressionModule = require(moments.Analytics.emitRecommendationImpression)
local emitRecommendationActionModule = require(moments.Analytics.emitRecommendationAction)
local _ = require(moments.SignalTracker)
local _ = require(script.Parent.FeedTypes)
local t = {
	AddReaction = constantsModule.RecommendationActionType.AddReaction,
	RemoveReaction = constantsModule.RecommendationActionType.RemoveReaction,
	Share = constantsModule.RecommendationActionType.Share,
	Report = constantsModule.RecommendationActionType.Report,
	Join = constantsModule.RecommendationActionType.Play
}
local t_1 = {
	AddReaction = "reaction_add",
	RemoveReaction = "reaction_remove",
	Share = "share",
	Report = "report",
	Join = "join"
}

local function _(value, p1)
	return if value == "AddReaction" or value == "RemoveReaction" then p1.reactionType or "" else ""
end

return function(p1)
	-- upvalues: emitRecommendationImpressionModule (ref), t (ref), fFlagMomentsRealtimeSessionTelemetry (ref), t_1 (ref), analytics (ref), emitRecommendationActionModule (ref)
	local getMomentsSessionId = p1.getMomentsSessionId
	local signalTracker = p1.signalTracker
	
	return {
		logView = function(p2, p3)
			-- upvalues: emitRecommendationImpressionModule (copy), getMomentsSessionId (ref), signalTracker (ref)
			emitRecommendationImpressionModule({
				itemId = p2.itemId,
				tracingId = p2.tracingId or "",
				momentsSessionId = getMomentsSessionId(false),
				position = p3.itemPosition,
				durationSeconds = p3.durationSeconds
			})
			
			if signalTracker then
				signalTracker:recordSignal(p2.itemId, "View", string.format("%.1f", p3.durationSeconds))
			end
		end,
		logAction = function(p2, p3, p4)
			-- upvalues: t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), t_1 (copy), analytics (copy), emitRecommendationActionModule (copy), getMomentsSessionId (ref), signalTracker (ref)
			local var1 = t[p2]
			
			if var1 == nil then
				return nil
			elseif fFlagMomentsRealtimeSessionTelemetry then
				local var2 = t_1[p2]
				
				if var2 ~= nil then
					analytics.reportMomentsEngagement(var2)
				end
			end
			local var3 = emitRecommendationActionModule({
				itemId = p3.itemId,
				tracingId = p3.tracingId or "",
				momentsSessionId = getMomentsSessionId(false),
				actionType = var1,
				reactionType = p4.reactionType,
				destinationPlaceId = p4.destinationPlaceId,
				commentText = p4.commentText,
				actionWeight = p4.actionWeight
			})
			
			if signalTracker then
				signalTracker:recordSignal(p3.itemId, p2, if p2 == "AddReaction" or p2 == "RemoveReaction" then p4.reactionType or "" else "")
			end
			return var3
		end
	}
end