local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = p1.index })
end)

return function(p1)
	-- upvalues: ReactModule (copy), MemoResult (copy), GameCollectionItemTypes (copy)
	return ReactModule.createElement(MemoResult, p1), GameCollectionItemTypes.GameCollectionItemType.Blank
end