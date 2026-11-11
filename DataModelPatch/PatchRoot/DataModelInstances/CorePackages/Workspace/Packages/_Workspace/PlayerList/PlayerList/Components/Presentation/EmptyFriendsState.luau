local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local ConstantsModule = require(Parent.Common.Constants)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), ConstantsModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = ConstantsModule.STATE_PANEL_TAG,
		LayoutOrder = p1.layoutOrder
	}, {
		Message = ReactModule.createElement(Text, {
			Text = "None of your friends have played this experience yet.",
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			TextWrapped = true
		})
	})
end)