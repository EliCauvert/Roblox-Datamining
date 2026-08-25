local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local buildHybridCallbackModule = require(script.Parent.BuildHybridCallback)
local _ = require(script.Parent.ChallengeWebView)
local challengeErrorModule = require(script.Parent.ChallengeError)
local completionDataToRawHeadersModule = require(genericChallenges.Utils.completionDataToRawHeaders)
local _ = require(genericChallenges.Parent.LuauPolyfill)
local errorKindModule = require(genericChallenges.Types.ErrorKind)
local buildCredentialsProtocolHookModule = require(script.Parent.Hooks.BuildCredentialsProtocolHook)

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: buildHybridCallbackModule (ref), buildCredentialsProtocolHookModule (ref), challengeErrorModule (ref), errorKindModule (ref), completionDataToRawHeadersModule (ref)
	return buildHybridCallbackModule({
		Hooks = { buildCredentialsProtocolHookModule() },
		OnChallengeLoadFailed = function(_)
			-- upvalues: p4 (ref), p6 (ref), challengeErrorModule (copy), errorKindModule (copy), p1 (ref), p2 (ref)
			if p4 ~= nil then
				p4()
			end
			p6(challengeErrorModule.new(errorKindModule.LoadFailed, { challengeType = p1 }))
			p2:close()
		end,
		OnChallengeInvalidated = function(p7)
			-- upvalues: p4 (ref), p6 (ref), challengeErrorModule (copy), errorKindModule (copy), p2 (ref)
			if p4 ~= nil and p7.data ~= nil then
				p4(p7.data)
			end
			p6(challengeErrorModule.new(errorKindModule.Invalidated, p7.data))
			p2:close()
		end,
		OnChallengeCompleted = function(p8)
			-- upvalues: p5 (ref), p3 (ref), completionDataToRawHeadersModule (copy), p0 (ref), p2 (ref)
			if p8.data ~= nil and p8.data.challengeType ~= nil and p8.data.metadata ~= nil then
				p5(p3(completionDataToRawHeadersModule({
					challengeId = p0,
					challengeType = p8.data.challengeType,
					metadata = p8.data.metadata
				})))
			end
			p2:close()
		end
	})
end