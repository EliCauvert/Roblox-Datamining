local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local GetToastStoreModule = require(AvatarWorkshop.Stores.Getters.getToastStore)
local UseSignalStateFunction = require(AvatarWorkshop.Parent.SignalsReact).useSignalState

return function()
	-- upvalues: UseSignalStateFunction (copy), GetToastStoreModule (copy)
	return UseSignalStateFunction(GetToastStoreModule).dismiss
end