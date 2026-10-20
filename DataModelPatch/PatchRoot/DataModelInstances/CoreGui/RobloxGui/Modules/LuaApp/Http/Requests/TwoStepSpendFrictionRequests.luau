local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return {
	status = function(Callback)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%sv2/spend-friction/two-step-verification/status", UrlModule.ECONOMY_URL), "GET")
	end,
	generate = function(Callback)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%sv2/spend-friction/two-step-verification/generate", UrlModule.ECONOMY_URL), "POST", { postBody = "", maxRetryCount = 0 })
	end,
	redeem = function(Callback, ChallengeToken, VerificationToken)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%sv2/spend-friction/two-step-verification/redeem", UrlModule.ECONOMY_URL), "POST", {
			maxRetryCount = 0,
			postBody = HttpService:JSONEncode({
				challengeToken = ChallengeToken,
				verificationToken = VerificationToken
			})
		})
	end
}