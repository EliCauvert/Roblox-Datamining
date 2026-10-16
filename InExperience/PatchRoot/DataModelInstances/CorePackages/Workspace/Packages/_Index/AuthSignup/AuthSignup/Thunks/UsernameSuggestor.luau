local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local PostUsernameSuggestionsModule = require(AuthSignup.Requests.PostUsernameSuggestions)
local PromiseModule = require(Parent.Promise)
local StatusCodes = require(Parent.Http).StatusCodes

return {
	suggestUsernames = function(p1, p2, p3, _) --[[ Line: 10 ]]
		-- upvalues: PostUsernameSuggestionsModule (copy), PromiseModule (copy), StatusCodes (copy)
		return PostUsernameSuggestionsModule(p1, p2, p3):andThen(function(Result) --[[ Line: 11 ]]
			-- upvalues: PromiseModule (upval)
			return if Result == nil or Result.responseBody == nil then PromiseModule.reject() else PromiseModule.resolve({
				shouldUpdateState = true,
				didGenerate = Result.responseBody.didGenerateNewUsername,
				suggestions = Result.responseBody.suggestedUsernames
			})
		end, function(p4) --[[ Line: 22 ]]
			-- upvalues: PromiseModule (upval), StatusCodes (upval)
			return PromiseModule.resolve({
				didGenerate = false,
				shouldUpdateState = p4.StatusCode ~= StatusCodes.TOO_MANY_REQUESTS,
				suggestions = {}
			})
		end)
	end
}