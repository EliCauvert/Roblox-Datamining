local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CrossExperienceVoiceModule = require(CorePackages.Workspace.Packages.CrossExperienceVoice)
local GetColorFromUserIdModule = require(CorePackages.Workspace.Packages.SquadsCore.getColorFromUserId)
local UseLastActiveParticipantFunction = CrossExperienceVoiceModule.Hooks.useLastActiveParticipant
local UseSequentialAnimationFunction = CrossExperienceVoiceModule.Hooks.useSequentialAnimation
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local PartyVoiceTopbarActivityIndicatorAnimationMs = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorAnimationMs", 50)
local PartyVoiceTopbarActivityIndicatorDebounceMs = game:DefineFastInt("PartyVoiceTopbarActivityIndicatorDebounceMs", 50)
local GetFFlagEnableCrossExpVoiceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableCrossExpVoice

function createAnimations(Value, Value1) --[[ Line: 32 ]]
	-- upvalues: PartyVoiceTopbarActivityIndicatorAnimationMs (copy)
	return {
		ICON_OUT_ANIMATION = {
			value = 0,
			durationInMs = PartyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		ICON_IN_ANIMATION = {
			value = Value,
			durationInMs = PartyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		AVATAR_IN_ANIMATION = {
			value = Value1,
			durationInMs = PartyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		},
		AVATAR_OUT_ANIMATION = {
			value = 0,
			durationInMs = PartyVoiceTopbarActivityIndicatorAnimationMs,
			easingStyle = Enum.EasingStyle.Linear
		}
	}
end

function getDisplayImage(p1, p2) --[[ Line: 57 ]]
	-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), GetColorFromUserIdModule (copy)
	return {
		thumbnail = if p1 == -1 then p2 else GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1))),
		backgroundColor = if p1 == -1 then nil else GetColorFromUserIdModule(p1)
	}
end

function usePartyIcon(p1, p2, p3) --[[ Line: 64 ]]
	-- upvalues: GetFFlagEnableCrossExpVoiceFunction (copy), UseLastActiveParticipantFunction (copy), UsePreviousFunction (copy), ReactModule (copy), UseSequentialAnimationFunction (copy), CrossExperienceVoiceModule (copy), PartyVoiceTopbarActivityIndicatorDebounceMs (copy)
	if GetFFlagEnableCrossExpVoiceFunction() then
		local UseLastActiveParticipantResult = UseLastActiveParticipantFunction()
		local UserId = UseLastActiveParticipantResult and UseLastActiveParticipantResult.userId or -1
		local UsePreviousResult = UsePreviousFunction(UserId)
		local UseStateResult, UseStateResult2 = ReactModule.useState(getDisplayImage(UserId, p3))
		local UseSequentialAnimationResult, UseSequentialAnimationResult2 = UseSequentialAnimationFunction(if UserId == -1 then p1 else p2)
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 75 ]]
			-- upvalues: p1 (copy), p2 (copy)
			return createAnimations(p1, p2)
		end, { p1, p2 })
		local UseResult = ReactModule.useCallback(function(p4) --[[ Line: 79 ]]
			-- upvalues: UseStateResult2 (copy), p3 (copy)
			UseStateResult2(function(p5) --[[ Line: 80 ]]
				-- upvalues: p4 (copy), p3 (upval)
				local DisplayImage = getDisplayImage(p4, p3)
				
				return if p5.thumbnail == DisplayImage.thumbnail and p5.backgroundColor == DisplayImage.backgroundColor then p5 else DisplayImage
			end)
		end, { p3, UseStateResult2 })
		local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 93 ]]
			-- upvalues: CrossExperienceVoiceModule (upval), UseSequentialAnimationResult2 (copy), PartyVoiceTopbarActivityIndicatorDebounceMs (upval)
			return CrossExperienceVoiceModule.Utils.debounce(function(p4, p5) --[[ Line: 95 ]]
				-- upvalues: UseSequentialAnimationResult2 (upval)
				UseSequentialAnimationResult2(p4, p5)
			end, PartyVoiceTopbarActivityIndicatorDebounceMs)
		end, {})
		ReactModule.useEffect(function() --[[ Line: 103 ]]
			-- upvalues: UsePreviousResult (copy), UserId (copy), UseMemoResult1 (copy), UseMemoResult (copy), UseResult (copy), UseSequentialAnimationResult2 (copy)
			if UsePreviousResult == nil or UserId == UsePreviousResult then
				UseResult(UserId)
				
				return
			end
			UseMemoResult1.cancel()
			
			if UserId == -1 then
				UseMemoResult1.call({
					UseMemoResult.AVATAR_OUT_ANIMATION,
					UseMemoResult.ICON_IN_ANIMATION
				}, function() --[[ Line: 110 ]]
					-- upvalues: UseResult (upval)
					UseResult(-1)
				end)
				
				return
			end
			if UsePreviousResult == -1 then
				UseSequentialAnimationResult2({
					UseMemoResult.ICON_OUT_ANIMATION,
					UseMemoResult.AVATAR_IN_ANIMATION
				}, function() --[[ Line: 118 ]]
					-- upvalues: UseResult (upval), UserId (upval)
					UseResult(UserId)
				end)
				
				return
			else
				UseResult(UserId)
			end
		end, { UserId, UseResult, UseMemoResult1, UseMemoResult })
		
		return {
			image = UseStateResult,
			size = UseSequentialAnimationResult
		}
	else
		local Binding, _ = ReactModule.createBinding(p1)
		
		return { image = getDisplayImage(-1, p3), size = Binding }
	end
end

return usePartyIcon