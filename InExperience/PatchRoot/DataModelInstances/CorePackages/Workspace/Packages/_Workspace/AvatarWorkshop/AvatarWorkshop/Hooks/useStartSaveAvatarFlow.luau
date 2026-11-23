local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.Creators.createSaveAvatarFlowStore)
local GetSaveAvatarFlowStoreModule = require(AvatarWorkshop.Stores.Getters.getSaveAvatarFlowStore)
local UseSignalStateFunction = require(AvatarWorkshop.Parent.SignalsReact).useSignalState

return function()
	-- upvalues: UseSignalStateFunction (copy), GetSaveAvatarFlowStoreModule (copy)
	return UseSignalStateFunction(GetSaveAvatarFlowStoreModule).start
end