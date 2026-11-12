local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local GenericTypeModule = require(GenericChallenges.Types.GenericType)
local MountRoCaptchaChallengeModule = require(script.Parent.Challenges.RoCaptcha.mountRoCaptchaChallenge)
local MountDeniedChallengeModule = require(script.Parent.Challenges.Denied.mountDeniedChallenge)
local DeniedMetadataModule = require(script.Parent.Challenges.Denied.DeniedMetadata)
local _ = require(GenericChallenges.Types.ChallengeMetadata)
local FFlagEnableRoCaptchaChallengeModule = require(script.Parent.Flags.FFlagEnableRoCaptchaChallenge)
local FFlagEnableDeniedChallengeModule = require(script.Parent.Flags.FFlagEnableDeniedChallenge)
local GenericChallengeService = game:GetService("GenericChallengeService")

return {
	canRenderNativeChallenge = function(RawValue): boolean
		-- upvalues: FFlagEnableRoCaptchaChallengeModule (copy), GenericTypeModule (copy), FFlagEnableDeniedChallengeModule (copy)
		return FFlagEnableRoCaptchaChallengeModule and RawValue == GenericTypeModule.toRawValue(GenericTypeModule.RoCaptcha) or FFlagEnableDeniedChallengeModule and RawValue == GenericTypeModule.toRawValue(GenericTypeModule.Denied)
	end,
	render = function(p1)
		-- upvalues: GenericChallengeService (copy), GenericTypeModule (copy), DeniedMetadataModule (copy), MountDeniedChallengeModule (copy), MountRoCaptchaChallengeModule (copy)
		local ChallengeId = p1.challengeId
		local GenericChallengeService1 = p1.genericChallengeService or GenericChallengeService
		
		if p1.challengeType == GenericTypeModule.toRawValue(GenericTypeModule.Denied) then
			local ChallengeMetadata = p1.challengeMetadata
			
			if ChallengeMetadata and ChallengeMetadata.reason == DeniedMetadataModule.DeniedReason.PromptUser then
				MountDeniedChallengeModule({
					challengeId = ChallengeId,
					reason = DeniedMetadataModule.DeniedReason.PromptUser,
					prompt = DeniedMetadataModule.getPrompt(ChallengeMetadata),
					onChallengeLoaded = function(Success)
						-- upvalues: GenericChallengeService1 (copy), ChallengeId (copy)
						GenericChallengeService1:SignalChallengeLoaded(ChallengeId, Success)
					end,
					onChallengeAbandoned = function()
						-- upvalues: GenericChallengeService1 (copy), ChallengeId (copy)
						GenericChallengeService1:SignalChallengeAbandoned(ChallengeId)
					end
				})
				
				return
			else
				GenericChallengeService1:SignalChallengeLoaded(ChallengeId, false)
				
				return
			end
		elseif p1.challengeType == GenericTypeModule.toRawValue(GenericTypeModule.RoCaptcha) then
			MountRoCaptchaChallengeModule({
				challengeId = ChallengeId,
				challengeMetadata = p1.challengeMetadata,
				onChallengeLoaded = function(Success)
					-- upvalues: GenericChallengeService1 (copy), ChallengeId (copy)
					GenericChallengeService1:SignalChallengeLoaded(ChallengeId, Success)
				end,
				onChallengeFailed = function()
					-- upvalues: GenericChallengeService1 (copy), ChallengeId (copy)
					GenericChallengeService1:SignalChallengeAbandoned(ChallengeId)
				end,
				onChallengeAbandoned = function()
					-- upvalues: GenericChallengeService1 (copy), ChallengeId (copy)
					GenericChallengeService1:SignalChallengeAbandoned(ChallengeId)
				end
			})
		end
	end
}