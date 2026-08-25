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

local function _(value, p0)
	return if value == "AddReaction" or value == "RemoveReaction" then p0.reactionType or "" else ""
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
		logAction = function(p4, p5, p6)
			-- upvalues: t (copy), fFlagMomentsRealtimeSessionTelemetry (copy), t_1 (copy), analytics (copy), emitRecommendationActionModule (copy), getMomentsSessionId (ref), signalTracker (ref)
			local var7 = t[p4]
			
			if var7 == nil then
				return nil
			elseif fFlagMomentsRealtimeSessionTelemetry then
				local var8 = t_1[p4]
				
				if var8 ~= nil then
					analytics.reportMomentsEngagement(var8)
				end
			end
			local var9 = emitRecommendationActionModule({
				itemId = p5.itemId,
				tracingId = p5.tracingId or "",
				momentsSessionId = getMomentsSessionId(false),
				actionType = var7,
				reactionType = p6.reactionType,
				destinationPlaceId = p6.destinationPlaceId,
				commentText = p6.commentText,
				actionWeight = p6.actionWeight
			})
			
			if signalTracker then
				signalTracker:recordSignal(p5.itemId, p4, if p4 == "AddReaction" or p4 == "RemoveReaction" then p6.reactionType or "" else "")
			end
			return var9
		end
	}
end