return {
	resolveCommentsNetwork = require(script.resolveCommentsNetwork),
	createMomentsCommentsStore = require(script.Parent.createMomentsCommentsStore),
	fetchMomentComments = require(script.Parent.Requests.fetchMomentComments),
	postMomentComment = require(script.Parent.Requests.postMomentComment),
	deleteMomentComment = require(script.Parent.Requests.deleteMomentComment),
	putMomentCommentReaction = require(script.Parent.Requests.putMomentCommentReaction),
	deleteMomentCommentReaction = require(script.Parent.Requests.deleteMomentCommentReaction),
	extractCommentsFromPage = require(script.Parent.Util.extractCommentsFromPage),
	parseCommentsError = require(script.Parent.Util.parseCommentsError)
}