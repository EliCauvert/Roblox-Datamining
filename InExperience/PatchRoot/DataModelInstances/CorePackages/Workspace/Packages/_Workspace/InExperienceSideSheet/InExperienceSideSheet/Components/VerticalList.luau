local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local verticalItemModule = require(inExperienceSideSheet.Components.VerticalItem)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), verticalItemModule (ref), fFlagSideSheetFocusNav (ref), view (ref)
	local t = {}
	
	for i, v in signalsReactModule.useSignalState(p1.integrationsGetter) do
		t[v.id] = reactModule.createElement(verticalItemModule, {
			label = v.integration.label,
			layoutOrder = i,
			onActivated = v.activated,
			icon = v.component,
			disableGamepadDirections = if fFlagSideSheetFocusNav then { right = true, left = true } else nil,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and i == 1 then p1.firstIntegrationToFocusCallback else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-y-xsmall padding-right-xlarge",
		LayoutOrder = p1.layoutOrder
	}, t)
end)