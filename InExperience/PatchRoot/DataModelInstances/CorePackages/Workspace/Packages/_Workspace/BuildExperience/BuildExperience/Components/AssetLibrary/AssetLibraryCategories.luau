local _ = require(script.Parent.AssetLibraryTypes)
local _ = require(script.Parent.collectDataModelLibrarySnapshot)
local list = {
	{
		key = "Layouts",
		sectionTitle = "Layouts",
		sectionPageKey = "Layouts",
		title = "Layouts",
		assetType = "Model"
	},
	{
		key = "Avatar",
		sectionTitle = "3D Objects",
		sectionPageKey = "Objects",
		title = "Avatar",
		assetType = "Model"
	},
	{
		key = "Objects",
		sectionTitle = "3D Objects",
		sectionPageKey = "Objects",
		title = "Objects",
		assetType = "Model"
	},
	{
		key = "Props",
		sectionTitle = "3D Objects",
		sectionPageKey = "Objects",
		title = "Props",
		assetType = "Model"
	},
	{
		key = "Terrain",
		sectionTitle = "3D Objects",
		sectionPageKey = "Objects",
		title = "Terrain",
		assetType = "Model"
	},
	{
		key = "Textures",
		sectionTitle = "2D Images",
		sectionPageKey = "Images",
		title = "Textures",
		assetType = "Image"
	},
	{
		key = "Decals",
		sectionTitle = "2D Images",
		sectionPageKey = "Images",
		title = "Decals",
		assetType = "Image"
	},
	{
		key = "Icons",
		sectionTitle = "2D Images",
		sectionPageKey = "Images",
		title = "Icons",
		assetType = "Image"
	},
	{
		key = "Interfaces",
		sectionTitle = "2D Images",
		sectionPageKey = "Images",
		title = "Interfaces",
		assetType = "Image"
	},
	{
		key = "Materials",
		sectionTitle = "2D Images",
		sectionPageKey = "Images",
		title = "Materials",
		assetType = "Image"
	},
	{
		key = "Sounds",
		sectionTitle = "Sounds",
		sectionPageKey = "Sounds",
		title = "Sounds",
		assetType = "Audio"
	}
}

local function hasToken(p1, p2)
	local lowerText = string.lower(`{p1.displayName} {p1.className or ""}`)
	
	for i, v in p2 do
		if string.find(lowerText, v, 1, true) ~= nil then
			return true
		end
	end
	return false
end

local function matches(p3, p4)
	-- upvalues: hasToken (ref), matches (ref)
	if p4.instance ~= nil and (p4.instance:GetAttribute("AssetLibraryCategory") or p4.instance:GetAttribute("BuildAssetLibraryCategory")) == p3 then
		return true
	elseif p3 == "Sounds" then
		return p4.kind == "Audio"
	elseif p3 == "Layouts" then
		return p4.kind == "Model" and hasToken(p4, {
			"layout", "map", "world", "level", "base", "building"
		})
	elseif p3 == "Avatar" then
		return p4.kind == "Model" and hasToken(p4, {
			"avatar",
			"character",
			"npc",
			"humanoid",
			"rig"
		})
	elseif p3 == "Props" then
		return p4.kind == "Model" and hasToken(p4, {
			"prop", "furniture", "chair", "table", "tool", "station", "weapon", "sword",
			"crate", "barrel", "decor", "lamp", "door"
		})
	elseif p3 == "Terrain" then
		return p4.kind == "Model" and hasToken(p4, {
			"terrain", "landscape", "ground", "rock", "mountain", "cliff", "tree", "plant",
			"grass", "water"
		})
	elseif p3 == "Objects" then
		return p4.kind == "Model" and (not matches("Layouts", p4) and (not matches("Avatar", p4) and (not matches("Props", p4) and not matches("Terrain", p4))))
	elseif p4.kind ~= "Image" then
		return false
	elseif p3 == "Textures" then
		return if p4.className ~= "Texture" then p4.instance ~= nil and p4.instance:IsA("Texture") else true
	elseif p3 == "Decals" then
		return if p4.className ~= "Decal" then p4.instance ~= nil and p4.instance:IsA("Decal") else true
	elseif p3 == "Icons" then
		local var1
		if p4.className ~= "ImageLabel" then
			var1 = p4.className == "ImageButton" and hasToken(p4, { "icon", "button", "logo", "badge" })
		end
		return var1
	elseif p3 == "Interfaces" then
		local var2
		if p4.className ~= "ImageLabel" then
			var2 = p4.className == "ImageButton" and not matches("Icons", p4)
		end
		return var2
	else
		return p3 == "Materials" and (if p4.className ~= "MeshPart" then p4.instance ~= nil and p4.instance:IsA("MeshPart") else true)
	end
end

return { definitions = list, matches = matches }