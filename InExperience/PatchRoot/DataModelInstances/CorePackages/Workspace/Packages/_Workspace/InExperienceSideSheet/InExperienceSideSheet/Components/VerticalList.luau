local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local _ = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local verticalItemModule = require(inExperienceSideSheet.Components.VerticalItem)

return reactModule.memo(function(p0) --[[ line: 21 | named "VerticalList" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), verticalItemModule (ref), view (ref)
	local t = {}
	
	for i, v in signalsReactModule.useSignalState(p0.integrationsGetter) do
		t[v.id] = reactModule.createElement(verticalItemModule, {
			label = v.integration.label,
			layoutOrder = i,
			onActivated = v.activated,
			icon = v.component
		})
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y padding-y-xsmall padding-right-xlarge",
		LayoutOrder = p0.layoutOrder
	}, t)
end)