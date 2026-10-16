local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableWhatsNew = SharedFlagsModule.FFlagEnableWhatsNew
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local WhatsNewAnchor = if FFlagEnableWhatsNew then require(Parent.WhatsNew).WhatsNewAnchor else nil
local GetSessionActionButtonsStoreModule = require(InExperienceSideSheet.Stores.GetSessionActionButtonsStore)
local BuildSessionActionButtonLayoutModule = require(InExperienceSideSheet.Utils.buildSessionActionButtonLayout)

local function getSessionActionButtonConfigs(p1) --[[ Line: 27 ]]
	-- upvalues: GetSessionActionButtonsStoreModule (copy)
	return GetSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
end

return ReactModule.memo(function(p1) --[[ Line: 31 | Named "SessionActionButtons" ]]
	-- upvalues: SignalsReactModule (copy), getSessionActionButtonConfigs (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), BuildSessionActionButtonLayoutModule (copy), ReactModule (copy), View (copy), FFlagEnableWhatsNew (copy), WhatsNewAnchor (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getSessionActionButtonConfigs)
	local List = UseSignalStateResult
	
	if FFlagShowSwitchServerButton or IsPioneerLaunchFunction() then
		List = {}
		
		for _, value in UseSignalStateResult do
			if value.getIsHidden == nil or not value.getIsHidden() then
				table.insert(List, value)
			end
		end
	end
	local Element = ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, (BuildSessionActionButtonLayoutModule(List)))
	
	return if FFlagEnableWhatsNew then ReactModule.createElement(WhatsNewAnchor, { anchorId = "LeaveRespawn", LayoutOrder = p1.layoutOrder }, { SessionActions = Element }) else Element
end)