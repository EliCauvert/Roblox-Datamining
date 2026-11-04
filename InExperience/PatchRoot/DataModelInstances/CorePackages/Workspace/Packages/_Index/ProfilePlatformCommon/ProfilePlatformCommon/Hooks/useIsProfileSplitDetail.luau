local Parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local SplitPaneModule = if FFlagEnableSplitPane then require(Parent.SplitPane) else nil

return function(): boolean
	-- upvalues: FFlagEnableSplitPane (copy), SplitPaneModule (copy), UseSignalStateFunction (copy)
	if FFlagEnableSplitPane then
		local UseSignalStateResult = UseSignalStateFunction(SplitPaneModule.SplitPaneStore.getStore().getSupportPaneModeIfActive)
		
		return UseSignalStateResult ~= nil and SplitPaneModule.SplitPaneVariant.getProfileSplitPaneEligibility(UseSignalStateResult) ~= nil
	else
		return false
	end
end