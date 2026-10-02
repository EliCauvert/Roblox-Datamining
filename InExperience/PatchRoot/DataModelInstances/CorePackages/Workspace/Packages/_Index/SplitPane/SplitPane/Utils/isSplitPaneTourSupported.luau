local sharedFlagsModule = require(script:FindFirstAncestor("SplitPane").Parent.SharedFlags)
local splitPaneVariantModule = require(script.Parent.SplitPaneVariant)
local fFlagEnableSplitPane = sharedFlagsModule.FFlagEnableSplitPane
local fFlagEnableSplitPaneAvatarOverlay = sharedFlagsModule.FFlagEnableSplitPaneAvatarOverlay
local fFlagSplitPaneEducationalTour = sharedFlagsModule.FFlagSplitPaneEducationalTour

return function()
	-- upvalues: fFlagEnableSplitPane (ref), fFlagEnableSplitPaneAvatarOverlay (ref), fFlagSplitPaneEducationalTour (ref), splitPaneVariantModule (ref)
	return fFlagEnableSplitPane and (fFlagEnableSplitPaneAvatarOverlay and (fFlagSplitPaneEducationalTour and splitPaneVariantModule.isEducationModalEnabled()))
end