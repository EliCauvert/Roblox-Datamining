local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommentsModule = require(parent.DataHydration.MomentsComments)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsGetMomentsReactionsStoreModule = require(parent.DataHydration.MomentsGetMomentsReactionsStore)
local signalsModule = require(parent.Signals)
local getCommentCollectionStoreModule = require(moments.Components.Comments.GetCommentCollectionStore)
local getCommentSessionFiltersStoreModule = require(moments.Components.Comments.GetCommentSessionFiltersStore)
local getCommentReactionsStoreModule = require(moments.Stores.GetCommentReactionsStore)
local createCommentsListCoordinatorModule = require(script.Parent.createCommentsListCoordinator)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments

local function getCommentPostedCallback(p1, p2)
	local recommendationSession = require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getRecommendationSession(p1, p2)
	
	return if recommendationSession == nil then nil else recommendationSession.logComment
end

local function getCommentDeletedCallback(p1, p2)
	local recommendationSession = require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getRecommendationSession(p1, p2)
	
	return if recommendationSession == nil then nil else recommendationSession.logCommentDelete
end

return signalsModule.createComputed(function(_)
	-- upvalues: momentsGetMomentsCommentsStoreModule (ref), createCommentsListCoordinatorModule (ref), getCommentCollectionStoreModule (ref), fFlagMomentsComments (ref), getCommentReactionsStoreModule (ref), momentsGetMomentsReactionsStoreModule (ref), getCommentSessionFiltersStoreModule (ref), momentsCommentsModule (ref), getCommentPostedCallback (ref), getCommentDeletedCallback (ref)
	return createCommentsListCoordinatorModule({
		collectionStore = getCommentCollectionStoreModule(false),
		commentsStore = momentsGetMomentsCommentsStoreModule(false),
		reactionStore = if fFlagMomentsComments then getCommentReactionsStoreModule(false) else nil,
		catalogStore = if fFlagMomentsComments then momentsGetMomentsReactionsStoreModule(false) else nil,
		sessionFilters = getCommentSessionFiltersStoreModule(false),
		network = momentsCommentsModule.resolveCommentsNetwork(nil),
		getCommentPostedCallback = if fFlagMomentsComments then getCommentPostedCallback else nil,
		getAnalyticsSession = if fFlagMomentsComments then function(p1, p2)
			return require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getAnalyticsSession(p1, p2)
		end else nil,
		getCommentDeletedCallback = if fFlagMomentsComments then getCommentDeletedCallback else nil
	})
end)