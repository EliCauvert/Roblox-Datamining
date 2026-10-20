local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommentsModule = require(Parent.DataHydration.MomentsComments)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local MomentsGetMomentsReactionsStoreModule = require(Parent.DataHydration.MomentsGetMomentsReactionsStore)
local GetCommentCollectionStoreModule = require(Moments.Components.Comments.GetCommentCollectionStore)
local GetCommentSessionFiltersStoreModule = require(Moments.Components.Comments.GetCommentSessionFiltersStore)
local GetCommentReactionsStoreModule = require(Moments.Stores.GetCommentReactionsStore)
local CreateCommentsListCoordinatorModule = require(script.Parent.createCommentsListCoordinator)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments

local function getCommentPostedCallback(p1, p2)
	local RecommendationSession = require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getRecommendationSession(p1, p2)
	
	return if RecommendationSession == nil then nil else RecommendationSession.logComment
end

local function getCommentDeletedCallback(p1, p2)
	local RecommendationSession = require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getRecommendationSession(p1, p2)
	
	return if RecommendationSession == nil then nil else RecommendationSession.logCommentDelete
end

return require(Parent.Signals).createComputed(function(_)
	-- upvalues: MomentsGetMomentsCommentsStoreModule (copy), CreateCommentsListCoordinatorModule (copy), GetCommentCollectionStoreModule (copy), FFlagMomentsComments (copy), GetCommentReactionsStoreModule (copy), MomentsGetMomentsReactionsStoreModule (copy), GetCommentSessionFiltersStoreModule (copy), MomentsCommentsModule (copy), getCommentPostedCallback (copy), getCommentDeletedCallback (copy)
	return CreateCommentsListCoordinatorModule({
		collectionStore = GetCommentCollectionStoreModule(false),
		commentsStore = MomentsGetMomentsCommentsStoreModule(false),
		reactionStore = if FFlagMomentsComments then GetCommentReactionsStoreModule(false) else nil,
		catalogStore = if FFlagMomentsComments then MomentsGetMomentsReactionsStoreModule(false) else nil,
		sessionFilters = GetCommentSessionFiltersStoreModule(false),
		network = MomentsCommentsModule.resolveCommentsNetwork(nil),
		getCommentPostedCallback = if FFlagMomentsComments then getCommentPostedCallback else nil,
		getAnalyticsSession = if FFlagMomentsComments then function(p1, p2)
			return require(script.Parent.Parent.Sheet.getCommentsSheetStore)(false).getAnalyticsSession(p1, p2)
		end else nil,
		getCommentDeletedCallback = if FFlagMomentsComments then getCommentDeletedCallback else nil
	})
end)