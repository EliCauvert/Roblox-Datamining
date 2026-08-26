local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local fFlagEnableWhatsNew = require(parent.SharedFlags).FFlagEnableWhatsNew
local var1 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local shortcutButtonModule = require(inExperienceSideSheet.Components.ShortcutButton)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getSessionActionButtonsStoreModule = require(inExperienceSideSheet.Stores.GetSessionActionButtonsStore)

local function getIsHeightSmall(p1)
	-- upvalues: getSideSheetConfigStoreModule (ref)
	return getSideSheetConfigStoreModule(p1).getIsHeightSmall(p1)
end

local function getSessionActionButtonConfigs(p1)
	-- upvalues: getSessionActionButtonsStoreModule (ref)
	return getSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
end

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), getIsHeightSmall (ref), getSessionActionButtonConfigs (ref), reactModule (ref), shortcutButtonModule (ref), view (ref), fFlagEnableWhatsNew (ref), var1 (ref)
	local var2 = signalsReactModule.useSignalState(getIsHeightSmall)
	local t = {}
	
	for i, v in signalsReactModule.useSignalState(getSessionActionButtonConfigs) do
		t[v.name] = reactModule.createElement(shortcutButtonModule, {
			label = v.label,
			getShortcutIcon = v.getShortcutIcon,
			getOnActivated = v.getOnActivated,
			getIsEnabled = v.getIsEnabled,
			isEmphasis = v.isEmphasis,
			isSmall = var2,
			layoutOrder = i
		})
	end
	local var3 = reactModule.createElement(view, {
		tag = "size-full-0 auto-y row gap-small",
		LayoutOrder = p1.layoutOrder
	}, t)
	
	return if fFlagEnableWhatsNew then reactModule.createElement(var1, { anchorId = "LeaveRespawn", LayoutOrder = p1.layoutOrder }, { SessionActions = var3 }) else var3
end)