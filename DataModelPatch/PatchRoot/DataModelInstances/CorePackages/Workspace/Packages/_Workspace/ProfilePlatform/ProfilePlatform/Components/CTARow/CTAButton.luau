local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Components.CTARow.Types)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseAppFocusRootFunction = FocusNavigationUtilsModule.useAppFocusRoot
local ContextualMenuModule = require(ProfilePlatform.Components.CTARow.ContextualMenu)
local FFlagAddCTAButtonAnalyticsModule = require(ProfilePlatform.Flags.FFlagAddCTAButtonAnalytics)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseAppFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ButtonVariant (copy), FFlagAddCTAButtonAnalyticsModule (copy), IconButton (copy), Button (copy), FillBehavior (copy), View (copy), ContextualMenuModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseAppFocusRootResult = UseAppFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) }
			}
		end, { UseResult }),
		isFocusable = UseStateResult
	})
	local UseRefResult = ReactModule.useRef(nil)
	local MenuItem = p1.buttonItem.menuItem
	local DisplayValue = MenuItem.displayValue
	local Icon = DisplayValue.icon
	local Text = DisplayValue.text
	local ContextualMenuItems = p1.buttonItem.contextualMenuItems
	local ButtonStyle = if p1.buttonItem.buttonStyle then p1.buttonItem.buttonStyle else ButtonVariant.Standard
	local v1: boolean = ContextualMenuItems and #ContextualMenuItems > 0
	local IsDisabled = p1.buttonItem.menuItem.isDisabled
	local UseResult2 = if FFlagAddCTAButtonAnalyticsModule then ReactModule.useCallback(function()
		-- upvalues: v1 (copy), UseStateResult (copy), MenuItem (copy), UseResult1 (copy)
		if not v1 then
			MenuItem.onActivated()
			
			return
		end
		if not UseStateResult then
			MenuItem.onActivated()
		end
		UseResult1()
	end, { v1, UseStateResult, MenuItem.onActivated, UseResult1 }) elseif v1 then UseResult1 else MenuItem.onActivated
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
			ref = UseRefResult,
			isDisabled = IsDisabled
		}) else ReactModule.createElement(Button, {
			text = Text,
			icon = Icon,
			onActivated = UseResult2,
			fillBehavior = FillBehavior.Fill,
			variant = ButtonStyle,
			isLoading = p1.buttonItem.isLoading,
			LayoutOrder = p1.layoutOrder,
			ref = UseRefResult,
			isDisabled = IsDisabled
		}),
		ContextualMenu = if v1 then ReactModule.createElement(ContextualMenuModule, {
			isOpen = UseStateResult,
			menuItems = ContextualMenuItems,
			anchorRef = UseRefResult,
			menuRef = UseAppFocusRootResult,
			closeMenu = UseResult,
			align = p1.align
		}) else nil
	})
end