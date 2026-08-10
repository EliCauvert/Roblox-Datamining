local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local view = foundationModule.View
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local unibarItemModule = require(inExperienceSideSheet.Components.UnibarItem)
local fFlagSideSheetFocusNav = require(parent.SharedFlags).FFlagSideSheetFocusNav

local function getIntegrations(p0) --[[ line: 21 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p0).getUnibarIntegrations(p0)
end

return reactModule.memo(function(p1) --[[ line: 26 | named "UnibarList" ]]
	-- upvalues: signalsReactModule (ref), getIntegrations (ref), reactModule (ref), unibarItemModule (ref), fFlagSideSheetFocusNav (ref), view (ref)
	local var7 = signalsReactModule.useSignalState(getIntegrations)
	
	if #var7 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in var7 do
		t[v.id] = reactModule.createElement(unibarItemModule, {
			label = v.integration.label,
			layoutOrder = i,
			onActivated = v.activated,
			icon = v.component,
			notification = v.integration.notification,
			disableGamepadDirections = if fFlagSideSheetFocusNav and i == 1 then { left = true } else nil
		})
	end
	return reactModule.createElement(view, {
		tag = "auto-xy row gap-xsmall align-y-center",
		LayoutOrder = p1.layoutOrder
	}, t)
end)