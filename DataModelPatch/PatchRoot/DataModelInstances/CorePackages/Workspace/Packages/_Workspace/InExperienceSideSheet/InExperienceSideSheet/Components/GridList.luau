local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local _ = require(Parent.Chrome)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local GridItemModule = require(InExperienceSideSheet.Components.GridItem)
local FFlagChromeActivatedMappedSignal = SharedFlagsModule.FFlagChromeActivatedMappedSignal
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), GridItemModule (copy), FFlagSideSheetFocusNav (copy), FFlagChromeActivatedMappedSignal (copy), View (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.integrationsGetter)
	local Elements = {}
	
	for LayoutOrder, value in UseSignalStateResult do
		Elements[value.id] = ReactModule.createElement(GridItemModule, {
			icon = value.component,
			label = value.integration.label,
			layoutOrder = LayoutOrder,
			notification = value.integration.notification,
			onActivated = value.activated,
			disableGamepadDirections = if FFlagSideSheetFocusNav and LayoutOrder == #UseSignalStateResult then { right = true } else nil,
			isActivated = if FFlagChromeActivatedMappedSignal then value.integration.isActivated else nil,
			firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and LayoutOrder == 1 then p1.firstIntegrationToFocusCallback else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "row wrap gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		ref = if FFlagSideSheetFocusNav then p1.ref else nil
	}, Elements)
end)