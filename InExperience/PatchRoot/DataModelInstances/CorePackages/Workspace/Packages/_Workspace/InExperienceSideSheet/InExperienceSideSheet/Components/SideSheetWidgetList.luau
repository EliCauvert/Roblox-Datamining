local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local chromeModule = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), view (ref), chromeModule (ref)
	local var1 = signalsReactModule.useSignalState(p1.integrationsGetter)
	
	if #var1 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in var1 do
		t[v.id] = reactModule.createElement(v.component, { layoutOrder = i, placement = p1.placement })
	end
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["padding-right-xlarge"] = p1.placement == chromeModule.Enums.SideSheetPlacement.ScrollableContentTop
		},
		LayoutOrder = p1.layoutOrder
	}, t)
end)