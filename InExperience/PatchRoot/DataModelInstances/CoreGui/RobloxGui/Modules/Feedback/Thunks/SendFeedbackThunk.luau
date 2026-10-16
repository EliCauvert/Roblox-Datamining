local CorePackages = game:GetService("CorePackages")
local Promise = require(CorePackages.Packages.InGameMenuDependencies).Promise
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local Parent = script.Parent.Parent
local PostFeedbackModule = require(Parent.Network.PostFeedback)
local IncrementFeedbackSubmissionAttemptsModule = require(Parent.Actions.IncrementFeedbackSubmissionAttempts)

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ Line: 17 ]]
	-- upvalues: PerformFetch (copy), PostFeedbackModule (copy), IncrementFeedbackSubmissionAttemptsModule (copy), Promise (copy)
	return PerformFetch.Single("PostFeedbackRequest", function(p9) --[[ Line: 28 ]]
		-- upvalues: PostFeedbackModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), IncrementFeedbackSubmissionAttemptsModule (upval), p8 (copy), Promise (upval)
		return PostFeedbackModule(p1, p2, p3, p4, p5, p6, p7):andThen(function(Result) --[[ Line: 37 ]]
			-- upvalues: p9 (copy), IncrementFeedbackSubmissionAttemptsModule (upval), p8 (upval), Promise (upval)
			p9:dispatch(IncrementFeedbackSubmissionAttemptsModule(p8))
			
			return Promise.resolve(Result)
		end, function(p10) --[[ Line: 40 ]]
			-- upvalues: Promise (upval)
			return Promise.reject(p10)
		end)
	end)
end