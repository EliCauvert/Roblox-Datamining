local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useMapJsonToProfileActionsModule = require(profilePlatform.Components.ProfileActionBar.useMapJsonToProfileActions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local profileActionBarModule = require(profilePlatform.Components.ProfileActionBar.ProfileActionBar)
local profileActionBarWithTransferTooltipModule = require(profilePlatform.Components.ProfileActionBar.ProfileActionBarWithTransferTooltip)
local useNavigation = navigationModule.useNavigation
local enumsModule = require(profilePlatform.Common.Enums)
local constantsModule = require(profilePlatform.Common.Constants)
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local socialStopwatchModule = require(parent.SocialStopwatch)
local loadingStagesExtensionModule = require(profilePlatform.Analytics.LoadingStagesExtension)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local fFlagProfilePlatformEnableTransferTooltipModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltip)
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local useTradeItemsExposureLoggerModule = require(profilePlatform.Hooks.useTradeItemsExposureLogger)

return function(p0) --[[ line: 38 | named "ProfileActionBarContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useFocusGuiObject (ref), useLastInputMode (ref), useProfileAnalyticsContextModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), enumsModule (ref), useMapJsonToProfileActionsModule (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), useProfileJsonComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), useEffectOnMount (ref), socialStopwatchModule (ref), loadingStagesExtensionModule (ref), profileActionBarWithTransferTooltipModule (ref), profileActionBarModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var19 = useNavigation()
	local var20 = useFocusGuiObject()
	local var21 = useLastInputMode()
	local var22 = useProfileAnalyticsContextModule()
	local var23 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local var24, var25 = reactModule.useState(false)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: var24 (ref), var28 (ref), var22 (ref), eventNamesModule (copy), fFlagProfileTradeItemsExposureLoggingModule (copy), var23 (write), constantsModule (copy), var25 (ref), var26 (ref), var19 (ref), enumsModule (copy)
		if var24 then
			if var28 and var28.current then
				var28.current()
			end
			return
		else
			var22.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
			
			if fFlagProfileTradeItemsExposureLoggingModule then
				var23()
			end
			var19.navigate(enumsModule.Screens.ContextualMenu, {
				[constantsModule.Navigation.ON_CLOSE] = function() --[[ line: 68 ]]
					-- upvalues: var25 (copy)
					var25(false)
				end,
				[constantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ line: 71 ]]
					-- upvalues: var26 (copy)
					return var26.current
				end,
				[constantsModule.Navigation.ON_DISMISS_REF] = var28
			})
			var25(true)
		end
	end, {
		var19,
		var24,
		var22,
		if fFlagProfileTradeItemsExposureLoggingModule then var23 else nil
	})
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var27 (ref), var21 (ref), var20 (ref)
		if var27.current and var21 == "Focus" then
			var20(var27.current)
		end
	end, { var27.current, var21 })
	local var30, var31 = useMapJsonToProfileActionsModule(profileId)
	local var32 = nil
	
	if fFlagProfilePlatformEnableTransferTooltipModule then
		local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
		var32 = fFlagProfilePlatformEnableCurrencyTransfer and (actions.contextual ~= nil and table.find(actions.contextual, enumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	useEffectOnMount(function() --[[ line: 102 ]]
		-- upvalues: socialStopwatchModule (copy), var22 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var34 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var22.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var34 then var34.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagProfilePlatformEnableTransferTooltipModule and var32 then reactModule.createElement(profileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = var24,
		layoutOrder = p0.layoutOrder,
		openContextualMenu = if var31 then var29 else nil,
		profileActions = var30,
		primaryButtonRef = var27,
		moreButtonRef = var26
	}) else reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = var24,
		layoutOrder = p0.layoutOrder,
		openContextualMenu = if var31 then var29 else nil,
		profileActions = var30,
		primaryButtonRef = var27,
		moreButtonRef = var26
	})
end