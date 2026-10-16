local Parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseProfileCardWidthModule = require(script.Parent.useProfileCardWidth)
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local SplitPaneModule = if FFlagEnableSplitPane then require(Parent.SplitPane) else nil

return function(p1) --[[ Line: 15 ]]
	-- upvalues: UseSelectorFunction (copy), FFlagEnableSplitPane (copy), SplitPaneModule (copy), UseSignalStateFunction (copy), UseProfileCardWidthModule (copy), FormFactor (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 16 ]]
		return p2.FormFactor
	end)
	local HasProfileSplitPaneEligibility = false
	
	if FFlagEnableSplitPane then
		local UseSignalStateResult = UseSignalStateFunction(SplitPaneModule.SplitPaneStore.getStore().getSupportPaneModeIfActive)
		HasProfileSplitPaneEligibility = UseSignalStateResult ~= nil and SplitPaneModule.SplitPaneVariant.getProfileSplitPaneEligibility(UseSignalStateResult) ~= nil
	end
	local UseProfileCardWidthModuleResult = UseProfileCardWidthModule()
	
	return if p1 and UseSelectorResult == FormFactor.WIDE and not HasProfileSplitPaneEligibility then UseProfileCardWidthModuleResult else nil
end