local Moments = script:FindFirstAncestor("Moments")
local _ = require(Moments.Parent.Signals)
local ConstantsModule = require(Moments.Constants)
local EmitRecommendationImpressionModule = require(Moments.Analytics.emitRecommendationImpression)
local EmitRecommendationActionModule = require(Moments.Analytics.emitRecommendationAction)
local _ = require(Moments.SignalTracker)
local _ = require(script.Parent.FeedTypes)
local config = {
	AddReaction = ConstantsModule.RecommendationActionType.AddReaction,
	RemoveReaction = ConstantsModule.RecommendationActionType.RemoveReaction,
	Share = ConstantsModule.RecommendationActionType.Share,
	Report = ConstantsModule.RecommendationActionType.Report,
	Join = ConstantsModule.RecommendationActionType.Play
}

local function _(p1, p2)
	return (p1 == "AddReaction" or p1 == "RemoveReaction") and p2.reactionType or ""
end

return function(p1)
	-- upvalues: EmitRecommendationImpressionModule (copy), config (copy), EmitRecommendationActionModule (copy)
	local GetMomentsSessionIdFunction = p1.getMomentsSessionId
	local SignalTracker = p1.signalTracker
	
	return {
		logView = function(p2, p3)
			-- upvalues: EmitRecommendationImpressionModule (upval), GetMomentsSessionIdFunction (copy), SignalTracker (copy)
			EmitRecommendationImpressionModule({
				itemId = p2.itemId,
				tracingId = p2.tracingId or "",
				momentsSessionId = GetMomentsSessionIdFunction(false),
				position = p3.itemPosition,
				durationSeconds = p3.durationSeconds
			})
			
			if SignalTracker then
				SignalTracker:recordSignal(p2.itemId, "View", string.format("%.1f", p3.durationSeconds))
			end
		end,
		logAction = function(p2, p3, p4)
			-- upvalues: config (upval), EmitRecommendationActionModule (upval), GetMomentsSessionIdFunction (copy), SignalTracker (copy)
			local Entry = config[p2]
			
			if Entry == nil then
				return nil
			end
			local EmitRecommendationActionModuleResult = EmitRecommendationActionModule({
				itemId = p3.itemId,
				tracingId = p3.tracingId or "",
				momentsSessionId = GetMomentsSessionIdFunction(false),
				actionType = Entry,
				reactionType = p4.reactionType,
				destinationPlaceId = p4.destinationPlaceId,
				commentText = p4.commentText,
				actionWeight = p4.actionWeight
			})
			
			if SignalTracker then
				SignalTracker:recordSignal(p3.itemId, p2, (p2 == "AddReaction" or p2 == "RemoveReaction") and p4.reactionType or "")
			end
			return EmitRecommendationActionModuleResult
		end
	}
end