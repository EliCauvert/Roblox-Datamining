local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local AppBloxModule = require(Parent.AppBlox)
local OverflowMenu = AppBloxModule.OverflowMenu
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseBackButtonBindingFunction = require(Parent.SduiSharedUtilities).useBackButtonBinding
local UseUidRefStringFunction = require(Parent.SduiCoreSystem).useUidRefString
local _ = require(Parent.SduiCompat)
local FoundationModule = require(Parent.Foundation)
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return ReactModule.memo(function(p1)
	-- upvalues: UseUidRefStringFunction (copy), FFlagSduiExperienceDetailsSupport (copy), ReactModule (copy), GetOverflowMenuSignalStoreFunction (copy), UseBackButtonBindingFunction (copy), FoundationModule (copy), OverflowMenu (copy)
	local OverflowName: string = `sdui-overflow-menu-{UseUidRefStringFunction().current}`
	local AnchorPoint = p1.anchorPoint or Vector2.new(0, 0)
	local Position = p1.position or UDim2.new(0, 0, 0, 0)
	
	if not FFlagSduiExperienceDetailsSupport then
		return ReactModule.createElement(OverflowMenu, {
			hasOverflowButton = true,
			shouldShowAnchor = true,
			anchorPoint = AnchorPoint,
			anchorPosition = Position,
			menuItems = p1.items,
			menuKey = OverflowName,
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
	local UseBackButtonBindingResult = UseBackButtonBindingFunction((ReactModule.useCallback(function()
		-- upvalues: GetOverflowMenuSignalStoreFunction (upval), OverflowName (copy)
		GetOverflowMenuSignalStoreFunction().closeMenu(OverflowName)
	end, { OverflowName })))
	local Items = p1.items
	local Count = 0
	
	for _ in Items do
		Count += 1
	end
	if Count ~= #Items then
		local List = {}
		
		for _, item in Items do
			table.insert(List, item)
		end
		Items = List
	end
	local HasLayoutOrder = p1.layoutOrder ~= nil
	local config = {
		hasOverflowButton = true,
		shouldShowAnchor = true,
		anchorPoint = if HasLayoutOrder then nil else AnchorPoint,
		anchorPosition = if HasLayoutOrder then nil else Position,
		menuItems = Items,
		menuKey = OverflowName,
		buttonVariant = p1.buttonVariant,
		buttonIconSize = p1.buttonSize,
		buttonIcon = p1.buttonIcon,
		buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
		menuItemSize = p1.menuItemSize,
		popoverAlign = p1.popoverAlign,
		popoverSide = p1.popoverSide,
		menuWidth = p1.menuWidth,
		buttonIsCircular = if FFlagSduiExperienceDetailsSupport then p1.buttonIsCircular else nil,
		buttonTag = if FFlagSduiExperienceDetailsSupport then p1.buttonTag else nil,
		setFocusRef = UseBackButtonBindingResult
	}
	
	return if HasLayoutOrder then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		OverflowMenu = ReactModule.createElement(OverflowMenu, config)
	}) else ReactModule.createElement(OverflowMenu, config)
end)