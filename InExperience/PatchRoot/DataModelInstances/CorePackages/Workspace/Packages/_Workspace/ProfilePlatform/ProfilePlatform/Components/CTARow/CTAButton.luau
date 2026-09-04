local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local fFlagProfileTradeItemsImpressionLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsImpressionLogging)
local useTradeItemsExposureLoggerModule = require(profilePlatform.Hooks.useTradeItemsExposureLogger)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local contextualMenuContainsActionModule = require(profilePlatform.Utils.contextualMenuContainsAction)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local contextualMenuModule = require(profilePlatform.Components.CTARow.ContextualMenu)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior

return function(p1)
	-- upvalues: reactModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), fFlagProfileTradeItemsImpressionLoggingModule (ref), useProfileAnalyticsContextModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonVariant (ref), enumsModule (ref), contextualMenuContainsActionModule (ref), eventNamesModule (ref), iconButton (ref), button (ref), fillBehavior (ref), view (ref), contextualMenuModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local var4 = if fFlagProfileTradeItemsImpressionLoggingModule then useProfileAnalyticsContextModule() else nil
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return not p2
		end)
	end, {})
	local var7 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var5 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var5) }
			}
		end, { var5 }),
		isFocusable = var1
	})
	local var8 = reactModule.useRef(nil)
	local menuItem = p1.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = p1.buttonItem.contextualMenuItems
	local var9 = if p1.buttonItem.buttonStyle then p1.buttonItem.buttonStyle else buttonVariant.Standard
	local var10 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = p1.buttonItem.menuItem.isDisabled
	local var11 = reactModule.useCallback(function()
		-- upvalues: fFlagProfileTradeItemsExposureLoggingModule (copy), menuItem (ref), enumsModule (copy), var1 (ref), var3 (write), fFlagProfileTradeItemsImpressionLoggingModule (copy), contextualMenuContainsActionModule (copy), contextualMenuItems (ref), var4 (ref), eventNamesModule (copy), var10 (ref), var6 (ref)
		if fFlagProfileTradeItemsExposureLoggingModule and menuItem.id == enumsModule.ProfileActions.ContextualOverflow and not var1 then
			var3()
		end
		if fFlagProfileTradeItemsImpressionLoggingModule and menuItem.id == enumsModule.ProfileActions.ContextualOverflow and (not var1 and contextualMenuContainsActionModule(contextualMenuItems, enumsModule.ProfileActions.TradeItems)) then
			var4.fireAnalyticsEvent(eventNamesModule.ContextualMenuTradeItemsImpression, { buttonSurface = enumsModule.ButtonSurface.ContextualMenu })
		end
		if not var10 then
			menuItem.onActivated()
			
			return
		elseif not var1 then
			menuItem.onActivated()
		end
		var6()
	end, {
		var10, var1, menuItem.id, menuItem.onActivated, var6,
		if fFlagProfileTradeItemsExposureLoggingModule then var3 else nil,
		if fFlagProfileTradeItemsImpressionLoggingModule then var4 else nil,
		if fFlagProfileTradeItemsImpressionLoggingModule then contextualMenuItems else nil
	})
	local var12 = icon ~= nil and text == nil
	
	return reactModule.createElement(view, {
		tag = { ["auto-xy"] = var12, ["fill auto-y"] = not var12 },
		LayoutOrder = p1.layoutOrder
	}, {
		Button = if var12 then reactModule.createElement(iconButton, {
			icon = icon,
			LayoutOrder = p1.layoutOrder,
			onActivated = var11,
			variant = buttonVariant.Standard,
			ref = var8,
			isDisabled = isDisabled
		}) else reactModule.createElement(button, {
			text = text,
			icon = icon,
			onActivated = var11,
			fillBehavior = fillBehavior.Fill,
			variant = var9,
			isLoading = p1.buttonItem.isLoading,
			LayoutOrder = p1.layoutOrder,
			ref = var8,
			isDisabled = isDisabled
		}),
		ContextualMenu = if var10 then reactModule.createElement(contextualMenuModule, {
			isOpen = var1,
			menuItems = contextualMenuItems,
			anchorRef = var8,
			menuRef = var7,
			closeMenu = var5,
			align = p1.align
		}) else nil
	})
end