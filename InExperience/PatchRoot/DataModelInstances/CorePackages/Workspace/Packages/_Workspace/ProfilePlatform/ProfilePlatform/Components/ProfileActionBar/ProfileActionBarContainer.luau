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

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useFocusGuiObject (ref), useLastInputMode (ref), useProfileAnalyticsContextModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), enumsModule (ref), useMapJsonToProfileActionsModule (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), useProfileJsonComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), useEffectOnMount (ref), socialStopwatchModule (ref), loadingStagesExtensionModule (ref), profileActionBarWithTransferTooltipModule (ref), profileActionBarModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var1 = useNavigation()
	local var2 = useFocusGuiObject()
	local var3 = useLastInputMode()
	local var4 = useProfileAnalyticsContextModule()
	local var5 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var10 (ref), var4 (ref), eventNamesModule (copy), fFlagProfileTradeItemsExposureLoggingModule (copy), var5 (write), constantsModule (copy), var7 (ref), var8 (ref), var1 (ref), enumsModule (copy)
		if var6 then
			if var10 and var10.current then
				var10.current()
			end
			return
		else
			var4.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
			
			if fFlagProfileTradeItemsExposureLoggingModule then
				var5()
			end
			var1.navigate(enumsModule.Screens.ContextualMenu, {
				[constantsModule.Navigation.ON_CLOSE] = function()
					-- upvalues: var7 (copy)
					var7(false)
				end,
				[constantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function()
					-- upvalues: var8 (copy)
					return var8.current
				end,
				[constantsModule.Navigation.ON_DISMISS_REF] = var10
			})
			var7(true)
		end
	end, {
		var1,
		var6,
		var4,
		if fFlagProfileTradeItemsExposureLoggingModule then var5 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var3 (ref), var2 (ref)
		if var9.current and var3 == "Focus" then
			var2(var9.current)
		end
	end, { var9.current, var3 })
	local var12, var13 = useMapJsonToProfileActionsModule(profileId)
	local var14 = nil
	
	if fFlagProfilePlatformEnableTransferTooltipModule then
		local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
		var14 = fFlagProfilePlatformEnableCurrencyTransfer and (actions.contextual ~= nil and table.find(actions.contextual, enumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	useEffectOnMount(function()
		-- upvalues: socialStopwatchModule (copy), var4 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var15 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var4.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var15 then var15.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagProfilePlatformEnableTransferTooltipModule and var14 then reactModule.createElement(profileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = var6,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var13 then var11 else nil,
		profileActions = var12,
		primaryButtonRef = var9,
		moreButtonRef = var8
	}) else reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = var6,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var13 then var11 else nil,
		profileActions = var12,
		primaryButtonRef = var9,
		moreButtonRef = var8
	})
end