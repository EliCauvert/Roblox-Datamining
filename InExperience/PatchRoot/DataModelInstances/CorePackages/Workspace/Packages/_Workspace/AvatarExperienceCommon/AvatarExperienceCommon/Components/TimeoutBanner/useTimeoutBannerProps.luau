local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local getTimeoutStatusStoreModule = require(avatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local formatTimeoutEndTimeModule = require(avatarExperienceCommon.Utils.formatTimeoutEndTime)

return function(value)
	-- upvalues: getTimeoutStatusStoreModule (ref), useSignalState (ref), useNavigation (ref), reactModule (ref), formatTimeoutEndTimeModule (ref), useLocalization (ref), avatarScreen (ref)
	local var1 = if value and value.shouldFetch ~= nil then value.shouldFetch else false
	local var2 = if value and value.shouldNavigateOnClick ~= nil then value.shouldNavigateOnClick else true
	local var3 = getTimeoutStatusStoreModule()
	local var4 = useSignalState(var3.getStatus)
	local var5 = useSignalState(var3.getIsTimedOut)
	local var6 = useNavigation()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref)
		if var1 then
			var3.fetchStatus()
		end
	end, { var1, var3 })
	local var7 = formatTimeoutEndTimeModule(if var4.timeoutAction then var4.timeoutAction.endTime else var4.details and var4.details.endDate)
	
	return {
		messageText = useLocalization({
			messageText = if var7 then {
				"Feature.Timeout.WarningBanner.DisabledUntilMessage",
				time = var7
			} else "Feature.Timeout.WarningBanner.DisabledMessage"
		}).messageText,
		onBannerActivated = if var2 then reactModule.useCallback(function()
			-- upvalues: var6 (ref), avatarScreen (copy)
			var6.navigate(avatarScreen.TimeoutStatusPrompt)
		end, { var6 }) else nil,
		shouldShow = var5
	}
end