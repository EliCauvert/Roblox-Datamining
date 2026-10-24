local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local Analytics = require(Parent.MomentsCommon).Analytics
local ConstantsModule = require(Moments.Constants)
local EmitRecommendationImpressionModule = require(Moments.Analytics.emitRecommendationImpression)
local EmitRecommendationActionModule = require(Moments.Analytics.emitRecommendationAction)
local _ = require(Moments.SignalTracker)
local _ = require(script.Parent.FeedTypes)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments
local config = {
	AddReaction = ConstantsModule.RecommendationActionType.AddReaction,
	RemoveReaction = ConstantsModule.RecommendationActionType.RemoveReaction,
	Share = ConstantsModule.RecommendationActionType.Share,
	Report = ConstantsModule.RecommendationActionType.Report,
	Join = ConstantsModule.RecommendationActionType.Play,
	Comment = if FFlagMomentsComments then ConstantsModule.RecommendationActionType.Comment else nil,
	CommentDelete = if FFlagMomentsComments then ConstantsModule.RecommendationActionType.CommentDelete else nil,
	CommentSectionOpen = if FFlagMomentsComments then ConstantsModule.RecommendationActionType.CommentSectionOpen else nil
}
local config1 = { AddFollow = true, RemoveFollow = true }
local config2 = {
	AddReaction = "reaction_add",
	RemoveReaction = "reaction_remove",
	Share = "share",
	Report = "report",
	Join = "join"
}

local function _(p1, p2)
	return (p1 == "AddReaction" or p1 == "RemoveReaction") and p2.reactionType or ""
end

return function(p1)
	-- upvalues: EmitRecommendationImpressionModule (copy), config (copy), config1 (copy), config2 (copy), Analytics (copy), EmitRecommendationActionModule (copy), FFlagMomentsComments (copy)
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
			-- upvalues: config (upval), SignalTracker (copy), config1 (upval), config2 (upval), Analytics (upval), EmitRecommendationActionModule (upval), FFlagMomentsComments (upval), GetMomentsSessionIdFunction (copy)
			local Entry = config[p2]
			
			if Entry == nil then
				if SignalTracker and config1[p2] then
					SignalTracker:recordSignal(p3.itemId, p2, (p2 == "AddReaction" or p2 == "RemoveReaction") and p4.reactionType or "")
				end
				return nil
			else
				local Entry1 = config2[p2]
				
				if Entry1 ~= nil then
					Analytics.reportMomentsEngagement(Entry1)
				end
				local EmitRecommendationActionModuleResult = EmitRecommendationActionModule({
					itemId = p3.itemId,
					tracingId = p3.tracingId or "",
					momentsSessionId = if FFlagMomentsComments and p4.momentsSessionId ~= nil then p4.momentsSessionId else GetMomentsSessionIdFunction(false),
					actionType = Entry,
					reactionType = p4.reactionType,
					destinationPlaceId = p4.destinationPlaceId,
					commentText = p4.commentText,
					actionWeight = p4.actionWeight,
					commentSectionOpenDurationSeconds = if FFlagMomentsComments then p4.commentSectionOpenDurationSeconds else nil
				})
				
				if SignalTracker then
					SignalTracker:recordSignal(p3.itemId, p2, (p2 == "AddReaction" or p2 == "RemoveReaction") and p4.reactionType or "")
				end
				return EmitRecommendationActionModuleResult
			end
		end
	}
end