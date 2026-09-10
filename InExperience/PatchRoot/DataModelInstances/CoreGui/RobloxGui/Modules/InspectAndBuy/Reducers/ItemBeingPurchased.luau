local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)
local parent = script.Parent.Parent
local fFlagAXIaBSinglePurchaseUnifiedEventsModule = require(parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)

return roduxModule.createReducer({ itemType = nil, itemId = nil, resalePrice = nil }, {
	[require(parent.Actions.SetItemBeingPurchased).name] = function(_, p1)
		-- upvalues: fFlagAXIaBSinglePurchaseUnifiedEventsModule (ref)
		return {
			itemType = p1.itemType,
			itemId = p1.itemId,
			resalePrice = if fFlagAXIaBSinglePurchaseUnifiedEventsModule then p1.resalePrice else nil
		}
	end
})