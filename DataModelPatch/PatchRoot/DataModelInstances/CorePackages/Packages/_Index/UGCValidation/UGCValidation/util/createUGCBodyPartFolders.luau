local Parent = script.Parent.Parent
local _ = require(Parent.util.BundlesMetadata)
local ConstantsModule = require(Parent.Constants)

local function getUGCBodyPartsAssetTypeMap(Model: Model, p1, p2)
	-- upvalues: ConstantsModule (copy)
	assert(Model:IsA("Model"))
	local v1 = p1[p2]
	
	if v1 == nil then
		return {}
	end
	local t = {}
	
	for _, uGCBODYPART in ConstantsModule.UGC_BODY_PARTS do
		local Child = Model:FindFirstChild(uGCBODYPART)
		local NoChild = Child == nil
		local UGCBODYPARTNAMESTOASSETTYPEEntry = nil
		
		if not NoChild then
			UGCBODYPARTNAMESTOASSETTYPEEntry = ConstantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[uGCBODYPART]
			assert(UGCBODYPARTNAMESTOASSETTYPEEntry ~= nil, "Body part doesn't map to an asset type")
			NoChild = v1.allowedAssetTypeSettings[UGCBODYPARTNAMESTOASSETTYPEEntry.Name] == nil
		end
		if not NoChild then
			if t[UGCBODYPARTNAMESTOASSETTYPEEntry] == nil then
				t[UGCBODYPARTNAMESTOASSETTYPEEntry] = { Child }
			else
				table.insert(t[UGCBODYPARTNAMESTOASSETTYPEEntry], Child)
			end
		end
	end
	return t
end

return function(Model: Model, p3, p4, p5)
	-- upvalues: getUGCBodyPartsAssetTypeMap (copy), ConstantsModule (copy)
	assert(Model:IsA("Model"), "Invalid root instance, must be a model")
	local t = {}
	
	for i, value in getUGCBodyPartsAssetTypeMap(Model, p3, p4) do
		if table.find(ConstantsModule.ASSET_TYPES_THAT_SKIP_FOLDER, i) ~= nil then
			t[i] = value
			continue
		end
		local Folder = Instance.new("Folder")
		Folder.Name = ConstantsModule.FOLDER_NAMES.R15ArtistIntent
		
		for _, value1 in value do
			value1.Parent = Folder
		end
		t[i] = { Folder }
		
		if p5 then
			local FolderClone = Folder:Clone()
			FolderClone.Name = ConstantsModule.FOLDER_NAMES.R15Fixed
			table.insert(t[i], FolderClone)
			local Folder1 = Instance.new("Folder")
			Folder1.Name = ConstantsModule.FOLDER_NAMES.R6
			table.insert(t[i], Folder1)
		end
	end
	return t
end