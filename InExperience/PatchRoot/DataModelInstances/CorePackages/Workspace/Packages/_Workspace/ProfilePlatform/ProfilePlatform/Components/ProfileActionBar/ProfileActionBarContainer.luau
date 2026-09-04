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
local fFlagProfileTradeItemsImpressionLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging)
local useTradeItemsExposureLoggerModule = require(profilePlatform.Hooks.useTradeItemsExposureLogger)
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useFocusGuiObject (ref), useLastInputMode (ref), useProfileAnalyticsContextModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfileTradeItemsImpressionLoggingModule (ref), useProfileActionsModule (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), useMapJsonToProfileActionsModule (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), useEffectOnMount (ref), socialStopwatchModule (ref), loadingStagesExtensionModule (ref), profileActionBarWithTransferTooltipModule (ref), profileActionBarModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var1 = useNavigation()
	local var2 = useFocusGuiObject()
	local var3 = useLastInputMode()
	local var4 = useProfileAnalyticsContextModule()
	local var5 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var6 = if fFlagProfileTradeItemsImpressionLoggingModule then useProfileActionsModule(enumsModule.ButtonSurface.ContextualMenu) else nil
	local var7 = false
	
	if fFlagProfileTradeItemsImpressionLoggingModule then
		local contextual = actions.contextual
		var7 = contextual ~= nil and (table.find(contextual, enumsModule.ProfileActions.TradeItems) ~= nil and var6[enumsModule.ProfileActions.TradeItems] ~= nil)
	end
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), var12 (ref), var4 (ref), eventNamesModule (copy), fFlagProfileTradeItemsExposureLoggingModule (copy), var5 (write), fFlagProfileTradeItemsImpressionLoggingModule (copy), var7 (write), enumsModule (copy), constantsModule (copy), var9 (ref), var10 (ref), var1 (ref)
		if var8 then
			if var12 and var12.current then
				var12.current()
			end
			return
		else
			var4.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
			
			if fFlagProfileTradeItemsExposureLoggingModule then
				var5()
			end
			if fFlagProfileTradeItemsImpressionLoggingModule and var7 then
				var4.fireAnalyticsEvent(eventNamesModule.ContextualMenuTradeItemsImpression, { buttonSurface = enumsModule.ButtonSurface.ContextualMenu })
			end
			var1.navigate(enumsModule.Screens.ContextualMenu, {
				[constantsModule.Navigation.ON_CLOSE] = function()
					-- upvalues: var9 (copy)
					var9(false)
				end,
				[constantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function()
					-- upvalues: var10 (copy)
					return var10.current
				end,
				[constantsModule.Navigation.ON_DISMISS_REF] = var12
			})
			var9(true)
		end
	end, {
		var1,
		var8,
		var4,
		if fFlagProfileTradeItemsExposureLoggingModule then var5 else nil,
		if fFlagProfileTradeItemsImpressionLoggingModule then var7 else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var3 (ref), var2 (ref)
		if var11.current and var3 == "Focus" then
			var2(var11.current)
		end
	end, { var11.current, var3 })
	local var14, var15 = useMapJsonToProfileActionsModule(profileId)
	local var16 = nil
	
	if fFlagProfilePlatformEnableTransferTooltipModule then
		var16 = fFlagProfilePlatformEnableCurrencyTransfer and (actions.contextual ~= nil and table.find(actions.contextual, enumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	useEffectOnMount(function()
		-- upvalues: socialStopwatchModule (copy), var4 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var17 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var4.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var17 then var17.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagProfilePlatformEnableTransferTooltipModule and var16 then reactModule.createElement(profileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = var8,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var15 then var13 else nil,
		profileActions = var14,
		primaryButtonRef = var11,
		moreButtonRef = var10
	}) else reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = var8,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if var15 then var13 else nil,
		profileActions = var14,
		primaryButtonRef = var11,
		moreButtonRef = var10
	})
end