local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local postUsernameSuggestionsModule = require(authSignup.Requests.PostUsernameSuggestions)
local promiseModule = require(parent.Promise)
local statusCodes = require(parent.Http).StatusCodes

return {
	suggestUsernames = function(p1, p2, p3, _)
		-- upvalues: postUsernameSuggestionsModule (ref), promiseModule (ref), statusCodes (ref)
		return postUsernameSuggestionsModule(p1, p2, p3):andThen(function(p4)
			-- upvalues: promiseModule (copy)
			return if p4 == nil or p4.responseBody == nil then promiseModule.reject() else promiseModule.resolve({
				shouldUpdateState = true,
				didGenerate = p4.responseBody.didGenerateNewUsername,
				suggestions = p4.responseBody.suggestedUsernames
			})
		end, function(p4)
			-- upvalues: promiseModule (copy), statusCodes (copy)
			return promiseModule.resolve({
				didGenerate = false,
				shouldUpdateState = p4.StatusCode ~= statusCodes.TOO_MANY_REQUESTS,
				suggestions = {}
			})
		end)
	end
}