local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local BaseMenuGroupModule = require(script.Parent.BaseMenuGroup)
local BaseMenuItemModule = require(script.Parent.BaseMenuItem)

local function DeclarativeBaseMenuContent(p1) --[[ Line: 42 ]]
	-- upvalues: ReactModule (copy), DashModule (copy), BaseMenuGroupModule (copy), BaseMenuItemModule (copy), DeclarativeBaseMenuContent (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: DashModule (upval), p1 (copy)
		local GetResult = DashModule.get(p1.items, { 1, "id" })
		
		return if DashModule.get(p1.items, { 1, "items" }) and not GetResult then p1.items else { { items = p1.items } }
	end, { p1.items })
	local t = {}
	local MenuHasCheck = false
	
	for i, value in UseMemoResult do
		local Flag = false
		
		for _, item in value.items do
			if not Flag and (item.leading ~= nil or item.icon ~= nil) then
				Flag = true
			end
			if not MenuHasCheck and item.isChecked == true then
				MenuHasCheck = true
			end
		end
		t[i] = Flag
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, DashModule.map(UseMemoResult, function(p2, Key) --[[ Line: 73 ]]
		-- upvalues: t (copy), ReactModule (upval), BaseMenuGroupModule (upval), MenuHasCheck (ref), DashModule (upval), BaseMenuItemModule (upval), DeclarativeBaseMenuContent (upval)
		local Entry = t[Key]
		
		return ReactModule.createElement(BaseMenuGroupModule, {
			key = Key,
			LayoutOrder = Key,
			title = p2.title,
			menuHasLeading = Entry,
			menuHasCheck = MenuHasCheck
		}, DashModule.map(p2.items, function(p3, LayoutOrder) --[[ Line: 84 ]]
			-- upvalues: ReactModule (upval), BaseMenuItemModule (upval), Entry (copy), MenuHasCheck (upval), DeclarativeBaseMenuContent (upval)
			return ReactModule.createElement(BaseMenuItemModule, {
				LayoutOrder = LayoutOrder,
				key = p3.id,
				icon = p3.icon,
				leading = p3.leading,
				trailing = p3.trailing,
				isChecked = p3.isChecked,
				isDisabled = p3.isDisabled,
				text = p3.text,
				onActivated = p3.onActivated,
				id = p3.id,
				testId = if p3.items then "--foundation-menu-submenu-item" else "--foundation-menu-item",
				ref = p3.ref,
				menuHasLeading = Entry,
				menuHasCheck = MenuHasCheck
			}, if p3.items then ReactModule.createElement(DeclarativeBaseMenuContent, { items = p3.items }) else nil)
		end))
	end))
end

return ReactModule.memo(DeclarativeBaseMenuContent)