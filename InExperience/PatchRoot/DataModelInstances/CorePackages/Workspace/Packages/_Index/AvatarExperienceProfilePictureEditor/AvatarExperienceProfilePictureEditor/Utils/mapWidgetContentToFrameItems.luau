local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local userLibModule = require(avatarExperienceProfilePictureEditor.Parent.UserLib)
local _ = require(avatarExperienceProfilePictureEditor.Api.profileFramesWidgetsApi)
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local constants = userLibModule.Utils.Constants

local function buildHydratedAssetLookup(value) --[[ line: 35 ]]
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
	getProfileFramePickerImage = function(p0) --[[ line: 27 ]]
		-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		return getRbxthumbWithTypeSizeAndOptions(p0, constants.RbxthumbTypes.Asset, 150)
	end,
	getProfileFramePreviewImage = function(p1) --[[ line: 31 ]]
		-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		return getRbxthumbWithTypeSizeAndOptions(p1, constants.RbxthumbTypes.Asset, 420)
	end,
	mapWidgetContentToFrameItems = function(p2, p3) --[[ line: 55 ]]
		-- upvalues: buildHydratedAssetLookup (ref), getRbxthumbWithTypeSizeAndOptions (ref), constants (ref)
		local t = {}
		local var5 = buildHydratedAssetLookup(p3)
		
		for i, v in p2 do
			if v.type == "Asset" then
				local var6 = tostring(v.id)
				local var7 = var5[var6]
				table.insert(t, {
					id = var6,
					label = if var7 and var7.name then var7.name else nil,
					image = getRbxthumbWithTypeSizeAndOptions(var6, constants.RbxthumbTypes.Asset, 150),
					previewImage = getRbxthumbWithTypeSizeAndOptions(var6, constants.RbxthumbTypes.Asset, 420)
				})
			end
		end
		return t
	end
}