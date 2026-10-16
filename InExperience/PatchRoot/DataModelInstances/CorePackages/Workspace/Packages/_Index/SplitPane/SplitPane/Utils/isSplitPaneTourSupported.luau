local SharedFlagsModule = require(script:FindFirstAncestor("SplitPane").Parent.SharedFlags)
local SplitPaneVariantModule = require(script.Parent.SplitPaneVariant)
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
local FFlagEnableSplitPaneAvatarOverlay = SharedFlagsModule.FFlagEnableSplitPaneAvatarOverlay
local FFlagSplitPaneEducationalTour = SharedFlagsModule.FFlagSplitPaneEducationalTour

return function() --[[ Line: 16 | Named "isSplitPaneTourSupported" ]]
	-- upvalues: FFlagEnableSplitPane (copy), FFlagEnableSplitPaneAvatarOverlay (copy), FFlagSplitPaneEducationalTour (copy), SplitPaneVariantModule (copy)
	return FFlagEnableSplitPane and (FFlagEnableSplitPaneAvatarOverlay and (FFlagSplitPaneEducationalTour and SplitPaneVariantModule.isEducationModalEnabled()))
end