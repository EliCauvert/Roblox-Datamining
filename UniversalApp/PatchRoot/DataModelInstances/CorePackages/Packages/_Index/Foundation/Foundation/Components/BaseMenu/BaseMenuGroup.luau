local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseMenuContextModule = require(script.Parent.BaseMenuContext)
local BaseMenuDividerModule = require(script.Parent.BaseMenuDivider)
local BaseMenuTitleItemModule = require(script.Parent.BaseMenuTitleItem)
local ViewModule = require(Foundation.Components.View)
local config = {
	XSmall = "padding-xsmall",
	Small = "padding-small",
	Medium = "padding-small",
	Large = "padding-small"
}

return function(Frame)
	-- upvalues: ReactModule (copy), BaseMenuContextModule (copy), BaseMenuDividerModule (copy), ViewModule (copy), config (copy), BaseMenuTitleItemModule (copy)
	local UseContextResult = ReactModule.useContext(BaseMenuContextModule)
	local LayoutOrder: number = Frame.LayoutOrder
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Divider = if LayoutOrder == 1 then nil else ReactModule.createElement(BaseMenuDividerModule, { LayoutOrder = LayoutOrder * 2 - 1 }),
		Group = ReactModule.createElement(ViewModule, {
			LayoutOrder = LayoutOrder * 2,
			tag = `col gap-xxsmall size-full-0 auto-y {config[UseContextResult.size]}`
		}, {
			Title = if Frame.title then ReactModule.createElement(BaseMenuTitleItemModule, {
				text = Frame.title,
				size = UseContextResult.size,
				menuHasLeading = Frame.menuHasLeading,
				menuHasCheck = Frame.menuHasCheck
			}) else nil,
			Items = ReactModule.createElement(ReactModule.Fragment, nil, Frame.children)
		})
	})
end