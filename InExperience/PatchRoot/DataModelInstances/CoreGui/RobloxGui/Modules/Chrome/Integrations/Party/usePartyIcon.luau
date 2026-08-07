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

function createAnimations(p0, p1) --[[ line: 32 ]]
	-- upvalues: partyVoiceTopbarActivityIndicatorAnimationMs (ref)
	return {
		ICON_OUT_ANIMATION = {
			value = 0,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		ICON_IN_ANIMATION = {
			value = p0,
			durationInMs = partyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		AVATAR_IN_ANIMATION = {
			value = p1,
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

function getDisplayImage(p2, p3) --[[ line: 57 ]]
	-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (ref), getColorFromUserIdModule (ref)
	return {
		thumbnail = if p2 ~= -1 then p3 else getStandardSizeAvatarHeadShotRbxthumb(tostring(p2)),
		backgroundColor = if p2 ~= -1 then nil else getColorFromUserIdModule(p2)
	}
end

function usePartyIcon(p4, p5, p6) --[[ line: 64 ]]
	-- upvalues: getFFlagEnableCrossExpVoice (ref), useLastActiveParticipant (ref), usePrevious (ref), reactModule (ref), useSequentialAnimation (ref), crossExperienceVoiceModule (ref), partyVoiceTopbarActivityIndicatorDebounceMs (ref)
	if getFFlagEnableCrossExpVoice() then
		local var8 = useLastActiveParticipant()
		local var9 = if var8 then var8.userId else -1
		local var10 = usePrevious(var9)
		local var11, var12 = reactModule.useState(getDisplayImage(var9, p6))
		local var13, var14 = useSequentialAnimation(if var9 == -1 then p4 else p5)
		local var15 = reactModule.useMemo(function() --[[ line: 75 ]]
			-- upvalues: p4 (ref), p5 (ref)
			return createAnimations(p4, p5)
		end, { p4, p5 })
		local var16 = reactModule.useCallback(function(p7) --[[ line: 79 ]]
			-- upvalues: var12 (ref), p6 (ref)
			var12(function(p8) --[[ line: 80 ]]
				-- upvalues: p7 (ref), p6 (copy)
				local var19 = getDisplayImage(p7, p6)
				
				return if p8.thumbnail == var19.thumbnail and p8.backgroundColor == var19.backgroundColor then p8 else var19
			end)
		end, { p6, var12 })
		local var17 = reactModule.useMemo(function() --[[ line: 93 ]]
			-- upvalues: crossExperienceVoiceModule (copy), var14 (ref), partyVoiceTopbarActivityIndicatorDebounceMs (copy)
			return crossExperienceVoiceModule.Utils.debounce(function(p9, p10) --[[ line: 95 ]]
				-- upvalues: var14 (copy)
				var14(p9, p10)
			end, partyVoiceTopbarActivityIndicatorDebounceMs)
		end, {})
		reactModule.useEffect(function() --[[ line: 103 ]]
			-- upvalues: var10 (ref), var9 (ref), var17 (ref), var15 (ref), var16 (ref), var14 (ref)
			if var10 == nil or var9 == var10 then
				var16(var9)
				
				return
			end
			var17.cancel()
			
			if var9 == -1 then
				var17.call({ var15.AVATAR_OUT_ANIMATION, var15.ICON_IN_ANIMATION }, function() --[[ line: 110 ]]
					-- upvalues: var16 (copy)
					var16(-1)
				end)
				
				return
			elseif var10 == -1 then
				var14({ var15.ICON_OUT_ANIMATION, var15.AVATAR_IN_ANIMATION }, function() --[[ line: 118 ]]
					-- upvalues: var16 (copy), var9 (copy)
					var16(var9)
				end)
				
				return
			end
			var16(var9)
		end, { var9, var16, var17, var15 })
		
		return { image = var11, size = var13 }
	end
	local var18, _ = reactModule.createBinding(p4)
	
	return { image = getDisplayImage(-1, p6), size = var18 }
end

return usePartyIcon