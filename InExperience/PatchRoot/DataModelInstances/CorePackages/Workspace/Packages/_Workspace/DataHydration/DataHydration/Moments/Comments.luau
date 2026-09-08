return {
	CommentFixtures = require(script.CommentFixtures),
	MockCommentsPages = require(script.MockCommentsPages),
	createCommentsMockNetwork = require(script.createCommentsMockNetwork),
	resolveCommentsNetwork = require(script.resolveCommentsNetwork),
	createMomentsCommentsStore = require(script.Parent.createMomentsCommentsStore),
	fetchMomentComments = require(script.Parent.Requests.fetchMomentComments),
	postMomentComment = require(script.Parent.Requests.postMomentComment),
	deleteMomentComment = require(script.Parent.Requests.deleteMomentComment),
	extractCommentsFromPage = require(script.Parent.Util.extractCommentsFromPage),
	parseCommentsError = require(script.Parent.Util.parseCommentsError)
}