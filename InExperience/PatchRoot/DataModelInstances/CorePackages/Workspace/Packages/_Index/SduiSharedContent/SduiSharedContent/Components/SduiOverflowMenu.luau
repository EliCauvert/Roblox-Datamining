local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local appBloxModule = require(parent.AppBlox)
local overflowMenu = appBloxModule.OverflowMenu
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local useBackButtonBinding = require(parent.SduiSharedUtilities).useBackButtonBinding
local useUidRefString = require(parent.SduiCoreSystem).useUidRefString
local _ = require(parent.SduiCompat)
local foundationModule = require(parent.Foundation)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppSduiGameTileFeedback = require(parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback

local function addMenuItemTelemetry(p1)
	local t = {}
	
	for i, v in p1 do
		if typeof(v.id) == "string" and v.id ~= "" then
			table.insert(t, v.id)
		end
	end
	local joined = table.concat(t, ",")
	local t_1 = {}
	
	for i_1, v_1 in p1 do
		if v_1.onActivated and typeof(v_1.id) == "string" and v_1.id ~= "" then
			local cloned = table.clone(v_1)
			
			function cloned.onActivated(_, _, _)
				-- upvalues: v_1 (ref), joined (ref)
				v_1.onActivated(nil, nil, { menuItemId = v_1.id, availableMenuItemIds = joined })
			end
			
			table.insert(t_1, cloned)
		else
			table.insert(t_1, v_1)
		end
	end
	return t_1
end

return reactModule.memo(function(p2)
	-- upvalues: useUidRefString (ref), fFlagLuaAppSduiGameTileFeedback (ref), reactModule (ref), addMenuItemTelemetry (ref), fFlagSduiExperienceDetailsSupport (ref), getOverflowMenuSignalStore (ref), useBackButtonBinding (ref), foundationModule (ref), overflowMenu (ref)
	local var1 = if fFlagLuaAppSduiGameTileFeedback and p2.menuKey then p2.menuKey else `sdui-overflow-menu-{useUidRefString().current}`
	local anchorPoint = p2.anchorPoint or Vector2.new(0, 0)
	local position = p2.position or UDim2.new(0, 0, 0, 0)
	local var2 = nil
	local var3 = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var2 = p2.hasOverflowButton == nil or p2.hasOverflowButton
		var3 = p2.shouldShowAnchor == nil or p2.shouldShowAnchor
	end
	local var4 = if fFlagLuaAppSduiGameTileFeedback then reactModule.useMemo(function()
		-- upvalues: p2 (ref), addMenuItemTelemetry (copy)
		return if p2.includeMenuItemTelemetry then addMenuItemTelemetry(p2.items) else p2.items
	end, { p2.items, p2.includeMenuItemTelemetry }) else nil
	
	if not fFlagSduiExperienceDetailsSupport then
		return reactModule.createElement(overflowMenu, {
			anchorPoint = anchorPoint,
			anchorPosition = position,
			menuItems = if fFlagLuaAppSduiGameTileFeedback then var4 else p2.items,
			menuKey = var1,
			buttonVariant = p2.buttonVariant,
			buttonIconSize = p2.buttonSize,
			buttonIcon = p2.buttonIcon,
			buttonIconBackgroundStyle = p2.buttonIconBackgroundStyle,
			menuItemSize = p2.menuItemSize,
			popoverAlign = p2.popoverAlign,
			popoverSide = p2.popoverSide,
			menuWidth = p2.menuWidth,
			hasOverflowButton = if fFlagLuaAppSduiGameTileFeedback then var2 else true,
			shouldShowAnchor = if fFlagLuaAppSduiGameTileFeedback then var3 else true,
			setFocusRef = if fFlagLuaAppSduiGameTileFeedback then p2.setFocusRef else nil,
			onMenuOpenChanged = if fFlagLuaAppSduiGameTileFeedback then p2.onMenuOpenChanged else nil,
			zIndex = if fFlagLuaAppSduiGameTileFeedback then p2.zIndex else nil
		})
	end
	local var5 = useBackButtonBinding(reactModule.useCallback(function()
		-- upvalues: getOverflowMenuSignalStore (copy), var1 (ref)
		getOverflowMenuSignalStore().closeMenu(var1)
	end, { var1 }))
	local var6 = if fFlagLuaAppSduiGameTileFeedback then var4 else p2.items
	local var7 = 0
	
	for i in var6 do
		var7 += 1
	end
	if var7 ~= #var6 then
		local t = {}
		
		for i_1, v in var6 do
			table.insert(t, v)
		end
		var6 = t
	end
	local var8 = p2.layoutOrder ~= nil
	local t = {
		anchorPoint = if var8 then nil else anchorPoint,
		anchorPosition = if var8 then nil else position,
		menuItems = var6,
		menuKey = var1,
		buttonVariant = p2.buttonVariant,
		buttonIconSize = p2.buttonSize,
		buttonIcon = p2.buttonIcon,
		buttonIconBackgroundStyle = p2.buttonIconBackgroundStyle,
		menuItemSize = p2.menuItemSize,
		popoverAlign = p2.popoverAlign,
		popoverSide = p2.popoverSide,
		menuWidth = p2.menuWidth,
		hasOverflowButton = if fFlagLuaAppSduiGameTileFeedback then var2 else true,
		shouldShowAnchor = if fFlagLuaAppSduiGameTileFeedback then var3 else true,
		buttonIsCircular = if fFlagSduiExperienceDetailsSupport then p2.buttonIsCircular else nil,
		buttonTag = if fFlagSduiExperienceDetailsSupport then p2.buttonTag else nil,
		setFocusRef = if fFlagLuaAppSduiGameTileFeedback and p2.setFocusRef then p2.setFocusRef else var5,
		onMenuOpenChanged = if fFlagLuaAppSduiGameTileFeedback then p2.onMenuOpenChanged else nil,
		zIndex = if fFlagLuaAppSduiGameTileFeedback then p2.zIndex else nil
	}
	
	return if var8 then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = p2.layoutOrder }, {
		OverflowMenu = reactModule.createElement(overflowMenu, t)
	}) else reactModule.createElement(overflowMenu, t)
end)