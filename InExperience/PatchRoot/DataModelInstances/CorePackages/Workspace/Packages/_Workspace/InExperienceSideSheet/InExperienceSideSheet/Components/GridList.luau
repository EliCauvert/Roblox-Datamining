local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local gridItemModule = require(inExperienceSideSheet.Components.GridItem)
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), gridItemModule (ref), fFlagSideSheetFocusNav (ref), view (ref)
	local var1 = signalsReactModule.useSignalState(p1.integrationsGetter)
	local t = {}
	
	for i, v in var1 do
		t[v.id] = reactModule.createElement(gridItemModule, {
			icon = v.component,
			label = v.integration.label,
			layoutOrder = i,
			notification = v.integration.notification,
			onActivated = v.activated,
			disableGamepadDirections = if fFlagSideSheetFocusNav and i == #var1 then { right = true } else nil,
			isActivated = v.integration.isActivated,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and i == 1 then p1.firstIntegrationToFocusCallback else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "row wrap gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		ref = if fFlagSideSheetFocusNav then p1.ref else nil
	}, t)
end)