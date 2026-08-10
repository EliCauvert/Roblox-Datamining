local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local fFlagEnableWhatsNew = require(parent.SharedFlags).FFlagEnableWhatsNew
local var3 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local shortcutButtonModule = require(inExperienceSideSheet.Components.ShortcutButton)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getSessionActionButtonsStoreModule = require(inExperienceSideSheet.Stores.GetSessionActionButtonsStore)

local function getIsHeightSmall(p0) --[[ line: 26 ]]
	-- upvalues: getSideSheetConfigStoreModule (ref)
	return getSideSheetConfigStoreModule(p0).getIsHeightSmall(p0)
end

local function getSessionActionButtonConfigs(p1) --[[ line: 30 ]]
	-- upvalues: getSessionActionButtonsStoreModule (ref)
	return getSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
end

return reactModule.memo(function(p2) --[[ line: 34 | named "SessionActionButtons" ]]
	-- upvalues: signalsReactModule (ref), getIsHeightSmall (ref), getSessionActionButtonConfigs (ref), reactModule (ref), shortcutButtonModule (ref), view (ref), fFlagEnableWhatsNew (ref), var3 (ref)
	local var9 = signalsReactModule.useSignalState(getIsHeightSmall)
	local t = {}
	
	for i, v in signalsReactModule.useSignalState(getSessionActionButtonConfigs) do
		t[v.name] = reactModule.createElement(shortcutButtonModule, {
			label = v.label,
			getShortcutIcon = v.getShortcutIcon,
			getOnActivated = v.getOnActivated,
			getIsEnabled = v.getIsEnabled,
			isEmphasis = v.isEmphasis,
			isSmall = var9,
			layoutOrder = i
		})
	end
	local var11 = reactModule.createElement(view, {
		tag = "size-full-0 auto-y row gap-small",
		LayoutOrder = p2.layoutOrder
	}, t)
	
	return if fFlagEnableWhatsNew then reactModule.createElement(var3, { anchorId = "LeaveRespawn", LayoutOrder = p2.layoutOrder }, { SessionActions = var11 }) else var11
end)