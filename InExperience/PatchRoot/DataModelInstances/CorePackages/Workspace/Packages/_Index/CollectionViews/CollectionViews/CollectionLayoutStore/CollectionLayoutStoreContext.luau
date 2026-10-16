local CollectionViews = script:FindFirstAncestor("CollectionViews")
local _ = require(CollectionViews.CollectionViewTypes)

return require(CollectionViews.Parent.React).createContext(nil)