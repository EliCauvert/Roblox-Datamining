local corePackagesService = game:GetService("CorePackages")
local promise = require(corePackagesService.Packages.InGameMenuDependencies).Promise
local performFetch = require(corePackagesService.Workspace.Packages.Http).PerformFetch
local parent = script.Parent.Parent
local postFeedbackModule = require(parent.Network.PostFeedback)
local incrementFeedbackSubmissionAttemptsModule = require(parent.Actions.IncrementFeedbackSubmissionAttempts)

return function(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 17 ]]
	-- upvalues: performFetch (ref), postFeedbackModule (ref), incrementFeedbackSubmissionAttemptsModule (ref), promise (ref)
	return performFetch.Single("PostFeedbackRequest", function(p8) --[[ line: 28 ]]
		-- upvalues: postFeedbackModule (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p7 (ref), promise (copy)
		return postFeedbackModule(p0, p1, p2, p3, p4, p5, p6):andThen(function(p9) --[[ line: 37 ]]
			-- upvalues: p8 (ref), incrementFeedbackSubmissionAttemptsModule (copy), p7 (copy), promise (copy)
			p8:dispatch(incrementFeedbackSubmissionAttemptsModule(p7))
			
			return promise.resolve(p9)
		end, function(p10) --[[ line: 40 ]]
			-- upvalues: promise (copy)
			return promise.reject(p10)
		end)
	end)
end