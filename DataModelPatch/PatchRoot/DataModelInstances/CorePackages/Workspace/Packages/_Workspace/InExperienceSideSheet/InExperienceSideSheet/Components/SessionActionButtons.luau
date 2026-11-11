local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local ShortcutButtonModule = require(InExperienceSideSheet.Components.ShortcutButton)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetSessionActionButtonsStoreModule = require(InExperienceSideSheet.Stores.GetSessionActionButtonsStore)

local function getIsHeightSmall(p1)
	-- upvalues: GetSideSheetConfigStoreModule (copy)
	return GetSideSheetConfigStoreModule(p1).getIsHeightSmall(p1)
end

local function getSessionActionButtonConfigs(p1)
	-- upvalues: GetSessionActionButtonsStoreModule (copy)
	return GetSessionActionButtonsStoreModule(p1).sessionActionButtonConfigs
end

return ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), getIsHeightSmall (copy), getSessionActionButtonConfigs (copy), ReactModule (copy), ShortcutButtonModule (copy), View (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(getIsHeightSmall)
	local Elements = {}
	
	for LayoutOrder, value in SignalsReactModule.useSignalState(getSessionActionButtonConfigs) do
		Elements[value.name] = ReactModule.createElement(ShortcutButtonModule, {
			label = value.label,
			getShortcutIcon = value.getShortcutIcon,
			getOnActivated = value.getOnActivated,
			getIsEnabled = value.getIsEnabled,
			isEmphasis = value.isEmphasis,
			isSmall = UseSignalStateResult,
			layoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y row gap-small",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end)