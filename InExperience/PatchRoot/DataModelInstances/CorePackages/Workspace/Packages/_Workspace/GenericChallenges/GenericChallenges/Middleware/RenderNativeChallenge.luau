local GenericTypeModule = require(script:FindFirstAncestor("GenericChallenges").Types.GenericType)
local MountRoCaptchaChallengeModule = require(script.Parent.Challenges.RoCaptcha.mountRoCaptchaChallenge)
local FFlagEnableRoCaptchaChallengeModule = require(script.Parent.Flags.FFlagEnableRoCaptchaChallenge)
local GenericChallengeService = game:GetService("GenericChallengeService")

return {
	canRenderNativeChallenge = function(RawValue): boolean
		-- upvalues: FFlagEnableRoCaptchaChallengeModule (copy), GenericTypeModule (copy)
		return FFlagEnableRoCaptchaChallengeModule and RawValue == GenericTypeModule.toRawValue(GenericTypeModule.RoCaptcha)
	end,
	render = function(p1)
		-- upvalues: GenericChallengeService (copy), GenericTypeModule (copy), MountRoCaptchaChallengeModule (copy)
		local ChallengeId = p1.challengeId
		local GenericChallengeService1 = p1.genericChallengeService or GenericChallengeService
		
		if p1.challengeType == GenericTypeModule.toRawValue(GenericTypeModule.RoCaptcha) then
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