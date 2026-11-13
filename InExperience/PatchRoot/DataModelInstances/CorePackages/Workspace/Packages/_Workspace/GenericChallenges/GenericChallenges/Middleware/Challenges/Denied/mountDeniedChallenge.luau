local ReactModule = require(script:FindFirstAncestor("GenericChallenges").Parent.React)
local DeniedChallengeModule = require(script.Parent.DeniedChallenge)
local DeniedMetadataModule = require(script.Parent.DeniedMetadata)
local DismissDefaultLoadingGuiModule = require(script.Parent.Parent.Common.dismissDefaultLoadingGui)
local MountNativeChallengeModule = require(script.Parent.Parent.Common.mountNativeChallenge)

local function _(p1): boolean
	-- upvalues: DeniedMetadataModule (copy)
	return p1.prompt == DeniedMetadataModule.DeniedPrompt.WasmGameJoinRedirect
end

local _ = function(p1): boolean
	-- upvalues: DeniedMetadataModule (copy)
	return p1.prompt == DeniedMetadataModule.DeniedPrompt.WasmGameJoinRedirect
end

return function(p1)
	-- upvalues: DeniedMetadataModule (copy), MountNativeChallengeModule (copy), ReactModule (copy), DeniedChallengeModule (copy), DismissDefaultLoadingGuiModule (copy)
	local IsPromptMatch = p1.prompt == DeniedMetadataModule.DeniedPrompt.WasmGameJoinRedirect
	MountNativeChallengeModule({
		challengeId = p1.challengeId,
		shutdownOnTeardown = IsPromptMatch,
		mount = p1.mount,
		render = function(Callback)
			-- upvalues: ReactModule (upval), DeniedChallengeModule (upval), p1 (copy), DeniedMetadataModule (upval), DismissDefaultLoadingGuiModule (upval), IsPromptMatch (copy)
			return ReactModule.createElement(DeniedChallengeModule, {
				challengeId = p1.challengeId,
				reason = p1.reason,
				prompt = p1.prompt,
				opaqueBackdrop = p1.prompt == DeniedMetadataModule.DeniedPrompt.WasmGameJoinRedirect,
				logging = p1.logging,
				onChallengeLoaded = function(p2)
					-- upvalues: p1 (upval), DismissDefaultLoadingGuiModule (upval)
					if p1.onChallengeLoaded then
						p1.onChallengeLoaded(p2)
					end
					if p2 then
						DismissDefaultLoadingGuiModule(p1.replicatedFirst)
					end
				end,
				onChallengeAbandoned = function()
					-- upvalues: p1 (upval), IsPromptMatch (upval), Callback (copy)
					if p1.onChallengeAbandoned and not IsPromptMatch then
						p1.onChallengeAbandoned()
					end
					Callback()
				end
			})
		end
	})
end