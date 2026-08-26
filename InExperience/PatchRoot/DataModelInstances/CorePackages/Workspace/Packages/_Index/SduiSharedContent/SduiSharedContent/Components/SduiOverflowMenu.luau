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

return reactModule.memo(function(p1)
	-- upvalues: useUidRefString (ref), fFlagSduiExperienceDetailsSupport (ref), reactModule (ref), getOverflowMenuSignalStore (ref), useBackButtonBinding (ref), foundationModule (ref), overflowMenu (ref)
	local current = `sdui-overflow-menu-{useUidRefString().current}`
	local anchorPoint = p1.anchorPoint or Vector2.new(0, 0)
	local position = p1.position or UDim2.new(0, 0, 0, 0)
	
	if not fFlagSduiExperienceDetailsSupport then
		return reactModule.createElement(overflowMenu, {
			hasOverflowButton = true,
			shouldShowAnchor = true,
			anchorPoint = anchorPoint,
			anchorPosition = position,
			menuItems = p1.items,
			menuKey = current,
			buttonVariant = p1.buttonVariant,
			buttonIconSize = p1.buttonSize,
			buttonIcon = p1.buttonIcon,
			buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
			menuItemSize = p1.menuItemSize,
			popoverAlign = p1.popoverAlign,
			popoverSide = p1.popoverSide,
			menuWidth = p1.menuWidth
		})
	end
	local var1 = useBackButtonBinding(reactModule.useCallback(function()
		-- upvalues: getOverflowMenuSignalStore (copy), current (ref)
		getOverflowMenuSignalStore().closeMenu(current)
	end, { current }))
	local items = p1.items
	local var2 = 0
	
	for i in items do
		var2 += 1
	end
	if var2 ~= #items then
		local t = {}
		
		for i_1, v in items do
			table.insert(t, v)
		end
		items = t
	end
	local var3 = p1.layoutOrder ~= nil
	local t = {
		hasOverflowButton = true,
		shouldShowAnchor = true,
		anchorPoint = if var3 then nil else anchorPoint,
		anchorPosition = if var3 then nil else position,
		menuItems = items,
		menuKey = current,
		buttonVariant = p1.buttonVariant,
		buttonIconSize = p1.buttonSize,
		buttonIcon = p1.buttonIcon,
		buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
		menuItemSize = p1.menuItemSize,
		popoverAlign = p1.popoverAlign,
		popoverSide = p1.popoverSide,
		menuWidth = p1.menuWidth,
		buttonIsCircular = if fFlagSduiExperienceDetailsSupport then p1.buttonIsCircular else nil,
		buttonTag = if fFlagSduiExperienceDetailsSupport then p1.buttonTag else nil,
		setFocusRef = var1
	}
	
	return if var3 then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		OverflowMenu = reactModule.createElement(overflowMenu, t)
	}) else reactModule.createElement(overflowMenu, t)
end)