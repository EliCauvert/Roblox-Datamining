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
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav

return reactModule.memo(function(p0) --[[ line: 28 | named "GridList" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), gridItemModule (ref), fFlagSideSheetFocusNav (ref), fFlagChromeActivatedMappedSignal (ref), view (ref)
	local var6 = signalsReactModule.useSignalState(p0.integrationsGetter)
	local t = {}
	
	for i, v in var6 do
		t[v.id] = reactModule.createElement(gridItemModule, {
			icon = v.component,
			label = v.integration.label,
			layoutOrder = i,
			notification = v.integration.notification,
			onActivated = v.activated,
			disableGamepadDirections = if fFlagSideSheetFocusNav and i == #var6 then { right = true } else nil,
			isActivated = if fFlagChromeActivatedMappedSignal then v.integration.isActivated else nil,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and i == 1 then p0.firstIntegrationToFocusCallback else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "row wrap gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p0.layoutOrder,
		ref = if fFlagSideSheetFocusNav then p0.ref else nil
	}, t)
end)