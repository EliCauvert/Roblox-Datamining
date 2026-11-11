local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local VerticalItemModule = require(InExperienceSideSheet.Components.VerticalItem)
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), VerticalItemModule (copy), FFlagSideSheetFocusNav (copy), View (copy)
	local Elements = {}
	
	for LayoutOrder, value in SignalsReactModule.useSignalState(p1.integrationsGetter) do
		Elements[value.id] = ReactModule.createElement(VerticalItemModule, {
			label = value.integration.label,
			layoutOrder = LayoutOrder,
			onActivated = value.activated,
			icon = value.component,
			disableGamepadDirections = if FFlagSideSheetFocusNav then { right = true, left = true } else nil,
			firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and LayoutOrder == 1 then p1.firstIntegrationToFocusCallback else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-y-xsmall padding-right-xlarge",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)