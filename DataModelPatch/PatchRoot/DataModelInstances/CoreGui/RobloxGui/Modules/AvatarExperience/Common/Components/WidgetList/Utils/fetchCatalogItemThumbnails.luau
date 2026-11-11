local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ContentProvider = game:GetService("ContentProvider")
local _ = require(Modules.AvatarExperience.Common.Types)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local PromiseModule = require(CorePackages.Packages.Promise)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local config = {
	[ItemTypeEnum.Asset] = true,
	Hat = true,
	Face = true,
	FaceAccessory = true,
	PantsAccessory = true,
	EmoteAnimation = true,
	Gear = true,
	HairAccessory = true,
	BackAccessory = true,
	ShoulderAccessory = true,
	DressSkirtAccessory = true,
	FrontAccessory = true
}

local function _(Bundle)
	-- upvalues: config (copy), Constants (copy), ItemTypeEnum (copy)
	return if config[Bundle] then Constants.RbxthumbTypes.Asset elseif Bundle == ItemTypeEnum.Bundle then Constants.RbxthumbTypes.BundleThumbnail elseif Bundle == ItemTypeEnum.Look then Constants.RbxthumbTypes.Look else Constants.RbxthumbTypes.Asset
end

local _ = function(Look, p1)
	-- upvalues: ItemTypeEnum (copy), ConstantsModule (copy)
	return if p1 then p1 elseif Look == ItemTypeEnum.Look then ConstantsModule.CatalogThumbnailTypeToSize.Look._300x450 else ConstantsModule.CatalogThumbnailTypeToSize.Asset._150x150
end

return function(List, p1)
	-- upvalues: PromiseModule (copy), config (copy), Constants (copy), ItemTypeEnum (copy), ConstantsModule (copy), ContentProvider (copy)
	if not List or #List == 0 then
		return PromiseModule.resolve()
	end
	local List1 = {}
	local Flag = false
	
	for _, value in List do
		local Type = value.type
		local Asset = if config[Type] then Constants.RbxthumbTypes.Asset elseif Type == ItemTypeEnum.Bundle then Constants.RbxthumbTypes.BundleThumbnail elseif Type == ItemTypeEnum.Look then Constants.RbxthumbTypes.Look else Constants.RbxthumbTypes.Asset
		local ThumbnailSize = value.thumbnailSize or p1
		local Type1 = value.type
		table.insert(List1, `rbxthumb://type={Asset}&id={value.id}&{if ThumbnailSize then ThumbnailSize elseif Type1 == ItemTypeEnum.Look then ConstantsModule.CatalogThumbnailTypeToSize.Look._300x450 else ConstantsModule.CatalogThumbnailTypeToSize.Asset._150x150}`)
		
		if value.type == ItemTypeEnum.Look and not Flag then
			Flag = true
		end
	end
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: ContentProvider (upval), List1 (copy)
		task.spawn(function()
			-- upvalues: ContentProvider (upval), List1 (upval), Callback (copy), Callback1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: ContentProvider (upval), List1 (upval)
				ContentProvider:PreloadAsync(List1)
			end)
			
			if Success then
				Callback()
				
				return
			else
				Callback1("Failed to preload thumbnails: " .. tostring(Result))
			end
		end)
	end)
end