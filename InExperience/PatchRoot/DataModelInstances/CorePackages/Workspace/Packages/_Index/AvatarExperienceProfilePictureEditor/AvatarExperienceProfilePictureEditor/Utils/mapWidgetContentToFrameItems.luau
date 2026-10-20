local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local UserLibModule = require(AvatarExperienceProfilePictureEditor.Parent.UserLib)
local _ = require(AvatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants

local function buildHydratedAssetLookup(p1)
	local t = {}
	
	if p1 == nil then
		return t
	end
	local HydratedContent = p1.hydratedContent
	
	if HydratedContent == nil then
		return t
	end
	for _, value in HydratedContent do
		if value.type == "Asset" then
			t[tostring(value.id)] = value
		end
	end
	return t
end

return {
	FRAME_PICKER_THUMB_SIZE = 150,
	FRAME_PREVIEW_THUMB_SIZE = 420,
	getProfileFramePickerImage = function(p2)
		-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
		return GetRbxthumbWithTypeSizeAndOptionsFunction(p2, Constants.RbxthumbTypes.Asset, 150)
	end,
	getProfileFramePreviewImage = function(p2)
		-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
		return GetRbxthumbWithTypeSizeAndOptionsFunction(p2, Constants.RbxthumbTypes.Asset, 420)
	end,
	mapWidgetContentToFrameItems = function(List, p2)
		-- upvalues: buildHydratedAssetLookup (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
		local List1 = {}
		local HydratedAssetLookup = buildHydratedAssetLookup(p2)
		
		for _, value in List do
			if value.type == "Asset" then
				local Text = tostring(value.id)
				local HydratedAsset = HydratedAssetLookup[Text]
				table.insert(List1, {
					id = Text,
					label = if HydratedAsset and HydratedAsset.name then HydratedAsset.name else nil,
					image = GetRbxthumbWithTypeSizeAndOptionsFunction(Text, Constants.RbxthumbTypes.Asset, 150),
					previewImage = GetRbxthumbWithTypeSizeAndOptionsFunction(Text, Constants.RbxthumbTypes.Asset, 420)
				})
			end
		end
		return List1
	end
}