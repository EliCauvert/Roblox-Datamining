local RoduxModule = require(script.Parent.Parent.Parent.Rodux)
local InspectModule = require(script.Parent.Inspect)
local ItemDetailsModule = require(script.Parent.ItemDetails)

return function()
	-- upvalues: RoduxModule (copy), InspectModule (copy), ItemDetailsModule (copy)
	return RoduxModule.combineReducers({ Inspect = InspectModule, ItemAssets = ItemDetailsModule })
end