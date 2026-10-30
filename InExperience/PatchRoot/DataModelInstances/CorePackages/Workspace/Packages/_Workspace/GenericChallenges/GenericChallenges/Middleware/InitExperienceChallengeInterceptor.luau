local RenderChallengeModule = require(script.Parent.RenderChallenge)
local RenderNativeChallengeModule = require(script.Parent.RenderNativeChallenge)
local FFlagEnableRenderNativeChallengeModule = require(script.Parent.Flags.FFlagEnableRenderNativeChallenge)
local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ChallengeTypeModule = require(GenericChallenges.Types.ChallengeType)
local Base64 = require(GenericChallenges.Parent.AuthCommon).Utils.Base64
local HttpService = game:GetService("HttpService")
local GenericChallengeService = game:GetService("GenericChallengeService")
local FFlagEnableMutexOnGenericChallengeInterceptorMount = game:DefineFastFlag("FFlagEnableMutexOnGenericChallengeInterceptorMount", false)
local Flag = false

function challengeRequiredEventHandler(ChallengeId, ChallengeType, ChallengeMetadata)
	-- upvalues: FFlagEnableRenderNativeChallengeModule (copy), RenderNativeChallengeModule (copy), RenderChallengeModule (copy), ChallengeTypeModule (copy), GenericChallengeService (copy), Base64 (copy), HttpService (copy)
	if FFlagEnableRenderNativeChallengeModule and RenderNativeChallengeModule.canRenderNativeChallenge(ChallengeType) then
		RenderNativeChallengeModule.render({
			challengeId = ChallengeId,
			challengeType = ChallengeType,
			challengeMetadata = ChallengeMetadata
		})
		
		return
	else
		RenderChallengeModule({
			renderWebViewInModal = true,
			challengeType = ChallengeTypeModule.Generic,
			challengeParameters = {
				genericChallengeId = ChallengeId,
				genericChallengeType = ChallengeType,
				genericChallengeMetadata = ChallengeMetadata
			},
			callbacks = {
				OnChallengeLoadFailed = function(_)
					-- upvalues: GenericChallengeService (upval), ChallengeId (copy)
					GenericChallengeService:SignalChallengeLoaded(ChallengeId, false)
				end,
				OnChallengeCompleted = function(p1)
					-- upvalues: Base64 (upval), HttpService (upval), GenericChallengeService (upval), ChallengeId (copy), ChallengeType (copy)
					if p1.data.metadata ~= nil then
						GenericChallengeService:SignalChallengeCompleted(ChallengeId, ChallengeType, (Base64.Encode(HttpService:JSONEncode(p1.data.metadata))))
					end
				end,
				OnChallengeInvalidated = function(_)
					-- upvalues: GenericChallengeService (upval), ChallengeId (copy)
					GenericChallengeService:SignalChallengeInvalidated(ChallengeId)
				end,
				OnChallengeAbandoned = function()
					-- upvalues: GenericChallengeService (upval), ChallengeId (copy)
					GenericChallengeService:SignalChallengeAbandoned(ChallengeId)
				end
			},
			onWebViewOpen = function()
				-- upvalues: GenericChallengeService (upval), ChallengeId (copy)
				GenericChallengeService:SignalChallengeLoaded(ChallengeId, true)
			end
		})
	end
end

return function()
	-- upvalues: FFlagEnableMutexOnGenericChallengeInterceptorMount (copy), Flag (ref), GenericChallengeService (copy)
	if not FFlagEnableMutexOnGenericChallengeInterceptorMount then
		GenericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
	elseif not Flag then
		Flag = true
		GenericChallengeService.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler)
		
		return
	end
end