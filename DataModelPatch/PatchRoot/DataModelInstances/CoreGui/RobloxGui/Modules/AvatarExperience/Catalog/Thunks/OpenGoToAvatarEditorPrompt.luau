local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local config = {
	toastMessage = "Feature.Avatar.Message.AlreadyAcquired",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}

return function(OnOverlayClosed, p1, p2, p3, ItemType)
	-- upvalues: ItemDataModule (copy), ConstantsModule (copy), AvatarScreen (copy), SetCurrentToastMessageModule (copy), config (copy), NavigateWithLockFunction (copy)
	return function(p4)
		-- upvalues: p2 (copy), ItemDataModule (upval), p3 (copy), ItemType (copy), ConstantsModule (upval), AvatarScreen (upval), SetCurrentToastMessageModule (upval), config (upval), p1 (copy), OnOverlayClosed (copy), NavigateWithLockFunction (upval)
		local Name = p2.opaque.name
		local AssetType = nil
		local ItemDataModuleResult = ItemDataModule(p4:getState().AvatarExperience.Common, p3, ItemType)
		
		if ItemType == ConstantsModule.ItemType.Asset then
			AssetType = ItemDataModuleResult.assetType
		elseif ItemType == ConstantsModule.ItemType.Bundle then
			AssetType = ItemDataModuleResult.bundleType
		end
		if Name == AvatarScreen.AvatarEditor then
			return p4:dispatch(SetCurrentToastMessageModule(config))
		else
			p4:dispatch(NavigateWithLockFunction(function()
				-- upvalues: p1 (upval), AvatarScreen (upval), ItemType (upval), AssetType (ref), OnOverlayClosed (upval)
				p1.navigate(AvatarScreen.LeaveCatalogToAvatarPrompt, {
					itemType = ItemType,
					itemSubType = AssetType,
					onOverlayClosed = OnOverlayClosed
				})
			end))
		end
	end
end