local renderChallengeModule = require(script.Parent.RenderChallenge)
local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local challengeTypeModule = require(genericChallenges.Types.ChallengeType)
local base64 = require(genericChallenges.Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")
local genericChallengeService = game:GetService("GenericChallengeService")
local fFlagEnableMutexOnGenericChallengeInterceptorMount = game:DefineFastFlag("FFlagEnableMutexOnGenericChallengeInterceptorMount", false)
local var6 = false

function challengeRequiredEventHandler(p0, p1, p2) --[[ line: 15 ]]
	-- upvalues: renderChallengeModule (ref), challengeTypeModule (ref), genericChallengeService (ref), base64 (ref), httpService (ref)
	renderChallengeModule({
		renderWebViewInModal = true,
		challengeType = challengeTypeModule.Generic,
		challengeParameters = {
			genericChallengeId = p0,
			genericChallengeType = p1,
			genericChallengeMetadata = p2
		},
		callbacks = {
			OnChallengeLoadFailed = function(_) --[[ line: 24 ]]
				-- upvalues: genericChallengeService (copy), p0 (ref)
				genericChallengeService:SignalChallengeLoaded(p0, false)
			end,
			OnChallengeCompleted = function(p3) --[[ line: 29 ]]
				-- upvalues: base64 (copy), httpService (copy), genericChallengeService (copy), p0 (ref), p1 (ref)
				if p3.data.metadata ~= nil then
					genericChallengeService:SignalChallengeCompleted(p0, p1, base64.Encode(httpService:JSONEncode(p3.data.metadata)))
				end
			end,
			OnChallengeInvalidated = function(_) --[[ line: 35 ]]
				-- upvalues: genericChallengeService (copy), p0 (ref)
				genericChallengeService:SignalChallengeInvalidated(p0)
			end,
			OnChallengeAbandoned = function() --[[ line: 38 ]]
				-- upvalues: genericChallengeService (copy), p0 (ref)
				genericChallengeService:SignalChallengeAbandoned(p0)
			end
		},
		onWebViewOpen = function() --[[ line: 43 ]]
			-- upvalues: genericChallengeService (copy), p0 (ref)
			genericChallengeService:SignalChallengeLoaded(p0, true)
		end
	})
end

return function() --[[ line: 49 ]]
	-- upvalues: fFlagEnableMutexOnGenericChallengeInterceptorMount (ref), var6 (write), genericChallengeService (ref)
	if fFlagEnableMutexOnGenericChallengeInterceptorMount then
		if var6 then
			return
		else
			var6 = true
			genericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
			
			return
		end
	else
		genericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
	end
end