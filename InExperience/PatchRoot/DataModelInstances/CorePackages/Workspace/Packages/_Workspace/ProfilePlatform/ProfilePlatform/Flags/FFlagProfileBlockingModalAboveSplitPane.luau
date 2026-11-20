local FFlagEnableSplitPane = require(script:FindFirstAncestor("ProfilePlatform").Parent.SharedFlags).FFlagEnableSplitPane

return game:DefineFastFlag("ProfileBlockingModalAboveSplitPane", false) and FFlagEnableSplitPane