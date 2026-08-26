local corePackagesService = game:GetService("CorePackages")
local promise = require(corePackagesService.Packages.InGameMenuDependencies).Promise
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local postFeedbackModule = require(parent.Network.PostFeedback)
local incrementFeedbackSubmissionAttemptsModule = require(parent.Actions.IncrementFeedbackSubmissionAttempts)

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: performFetch (ref), postFeedbackModule (ref), incrementFeedbackSubmissionAttemptsModule (ref), promise (ref)
	return performFetch.Single("PostFeedbackRequest", function(p9)
		-- upvalues: postFeedbackModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p8 (ref), promise (copy)
		return postFeedbackModule(p1, p2, p3, p4, p5, p6, p7):andThen(function(p10)
			-- upvalues: p9 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p8 (copy), promise (copy)
			p9:dispatch(incrementFeedbackSubmissionAttemptsModule(p8))
			
			return promise.resolve(p10)
		end, function(p10)
			-- upvalues: promise (copy)
			return promise.reject(p10)
		end)
	end)
end