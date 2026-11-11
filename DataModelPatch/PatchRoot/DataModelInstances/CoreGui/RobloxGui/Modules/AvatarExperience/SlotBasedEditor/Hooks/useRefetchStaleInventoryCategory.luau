local CorePackages = game:GetService("CorePackages")
local MemStorageService = game:GetService("MemStorageService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local SetPageFinishedModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local GetStaleInventoryGrantStoreFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Stores.getStaleInventoryGrantStore
local FFlagAXRefetchInventoryOnAssetGrant = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRefetchInventoryOnAssetGrant

return function(Key, p1, Callback)
	-- upvalues: UseDispatchFunction (copy), GetStaleInventoryGrantStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), FFlagAXRefetchInventoryOnAssetGrant (copy), MemStorageService (copy), SetPageFinishedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsUseSignalStateResultEntry = UseSignalStateFunction(GetStaleInventoryGrantStoreFunction().getStaleSearchUuids)[Key] == true
	ReactModule.useEffect(function()
		-- upvalues: FFlagAXRefetchInventoryOnAssetGrant (upval), IsUseSignalStateResultEntry (copy), p1 (copy), MemStorageService (upval), Key (copy), UseDispatchResult (copy), SetPageFinishedModule (upval), Callback (copy)
		if not FFlagAXRefetchInventoryOnAssetGrant or not IsUseSignalStateResultEntry then return end
		if p1 then
			p1.startNewSearch()
		end
		MemStorageService:SetItem(Key, "")
		UseDispatchResult(SetPageFinishedModule(Key, false))
		Callback()
	end, {
		IsUseSignalStateResultEntry,
		Key,
		p1,
		Callback,
		UseDispatchResult
	})
end