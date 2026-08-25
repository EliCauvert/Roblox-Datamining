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

return function(p0)
	-- upvalues: reactModule (ref), fFlagProfileTradeItemsExposureLoggingModule (ref), useTradeItemsExposureLoggerModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonVariant (ref), enumsModule (ref), iconButton (ref), button (ref), fillBehavior (ref), view (ref), contextualMenuModule (ref)
	local var9, var10 = reactModule.useState(false)
	local var11 = if fFlagProfileTradeItemsExposureLoggingModule then useTradeItemsExposureLoggerModule() else nil
	local var12 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(false)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var10 (ref)
		var10(function(p1)
			return not p1
		end)
	end, {})
	local var14 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var12 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var12) }
			}
		end, { var12 }),
		isFocusable = var9
	})
	local var15 = reactModule.useRef(nil)
	local menuItem = p0.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = p0.buttonItem.contextualMenuItems
	local var16 = if p0.buttonItem.buttonStyle then p0.buttonItem.buttonStyle else buttonVariant.Standard
	local var17 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = p0.buttonItem.menuItem.isDisabled
	local var18 = reactModule.useCallback(function()
		-- upvalues: fFlagProfileTradeItemsExposureLoggingModule (copy), menuItem (ref), enumsModule (copy), var9 (ref), var11 (write), var17 (ref), var13 (ref)
		if fFlagProfileTradeItemsExposureLoggingModule and menuItem.id == enumsModule.ProfileActions.ContextualOverflow and not var9 then
			var11()
		end
		if not var17 then
			menuItem.onActivated()
			
			return
		elseif not var9 then
			menuItem.onActivated()
		end
		var13()
	end, {
		var17, var9, menuItem.id, menuItem.onActivated, var13,
		if fFlagProfileTradeItemsExposureLoggingModule then var11 else nil
	})
	local var19 = icon ~= nil and text == nil
	
	return reactModule.createElement(view, {
		tag = { ["auto-xy"] = var19, ["fill auto-y"] = not var19 },
		LayoutOrder = p0.layoutOrder
	}, {
		Button = if var19 then reactModule.createElement(iconButton, {
			icon = icon,
			LayoutOrder = p0.layoutOrder,
			onActivated = var18,
			variant = buttonVariant.Standard,
			ref = var15,
			isDisabled = isDisabled
		}) else reactModule.createElement(button, {
			text = text,
			icon = icon,
			onActivated = var18,
			fillBehavior = fillBehavior.Fill,
			variant = var16,
			isLoading = p0.buttonItem.isLoading,
			LayoutOrder = p0.layoutOrder,
			ref = var15,
			isDisabled = isDisabled
		}),
		ContextualMenu = if var17 then reactModule.createElement(contextualMenuModule, {
			isOpen = var9,
			menuItems = contextualMenuItems,
			anchorRef = var15,
			menuRef = var14,
			closeMenu = var12,
			align = p0.align
		}) else nil
	})
end