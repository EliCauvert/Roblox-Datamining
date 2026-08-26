local renderChallengeModule = require(script.Parent.RenderChallenge)
local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local challengeTypeModule = require(genericChallenges.Types.ChallengeType)
local base64 = require(genericChallenges.Parent.AuthCommon).Utils.Base64
local httpService = game:GetService("HttpService")
local genericChallengeService = game:GetService("GenericChallengeService")
local fFlagEnableMutexOnGenericChallengeInterceptorMount = game:DefineFastFlag("FFlagEnableMutexOnGenericChallengeInterceptorMount", false)
local var1 = false

function challengeRequiredEventHandler(p1, p2, p3)
	-- upvalues: renderChallengeModule (ref), challengeTypeModule (ref), genericChallengeService (ref), base64 (ref), httpService (ref)
	renderChallengeModule({
		renderWebViewInModal = true,
		challengeType = challengeTypeModule.Generic,
		challengeParameters = {
			genericChallengeId = p1,
			genericChallengeType = p2,
			genericChallengeMetadata = p3
		},
		callbacks = {
			OnChallengeLoadFailed = function(_)
				-- upvalues: genericChallengeService (copy), p1 (ref)
				genericChallengeService:SignalChallengeLoaded(p1, false)
			end,
			OnChallengeCompleted = function(p4)
				-- upvalues: base64 (copy), httpService (copy), genericChallengeService (copy), p1 (ref), p2 (ref)
				if p4.data.metadata ~= nil then
					genericChallengeService:SignalChallengeCompleted(p1, p2, base64.Encode(httpService:JSONEncode(p4.data.metadata)))
				end
			end,
			OnChallengeInvalidated = function(_)
				-- upvalues: genericChallengeService (copy), p1 (ref)
				genericChallengeService:SignalChallengeInvalidated(p1)
			end,
			OnChallengeAbandoned = function()
				-- upvalues: genericChallengeService (copy), p1 (ref)
				genericChallengeService:SignalChallengeAbandoned(p1)
			end
		},
		onWebViewOpen = function()
			-- upvalues: genericChallengeService (copy), p1 (ref)
			genericChallengeService:SignalChallengeLoaded(p1, true)
		end
	})
end

return function()
	-- upvalues: fFlagEnableMutexOnGenericChallengeInterceptorMount (ref), var1 (write), genericChallengeService (ref)
	if fFlagEnableMutexOnGenericChallengeInterceptorMount then
		if var1 then
			return
		else
			var1 = true
			genericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
			
			return
		end
	else
		genericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
	end
end