local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableWhatsNew = SharedFlagsModule.FFlagEnableWhatsNew
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local WhatsNewAnchor = if FFlagEnableWhatsNew then require(Parent.WhatsNew).WhatsNewAnchor else nil
local GetSessionActionButtonsStoreModule = require(InExperienceSideSheet.Stores.GetSessionActionButtonsStore)
local FFlagPioneerSwitchServerNextToRespawn = require(InExperienceSideSheet.Flags).FFlagPioneerSwitchServerNextToRespawn
local _ = require(InExperienceSideSheet.Common.Types)
local BuildSessionActionButtonLayoutModule = require(InExperienceSideSheet.Utils.buildSessionActionButtonLayout)

local function getSessionActionButtonConfigs(p1)
	-- upvalues: GetSessionActionButtonsStoreModule (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), FFlagPioneerSwitchServerNextToRespawn (copy)
	local SessionActionButtonConfigs = GetSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
	
	if not FFlagShowSwitchServerButton and (not IsPioneerLaunchFunction() or not FFlagPioneerSwitchServerNextToRespawn) then
		return SessionActionButtonConfigs
	end
	local List = {}
	
	for _, sessionActionButtonConfig in SessionActionButtonConfigs do
		if sessionActionButtonConfig.getIsHidden == nil or not sessionActionButtonConfig.getIsHidden(p1) then
			table.insert(List, sessionActionButtonConfig)
		end
	end
	return List
end

return ReactModule.memo(function(p2)
	-- upvalues: SignalsReactModule (copy), getSessionActionButtonConfigs (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), FFlagPioneerSwitchServerNextToRespawn (copy), BuildSessionActionButtonLayoutModule (copy), ReactModule (copy), View (copy), FFlagEnableWhatsNew (copy), WhatsNewAnchor (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getSessionActionButtonConfigs)
	local List = UseSignalStateResult
	
	if not FFlagShowSwitchServerButton and IsPioneerLaunchFunction() and not FFlagPioneerSwitchServerNextToRespawn then
		List = {}
		
		for _, value in UseSignalStateResult do
			if value.getIsHidden == nil or not value.getIsHidden() then
				table.insert(List, value)
			end
		end
	end
	local Element = ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p2.layoutOrder
	}, (BuildSessionActionButtonLayoutModule(List)))
	
	return if FFlagEnableWhatsNew then ReactModule.createElement(WhatsNewAnchor, { anchorId = "LeaveRespawn", LayoutOrder = p2.layoutOrder }, { SessionActions = Element }) else Element
end)