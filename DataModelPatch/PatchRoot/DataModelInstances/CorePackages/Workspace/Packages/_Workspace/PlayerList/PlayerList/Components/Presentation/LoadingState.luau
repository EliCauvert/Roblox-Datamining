local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local ConstantsModule = require(Parent.Common.Constants)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), ConstantsModule (copy), Loading (copy), IconSize (copy)
	return ReactModule.createElement(View, {
		tag = ConstantsModule.STATE_PANEL_TAG,
		LayoutOrder = p1.layoutOrder
	}, {
		Spinner = ReactModule.createElement(Loading, { size = IconSize.XLarge })
	})
end)