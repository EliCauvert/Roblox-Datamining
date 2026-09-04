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

return reactModule.memo(function(p1)
	-- upvalues: useUidRefString (ref), fFlagLuaAppSduiGameTileFeedback (ref), fFlagSduiExperienceDetailsSupport (ref), reactModule (ref), getOverflowMenuSignalStore (ref), useBackButtonBinding (ref), foundationModule (ref), overflowMenu (ref)
	local var1 = if fFlagLuaAppSduiGameTileFeedback and p1.menuKey then p1.menuKey else `sdui-overflow-menu-{useUidRefString().current}`
	local anchorPoint = p1.anchorPoint or Vector2.new(0, 0)
	local position = p1.position or UDim2.new(0, 0, 0, 0)
	local var2 = nil
	local var3 = nil
	
	if fFlagLuaAppSduiGameTileFeedback then
		var2 = p1.hasOverflowButton == nil or p1.hasOverflowButton
		var3 = p1.shouldShowAnchor == nil or p1.shouldShowAnchor
	end
	if not fFlagSduiExperienceDetailsSupport then
		return reactModule.createElement(overflowMenu, {
			anchorPoint = anchorPoint,
			anchorPosition = position,
			menuItems = p1.items,
			menuKey = var1,
			buttonVariant = p1.buttonVariant,
			buttonIconSize = p1.buttonSize,
			buttonIcon = p1.buttonIcon,
			buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
			menuItemSize = p1.menuItemSize,
			popoverAlign = p1.popoverAlign,
			popoverSide = p1.popoverSide,
			menuWidth = p1.menuWidth,
			hasOverflowButton = if fFlagLuaAppSduiGameTileFeedback then var2 else true,
			shouldShowAnchor = if fFlagLuaAppSduiGameTileFeedback then var3 else true,
			setFocusRef = if fFlagLuaAppSduiGameTileFeedback then p1.setFocusRef else nil,
			onMenuOpenChanged = if fFlagLuaAppSduiGameTileFeedback then p1.onMenuOpenChanged else nil,
			zIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil
		})
	end
	local var4 = useBackButtonBinding(reactModule.useCallback(function()
		-- upvalues: getOverflowMenuSignalStore (copy), var1 (ref)
		getOverflowMenuSignalStore().closeMenu(var1)
	end, { var1 }))
	local items = p1.items
	local var5 = 0
	
	for i in items do
		var5 += 1
	end
	if var5 ~= #items then
		local t = {}
		
		for i_1, v in items do
			table.insert(t, v)
		end
		items = t
	end
	local var6 = p1.layoutOrder ~= nil
	local t = {
		anchorPoint = if var6 then nil else anchorPoint,
		anchorPosition = if var6 then nil else position,
		menuItems = items,
		menuKey = var1,
		buttonVariant = p1.buttonVariant,
		buttonIconSize = p1.buttonSize,
		buttonIcon = p1.buttonIcon,
		buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
		menuItemSize = p1.menuItemSize,
		popoverAlign = p1.popoverAlign,
		popoverSide = p1.popoverSide,
		menuWidth = p1.menuWidth,
		hasOverflowButton = if fFlagLuaAppSduiGameTileFeedback then var2 else true,
		shouldShowAnchor = if fFlagLuaAppSduiGameTileFeedback then var3 else true,
		buttonIsCircular = if fFlagSduiExperienceDetailsSupport then p1.buttonIsCircular else nil,
		buttonTag = if fFlagSduiExperienceDetailsSupport then p1.buttonTag else nil,
		setFocusRef = if fFlagLuaAppSduiGameTileFeedback and p1.setFocusRef then p1.setFocusRef else var4,
		onMenuOpenChanged = if fFlagLuaAppSduiGameTileFeedback then p1.onMenuOpenChanged else nil,
		zIndex = if fFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil
	}
	
	return if var6 then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		OverflowMenu = reactModule.createElement(overflowMenu, t)
	}) else reactModule.createElement(overflowMenu, t)
end)