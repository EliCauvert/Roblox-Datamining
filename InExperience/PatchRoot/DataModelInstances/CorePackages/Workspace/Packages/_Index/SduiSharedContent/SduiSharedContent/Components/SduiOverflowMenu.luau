local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local AppBloxModule = require(Parent.AppBlox)
local OverflowMenu = AppBloxModule.OverflowMenu
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseBackButtonBindingFunction = require(Parent.SduiSharedUtilities).useBackButtonBinding
local UseUidRefStringFunction = require(Parent.SduiCoreSystem).useUidRefString
local _ = require(Parent.SduiCompat)
local FoundationModule = require(Parent.Foundation)
local FFlagLuaAppSduiGameTileFeedback = require(Parent.SharedFlags).FFlagLuaAppSduiGameTileFeedback

local function addMenuItemTelemetry(List) --[[ Line: 57 ]]
	local List1 = {}
	
	for _, value in List do
		if typeof(value.id) == "string" and value.id ~= "" then
			table.insert(List1, value.id)
		end
	end
	local Joined = table.concat(List1, ",")
	local List2 = {}
	
	for _, value1 in List do
		if value1.onActivated and typeof(value1.id) == "string" and value1.id ~= "" then
			local Copy = table.clone(value1)
			
			function Copy:onActivated(_, _) --[[ Line: 74 ]]
				-- upvalues: value1 (copy), Joined (copy)
				value1.onActivated(nil, nil, { menuItemId = value1.id, availableMenuItemIds = Joined })
			end
			
			table.insert(List2, Copy)
		else
			table.insert(List2, value1)
		end
	end
	return List2
end

return ReactModule.memo(function(p1) --[[ Line: 86 | Named "SduiOverflowMenu" ]]
	-- upvalues: UseUidRefStringFunction (copy), FFlagLuaAppSduiGameTileFeedback (copy), ReactModule (copy), addMenuItemTelemetry (copy), GetOverflowMenuSignalStoreFunction (copy), UseBackButtonBindingFunction (copy), FoundationModule (copy), OverflowMenu (copy)
	local UseUidRefStringResult = UseUidRefStringFunction()
	local MenuKey = if FFlagLuaAppSduiGameTileFeedback and p1.menuKey then p1.menuKey else `sdui-overflow-menu-{UseUidRefStringResult.current}`
	local AnchorPoint = p1.anchorPoint or Vector2.new(0, 0)
	local Position = p1.position or UDim2.new(0, 0, 0, 0)
	local NoHasOverflowButton = nil
	local NoShouldShowAnchor = nil
	
	if FFlagLuaAppSduiGameTileFeedback then
		NoHasOverflowButton = p1.hasOverflowButton == nil or p1.hasOverflowButton
		NoShouldShowAnchor = p1.shouldShowAnchor == nil or p1.shouldShowAnchor
	end
	local UseMemoResult = if FFlagLuaAppSduiGameTileFeedback then ReactModule.useMemo(function() --[[ Line: 104 ]]
		-- upvalues: p1 (copy), addMenuItemTelemetry (upval)
		return if p1.includeMenuItemTelemetry then addMenuItemTelemetry(p1.items) else p1.items
	end, { p1.items, p1.includeMenuItemTelemetry }) else nil
	local UseBackButtonBindingResult = UseBackButtonBindingFunction((ReactModule.useCallback(function() --[[ Line: 114 ]]
		-- upvalues: GetOverflowMenuSignalStoreFunction (upval), MenuKey (copy)
		GetOverflowMenuSignalStoreFunction().closeMenu(MenuKey)
	end, { MenuKey })))
	local UseMemoResult1 = if FFlagLuaAppSduiGameTileFeedback then UseMemoResult else p1.items
	local Count = 0
	
	for _ in UseMemoResult1 do
		Count += 1
	end
	if Count ~= #UseMemoResult1 then
		local List = {}
		
		for _, value in UseMemoResult1 do
			table.insert(List, value)
		end
		UseMemoResult1 = List
	end
	local HasLayoutOrder = p1.layoutOrder ~= nil
	local config = {
		anchorPoint = if HasLayoutOrder then nil else AnchorPoint,
		anchorPosition = if HasLayoutOrder then nil else Position,
		menuItems = UseMemoResult1,
		menuKey = MenuKey,
		buttonVariant = p1.buttonVariant,
		buttonIconSize = p1.buttonSize,
		buttonIcon = p1.buttonIcon,
		buttonIconBackgroundStyle = p1.buttonIconBackgroundStyle,
		menuItemSize = p1.menuItemSize,
		popoverAlign = p1.popoverAlign,
		popoverSide = p1.popoverSide,
		menuWidth = p1.menuWidth,
		hasOverflowButton = not FFlagLuaAppSduiGameTileFeedback or NoHasOverflowButton,
		shouldShowAnchor = not FFlagLuaAppSduiGameTileFeedback or NoShouldShowAnchor,
		buttonIsCircular = p1.buttonIsCircular,
		buttonTag = p1.buttonTag,
		setFocusRef = if FFlagLuaAppSduiGameTileFeedback and p1.setFocusRef then p1.setFocusRef else UseBackButtonBindingResult,
		onMenuOpenChanged = if FFlagLuaAppSduiGameTileFeedback then p1.onMenuOpenChanged else nil,
		zIndex = if FFlagLuaAppSduiGameTileFeedback then p1.zIndex else nil
	}
	
	return if HasLayoutOrder then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		OverflowMenu = ReactModule.createElement(OverflowMenu, config)
	}) else ReactModule.createElement(OverflowMenu, config)
end)