local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local renderChallengeModule = require(script.Parent.RenderChallenge)
local _ = require(script.Parent.InitializeHybridCallback)
local parent = genericChallenges.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.LuauPolyfill)

return function(p0) --[[ line: 21 ]]
	-- upvalues: promiseModule (ref), renderChallengeModule (ref)
	return promiseModule.new(function(p1, p2) --[[ line: 22 ]]
		-- upvalues: renderChallengeModule (copy), p0 (ref)
		renderChallengeModule({
			title = p0.title,
			rawResponseHeaders = p0.rawResponseHeaders,
			retryRequestCallback = p0.retryRequestCallback,
			challengeErrorCallback = p0.challengeErrorCallback,
			resolve = p1,
			reject = p2
		})
	end)
end