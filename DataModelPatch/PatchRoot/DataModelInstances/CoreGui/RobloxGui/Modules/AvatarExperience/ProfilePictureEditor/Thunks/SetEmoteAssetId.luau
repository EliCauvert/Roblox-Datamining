local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local SetEmoteAssetIdModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)

return function(p1, p2)
	-- upvalues: ArgCheckModule (copy), CryoModule (copy), ClearTryOnsFunction (copy), CloseAllItemDetailsModule (copy), SetEmoteAssetIdModule (copy)
	ArgCheckModule.isTypeOrNil(p1, "string", "SetEmoteAssetId thunk expects emoteAssetId to be a string or nil")
	
	return function(p3)
		-- upvalues: CryoModule (upval), ClearTryOnsFunction (upval), CloseAllItemDetailsModule (upval), p2 (copy), SetEmoteAssetIdModule (upval), p1 (copy)
		if not CryoModule.isEmpty(p3:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems) then
			p3:dispatch(ClearTryOnsFunction())
			p3:dispatch(CloseAllItemDetailsModule(p2))
		end
		p3:dispatch(SetEmoteAssetIdModule(p1))
	end
end