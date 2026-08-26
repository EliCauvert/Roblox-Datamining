local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local userLibModule = require(avatarExperienceProfilePictureEditor.Parent.UserLib)
local _ = require(avatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants

local function buildHydratedAssetLookup(value)
	local t = {}
	
	if value == nil then
		return t
	end
	local hydratedContent = value.hydratedContent
	
	if hydratedContent == nil then
		return t
	end
	for i, v in hydratedContent do
		if v.type == "Asset" then
			t[tostring(v.id)] = v
		end
	end
	return t
end

return {
	FRAME_PICKER_THUMB_SIZE = 150,
	FRAME_PREVIEW_THUMB_SIZE = 420,
	getProfileFramePickerImage = function(p1)
		-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		return getRbxthumbWithTypeSizeAndOptions(p1, constants.RbxthumbTypes.Asset, 150)
	end,
	getProfileFramePreviewImage = function(p1)
		-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		return getRbxthumbWithTypeSizeAndOptions(p1, constants.RbxthumbTypes.Asset, 420)
	end,
	mapWidgetContentToFrameItems = function(p1, p2)
		-- upvalues: buildHydratedAssetLookup (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		local t = {}
		local var1 = buildHydratedAssetLookup(p2)
		
		for i, v in p1 do
			if v.type == "Asset" then
				local var2 = tostring(v.id)
				local var3 = var1[var2]
				table.insert(t, {
					id = var2,
					label = if var3 and var3.name then var3.name else nil,
					image = getRbxthumbWithTypeSizeAndOptions(var2, constants.RbxthumbTypes.Asset, 150),
					previewImage = getRbxthumbWithTypeSizeAndOptions(var2, constants.RbxthumbTypes.Asset, 420)
				})
			end
		end
		return t
	end
}