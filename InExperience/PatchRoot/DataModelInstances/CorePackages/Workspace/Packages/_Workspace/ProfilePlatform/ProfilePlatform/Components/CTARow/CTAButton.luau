local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Components.CTARow.Types)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagProfileTradeItemsExposureLoggingModule = require(ProfilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local FFlagProfileTradeItemsImpressionLoggingModule = require(ProfilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging)
local UseTradeItemsExposureLoggerModule = require(ProfilePlatform.Hooks.useTradeItemsExposureLogger)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local ContextualMenuContainsActionModule = require(ProfilePlatform.Utils.contextualMenuContainsAction)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local FFlagProfileGamepadPrimaryActionFocusModule = require(ProfilePlatform.Flags.FFlagProfileGamepadPrimaryActionFocus)
local ReactModule = require(Parent.React)
local UseComposedRefFunction = require(Parent.ReactUtils).useComposedRef
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ContextualMenuModule = require(ProfilePlatform.Components.CTARow.ContextualMenu)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior

return function(p1) --[[ Line: 50 | Named "CTAButton" ]]
	-- upvalues: ReactModule (copy), FFlagProfileTradeItemsExposureLoggingModule (copy), UseTradeItemsExposureLoggerModule (copy), FFlagProfileTradeItemsImpressionLoggingModule (copy), UseProfileAnalyticsContextModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagProfileGamepadPrimaryActionFocusModule (copy), FocusNavigationUtilsModule (copy), UseComposedRefFunction (copy), UseProfileWrapperContextModule (copy), EnumsModule (copy), ButtonVariant (copy), ContextualMenuContainsActionModule (copy), EventNamesModule (copy), IconButton (copy), Button (copy), FillBehavior (copy), View (copy), ContextualMenuModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTradeItemsExposureLoggerModuleResult = if FFlagProfileTradeItemsExposureLoggingModule then UseTradeItemsExposureLoggerModule() else nil
	local UseProfileAnalyticsContextModuleResult = if FFlagProfileTradeItemsImpressionLoggingModule then UseProfileAnalyticsContextModule() else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 58 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 62 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean --[[ Line: 63 ]]
			return not p2
		end)
	end, {})
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = ReactModule.useMemo(function() --[[ Line: 68 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) }
			}
		end, { UseResult }),
		isFocusable = UseStateResult
	})
	local UseRefResult = ReactModule.useRef(nil)
	local MenuItem = p1.buttonItem.menuItem
	local v1 = nil
	
	if FFlagProfileGamepadPrimaryActionFocusModule then
		local UseComposedRefResult = UseComposedRefFunction(UseRefResult, (FocusNavigationUtilsModule.useFocusOnMount()))
		local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
		v1 = if p1.layoutOrder == 1 and MenuItem.id ~= EnumsModule.ProfileActions.ContextualOverflow and UseProfileWrapperContextModuleResult.headerVariant ~= EnumsModule.ProfileTabVariants.MeTab then UseComposedRefResult else UseRefResult
	end
	local DisplayValue = MenuItem.displayValue
	local Icon = DisplayValue.icon
	local Text = DisplayValue.text
	local ContextualMenuItems = p1.buttonItem.contextualMenuItems
	local ButtonStyle = if p1.buttonItem.buttonStyle then p1.buttonItem.buttonStyle else ButtonVariant.Standard
	local v2: boolean = ContextualMenuItems and #ContextualMenuItems > 0
	local IsDisabled = p1.buttonItem.menuItem.isDisabled
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 105 ]]
		-- upvalues: FFlagProfileTradeItemsExposureLoggingModule (upval), MenuItem (copy), EnumsModule (upval), UseStateResult (copy), UseTradeItemsExposureLoggerModuleResult (ref), FFlagProfileTradeItemsImpressionLoggingModule (upval), ContextualMenuContainsActionModule (upval), ContextualMenuItems (copy), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), v2 (copy), UseResult1 (copy)
		if FFlagProfileTradeItemsExposureLoggingModule and MenuItem.id == EnumsModule.ProfileActions.ContextualOverflow and not UseStateResult then
			UseTradeItemsExposureLoggerModuleResult()
		end
		if FFlagProfileTradeItemsImpressionLoggingModule and MenuItem.id == EnumsModule.ProfileActions.ContextualOverflow and not UseStateResult and ContextualMenuContainsActionModule(ContextualMenuItems, EnumsModule.ProfileActions.TradeItems) then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuTradeItemsImpression, { buttonSurface = EnumsModule.ButtonSurface.ContextualMenu })
		end
		if not v2 then
			MenuItem.onActivated()
			
			return
		end
		if not UseStateResult then
			MenuItem.onActivated()
		end
		UseResult1()
	end, {
		v2, UseStateResult, MenuItem.id, MenuItem.onActivated, UseResult1,
		if FFlagProfileTradeItemsExposureLoggingModule then UseTradeItemsExposureLoggerModuleResult else nil,
		if FFlagProfileTradeItemsImpressionLoggingModule then UseProfileAnalyticsContextModuleResult else nil,
		if FFlagProfileTradeItemsImpressionLoggingModule then ContextualMenuItems else nil
	})
	local NoText: boolean = Icon ~= nil and Text == nil
	
	return ReactModule.createElement(View, {
		tag = { ["auto-xy"] = NoText, ["fill auto-y"] = not NoText },
		LayoutOrder = p1.layoutOrder
	}, {
		Button = if NoText then ReactModule.createElement(IconButton, {
			icon = Icon,
			LayoutOrder = p1.layoutOrder,
			onActivated = UseResult2,
			variant = ButtonVariant.Standard,
			ref = if FFlagProfileGamepadPrimaryActionFocusModule then v1 else UseRefResult,
			isDisabled = IsDisabled
		}) else ReactModule.createElement(Button, {
			text = Text,
			icon = Icon,
			onActivated = UseResult2,
			fillBehavior = FillBehavior.Fill,
			variant = ButtonStyle,
			isLoading = p1.buttonItem.isLoading,
			LayoutOrder = p1.layoutOrder,
			ref = if FFlagProfileGamepadPrimaryActionFocusModule then v1 else UseRefResult,
			isDisabled = IsDisabled
		}),
		ContextualMenu = if v2 then ReactModule.createElement(ContextualMenuModule, {
			isOpen = UseStateResult,
			menuItems = ContextualMenuItems,
			anchorRef = UseRefResult,
			menuRef = UseAppFocusRootResult,
			closeMenu = UseResult,
			align = p1.align
		}) else nil
	})
end