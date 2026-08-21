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
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior

return function(p0) --[[ line: 40 | named "CTAButton" ]]
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useAppFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), buttonVariant (ref), iconButton (ref), button (ref), fillBehavior (ref), view (ref), contextualMenuModule (ref)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function() --[[ line: 43 ]]
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	local var9 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var7 (ref)
		var7(function(p1) --[[ line: 48 ]]
			return not p1
		end)
	end, {})
	local var10 = useAppFocusRoot({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = reactModule.useMemo(function() --[[ line: 53 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var8 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var8) }
			}
		end, { var8 }),
		isFocusable = var6
	})
	local var11 = reactModule.useRef(nil)
	local menuItem = p0.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = p0.buttonItem.contextualMenuItems
	local var12 = if p0.buttonItem.buttonStyle then p0.buttonItem.buttonStyle else buttonVariant.Standard
	local var13 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = p0.buttonItem.menuItem.isDisabled
	local var14 = reactModule.useCallback(function() --[[ line: 78 ]]
		-- upvalues: var13 (ref), var6 (ref), menuItem (ref), var9 (ref)
		if not var13 then
			menuItem.onActivated()
			
			return
		elseif not var6 then
			menuItem.onActivated()
		end
		var9()
	end, { var13, var6, menuItem.onActivated, var9 })
	local var15 = icon ~= nil and text == nil
	
	return reactModule.createElement(view, {
		tag = { ["auto-xy"] = var15, ["fill auto-y"] = not var15 },
		LayoutOrder = p0.layoutOrder
	}, {
		Button = if var15 then reactModule.createElement(iconButton, {
			icon = icon,
			LayoutOrder = p0.layoutOrder,
			onActivated = var14,
			variant = buttonVariant.Standard,
			ref = var11,
			isDisabled = isDisabled
		}) else reactModule.createElement(button, {
			text = text,
			icon = icon,
			onActivated = var14,
			fillBehavior = fillBehavior.Fill,
			variant = var12,
			isLoading = p0.buttonItem.isLoading,
			LayoutOrder = p0.layoutOrder,
			ref = var11,
			isDisabled = isDisabled
		}),
		ContextualMenu = if var13 then reactModule.createElement(contextualMenuModule, {
			isOpen = var6,
			menuItems = contextualMenuItems,
			anchorRef = var11,
			menuRef = var10,
			closeMenu = var8,
			align = p0.align
		}) else nil
	})
end