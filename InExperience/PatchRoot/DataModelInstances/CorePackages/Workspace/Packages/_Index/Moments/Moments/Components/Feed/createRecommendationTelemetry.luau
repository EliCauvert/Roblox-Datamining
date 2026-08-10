local moments = script:FindFirstAncestor("Moments")
local _ = require(moments.Parent.Signals)
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

local function _(value, p0) --[[ line: 50 | named "getSignalValue" ]]
	return if value == "AddReaction" or value == "RemoveReaction" then p0.reactionType or "" else ""
end

return function(p1) --[[ line: 57 | named "createRecommendationTelemetry" ]]
	-- upvalues: emitRecommendationImpressionModule (ref), t (ref), emitRecommendationActionModule (ref)
	local getMomentsSessionId = p1.getMomentsSessionId
	local signalTracker = p1.signalTracker
	
	return {
		logView = function(p2, p3) --[[ line: 62 ]]
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
		logAction = function(p4, p5, p6) --[[ line: 76 ]]
			-- upvalues: t (copy), emitRecommendationActionModule (copy), getMomentsSessionId (ref), signalTracker (ref)
			local var5 = t[p4]
			
			if var5 == nil then
				return nil
			end
			local var6 = emitRecommendationActionModule({
				itemId = p5.itemId,
				tracingId = p5.tracingId or "",
				momentsSessionId = getMomentsSessionId(false),
				actionType = var5,
				reactionType = p6.reactionType,
				destinationPlaceId = p6.destinationPlaceId,
				commentText = p6.commentText,
				actionWeight = p6.actionWeight
			})
			
			if signalTracker then
				signalTracker:recordSignal(p5.itemId, p4, if p4 == "AddReaction" or p4 == "RemoveReaction" then p6.reactionType or "" else "")
			end
			return var6
		end
	}
end