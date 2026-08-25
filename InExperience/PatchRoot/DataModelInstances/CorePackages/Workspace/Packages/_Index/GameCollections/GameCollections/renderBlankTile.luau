local parent = script:FindFirstAncestor("GameCollections").Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local var1 = reactModule.memo(function(p0)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, LayoutOrder = p0.index })
end)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), gameCollectionItemTypes (ref)
	return reactModule.createElement(var1, p1), gameCollectionItemTypes.GameCollectionItemType.Blank
end