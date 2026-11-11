local _ = require(script.Parent.Stores.createPhotoboothStore)
local Store = nil

return {
	setStore = function(Value)
		-- upvalues: Store (ref)
		Store = Value
	end,
	getStore = function()
		-- upvalues: Store (ref)
		return Store
	end,
	clearStore = function()
		-- upvalues: Store (ref)
		Store = nil
	end
}