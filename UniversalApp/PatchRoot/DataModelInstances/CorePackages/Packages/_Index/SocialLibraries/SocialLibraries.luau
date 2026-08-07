local UIBloxModule = require(script.Parent.UIBlox)

return {
	config = function(p0) --[[ line: 5 ]]
		-- upvalues: UIBloxModule (ref)
		if p0.UIBloxConfig then
			UIBloxModule.init(p0.UIBloxConfig)
		end
		return {
			Analytics = require(script.Analytics),
			Components = require(script.Components),
			Conversation = require(script.Conversation),
			Dictionary = require(script.Dictionary),
			User = require(script.User),
			Utils = require(script.Utils),
			RoactLayout = require(script.RoactLayout),
			RoactPaginator = require(script.RoactPaginator),
			RoduxTools = require(script.RoduxTools),
			populate = require(script.populate),
			TestingAnalytics = require(script.TestingAnalytics),
			ReleaseHelpers = require(script.ReleaseHelpers),
			Flags = require(script.Flags),
			StoryMiddleware = require(script.StoryMiddleware),
			Context = require(script.Context)
		}
	end
}