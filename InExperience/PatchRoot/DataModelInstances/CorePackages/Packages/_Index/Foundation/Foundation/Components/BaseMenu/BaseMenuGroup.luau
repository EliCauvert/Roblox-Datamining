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

return function(p1)
	-- upvalues: reactModule (ref), baseMenuContextModule (ref), baseMenuDividerModule (ref), viewModule (ref), t (ref), baseMenuTitleItemModule (ref)
	local var1 = reactModule.useContext(baseMenuContextModule)
	local layoutOrder = p1.LayoutOrder
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Divider = if layoutOrder ~= 1 then nil else reactModule.createElement(baseMenuDividerModule, { LayoutOrder = layoutOrder * 2 - 1 }),
		Group = reactModule.createElement(viewModule, {
			LayoutOrder = layoutOrder * 2,
			tag = `col gap-xxsmall size-full-0 auto-y {t[var1.size]}`
		}, {
			Title = if p1.title then reactModule.createElement(baseMenuTitleItemModule, {
				text = p1.title,
				size = var1.size,
				menuHasLeading = p1.menuHasLeading,
				menuHasCheck = p1.menuHasCheck
			}) else nil,
			Items = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		})
	})
end