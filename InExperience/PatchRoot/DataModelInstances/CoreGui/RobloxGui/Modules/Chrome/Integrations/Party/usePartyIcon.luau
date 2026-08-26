local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local crossExperienceVoiceModule = require(corePackagesService.Workspace.Packages.CrossExperienceVoice)
local roactUtilsModule = require(corePackagesService.Workspace.Packages.RoactUtils)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getColorFromUserIdModule = require(corePackagesService.Workspace.Packages.SquadsCore.getColorFromUserId)
local useLastActiveParticipant = crossExperienceVoiceModule.Hooks.useLastActiveParticipant
local useSequentialAnimation = crossExperienceVoiceModule.Hooks.useSequentialAnimation
local usePrevious = roactUtilsModule.Hooks.usePrevious
local getStandardSizeAvatarHeadShotRbxthumb = require(corePackagesService.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local partyVoiceTopbarActivityIndicatorAnimationMs = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorAnimationMs", 50)
local partyVoiceTopbarActivityIndicatorDebounceMs = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorDebounceMs", 50)
local getFFlagEnableCrossExpVoice = sharedFlagsModule.GetFFlagEnableCrossExpVoice

function createAnimations(p1, p2)
	-- upvalues: partyVoiceTopbarActivityIndicatorAnimationMs (ref)
	return {
		ICON_OUT_ANIMATION = {
			value = 0,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		ICON_IN_ANIMATION = {
			value = p1,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		AVATAR_IN_ANIMATION = {
			value = p2,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		AVATAR_OUT_ANIMATION = {
			value = 0,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		}
	}
end

function getDisplayImage(p1, p2)
	-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (ref), getColorFromUserIdModule (ref)
	return {
		thumbnail = if p1 ~= -1 then p2 else getStandardSizeAvatarHeadShotRbxthumb(tostring(p1)),
		backgroundColor = if p1 ~= -1 then nil else getColorFromUserIdModule(p1)
	}
end

function usePartyIcon(p1, p2, p3)
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useLastActiveParticipant (ref), usePrevious (ref), reactModule (ref), useSequentialAnimation (ref), crossExperienceVoiceModule (ref), partyVoiceTopbarActivityIndicatorDebounceMs (ref)
	if getFFlagEnableCrossExpVoice() then
		local var1 = useLastActiveParticipant()
		local var2 = if var1 then var1.userId else -1
		local var3 = usePrevious(var2)
		local var4, var5 = reactModule.useState(getDisplayImage(var2, p3))
		local var6, var7 = useSequentialAnimation(if var2 == -1 then p1 else p2)
		local var8 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), p2 (ref)
			return createAnimations(p1, p2)
		end, { p1, p2 })
		local var9 = reactModule.useCallback(function(p4)
			-- upvalues: var5 (ref), p3 (ref)
			var5(function(p5)
				-- upvalues: p4 (ref), p3 (copy)
				local var10 = getDisplayImage(p4, p3)
				
				return if p5.thumbnail == var10.thumbnail and p5.backgroundColor == var10.backgroundColor then p5 else var10
			end)
		end, { p3, var5 })
		local var10 = reactModule.useMemo(function()
			-- upvalues: crossExperienceVoiceModule (copy), var7 (ref), partyVoiceTopbarActivityIndicatorDebounceMs (copy)
			return crossExperienceVoiceModule.Utils.debounce(function(p4, p5)
				-- upvalues: var7 (copy)
				var7(p4, p5)
			end, partyVoiceTopbarActivityIndicatorDebounceMs)
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), var2 (ref), var10 (ref), var8 (ref), var9 (ref), var7 (ref)
			if var3 == nil or var2 == var3 then
				var9(var2)
				
				return
			end
			var10.cancel()
			
			if var2 == -1 then
				var10.call({ var8.AVATAR_OUT_ANIMATION, var8.ICON_IN_ANIMATION }, function()
					-- upvalues: var9 (copy)
					var9(-1)
				end)
				
				return
			elseif var3 == -1 then
				var7({ var8.ICON_OUT_ANIMATION, var8.AVATAR_IN_ANIMATION }, function()
					-- upvalues: var9 (copy), var2 (copy)
					var9(var2)
				end)
				
				return
			end
			var9(var2)
		end, { var2, var9, var10, var8 })
		
		return { image = var4, size = var6 }
	end
	local var11, _ = reactModule.createBinding(p1)
	
	return { image = getDisplayImage(-1, p3), size = var11 }
end

return usePartyIcon