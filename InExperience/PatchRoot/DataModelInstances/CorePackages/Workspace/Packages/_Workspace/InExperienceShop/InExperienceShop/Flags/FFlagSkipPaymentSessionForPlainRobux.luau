local FFlagEnableRobuxInExperienceShop = require(script:FindFirstAncestor("InExperienceShop").Parent.SharedFlags).FFlagEnableRobuxInExperienceShop

return game:DefineFastFlag("SkipPaymentSessionForPlainRobux", false) and FFlagEnableRobuxInExperienceShop