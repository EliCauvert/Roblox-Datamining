local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local buildHybridCallbackModule = require(script.Parent.BuildHybridCallback)
local _ = require(script.Parent.ChallengeWebView)
local challengeErrorModule = require(script.Parent.ChallengeError)
local completionDataToRawHeadersModule = require(genericChallenges.Utils.completionDataToRawHeaders)
local _ = require(genericChallenges.Parent.LuauPolyfill)
local errorKindModule = require(genericChallenges.Types.ErrorKind)
local buildCredentialsProtocolHookModule = require(script.Parent.Hooks.BuildCredentialsProtocolHook)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: buildHybridCallbackModule (ref), buildCredentialsProtocolHookModule (ref), challengeErrorModule (ref), errorKindModule (ref), completionDataToRawHeadersModule (ref)
	return buildHybridCallbackModule({
		Hooks = { buildCredentialsProtocolHookModule() },
		OnChallengeLoadFailed = function(_)
			-- upvalues: p5 (ref), p7 (ref), challengeErrorModule (copy), errorKindModule (copy), p2 (ref), p3 (ref)
			if p5 ~= nil then
				p5()
			end
			p7(challengeErrorModule.new(errorKindModule.LoadFailed, { challengeType = p2 }))
			p3:close()
		end,
		OnChallengeInvalidated = function(p8)
			-- upvalues: p5 (ref), p7 (ref), challengeErrorModule (copy), errorKindModule (copy), p3 (ref)
			if p5 ~= nil and p8.data ~= nil then
				p5(p8.data)
			end
			p7(challengeErrorModule.new(errorKindModule.Invalidated, p8.data))
			p3:close()
		end,
		OnChallengeDisplayed = function(_)
			-- upvalues: p3 (ref)
			p3:setVisible(true)
		end,
		OnChallengeCompleted = function(p8)
			-- upvalues: p6 (ref), p4 (ref), completionDataToRawHeadersModule (copy), p1 (ref), p3 (ref)
			if p8.data ~= nil and p8.data.challengeType ~= nil and p8.data.metadata ~= nil then
				p6(p4(completionDataToRawHeadersModule({
					challengeId = p1,
					challengeType = p8.data.challengeType,
					metadata = p8.data.metadata
				})))
			end
			p3:close()
		end
	})
end