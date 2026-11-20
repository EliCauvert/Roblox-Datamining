local FFlagEnableInExperienceShop = require(script:FindFirstAncestor("InExperienceShop").Parent.SharedFlags).FFlagEnableInExperienceShop

return game:DefineFastFlag("HideBonusInShopWhenNotClaimable", false) and FFlagEnableInExperienceShop