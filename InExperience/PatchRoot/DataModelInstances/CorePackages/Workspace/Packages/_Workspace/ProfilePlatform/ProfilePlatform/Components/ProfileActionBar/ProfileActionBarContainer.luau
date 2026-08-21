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

return function(p0) --[[ line: 36 | named "ProfileActionBarContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useNavigation (ref), useFocusGuiObject (ref), useLastInputMode (ref), useProfileAnalyticsContextModule (ref), reactModule (ref), eventNamesModule (ref), constantsModule (ref), enumsModule (ref), useMapJsonToProfileActionsModule (ref), fFlagProfilePlatformEnableTransferTooltipModule (ref), useProfileJsonComponentModule (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), useEffectOnMount (ref), socialStopwatchModule (ref), loadingStagesExtensionModule (ref), profileActionBarWithTransferTooltipModule (ref), profileActionBarModule (ref)
	local profileId = useProfileWrapperContextModule().profileId
	local var17 = useNavigation()
	local var18 = useFocusGuiObject()
	local var19 = useLastInputMode()
	local var20 = useProfileAnalyticsContextModule()
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useCallback(function() --[[ line: 48 ]]
		-- upvalues: var21 (ref), var25 (ref), var20 (ref), eventNamesModule (copy), constantsModule (copy), var22 (ref), var23 (ref), var17 (ref), enumsModule (copy)
		if var21 then
			if var25 and var25.current then
				var25.current()
			end
			return
		else
			var20.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
			var17.navigate(enumsModule.Screens.ContextualMenu, {
				[constantsModule.Navigation.ON_CLOSE] = function() --[[ line: 59 ]]
					-- upvalues: var22 (copy)
					var22(false)
				end,
				[constantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function() --[[ line: 62 ]]
					-- upvalues: var23 (copy)
					return var23.current
				end,
				[constantsModule.Navigation.ON_DISMISS_REF] = var25
			})
			var22(true)
		end
	end, { var17, var21 })
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var24 (ref), var19 (ref), var18 (ref)
		if var24.current and var19 == "Focus" then
			var18(var24.current)
		end
	end, { var24.current, var19 })
	local var27, var28 = useMapJsonToProfileActionsModule(profileId)
	local var29 = nil
	
	if fFlagProfilePlatformEnableTransferTooltipModule then
		local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
		var29 = fFlagProfilePlatformEnableCurrencyTransfer and (actions.contextual ~= nil and table.find(actions.contextual, enumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	useEffectOnMount(function() --[[ line: 88 ]]
		-- upvalues: socialStopwatchModule (copy), var20 (ref), eventNamesModule (copy), loadingStagesExtensionModule (copy)
		local var31 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var20.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var31 then var31.timeElapsed else nil,
			status = loadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if fFlagProfilePlatformEnableTransferTooltipModule and var29 then reactModule.createElement(profileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = var21,
		layoutOrder = p0.layoutOrder,
		openContextualMenu = if var28 then var26 else nil,
		profileActions = var27,
		primaryButtonRef = var24,
		moreButtonRef = var23
	}) else reactModule.createElement(profileActionBarModule, {
		isContextualMenuOpen = var21,
		layoutOrder = p0.layoutOrder,
		openContextualMenu = if var28 then var26 else nil,
		profileActions = var27,
		primaryButtonRef = var24,
		moreButtonRef = var23
	})
end