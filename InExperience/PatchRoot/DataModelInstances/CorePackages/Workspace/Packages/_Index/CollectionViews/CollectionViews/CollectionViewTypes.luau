local parent = script:FindFirstAncestor("CollectionViews").Parent
local _ = require(parent.Style)
local _ = require(parent.Foundation)
local _ = require(parent.Signals)

return {
	CollectionItemSize = {
		XSmall = "XSmall",
		Small = "Small",
		Medium = "Medium",
		Large = "Large",
		XLarge = "XLarge"
	}
}