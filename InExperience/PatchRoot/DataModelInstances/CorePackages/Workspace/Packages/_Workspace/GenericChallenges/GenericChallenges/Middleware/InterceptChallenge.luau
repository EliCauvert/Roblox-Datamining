local RenderChallengeModule = require(script.Parent.RenderChallenge)
local _ = require(script.Parent.InitializeHybridCallback)
local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)

return function(p1) --[[ Line: 21 ]]
	-- upvalues: PromiseModule (copy), RenderChallengeModule (copy)
	return PromiseModule.new(function(Resolve, Reject) --[[ Line: 22 ]]
		-- upvalues: RenderChallengeModule (upval), p1 (copy)
		RenderChallengeModule({
			title = p1.title,
			rawResponseHeaders = p1.rawResponseHeaders,
			retryRequestCallback = p1.retryRequestCallback,
			challengeErrorCallback = p1.challengeErrorCallback,
			resolve = Resolve,
			reject = Reject
		})
	end)
end