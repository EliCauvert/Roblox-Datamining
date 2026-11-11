local AppBlox = script:FindFirstAncestor("AppBlox")
local Parent = AppBlox.Parent
local CryoModule = require(Parent.Cryo)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local ThreeDotsHorizontal = require(Parent.BuilderIcons).Icon.ThreeDotsHorizontal
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local Menu = FoundationModule.Menu
local View = FoundationModule.View
local GetOverflowMenuSignalStoreModule = require(AppBlox.OverflowMenu.getOverflowMenuSignalStore)
local UseOverflowMenuOpenModule = require(AppBlox.OverflowMenu.useOverflowMenuOpen)
local FFlagLuaAppGameTileOverflowMenuTelemetry = SharedFlagsModule.FFlagLuaAppGameTileOverflowMenuTelemetry
local OverflowMenuRemoveCloseMenuChecks = game:DefineFastFlag("OverflowMenuRemoveCloseMenuChecks", false)
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), OverflowMenuRemoveCloseMenuChecks (copy), GetOverflowMenuSignalStoreModule (copy), UseOverflowMenuOpenModule (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (copy), CryoModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), View (copy), FFlagSduiExperienceDetailsSupport (copy), IconButton (copy), ThreeDotsHorizontal (copy), IconSize (copy), ButtonVariant (copy), Menu (copy), PopoverAlign (copy), PopoverSide (copy), InputSize (copy)
	local MenuKey = p1.menuKey
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if OverflowMenuRemoveCloseMenuChecks then nil else ReactModule.useRef(nil)
	local OverflowMenuSignalStoreModule = GetOverflowMenuSignalStoreModule()
	local UseOverflowMenuOpenModuleResult = UseOverflowMenuOpenModule(MenuKey)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagLuaAppGameTileOverflowMenuTelemetry (upval), UseOverflowMenuOpenModuleResult (copy), OverflowMenuSignalStoreModule (copy), MenuKey (copy), p1 (copy)
		local UseOverflowMenuOpenModuleResult1 = if FFlagLuaAppGameTileOverflowMenuTelemetry then UseOverflowMenuOpenModuleResult else nil
		OverflowMenuSignalStoreModule.toggleMenu(MenuKey)
		
		if FFlagLuaAppGameTileOverflowMenuTelemetry and p1.onMenuOpenChanged then
			p1.onMenuOpenChanged(UseOverflowMenuOpenModuleResult1)
		end
	end, {
		MenuKey,
		OverflowMenuSignalStoreModule,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then UseOverflowMenuOpenModuleResult else nil,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then p1.onMenuOpenChanged else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OverflowMenuRemoveCloseMenuChecks (upval), UseRefResult1 (copy), p1 (copy), OverflowMenuSignalStoreModule (copy), MenuKey (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (upval)
		if OverflowMenuRemoveCloseMenuChecks or UseRefResult1.current == Enum.GuiState.Idle or not p1.hasOverflowButton or not p1.shouldShowAnchor then
			OverflowMenuSignalStoreModule.closeMenu(MenuKey)
			
			if FFlagLuaAppGameTileOverflowMenuTelemetry and p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(true)
			end
		end
	end, {
		if OverflowMenuRemoveCloseMenuChecks then nil else p1.hasOverflowButton,
		if OverflowMenuRemoveCloseMenuChecks then nil else p1.shouldShowAnchor,
		MenuKey,
		OverflowMenuSignalStoreModule,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then p1.onMenuOpenChanged else nil
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), OverflowMenuSignalStoreModule (copy), MenuKey (copy), FFlagLuaAppGameTileOverflowMenuTelemetry (upval)
		return CryoModule.List.map(p1.menuItems, function(p2)
			-- upvalues: OverflowMenuSignalStoreModule (upval), MenuKey (upval), FFlagLuaAppGameTileOverflowMenuTelemetry (upval), p1 (upval)
			return {
				icon = p2.icon,
				id = p2.id,
				text = p2.text,
				onActivated = function()
					-- upvalues: p2 (copy), OverflowMenuSignalStoreModule (upval), MenuKey (upval), FFlagLuaAppGameTileOverflowMenuTelemetry (upval), p1 (upval)
					task.spawn(function()
						-- upvalues: p2 (upval)
						p2.onActivated()
					end)
					OverflowMenuSignalStoreModule.closeMenu(MenuKey)
					
					if FFlagLuaAppGameTileOverflowMenuTelemetry and p1.onMenuOpenChanged then
						p1.onMenuOpenChanged(true)
					end
				end
			}
		end)
	end, {
		p1.menuItems,
		MenuKey,
		OverflowMenuSignalStoreModule,
		if FFlagLuaAppGameTileOverflowMenuTelemetry then p1.onMenuOpenChanged else nil
	})
	local UseRefResult2 = ReactModule.useRef(MenuKey)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), MenuKey (copy), OverflowMenuSignalStoreModule (copy)
		if UseRefResult2.current ~= MenuKey and OverflowMenuSignalStoreModule then
			UseRefResult2.current = MenuKey
			OverflowMenuSignalStoreModule.closeMenu(MenuKey)
		end
	end, { MenuKey, OverflowMenuSignalStoreModule })
	local UseResult2 = if OverflowMenuRemoveCloseMenuChecks then nil else ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult1.current = UseRefResult.current.GuiState
		end
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p2)
		
		if p1.setFocusRef then
			p1.setFocusRef(p2)
		end
	end, { p1.setFocusRef })
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseStateResult, FocusNavigableSurfaceIdentifierEnum.ContextualMenu, true)
	
	return if p1.shouldShowAnchor or UseOverflowMenuOpenModuleResult then ReactModule.createElement(ReactModule.Fragment, nil, {
		MenuAnchor = if p1.hasOverflowButton and (p1.shouldShowAnchor or UseOverflowMenuOpenModuleResult) then ReactModule.createElement(View, {
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			onStateChanged = if OverflowMenuRemoveCloseMenuChecks then nil else UseResult2,
			tag = if FFlagSduiExperienceDetailsSupport and p1.buttonTag ~= nil then p1.buttonTag else "auto-xy radius-circle",
			backgroundStyle = p1.buttonIconBackgroundStyle,
			ref = UseRefResult
		}, {
			IconButton = ReactModule.createElement(IconButton, {
				icon = p1.buttonIcon or ThreeDotsHorizontal,
				isCircular = not FFlagSduiExperienceDetailsSupport or p1.buttonIsCircular == nil or p1.buttonIsCircular,
				onActivated = UseResult,
				size = p1.buttonIconSize or IconSize.Medium,
				variant = p1.buttonVariant or ButtonVariant.Utility
			})
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			Size = UDim2.fromScale(0, 0),
			ref = UseRefResult
		}),
		OverflowMenu = if UseOverflowMenuOpenModuleResult then ReactModule.createElement(Menu, {
			isOpen = true,
			align = p1.popoverAlign or PopoverAlign.End,
			items = UseMemoResult,
			onPressedOutside = UseResult1,
			side = p1.popoverSide or PopoverSide.Bottom,
			size = p1.menuItemSize or InputSize.Medium,
			width = p1.menuWidth,
			anchorRef = UseRefResult,
			ref = UseResult3
		}) else nil
	}) else nil
end)