local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local fFlagShowSwitchServerButton = sharedFlagsModule.FFlagShowSwitchServerButton
local var1 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local getSessionActionButtonsStoreModule = require(inExperienceSideSheet.Stores.GetSessionActionButtonsStore)
local buildSessionActionButtonLayoutModule = require(inExperienceSideSheet.Utils.buildSessionActionButtonLayout)

local function getSessionActionButtonConfigs(p1)
	-- upvalues: getSessionActionButtonsStoreModule (ref)
	return getSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
end

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), getSessionActionButtonConfigs (ref), fFlagShowSwitchServerButton (ref), buildSessionActionButtonLayoutModule (ref), reactModule (ref), view (ref), fFlagEnableWhatsNew (ref), var1 (ref)
	local var2 = signalsReactModule.useSignalState(getSessionActionButtonConfigs)
	local var3 = var2
	
	if fFlagShowSwitchServerButton then
		var3 = {}
		
		for i, v in var2 do
			if v.getIsHidden == nil or not v.getIsHidden() then
				table.insert(var3, v)
			end
		end
	end
	local var4 = reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, buildSessionActionButtonLayoutModule(var3))
	
	return if fFlagEnableWhatsNew then reactModule.createElement(var1, { anchorId = "LeaveRespawn", LayoutOrder = p1.layoutOrder }, { SessionActions = var4 }) else var4
end)