local RenderChallengeModule = require(script.Parent.RenderChallenge)
local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ChallengeTypeModule = require(GenericChallenges.Types.ChallengeType)
local Base64 = require(GenericChallenges.Parent.AuthCommon).Utils.Base64
local HttpService = game:GetService("HttpService")
local GenericChallengeService = game:GetService("GenericChallengeService")
local FFlagEnableMutexOnGenericChallengeInterceptorMount = game:DefineFastFlag("FFlagEnableMutexOnGenericChallengeInterceptorMount", false)
local Flag = false

function challengeRequiredEventHandler(GenericChallengeId, GenericChallengeType, GenericChallengeMetadata) --[[ Line: 15 ]]
	-- upvalues: RenderChallengeModule (copy), ChallengeTypeModule (copy), GenericChallengeService (copy), Base64 (copy), HttpService (copy)
	RenderChallengeModule({
		renderWebViewInModal = true,
		challengeType = ChallengeTypeModule.Generic,
		challengeParameters = {
			genericChallengeId = GenericChallengeId,
			genericChallengeType = GenericChallengeType,
			genericChallengeMetadata = GenericChallengeMetadata
		},
		callbacks = {
			OnChallengeLoadFailed = function(_) --[[ Line: 24 ]]
				-- upvalues: GenericChallengeService (upval), GenericChallengeId (copy)
				GenericChallengeService:SignalChallengeLoaded(GenericChallengeId, false)
			end,
			OnChallengeCompleted = function(p1) --[[ Line: 29 ]]
				-- upvalues: Base64 (upval), HttpService (upval), GenericChallengeService (upval), GenericChallengeId (copy), GenericChallengeType (copy)
				if p1.data.metadata ~= nil then
					GenericChallengeService:SignalChallengeCompleted(GenericChallengeId, GenericChallengeType, (Base64.Encode(HttpService:JSONEncode(p1.data.metadata))))
				end
			end,
			OnChallengeInvalidated = function(_) --[[ Line: 35 ]]
				-- upvalues: GenericChallengeService (upval), GenericChallengeId (copy)
				GenericChallengeService:SignalChallengeInvalidated(GenericChallengeId)
			end,
			OnChallengeAbandoned = function() --[[ Line: 38 ]]
				-- upvalues: GenericChallengeService (upval), GenericChallengeId (copy)
				GenericChallengeService:SignalChallengeAbandoned(GenericChallengeId)
			end
		},
		onWebViewOpen = function() --[[ Line: 43 ]]
			-- upvalues: GenericChallengeService (upval), GenericChallengeId (copy)
			GenericChallengeService:SignalChallengeLoaded(GenericChallengeId, true)
		end
	})
end

return function() --[[ Line: 49 ]]
	-- upvalues: FFlagEnableMutexOnGenericChallengeInterceptorMount (copy), Flag (ref), GenericChallengeService (copy)
	if not FFlagEnableMutexOnGenericChallengeInterceptorMount then
		GenericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
	elseif not Flag then
		Flag = true
		GenericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
		
		return
	end
end