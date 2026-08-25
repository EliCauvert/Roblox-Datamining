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

return reactModule.memo(function(p0)
	-- upvalues: useUidRefString (ref), fFlagSduiExperienceDetailsSupport (ref), reactModule (ref), getOverflowMenuSignalStore (ref), useBackButtonBinding (ref), foundationModule (ref), overflowMenu (ref)
	local current = `sdui-overflow-menu-{useUidRefString().current}`
	local anchorPoint = p0.anchorPoint or Vector2.new(0, 0)
	local position = p0.position or UDim2.new(0, 0, 0, 0)
	
	if not fFlagSduiExperienceDetailsSupport then
		return reactModule.createElement(overflowMenu, {
			hasOverflowButton = true,
			shouldShowAnchor = true,
			anchorPoint = anchorPoint,
			anchorPosition = position,
			menuItems = p0.items,
			menuKey = current,
			buttonVariant = p0.buttonVariant,
			buttonIconSize = p0.buttonSize,
			buttonIcon = p0.buttonIcon,
			buttonIconBackgroundStyle = p0.buttonIconBackgroundStyle,
			menuItemSize = p0.menuItemSize,
			popoverAlign = p0.popoverAlign,
			popoverSide = p0.popoverSide,
			menuWidth = p0.menuWidth
		})
	end
	local var6 = useBackButtonBinding(reactModule.useCallback(function()
		-- upvalues: getOverflowMenuSignalStore (copy), current (ref)
		getOverflowMenuSignalStore().closeMenu(current)
	end, { current }))
	local items = p0.items
	local var7 = 0
	
	for i in items do
		var7 += 1
	end
	if var7 ~= #items then
		local t = {}
		
		for i_1, v in items do
			table.insert(t, v)
		end
		items = t
	end
	local var9 = p0.layoutOrder ~= nil
	local t = {
		hasOverflowButton = true,
		shouldShowAnchor = true,
		anchorPoint = if var9 then nil else anchorPoint,
		anchorPosition = if var9 then nil else position,
		menuItems = items,
		menuKey = current,
		buttonVariant = p0.buttonVariant,
		buttonIconSize = p0.buttonSize,
		buttonIcon = p0.buttonIcon,
		buttonIconBackgroundStyle = p0.buttonIconBackgroundStyle,
		menuItemSize = p0.menuItemSize,
		popoverAlign = p0.popoverAlign,
		popoverSide = p0.popoverSide,
		menuWidth = p0.menuWidth,
		buttonIsCircular = if fFlagSduiExperienceDetailsSupport then p0.buttonIsCircular else nil,
		buttonTag = if fFlagSduiExperienceDetailsSupport then p0.buttonTag else nil,
		setFocusRef = var6
	}
	
	return if var9 then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = p0.layoutOrder }, {
		OverflowMenu = reactModule.createElement(overflowMenu, t)
	}) else reactModule.createElement(overflowMenu, t)
end)