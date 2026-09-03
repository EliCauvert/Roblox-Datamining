local parent = script:FindFirstAncestor("ProfilePlatformCommon").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local formFactor = require(parent.FormFactor).Enums.FormFactor
local useSignalState = require(parent.SignalsReact).useSignalState
local useProfileCardWidthModule = require(script.Parent.useProfileCardWidth)
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var1 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil

return function(p1)
	-- upvalues: useSelector (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var1 (ref), useProfileCardWidthModule (ref), formFactor (ref)
	return if p1 and useSelector(function(p2)
		return p2.FormFactor
	end) == formFactor.WIDE and not (if fFlagEnableSplitPane then useSignalState(var1.getStore().getIsSplitEnabled) else false) then useProfileCardWidthModule() else nil
end