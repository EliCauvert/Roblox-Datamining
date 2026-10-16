local Gifting = script:FindFirstAncestor("Gifting")
local CreateCanGiftStoreModule = require(Gifting.Stores.createCanGiftStore)

return require(Gifting.Parent.Signals).createComputed(function() --[[ Line: 8 ]]
	-- upvalues: CreateCanGiftStoreModule (copy)
	return CreateCanGiftStoreModule()
end)