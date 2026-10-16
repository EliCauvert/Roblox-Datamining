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
local fFlagProfileGamepadPrimaryActionFocusModule = require(profilePlatform.Flags.FFlagProfileGamepadPrimaryActionFocus)
local fFlagProfilePlatformEnableTransferTooltipModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltip)
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local fFlagProfileTradeItemsImpressionLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging)
local useTradeItemsExposureLoggerModule = require(profilePlatform.Hooks.useTradeItemsExposureLogger)
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useFocusGuiObject (ref), useLastInputMode (ref), useProfileAnalyticsContextModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfileTradeItemsImpressionLoggingModule (ref), useProfileActionsModule (ref), reactModule (ref), fFlagProfileGamepadPrimaryActionFocusModule (ref), focusNavigationUtilsModule (ref), eventNamesModule (ref), constantsModule (ref), useMapJsonToProfileActionsModule (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), useEffectOnMount (ref), socialStopwatchModule (ref), loadingStagesExtensionModule (ref), profileActionBarWithTransferTooltipModule (ref), profileActionBarModule (ref)
	local var1 = useProfileWrapperContextModule()
	local profileId = var1.profileId
	local var2 = useNavigation()
	local var3 = useFocusGuiObject()
	local var4 = useLastInputMode()
	local var5 = useProfileAnalyticsContextModule()
	local var6 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var7 = if fFlagProfileTradeItemsImpressionLoggingModule then useProfileActionsModule(enumsModule.ButtonSurface.ContextualMenu) else nil
	local var8 = false
	
	if fFlagProfileTradeItemsImpressionLoggingModule then
		local contextual = actions.contextual
		var8 = contextual ~= nil and (table.find(contextual, enumsModule.ProfileActions.TradeItems) ~= nil and var7[enumsModule.ProfileActions.TradeItems] ~= nil)
	end
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = if fFlagProfileGamepadPrimaryActionFocusModule then if var1.headerVariant == enumsModule.ProfileTabVariants.MeTab then var12 else focusNavigationUtilsModule.useFocusOnMount(var12) else nil
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var14 (ref), var5 (ref), eventNamesModule (copy), fFlagProfileTradeItemsExposureLoggingModule (copy), var6 (write), fFlagProfileTradeItemsImpressionLoggingModule (copy), var8 (write), enumsModule (copy), constantsModule (copy), var10 (ref), var11 (ref), var2 (ref)
		if var9 then
			if var14 and var14.current then
				var14.current()
			end
			return
		else
			var5.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
			
			if fFlagProfileTradeItemsExposureLoggingModule then
				var6()
			end
			if fFlagProfileTradeItemsImpressionLoggingModule and var8 then
				var5.fireAnalyticsEvent(eventNamesModule.ContextualMenuTradeItemsImpression, { buttonSurface = enumsModule.ButtonSurface.ContextualMenu })
			end
			var2.navigate(enumsModule.Screens.ContextualMenu, {
				[constantsModule.Navigation.ON_CLOSE] = function()
					-- upvalues: var10 (copy)
					var10(false)
				end,
				[constantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function()
					-- upvalues: var11 (copy)
					return var11.current
				end,
				[constantsModule.Navigation.ON_DISMISS_REF] = var14
			})
			var10(true)
		end
	end, {
		var2,
		var9,
		var5,
		if fFlagProfileTradeItemsExposureLoggingModule then var6 else nil,
		if fFlagProfileTradeItemsImpressionLoggingModule then var8 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var4 (ref), var3 (ref)
		if var12.current and var4 == "Focus" then
			var3(var12.current)
		end
	end, { var12.current, var4 })
	local var16, var17 = useMapJsonToProfileActionsModule(profileId)
	local var18 = nil
	
	if fFlagProfilePlatformEnableTransferTooltipModule then
		var18 = fFlagProfilePlatformEnableCurrencyTransfer and (actions.contextual ~= nil and table.find(actions.contextual, enumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	useEffectOnMount(function()
		-- upvalues: socialStopwatchModule (copy), var5 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var19 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var5.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var19 then var19.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagProfilePlatformEnableTransferTooltipModule and var18 then reactModule.createElement(profileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = var9,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var17 then var15 else nil,
		profileActions = var16,
		primaryButtonRef = if fFlagProfileGamepadPrimaryActionFocusModule then var13 else var12,
		moreButtonRef = var11
	}) else reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = var9,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var17 then var15 else nil,
		profileActions = var16,
		primaryButtonRef = if fFlagProfileGamepadPrimaryActionFocusModule then var13 else var12,
		moreButtonRef = var11
	})
end