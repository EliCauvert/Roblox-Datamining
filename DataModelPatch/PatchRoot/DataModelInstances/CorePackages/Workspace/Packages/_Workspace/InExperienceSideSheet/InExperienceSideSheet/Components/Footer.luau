local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Divider = FoundationModule.Divider
local View = FoundationModule.View
local SessionActionButtonsModule = require(InExperienceSideSheet.Components.SessionActionButtons)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Divider (copy), SessionActionButtonsModule (copy)
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-right-xlarge padding-bottom-medium",
		LayoutOrder = p1.layoutOrder
	}, {
		FooterDivider = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-bottom-medium",
			LayoutOrder = 1
		}, { Divider = ReactModule.createElement(Divider) }),
		SessionActionButtons = ReactModule.createElement(SessionActionButtonsModule, { layoutOrder = 2 })
	})
end)