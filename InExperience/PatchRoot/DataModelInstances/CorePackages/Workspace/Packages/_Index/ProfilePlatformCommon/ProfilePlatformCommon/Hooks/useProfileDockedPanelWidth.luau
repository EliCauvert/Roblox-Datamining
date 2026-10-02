local parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useSignalState = require(parent.SignalsReact).useSignalState
local useProfileCardWidthModule = require(script.Parent.useProfileCardWidth)
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var1 = if fFlagEnableSplitPane then require(parent.SplitPane) else nil

return function(p1)
	-- upvalues: useSelector (ref), fFlagEnableSplitPane (ref), var1 (ref), useSignalState (ref), useProfileCardWidthModule (ref), formFactor (ref)
	local var2 = useSelector(function(p2)
		return p2.FormFactor
	end)
	local var3 = false
	
	if fFlagEnableSplitPane then
		local var4 = useSignalState(var1.SplitPaneStore.getStore().getSupportPaneModeIfActive)
		var3 = var4 ~= nil and var1.SplitPaneVariant.getProfileSplitPaneEligibility(var4) ~= nil
	end
	return if p1 and var2 == formFactor.WIDE and not var3 then useProfileCardWidthModule() else nil
end