local appBlox = script:FindFirstAncestor("AppBlox")
local parent = appBlox.Parent
local builderIconsModule = require(parent.BuilderIcons)
local cryoModule = require(parent.Cryo)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local threeDotsHorizontal = builderIconsModule.Icon.ThreeDotsHorizontal
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useFocusNavigableSurfaceRegistryConnection = focusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local menu = foundationModule.Menu
local view = foundationModule.View
local getOverflowMenuSignalStoreModule = require(appBlox.OverflowMenu.getOverflowMenuSignalStore)
local useOverflowMenuOpenModule = require(appBlox.OverflowMenu.useOverflowMenuOpen)
local overflowMenuRemoveCloseMenuChecks = game:DefineFastFlag("OverflowMenuRemoveCloseMenuChecks", false)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), overflowMenuRemoveCloseMenuChecks (ref), getOverflowMenuSignalStoreModule (ref), useOverflowMenuOpenModule (ref), cryoModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref), fFlagSduiExperienceDetailsSupport (ref), iconButton (ref), threeDotsHorizontal (ref), iconSize (ref), buttonVariant (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref)
	local menuKey = p0.menuKey
	local var10 = reactModule.useRef(nil)
	local var11 = if overflowMenuRemoveCloseMenuChecks then nil else reactModule.useRef(nil)
	local var12 = getOverflowMenuSignalStoreModule()
	local var13 = useOverflowMenuOpenModule(menuKey)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var12 (ref), menuKey (ref), p0 (ref)
		var12.toggleMenu(menuKey)
		
		if p0.onMenuOpenChanged then
			p0.onMenuOpenChanged(var13)
		end
	end, { menuKey, var12, var13, p0.onMenuOpenChanged })
	local var15 = reactModule.useCallback(function()
		-- upvalues: overflowMenuRemoveCloseMenuChecks (copy), var11 (ref), p0 (ref), var12 (ref), menuKey (ref)
		if overflowMenuRemoveCloseMenuChecks or var11.current == Enum.GuiState.Idle or (not p0.hasOverflowButton or not p0.shouldShowAnchor) then
			var12.closeMenu(menuKey)
			
			if p0.onMenuOpenChanged then
				p0.onMenuOpenChanged(true)
			end
		end
	end, {
		if not overflowMenuRemoveCloseMenuChecks then p0.hasOverflowButton else nil,
		if not overflowMenuRemoveCloseMenuChecks then p0.shouldShowAnchor else nil,
		menuKey,
		var12,
		p0.onMenuOpenChanged
	})
	local var16 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref), var12 (ref), menuKey (ref)
		return cryoModule.List.map(p0.menuItems, function(p1)
			-- upvalues: var12 (copy), menuKey (copy), p0 (copy)
			return {
				icon = p1.icon,
				id = p1.id,
				text = p1.text,
				onActivated = function()
					-- upvalues: p1 (ref), var12 (copy), menuKey (copy), p0 (copy)
					task.spawn(function()
						-- upvalues: p1 (copy)
						p1.onActivated()
					end)
					var12.closeMenu(menuKey)
					
					if p0.onMenuOpenChanged then
						p0.onMenuOpenChanged(true)
					end
				end
			}
		end)
	end, { p0.menuItems, menuKey, var12, p0.onMenuOpenChanged })
	local var17 = reactModule.useRef(menuKey)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), menuKey (ref), var12 (ref)
		if var17.current ~= menuKey and var12 then
			var17.current = menuKey
			var12.closeMenu(menuKey)
		end
	end, { menuKey, var12 })
	local var18 = if not overflowMenuRemoveCloseMenuChecks then reactModule.useCallback(function()
		-- upvalues: var10 (ref), var11 (ref)
		if var10.current then
			var11.current = var10.current.GuiState
		end
	end, {}) else nil
	local var19, var20 = reactModule.useState(nil)
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var20 (ref), p0 (ref)
		var20(p2)
		
		if p0.setFocusRef then
			p0.setFocusRef(p2)
		end
	end, { p0.setFocusRef })
	useFocusNavigableSurfaceRegistryConnection(var19, focusNavigableSurfaceIdentifierEnum.ContextualMenu, true)
	
	if not p0.shouldShowAnchor and not var13 then
		return nil
	end
	local frame
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var22 = nil
	local t = {}
	
	if p0.hasOverflowButton and (p0.shouldShowAnchor or var13) then
		frame = reactModule.createElement
		frame = frame(view, {
			AnchorPoint = p0.anchorPoint,
			Position = p0.anchorPosition,
			onStateChanged = if overflowMenuRemoveCloseMenuChecks then nil else var18,
			tag = if fFlagSduiExperienceDetailsSupport and p0.buttonTag ~= nil then p0.buttonTag else "auto-xy radius-circle",
			backgroundStyle = p0.buttonIconBackgroundStyle,
			ref = var10
		}, {
			IconButton = reactModule.createElement(iconButton, {
				icon = p0.buttonIcon or threeDotsHorizontal,
				isCircular = if fFlagSduiExperienceDetailsSupport and p0.buttonIsCircular ~= nil then p0.buttonIsCircular else true,
				onActivated = var14,
				size = p0.buttonIconSize or iconSize.Medium,
				variant = p0.buttonVariant or buttonVariant.Utility
			})
		})
	else
		frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p0.anchorPoint,
			Position = p0.anchorPosition,
			Size = UDim2.fromScale(0, 0),
			ref = var10
		})
	end
	t.MenuAnchor = frame
	t.OverflowMenu = if var13 then reactModule.createElement(menu, {
		isOpen = true,
		align = p0.popoverAlign or popoverAlign.End,
		items = var16,
		onPressedOutside = var15,
		side = p0.popoverSide or popoverSide.Bottom,
		size = p0.menuItemSize or inputSize.Medium,
		width = p0.menuWidth,
		anchorRef = var10,
		ref = var21
	}) else nil
	
	return createElement(fragment, var22, t)
end)