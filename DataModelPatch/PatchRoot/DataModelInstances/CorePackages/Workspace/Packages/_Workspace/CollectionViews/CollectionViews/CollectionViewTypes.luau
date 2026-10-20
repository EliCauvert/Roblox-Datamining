local Parent = script:FindFirstAncestor("CollectionViews").Parent
local _ = require(Parent.Style)
local _ = require(Parent.Foundation)
local _ = require(Parent.Signals)

return {
	CollectionItemSize = {
		XSmall = "XSmall",
		Small = "Small",
		Medium = "Medium",
		Large = "Large",
		XLarge = "XLarge"
	}
}