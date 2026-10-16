local Parent = script.Parent.Parent
local FFlagAXIaBSinglePurchaseUnifiedEventsModule = require(Parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)

return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ itemType = nil, itemId = nil, resalePrice = nil }, {
	[require(Parent.Actions.SetItemBeingPurchased).name] = function(_, p1) --[[ Line: 14 ]]
		-- upvalues: FFlagAXIaBSinglePurchaseUnifiedEventsModule (copy)
		return {
			itemType = p1.itemType,
			itemId = p1.itemId,
			resalePrice = if FFlagAXIaBSinglePurchaseUnifiedEventsModule then p1.resalePrice else nil
		}
	end
})