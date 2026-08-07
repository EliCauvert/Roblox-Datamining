-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local baseMenuContextModule = require(script.Parent.BaseMenuContext)
local baseMenuDividerModule = require(script.Parent.BaseMenuDivider)
local baseMenuTitleItemModule = require(script.Parent.BaseMenuTitleItem)
local viewModule = require(foundation.Components.View)
local t = {
	XSmall = "padding-xsmall",
	Small = "padding-small",
	Medium = "padding-small",
	Large = "padding-small"
}

return function(p0) --[[ line: 27 | named "BaseMenuGroup" ]]
	-- upvalues: reactModule (ref), baseMenuContextModule (ref), baseMenuDividerModule (ref), viewModule (ref), t (ref), baseMenuTitleItemModule (ref)
	local var7 = reactModule.useContext(baseMenuContextModule)
	local layoutOrder = p0.LayoutOrder
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Divider = if layoutOrder ~= 1 then nil else reactModule.createElement(baseMenuDividerModule, { LayoutOrder = layoutOrder * 2 - 1 }),
		Group = reactModule.createElement(viewModule, {
			LayoutOrder = layoutOrder * 2,
			tag = `col gap-xxsmall size-full-0 auto-y {t[var7.size]}`
		}, {
			Title = if p0.title then reactModule.createElement(baseMenuTitleItemModule, {
				text = p0.title,
				size = var7.size,
				menuHasLeading = p0.menuHasLeading,
				menuHasCheck = p0.menuHasCheck
			}) else nil,
			Items = reactModule.createElement(reactModule.Fragment, nil, p0.children)
		})
	})
end