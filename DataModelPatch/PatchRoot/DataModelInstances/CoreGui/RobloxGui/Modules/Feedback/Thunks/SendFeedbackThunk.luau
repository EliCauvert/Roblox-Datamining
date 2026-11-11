local CorePackages = game:GetService("CorePackages")
local Promise = require(CorePackages.Packages.InGameMenuDependencies).Promise
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local PostFeedbackModule = require(Parent.Network.PostFeedback)
local IncrementFeedbackSubmissionAttemptsModule = require(Parent.Actions.IncrementFeedbackSubmissionAttempts)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: PerformFetch (copy), PostFeedbackModule (copy), IncrementFeedbackSubmissionAttemptsModule (copy), Promise (copy)
	return PerformFetch.Single("PostFeedbackRequest", function(p8)
		-- upvalues: PostFeedbackModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), IncrementFeedbackSubmissionAttemptsModule (upval), p7 (copy), Promise (upval)
		return PostFeedbackModule(p1, p2, p3, p4, p5, p6):andThen(function(Result)
			-- upvalues: p8 (copy), IncrementFeedbackSubmissionAttemptsModule (upval), p7 (upval), Promise (upval)
			p8:dispatch(IncrementFeedbackSubmissionAttemptsModule(p7))
			
			return Promise.resolve(Result)
		end, function(p9)
			-- upvalues: Promise (upval)
			return Promise.reject(p9)
		end)
	end)
end