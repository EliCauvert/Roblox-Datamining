local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local WorkshopWindowContextModule = require(AvatarWorkshop.Contexts.WorkshopWindowContext)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local GetUiStateStoreModule = require(AvatarWorkshop.Stores.Getters.getUiStateStore)

return function()
	-- upvalues: ReactModule (copy), WorkshopWindowContextModule (copy), UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), GetUiStateStoreModule (copy)
	local OnCloseFunction = ReactModule.useContext(WorkshopWindowContextModule).onClose
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(GetUiStateStoreModule)
	
	return ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), OnCloseFunction (copy)
		if UseSignalStateResult.getHasChanges(false) or UseSignalStateResult.getHasPendingAvatar(false) then
			UseSignalStateResult1.setIsRespawnDialogOpen(true)
			
			return
		else
			OnCloseFunction()
		end
	end, {
		UseSignalStateResult,
		UseSignalStateResult1,
		OnCloseFunction
	})
end