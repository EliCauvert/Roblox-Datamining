local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local getTimeoutStatusStoreModule = require(avatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local formatTimeoutEndTimeModule = require(avatarExperienceCommon.Utils.formatTimeoutEndTime)

return function(value) --[[ line: 28 | named "useTimeoutBannerProps" ]]
	-- upvalues: getTimeoutStatusStoreModule (ref), useSignalState (ref), useNavigation (ref), reactModule (ref), formatTimeoutEndTimeModule (ref), useLocalization (ref), avatarScreen (ref)
	local var4 = if value and value.shouldFetch ~= nil then value.shouldFetch else false
	local var5 = if value and value.shouldNavigateOnClick ~= nil then value.shouldNavigateOnClick else true
	local var6 = getTimeoutStatusStoreModule()
	local var7 = useSignalState(var6.getStatus)
	local var8 = useSignalState(var6.getIsTimedOut)
	local var9 = useNavigation()
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var4 (ref), var6 (ref)
		if var4 then
			var6.fetchStatus()
		end
	end, { var4, var6 })
	local var10 = formatTimeoutEndTimeModule(if var7.timeoutAction then var7.timeoutAction.endTime else var7.details and var7.details.endDate)
	
	return {
		messageText = useLocalization({
			messageText = if var10 then {
				"Feature.Timeout.WarningBanner.DisabledUntilMessage",
				time = var10
			} else "Feature.Timeout.WarningBanner.DisabledMessage"
		}).messageText,
		onBannerActivated = if var5 then reactModule.useCallback(function() --[[ line: 54 ]]
			-- upvalues: var9 (ref), avatarScreen (copy)
			var9.navigate(avatarScreen.TimeoutStatusPrompt)
		end, { var9 }) else nil,
		shouldShow = var8
	}
end