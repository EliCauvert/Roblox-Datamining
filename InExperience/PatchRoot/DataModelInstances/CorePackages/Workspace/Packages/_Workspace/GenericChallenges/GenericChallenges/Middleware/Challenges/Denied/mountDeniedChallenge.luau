local ReactModule = require(script:FindFirstAncestor("GenericChallenges").Parent.React)
local DeniedChallengeModule = require(script.Parent.DeniedChallenge)
local MountNativeChallengeModule = require(script.Parent.Parent.Common.mountNativeChallenge)

return function(p1)
	-- upvalues: MountNativeChallengeModule (copy), ReactModule (copy), DeniedChallengeModule (copy)
	MountNativeChallengeModule({
		challengeId = p1.challengeId,
		mount = p1.mount,
		render = function(Callback)
			-- upvalues: ReactModule (upval), DeniedChallengeModule (upval), p1 (copy)
			return ReactModule.createElement(DeniedChallengeModule, {
				challengeId = p1.challengeId,
				reason = p1.reason,
				prompt = p1.prompt,
				logging = p1.logging,
				onChallengeLoaded = p1.onChallengeLoaded,
				onChallengeAbandoned = function()
					-- upvalues: p1 (upval), Callback (copy)
					if p1.onChallengeAbandoned then
						p1.onChallengeAbandoned()
					end
					Callback()
				end
			})
		end
	})
end