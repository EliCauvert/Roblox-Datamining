local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ReactModule = require(GenericChallenges.Parent.React)
local RoCaptchaChallengeModule = require(script.Parent.RoCaptchaChallenge)
local MountNativeChallengeModule = require(script.Parent.Parent.Common.mountNativeChallenge)
local _ = require(GenericChallenges.Types.ChallengeMetadata)

return function(p1)
	-- upvalues: MountNativeChallengeModule (copy), ReactModule (copy), RoCaptchaChallengeModule (copy)
	MountNativeChallengeModule({
		shutdownOnTeardown = true,
		challengeId = p1.challengeId,
		mount = p1.mount,
		shutdownGame = p1.shutdownGame,
		render = function(Callback)
			-- upvalues: ReactModule (upval), RoCaptchaChallengeModule (upval), p1 (copy)
			return ReactModule.createElement(RoCaptchaChallengeModule, {
				challengeId = p1.challengeId,
				challengeMetadata = p1.challengeMetadata,
				experienceService = p1.experienceService,
				desiredPlaceId = p1.desiredPlaceId,
				logging = p1.logging,
				onChallengeLoaded = p1.onChallengeLoaded,
				onChallengeFailed = function()
					-- upvalues: p1 (upval), Callback (copy)
					if p1.onChallengeFailed then
						p1.onChallengeFailed()
					end
					Callback()
				end,
				onChallengeAbandoned = function()
					-- upvalues: p1 (upval), Callback (copy)
					if p1.onChallengeAbandoned then
						p1.onChallengeAbandoned()
					end
					Callback()
				end,
				onChallengeCompleted = function()
					-- upvalues: p1 (upval), Callback (copy)
					if p1.onChallengeCompleted then
						p1.onChallengeCompleted()
					end
					Callback()
				end
			})
		end
	})
end