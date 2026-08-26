local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local baseMenuGroupModule = require(script.Parent.BaseMenuGroup)
local baseMenuItemModule = require(script.Parent.BaseMenuItem)

local function DeclarativeBaseMenuContent(p1)
	-- upvalues: reactModule (ref), dashModule (ref), baseMenuGroupModule (ref), baseMenuItemModule (ref), DeclarativeBaseMenuContent (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), p1 (ref)
		return if dashModule.get(p1.items, { 1, "items" }) and not dashModule.get(p1.items, { 1, "id" }) then p1.items else { { items = p1.items } }
	end, { p1.items })
	local t = {}
	local var2 = false
	
	for i, v in var1 do
		local var3 = false
		
		for i_1, v_1 in v.items do
			if not var3 and (v_1.leading ~= nil or v_1.icon ~= nil) then
				var3 = true
			end
			if not var2 and v_1.isChecked == true then
				var2 = true
			end
		end
		t[i] = var3
	end
	return reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var1, function(p2, p3)
		-- upvalues: t (ref), reactModule (copy), baseMenuGroupModule (copy), var2 (write), dashModule (copy), baseMenuItemModule (copy), DeclarativeBaseMenuContent (copy)
		local var4 = t[p3]
		
		return reactModule.createElement(baseMenuGroupModule, {
			key = p3,
			LayoutOrder = p3,
			title = p2.title,
			menuHasLeading = var4,
			menuHasCheck = var2
		}, dashModule.map(p2.items, function(p4, p5)
			-- upvalues: reactModule (copy), baseMenuItemModule (copy), var4 (ref), var2 (copy), DeclarativeBaseMenuContent (copy)
			return reactModule.createElement(baseMenuItemModule, {
				LayoutOrder = p5,
				key = p4.id,
				icon = p4.icon,
				leading = p4.leading,
				trailing = p4.trailing,
				isChecked = p4.isChecked,
				isDisabled = p4.isDisabled,
				text = p4.text,
				onActivated = p4.onActivated,
				id = p4.id,
				testId = if p4.items then "--foundation-menu-submenu-item" else "--foundation-menu-item",
				ref = p4.ref,
				menuHasLeading = var4,
				menuHasCheck = var2
			}, if p4.items then reactModule.createElement(DeclarativeBaseMenuContent, { items = p4.items }) else nil)
		end))
	end))
end

return reactModule.memo(DeclarativeBaseMenuContent)