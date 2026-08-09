local corePackagesService = game:GetService("CorePackages")
local promise = require(corePackagesService.Packages.InGameMenuDependencies).Promise
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local postFeedbackModule = require(parent.Network.PostFeedback)
local incrementFeedbackSubmissionAttemptsModule = require(parent.Actions.IncrementFeedbackSubmissionAttempts)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 17 ]]
	-- upvalues: performFetch (ref), postFeedbackModule (ref), incrementFeedbackSubmissionAttemptsModule (ref), promise (ref)
	return performFetch.Single("PostFeedbackRequest", function(p7) --[[ line: 27 ]]
		-- upvalues: postFeedbackModule (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p6 (ref), promise (copy)
		return postFeedbackModule(p0, p1, p2, p3, p4, p5):andThen(function(p8) --[[ line: 35 ]]
			-- upvalues: p7 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p6 (copy), promise (copy)
			p7:dispatch(incrementFeedbackSubmissionAttemptsModule(p6))
			
			return promise.resolve(p8)
		end, function(p9) --[[ line: 38 ]]
			-- upvalues: promise (copy)
			return promise.reject(p9)
		end)
	end)
end