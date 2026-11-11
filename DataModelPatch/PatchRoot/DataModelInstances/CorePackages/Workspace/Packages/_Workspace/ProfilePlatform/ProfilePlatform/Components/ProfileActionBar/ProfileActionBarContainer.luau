local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseMapJsonToProfileActionsModule = require(ProfilePlatform.Components.ProfileActionBar.useMapJsonToProfileActions)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local ProfileActionBarModule = require(ProfilePlatform.Components.ProfileActionBar.ProfileActionBar)
local ProfileActionBarWithTransferTooltipModule = require(ProfilePlatform.Components.ProfileActionBar.ProfileActionBarWithTransferTooltip)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local LoadingStagesExtensionModule = require(ProfilePlatform.Analytics.LoadingStagesExtension)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local FFlagProfilePlatformEnableTransferTooltipModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTransferTooltip)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseNavigationFunction (copy), UseFocusGuiObjectFunction (copy), UseLastInputModeFunction (copy), UseProfileAnalyticsContextModule (copy), ReactModule (copy), EventNamesModule (copy), ConstantsModule (copy), EnumsModule (copy), UseMapJsonToProfileActionsModule (copy), FFlagProfilePlatformEnableTransferTooltipModule (copy), UseProfileJsonComponentModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), UseEffectOnMountFunction (copy), SocialStopwatchModule (copy), LoadingStagesExtensionModule (copy), ProfileActionBarWithTransferTooltipModule (copy), ProfileActionBarModule (copy)
	local ProfileId = UseProfileWrapperContextModule().profileId
	local UseNavigationResult = UseNavigationFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseRefResult2 (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ConstantsModule (upval), UseStateResult2 (copy), UseRefResult (copy), UseNavigationResult (copy), EnumsModule (upval)
		if not UseStateResult then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButton)
			UseNavigationResult.navigate(EnumsModule.Screens.ContextualMenu, {
				[ConstantsModule.Navigation.ON_CLOSE] = function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end,
				[ConstantsModule.Navigation.GET_ROOT_ELEMENT_REF] = function()
					-- upvalues: UseRefResult (upval)
					return UseRefResult.current
				end,
				[ConstantsModule.Navigation.ON_DISMISS_REF] = UseRefResult2
			})
			UseStateResult2(true)
			
			return
		elseif UseRefResult2 and UseRefResult2.current then
			UseRefResult2.current()
		end
	end, { UseNavigationResult, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseLastInputModeResult (copy), UseFocusGuiObjectResult (copy)
		if UseRefResult1.current and UseLastInputModeResult == "Focus" then
			UseFocusGuiObjectResult(UseRefResult1.current)
		end
	end, { UseRefResult1.current, UseLastInputModeResult })
	local UseMapJsonToProfileActionsModuleResult, UseMapJsonToProfileActionsModuleResult2 = UseMapJsonToProfileActionsModule(ProfileId)
	local HasFoundIndex: boolean? = nil
	
	if FFlagProfilePlatformEnableTransferTooltipModule then
		local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Actions) or {}
		HasFoundIndex = FFlagProfilePlatformEnableCurrencyTransfer and (UseProfileJsonComponentModuleResult.contextual ~= nil and table.find(UseProfileJsonComponentModuleResult.contextual, EnumsModule.ProfileActions.CurrencyTransfer) ~= nil)
	end
	UseEffectOnMountFunction(function()
		-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), LoadingStagesExtensionModule (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.ProfileOpened)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if GetResult then GetResult.timeElapsed else nil,
			status = LoadingStagesExtensionModule.CTALoaded
		})
	end)
	
	return if FFlagProfilePlatformEnableTransferTooltipModule and HasFoundIndex then ReactModule.createElement(ProfileActionBarWithTransferTooltipModule, {
		isContextualMenuOpen = UseStateResult,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if UseMapJsonToProfileActionsModuleResult2 then UseResult else nil,
		profileActions = UseMapJsonToProfileActionsModuleResult,
		primaryButtonRef = UseRefResult1,
		moreButtonRef = UseRefResult
	}) else ReactModule.createElement(ProfileActionBarModule, {
		isContextualMenuOpen = UseStateResult,
		layoutOrder = p1.layoutOrder,
		openContextualMenu = if UseMapJsonToProfileActionsModuleResult2 then UseResult else nil,
		profileActions = UseMapJsonToProfileActionsModuleResult,
		primaryButtonRef = UseRefResult1,
		moreButtonRef = UseRefResult
	})
end