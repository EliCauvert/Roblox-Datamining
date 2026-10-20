local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local BuildHybridCallbackModule = require(script.Parent.BuildHybridCallback)
local _ = require(script.Parent.ChallengeWebView)
local ChallengeErrorModule = require(script.Parent.ChallengeError)
local CompletionDataToRawHeadersModule = require(GenericChallenges.Utils.completionDataToRawHeaders)
local _ = require(GenericChallenges.Parent.LuauPolyfill)
local ErrorKindModule = require(GenericChallenges.Types.ErrorKind)
local BuildCredentialsProtocolHookModule = require(script.Parent.Hooks.BuildCredentialsProtocolHook)

return function(ChallengeId, ChallengeType, p1, Callback3, Callback, Callback2, Callback1)
	-- upvalues: BuildHybridCallbackModule (copy), BuildCredentialsProtocolHookModule (copy), ChallengeErrorModule (copy), ErrorKindModule (copy), CompletionDataToRawHeadersModule (copy)
	return BuildHybridCallbackModule({
		Hooks = { BuildCredentialsProtocolHookModule() },
		OnChallengeLoadFailed = function(_)
			-- upvalues: Callback (copy), Callback1 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), ChallengeType (copy), p1 (copy)
			if Callback ~= nil then
				Callback()
			end
			Callback1(ChallengeErrorModule.new(ErrorKindModule.LoadFailed, { challengeType = ChallengeType }))
			p1:close()
		end,
		OnChallengeInvalidated = function(p2)
			-- upvalues: Callback (copy), Callback1 (copy), ChallengeErrorModule (upval), ErrorKindModule (upval), p1 (copy)
			if Callback ~= nil and p2.data ~= nil then
				Callback(p2.data)
			end
			Callback1(ChallengeErrorModule.new(ErrorKindModule.Invalidated, p2.data))
			p1:close()
		end,
		OnChallengeDisplayed = function(_)
			-- upvalues: p1 (copy)
			p1:setVisible(true)
		end,
		OnChallengeCompleted = function(p2)
			-- upvalues: Callback2 (copy), Callback3 (copy), CompletionDataToRawHeadersModule (upval), ChallengeId (copy), p1 (copy)
			if p2.data ~= nil and p2.data.challengeType ~= nil and p2.data.metadata ~= nil then
				Callback2(Callback3(CompletionDataToRawHeadersModule({
					challengeId = ChallengeId,
					challengeType = p2.data.challengeType,
					metadata = p2.data.metadata
				})))
			end
			p1:close()
		end
	})
end