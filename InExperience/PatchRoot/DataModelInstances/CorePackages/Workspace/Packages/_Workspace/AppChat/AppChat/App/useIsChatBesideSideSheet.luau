local Parent = script:FindFirstAncestor("AppChat").Parent
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagKeepSideSheetOpenBesideMenu = require(Parent.SharedFlags).FFlagKeepSideSheetOpenBesideMenu

return function(): boolean
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), Parent (copy), UseSignalStateFunction (copy)
	return if FFlagKeepSideSheetOpenBesideMenu then UseSignalStateFunction(require(Parent.InExperienceSideSheetStore.windowShownBesideSideSheet).getWindowShownBesideSideSheet) == require(Parent.InExperienceSideSheetStore.Constants).IntegrationIds.ConnectDropdown else false
end