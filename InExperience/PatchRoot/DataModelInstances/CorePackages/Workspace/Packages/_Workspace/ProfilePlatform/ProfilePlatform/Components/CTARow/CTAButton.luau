local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfileTradeItemsExposureLoggingModule = require(profilePlatform.Flags.FFlagProfileTradeItemsExposureLogging)
local useTradeItemsExposureLoggerModule = require(profilePlatform.Hooks.useTradeItemsExposureLogger)
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
	-- upvalues: reactModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonVariant (ref), enumsModule (ref), iconButton (ref), button (ref), fillBehavior (ref), view (ref), contextualMenuModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(function(p2)
			return not p2
		end)
	end, {})
	local var6 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var4 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var4) }
			}
		end, { var4 }),
		isFocusable = var1
	})
	local var7 = reactModule.useRef(nil)
	local menuItem = p1.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = p1.buttonItem.contextualMenuItems
	local var8 = if p1.buttonItem.buttonStyle then p1.buttonItem.buttonStyle else buttonVariant.Standard
	local var9 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = p1.buttonItem.menuItem.isDisabled
	local var10 = reactModule.useCallback(function()
		-- upvalues: fFlagProfileTradeItemsExposureLoggingModule (copy), menuItem (ref), enumsModule (copy), var1 (ref), var3 (write), var9 (ref), var5 (ref)
		if fFlagProfileTradeItemsExposureLoggingModule and menuItem.id == enumsModule.ProfileActions.ContextualOverflow and not var1 then
			var3()
		end
		if not var9 then
			menuItem.onActivated()
			
			return
		elseif not var1 then
			menuItem.onActivated()
		end
		var5()
	end, {
		var9, var1, menuItem.id, menuItem.onActivated, var5,
		if fFlagProfileTradeItemsExposureLoggingModule then var3 else nil
	})
	local var11 = icon ~= nil and text == nil
	
	return reactModule.createElement(view, {
		tag = { ["auto-xy"] = var11, ["fill auto-y"] = not var11 },
		LayoutOrder = p1.layoutOrder
	}, {
		Button = if var11 then reactModule.createElement(iconButton, {
			icon = icon,
			LayoutOrder = p1.layoutOrder,
			onActivated = var10,
			variant = buttonVariant.Standard,
			ref = var7,
			isDisabled = isDisabled
		}) else reactModule.createElement(button, {
			text = text,
			icon = icon,
			onActivated = var10,
			fillBehavior = fillBehavior.Fill,
			variant = var8,
			isLoading = p1.buttonItem.isLoading,
			LayoutOrder = p1.layoutOrder,
			ref = var7,
			isDisabled = isDisabled
		}),
		ContextualMenu = if var9 then reactModule.createElement(contextualMenuModule, {
			isOpen = var1,
			menuItems = contextualMenuItems,
			anchorRef = var7,
			menuRef = var6,
			closeMenu = var4,
			align = p1.align
		}) else nil
	})
end