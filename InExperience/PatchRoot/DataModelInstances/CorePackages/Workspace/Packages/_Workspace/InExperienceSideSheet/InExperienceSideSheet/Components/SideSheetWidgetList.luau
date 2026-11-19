local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), FFlagSideSheetFocusNav (copy), View (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.integrationsGetter)
	
	if #UseSignalStateResult == 0 then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, value in UseSignalStateResult do
		Elements[value.id] = ReactModule.createElement(value.component, {
			layoutOrder = LayoutOrder,
			placement = p1.placement,
			sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then value.integration.sideSheetOpenBehavior else nil,
			firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and LayoutOrder == 1 then p1.firstIntegrationToFocusCallback else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)