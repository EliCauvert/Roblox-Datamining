local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local BaseMenuGroupModule = require(script.Parent.BaseMenuGroup)
local BaseMenuItemModule = require(script.Parent.BaseMenuItem)

local function DeclarativeBaseMenuContent(p1)
	-- upvalues: ReactModule (copy), DashModule (copy), FlagsModule (copy), BaseMenuGroupModule (copy), BaseMenuItemModule (copy), DeclarativeBaseMenuContent (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), p1 (copy)
		local GetResult = DashModule.get(p1.items, { 1, "id" })
		
		return if DashModule.get(p1.items, { 1, "items" }) and not GetResult then p1.items else { { items = p1.items } }
	end, { p1.items })
	local t = {}
	local Flag = false
	
	if FlagsModule.FoundationBaseMenuBeta then
		for i, value in UseMemoResult do
			local Flag1 = false
			
			for _, item in value.items do
				if not Flag1 and (item.leading ~= nil or item.icon ~= nil) then
					Flag1 = true
				end
				if not Flag and item.isChecked == true then
					Flag = true
				end
			end
			t[i] = Flag1
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, DashModule.map(UseMemoResult, function(p2, Key)
		-- upvalues: t (copy), ReactModule (upval), BaseMenuGroupModule (upval), FlagsModule (upval), Flag (ref), DashModule (upval), BaseMenuItemModule (upval), DeclarativeBaseMenuContent (upval)
		local Entry = t[Key]
		
		return ReactModule.createElement(BaseMenuGroupModule, {
			key = Key,
			LayoutOrder = Key,
			title = p2.title,
			menuHasLeading = if FlagsModule.FoundationBaseMenuBeta then Entry else nil,
			menuHasCheck = if FlagsModule.FoundationBaseMenuBeta then Flag else nil
		}, DashModule.map(p2.items, function(p3, LayoutOrder)
			-- upvalues: ReactModule (upval), BaseMenuItemModule (upval), FlagsModule (upval), Entry (copy), Flag (upval), DeclarativeBaseMenuContent (upval)
			return ReactModule.createElement(BaseMenuItemModule, {
				LayoutOrder = LayoutOrder,
				key = p3.id,
				icon = p3.icon,
				leading = if FlagsModule.FoundationBaseMenuBeta then p3.leading else nil,
				trailing = if FlagsModule.FoundationBaseMenuBeta then p3.trailing else nil,
				isChecked = p3.isChecked,
				isDisabled = p3.isDisabled,
				text = p3.text,
				onActivated = p3.onActivated,
				id = p3.id,
				testId = if p3.items then "--foundation-menu-submenu-item" else "--foundation-menu-item",
				ref = p3.ref,
				menuHasLeading = if FlagsModule.FoundationBaseMenuBeta then Entry else nil,
				menuHasCheck = if FlagsModule.FoundationBaseMenuBeta then Flag else nil
			}, if p3.items then ReactModule.createElement(DeclarativeBaseMenuContent, { items = p3.items }) else nil)
		end))
	end))
end

return ReactModule.memo(DeclarativeBaseMenuContent)