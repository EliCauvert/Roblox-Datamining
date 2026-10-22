local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local GetTimeoutStatusStoreModule = require(AvatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local FormatTimeoutEndTimeModule = require(AvatarExperienceCommon.Utils.formatTimeoutEndTime)
local ShowAvatarChangeFeatureRestrictionModule = require(AvatarExperienceCommon.Utils.showAvatarChangeFeatureRestriction)
local FFlagAXUseUFRForTimeoutPromptInApp = require(Parent.AvatarExperienceFlags).FFlagAXUseUFRForTimeoutPromptInApp

return function(p1)
	-- upvalues: GetTimeoutStatusStoreModule (copy), UseSignalStateFunction (copy), UseNavigationFunction (copy), ReactModule (copy), FormatTimeoutEndTimeModule (copy), UseLocalizationFunction (copy), AvatarScreen (copy), FFlagAXUseUFRForTimeoutPromptInApp (copy), ShowAvatarChangeFeatureRestrictionModule (copy)
	local ShouldFetch = if p1 and p1.shouldFetch ~= nil then p1.shouldFetch else false
	local NoP0 = not p1 or p1.shouldNavigateOnClick == nil or p1.shouldNavigateOnClick
	local TimeoutStatusStoreModule = GetTimeoutStatusStoreModule()
	local UseSignalStateResult = UseSignalStateFunction(TimeoutStatusStoreModule.getStatus)
	local UseSignalStateResult1 = UseSignalStateFunction(TimeoutStatusStoreModule.getIsTimedOut)
	local UseNavigationResult = UseNavigationFunction()
	ReactModule.useEffect(function()
		-- upvalues: ShouldFetch (copy), TimeoutStatusStoreModule (copy)
		if ShouldFetch then
			TimeoutStatusStoreModule.fetchStatus()
		end
	end, { ShouldFetch, TimeoutStatusStoreModule })
	local FormatTimeoutEndTimeModuleResult = FormatTimeoutEndTimeModule(UseSignalStateResult.timeoutAction and UseSignalStateResult.timeoutAction.endTime or UseSignalStateResult.details and UseSignalStateResult.details.endDate)
	local UseLocalizationResult = UseLocalizationFunction({
		messageText = if FormatTimeoutEndTimeModuleResult then {
			"Feature.Timeout.WarningBanner.DisabledUntilMessage",
			time = FormatTimeoutEndTimeModuleResult
		} else "Feature.Timeout.WarningBanner.DisabledMessage"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
		UseNavigationResult.navigate(AvatarScreen.TimeoutStatusPrompt)
	end, { UseNavigationResult })
	
	return if FFlagAXUseUFRForTimeoutPromptInApp then {
		messageText = UseLocalizationResult.messageText,
		onBannerActivated = if NoP0 then ShowAvatarChangeFeatureRestrictionModule else nil,
		shouldShow = UseSignalStateResult1
	} else {
		messageText = UseLocalizationResult.messageText,
		onBannerActivated = if NoP0 then UseResult else nil,
		shouldShow = UseSignalStateResult1
	}
end