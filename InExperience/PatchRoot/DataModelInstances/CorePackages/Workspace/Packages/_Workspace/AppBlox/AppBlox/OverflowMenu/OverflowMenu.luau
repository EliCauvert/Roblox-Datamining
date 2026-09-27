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
local fFlagLuaAppSduiGameTileFeedback = sharedFlagsModule.FFlagLuaAppSduiGameTileFeedback

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getOverflowMenuSignalStoreModule (ref), useOverflowMenuOpenModule (ref), cryoModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref), fFlagLuaAppSduiGameTileFeedback (ref), iconButton (ref), threeDotsHorizontal (ref), iconSize (ref), buttonVariant (ref), menu (ref), popoverAlign (ref), popoverSide (ref), inputSize (ref)
	local menuKey = p1.menuKey
	local var1 = reactModule.useRef(nil)
	local var2 = getOverflowMenuSignalStoreModule()
	local var3 = useOverflowMenuOpenModule(menuKey)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), menuKey (ref), p1 (ref)
		var2.toggleMenu(menuKey)
		
		if p1.onMenuOpenChanged then
			p1.onMenuOpenChanged(var3)
		end
	end, { menuKey, var2, var3, p1.onMenuOpenChanged })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), menuKey (ref), p1 (ref)
		var2.closeMenu(menuKey)
		
		if p1.onMenuOpenChanged then
			p1.onMenuOpenChanged(true)
		end
	end, { menuKey, var2, p1.onMenuOpenChanged })
	local var6 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var2 (ref), menuKey (ref)
		return cryoModule.List.map(p1.menuItems, function(p2)
			-- upvalues: var2 (copy), menuKey (copy), p1 (copy)
			return {
				icon = p2.icon,
				id = p2.id,
				text = p2.text,
				onActivated = function()
					-- upvalues: p2 (ref), var2 (copy), menuKey (copy), p1 (copy)
					task.spawn(function()
						-- upvalues: p2 (copy)
						p2.onActivated()
					end)
					var2.closeMenu(menuKey)
					
					if p1.onMenuOpenChanged then
						p1.onMenuOpenChanged(true)
					end
				end
			}
		end)
	end, { p1.menuItems, menuKey, var2, p1.onMenuOpenChanged })
	local var7 = reactModule.useRef(menuKey)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), menuKey (ref), var2 (ref)
		if var7.current ~= menuKey and var2 then
			var7.current = menuKey
			var2.closeMenu(menuKey)
		end
	end, { menuKey, var2 })
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), p1 (ref)
		var9(p2)
		
		if p1.setFocusRef then
			p1.setFocusRef(p2)
		end
	end, { p1.setFocusRef })
	useFocusNavigableSurfaceRegistryConnection(var8, focusNavigableSurfaceIdentifierEnum.ContextualMenu, true)
	
	return if not (not p1.shouldShowAnchor and not var3) then reactModule.createElement(reactModule.Fragment, nil, {
		MenuAnchor = if p1.hasOverflowButton and (p1.shouldShowAnchor or var3) then reactModule.createElement(view, {
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			ZIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil,
			tag = if p1.buttonTag ~= nil then "auto-xy radius-circle" else p1.buttonTag,
			backgroundStyle = p1.buttonIconBackgroundStyle,
			ref = var1
		}, {
			IconButton = reactModule.createElement(iconButton, {
				icon = p1.buttonIcon or threeDotsHorizontal,
				isCircular = p1.buttonIsCircular ~= nil or p1.buttonIsCircular,
				onActivated = var4,
				size = p1.buttonIconSize or iconSize.Medium,
				variant = p1.buttonVariant or buttonVariant.Utility
			})
		}) else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = p1.anchorPoint,
			Position = p1.anchorPosition,
			Size = UDim2.fromScale(0, 0),
			ZIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil,
			ref = var1
		}),
		OverflowMenu = if var3 then reactModule.createElement(menu, {
			isOpen = true,
			align = p1.popoverAlign or popoverAlign.End,
			items = var6,
			onPressedOutside = var5,
			side = p1.popoverSide or popoverSide.Bottom,
			size = p1.menuItemSize or inputSize.Medium,
			width = p1.menuWidth,
			anchorRef = var1,
			ref = var10
		}) else nil
	}) else nil
end)