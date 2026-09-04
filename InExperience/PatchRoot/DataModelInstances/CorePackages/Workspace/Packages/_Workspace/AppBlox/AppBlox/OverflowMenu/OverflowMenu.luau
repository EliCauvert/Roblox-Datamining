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
local fFlagLuaAppSduiGameTileFeedback = sharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), overflowMenuRemoveCloseMenuChecks (ref), getOverflowMenuSignalStoreModule (ref), useOverflowMenuOpenModule (ref), cryoModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagSduiExperienceDetailsSupport (ref), iconButton (ref), threeDotsHorizontal (ref), iconSize (ref), buttonVariant (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref)
	local menuKey = p1.menuKey
	local var1 = reactModule.useRef(nil)
	local var2 = if overflowMenuRemoveCloseMenuChecks then nil else reactModule.useRef(nil)
	local var3 = getOverflowMenuSignalStoreModule()
	local var4 = useOverflowMenuOpenModule(menuKey)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var3 (ref), menuKey (ref), p1 (ref)
		var3.toggleMenu(menuKey)
		
		if p1.onMenuOpenChanged then
			p1.onMenuOpenChanged(var4)
		end
	end, { menuKey, var3, var4, p1.onMenuOpenChanged })
	local var6 = reactModule.useCallback(function()
		-- upvalues: overflowMenuRemoveCloseMenuChecks (copy), var2 (ref), p1 (ref), var3 (ref), menuKey (ref)
		if overflowMenuRemoveCloseMenuChecks or var2.current == Enum.GuiState.Idle or (not p1.hasOverflowButton or not p1.shouldShowAnchor) then
			var3.closeMenu(menuKey)
			
			if p1.onMenuOpenChanged then
				p1.onMenuOpenChanged(true)
			end
		end
	end, {
		if not overflowMenuRemoveCloseMenuChecks then p1.hasOverflowButton else nil,
		if not overflowMenuRemoveCloseMenuChecks then p1.shouldShowAnchor else nil,
		menuKey,
		var3,
		p1.onMenuOpenChanged
	})
	local var7 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var3 (ref), menuKey (ref)
		return cryoModule.List.map(p1.menuItems, function(p2)
			-- upvalues: var3 (copy), menuKey (copy), p1 (copy)
			return {
				icon = p2.icon,
				id = p2.id,
				text = p2.text,
				onActivated = function()
					-- upvalues: p2 (ref), var3 (copy), menuKey (copy), p1 (copy)
					task.spawn(function()
						-- upvalues: p2 (copy)
						p2.onActivated()
					end)
					var3.closeMenu(menuKey)
					
					if p1.onMenuOpenChanged then
						p1.onMenuOpenChanged(true)
					end
				end
			}
		end)
	end, { p1.menuItems, menuKey, var3, p1.onMenuOpenChanged })
	local var8 = reactModule.useRef(menuKey)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), menuKey (ref), var3 (ref)
		if var8.current ~= menuKey and var3 then
			var8.current = menuKey
			var3.closeMenu(menuKey)
		end
	end, { menuKey, var3 })
	local var9 = if not overflowMenuRemoveCloseMenuChecks then reactModule.useCallback(function()
		-- upvalues: var1 (ref), var2 (ref)
		if var1.current then
			var2.current = var1.current.GuiState
		end
	end, {}) else nil
	local var10, var11 = reactModule.useState(nil)
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref), p1 (ref)
		var11(p2)
		
		if p1.setFocusRef then
			p1.setFocusRef(p2)
		end
	end, { p1.setFocusRef })
	useFocusNavigableSurfaceRegistryConnection(var10, focusNavigableSurfaceIdentifierEnum.ContextualMenu, true)
	
	if not p1.shouldShowAnchor and not var4 then
		return nil
	end
	local frame
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var13 = nil
	local t = {}
	
	if p1.hasOverflowButton and (p1.shouldShowAnchor or var4) then
		frame = reactModule.createElement
		frame = frame(view, {
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			ZIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil,
			onStateChanged = if overflowMenuRemoveCloseMenuChecks then nil else var9,
			tag = if fFlagSduiExperienceDetailsSupport and p1.buttonTag ~= nil then p1.buttonTag else "auto-xy radius-circle",
			backgroundStyle = p1.buttonIconBackgroundStyle,
			ref = var1
		}, {
			IconButton = reactModule.createElement(iconButton, {
				icon = p1.buttonIcon or threeDotsHorizontal,
				isCircular = if fFlagSduiExperienceDetailsSupport and p1.buttonIsCircular ~= nil then p1.buttonIsCircular else true,
				onActivated = var5,
				size = p1.buttonIconSize or iconSize.Medium,
				variant = p1.buttonVariant or buttonVariant.Utility
			})
		})
	else
		frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			Size = UDim2.fromScale(0, 0),
			ZIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil,
			ref = var1
		})
	end
	t.MenuAnchor = frame
	t.OverflowMenu = if var4 then reactModule.createElement(menu, {
		isOpen = true,
		align = p1.popoverAlign or popoverAlign.End,
		items = var7,
		onPressedOutside = var6,
		side = p1.popoverSide or popoverSide.Bottom,
		size = p1.menuItemSize or inputSize.Medium,
		width = p1.menuWidth,
		anchorRef = var1,
		ref = var12
	}) else nil
	
	return createElement(fragment, var13, t)
end)