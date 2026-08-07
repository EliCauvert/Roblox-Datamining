-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
local baseMenuGroupModule = require(script.Parent.BaseMenuGroup)
local baseMenuItemModule = require(script.Parent.BaseMenuItem)

local function DeclarativeBaseMenuContent(p0) --[[ line: 44 ]]
	-- upvalues: reactModule (ref), dashModule (ref), flagsModule (ref), baseMenuGroupModule (ref), baseMenuItemModule (ref), DeclarativeBaseMenuContent (ref)
	local var7 = reactModule.useMemo(function() --[[ line: 45 ]]
		-- upvalues: dashModule (copy), p0 (ref)
		return if dashModule.get(p0.items, { 1, "items" }) and not dashModule.get(p0.items, { 1, "id" }) then p0.items else { { items = p0.items } }
	end, { p0.items })
	local t = {}
	local var9 = false
	
	if flagsModule.FoundationBaseMenuBeta then
		for i, v in var7 do
			local var10 = false
			
			for i_1, v_1 in v.items do
				if not var10 and (v_1.leading ~= nil or v_1.icon ~= nil) then
					var10 = true
				end
				if not var9 and v_1.isChecked == true then
					var9 = true
				end
			end
			t[i] = var10
		end
	end
	return reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var7, function(p1, p2) --[[ line: 78 ]]
		-- upvalues: t (ref), reactModule (copy), baseMenuGroupModule (copy), flagsModule (copy), var9 (write), dashModule (copy), baseMenuItemModule (copy), DeclarativeBaseMenuContent (copy)
		local var11 = t[p2]
		
		return reactModule.createElement(baseMenuGroupModule, {
			key = p2,
			LayoutOrder = p2,
			title = p1.title,
			menuHasLeading = if flagsModule.FoundationBaseMenuBeta then var11 else nil,
			menuHasCheck = if flagsModule.FoundationBaseMenuBeta then var9 else nil
		}, dashModule.map(p1.items, function(p3, p4) --[[ line: 89 ]]
			-- upvalues: reactModule (copy), baseMenuItemModule (copy), flagsModule (copy), var11 (ref), var9 (copy), DeclarativeBaseMenuContent (copy)
			return reactModule.createElement(baseMenuItemModule, {
				LayoutOrder = p4,
				key = p3.id,
				icon = p3.icon,
				leading = if flagsModule.FoundationBaseMenuBeta then p3.leading else nil,
				trailing = if flagsModule.FoundationBaseMenuBeta then p3.trailing else nil,
				isChecked = p3.isChecked,
				isDisabled = p3.isDisabled,
				text = p3.text,
				onActivated = p3.onActivated,
				id = p3.id,
				testId = if p3.items then "--foundation-menu-submenu-item" else "--foundation-menu-item",
				ref = p3.ref,
				menuHasLeading = if flagsModule.FoundationBaseMenuBeta then var11 else nil,
				menuHasCheck = if flagsModule.FoundationBaseMenuBeta then var9 else nil
			}, if p3.items then reactModule.createElement(DeclarativeBaseMenuContent, { items = p3.items }) else nil)
		end))
	end))
end

return reactModule.memo(DeclarativeBaseMenuContent)