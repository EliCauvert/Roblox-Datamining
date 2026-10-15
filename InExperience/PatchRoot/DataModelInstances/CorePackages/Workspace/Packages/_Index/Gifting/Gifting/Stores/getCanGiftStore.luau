local gifting = script:FindFirstAncestor("Gifting")
local createCanGiftStoreModule = require(gifting.Stores.createCanGiftStore)

return require(gifting.Parent.Signals).createComputed(function()
	-- upvalues: createCanGiftStoreModule (ref)
	return createCanGiftStoreModule()
end)