local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local baseMenuGroupModule = require(script.Parent.BaseMenuGroup)
local baseMenuItemModule = require(script.Parent.BaseMenuItem)

local function DeclarativeBaseMenuContent(p0)
	-- upvalues: reactModule (ref), dashModule (ref), baseMenuGroupModule (ref), baseMenuItemModule (ref), DeclarativeBaseMenuContent (ref)
	local var6 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), p0 (ref)
		return if dashModule.get(p0.items, { 1, "items" }) and not dashModule.get(p0.items, { 1, "id" }) then p0.items else { { items = p0.items } }
	end, { p0.items })
	local t = {}
	local var8 = false
	
	for i, v in var6 do
		local var9 = false
		
		for i_1, v_1 in v.items do
			if not var9 and (v_1.leading ~= nil or v_1.icon ~= nil) then
				var9 = true
			end
			if not var8 and v_1.isChecked == true then
				var8 = true
			end
		end
		t[i] = var9
	end
	return reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var6, function(p1, p2)
		-- upvalues: t (ref), reactModule (copy), baseMenuGroupModule (copy), var8 (write), dashModule (copy), baseMenuItemModule (copy), DeclarativeBaseMenuContent (copy)
		local var10 = t[p2]
		
		return reactModule.createElement(baseMenuGroupModule, {
			key = p2,
			LayoutOrder = p2,
			title = p1.title,
			menuHasLeading = var10,
			menuHasCheck = var8
		}, dashModule.map(p1.items, function(p3, p4)
			-- upvalues: reactModule (copy), baseMenuItemModule (copy), var10 (ref), var8 (copy), DeclarativeBaseMenuContent (copy)
			return reactModule.createElement(baseMenuItemModule, {
				LayoutOrder = p4,
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
				menuHasLeading = var10,
				menuHasCheck = var8
			}, if p3.items then reactModule.createElement(DeclarativeBaseMenuContent, { items = p3.items }) else nil)
		end))
	end))
end

return reactModule.memo(DeclarativeBaseMenuContent)