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

return reactModule.memo(function(p0) --[[ line: 25 | named "GridList" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), gridItemModule (ref), fFlagChromeActivatedMappedSignal (ref), view (ref)
	local t = {}
	
	for i, v in signalsReactModule.useSignalState(p0.integrationsGetter) do
		t[v.id] = reactModule.createElement(gridItemModule, {
			icon = v.component,
			label = v.integration.label,
			layoutOrder = i,
			notification = v.integration.notification,
			onActivated = v.activated,
			isActivated = if fFlagChromeActivatedMappedSignal then v.integration.isActivated else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "row wrap gap-medium size-full-0 auto-y padding-y-large",
		LayoutOrder = p0.layoutOrder
	}, t)
end)