local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useAppFocusRoot = focusNavigationUtilsModule.useAppFocusRoot
local contextualMenuModule = require(profilePlatform.Components.CTARow.ContextualMenu)
local fFlagAddCTAButtonAnalyticsModule = require(profilePlatform.Flags.FFlagAddCTAButtonAnalytics)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior

return function(p0) --[[ line: 42 | named "CTAButton" ]]
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonVariant (ref), fFlagAddCTAButtonAnalyticsModule (ref), iconButton (ref), button (ref), fillBehavior (ref), view (ref), contextualMenuModule (ref)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: var8 (ref)
		var8(false)
	end, {})
	local var10 = reactModule.useCallback(function() --[[ line: 49 ]]
		-- upvalues: var8 (ref)
		var8(function(p1) --[[ line: 50 ]]
			return not p1
		end)
	end, {})
	local var11 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = reactModule.useMemo(function() --[[ line: 55 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var9 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var9) }
			}
		end, { var9 }),
		isFocusable = var7
	})
	local var12 = reactModule.useRef(nil)
	local menuItem = p0.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = p0.buttonItem.contextualMenuItems
	local var13 = if p0.buttonItem.buttonStyle then p0.buttonItem.buttonStyle else buttonVariant.Standard
	local var14 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = p0.buttonItem.menuItem.isDisabled
	local var15 = if fFlagAddCTAButtonAnalyticsModule then reactModule.useCallback(function() --[[ line: 81 ]]
		-- upvalues: var14 (ref), var7 (ref), menuItem (ref), var10 (ref)
		if not var14 then
			menuItem.onActivated()
			
			return
		elseif not var7 then
			menuItem.onActivated()
		end
		var10()
	end, { var14, var7, menuItem.onActivated, var10 }) elseif var14 then var10 else menuItem.onActivated
	local var16 = icon ~= nil and text == nil
	
	return reactModule.createElement(view, {
		tag = { ["auto-xy"] = var16, ["fill auto-y"] = not var16 },
		LayoutOrder = p0.layoutOrder
	}, {
		Button = if var16 then reactModule.createElement(iconButton, {
			icon = icon,
			LayoutOrder = p0.layoutOrder,
			onActivated = var15,
			variant = buttonVariant.Standard,
			ref = var12,
			isDisabled = isDisabled
		}) else reactModule.createElement(button, {
			text = text,
			icon = icon,
			onActivated = var15,
			fillBehavior = fillBehavior.Fill,
			variant = var13,
			isLoading = p0.buttonItem.isLoading,
			LayoutOrder = p0.layoutOrder,
			ref = var12,
			isDisabled = isDisabled
		}),
		ContextualMenu = if var14 then reactModule.createElement(contextualMenuModule, {
			isOpen = var7,
			menuItems = contextualMenuItems,
			anchorRef = var12,
			menuRef = var11,
			closeMenu = var9,
			align = p0.align
		}) else nil
	})
end