local FFlagEnableBonusJwtInShop = require(script:FindFirstAncestor("InExperienceShop").Parent.SharedFlags).FFlagEnableBonusJwtInShop

return game:DefineFastFlag("RefetchRobuxWidgetAfterPurchase", false) and FFlagEnableBonusJwtInShop