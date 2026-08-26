local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local renderChallengeModule = require(script.Parent.RenderChallenge)
local _ = require(script.Parent.InitializeHybridCallback)
local parent = genericChallenges.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)

return function(p1)
	-- upvalues: promiseModule (ref), renderChallengeModule (ref)
	return promiseModule.new(function(p2, p3)
		-- upvalues: renderChallengeModule (copy), p1 (ref)
		renderChallengeModule({
			title = p1.title,
			rawResponseHeaders = p1.rawResponseHeaders,
			retryRequestCallback = p1.retryRequestCallback,
			challengeErrorCallback = p1.challengeErrorCallback,
			resolve = p2,
			reject = p3
		})
	end)
end