local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)
local UnibarItemModule = require(InExperienceSideSheet.Components.UnibarItem)
local FFlagSideSheetFocusNav = require(Parent.SharedFlags).FFlagSideSheetFocusNav

local function getIntegrations(p1) --[[ Line: 21 ]]
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getUnibarIntegrations(p1)
end

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "UnibarList" ]]
	-- upvalues: SignalsReactModule (copy), getIntegrations (copy), ReactModule (copy), UnibarItemModule (copy), FFlagSideSheetFocusNav (copy), View (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getIntegrations)
	
	if #UseSignalStateResult == 0 then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, value in UseSignalStateResult do
		Elements[value.id] = ReactModule.createElement(UnibarItemModule, {
			label = value.integration.label,
			layoutOrder = LayoutOrder,
			onActivated = value.activated,
			icon = value.component,
			notification = value.integration.notification,
			disableGamepadDirections = if FFlagSideSheetFocusNav and LayoutOrder == 1 then { left = true } else nil
		})
	end
	return ReactModule.createElement(View, {
		tag = "auto-xy row gap-xsmall align-y-center",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)