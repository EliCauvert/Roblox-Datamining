local collectionViews = script:FindFirstAncestor("CollectionViews")
local _ = require(collectionViews.CollectionViewTypes)

return require(collectionViews.Parent.React).createContext(nil)