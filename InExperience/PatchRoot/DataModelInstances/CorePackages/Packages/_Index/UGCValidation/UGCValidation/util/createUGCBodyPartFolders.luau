local parent = script.Parent.Parent
local _ = require(parent.util.BundlesMetadata)
local constantsModule = require(parent.Constants)

local function getUGCBodyPartsAssetTypeMap(value, p1, p2)
	-- upvalues: constantsModule (ref)
	assert(value:IsA("Model"))
	local var1 = p1[p2]
	
	if var1 == nil then
		return {}
	end
	local t = {}
	
	for i, v in constantsModule.UGC_BODY_PARTS do
		local var2 = value:FindFirstChild(v)
		
		if var2 ~= nil then
			local var3 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v]
			assert(var3 ~= nil, "Body part doesn't map to an asset type")
			
			if var1.allowedAssetTypeSettings[var3.Name] ~= nil then
				if t[var3] == nil then
					t[var3] = { var2 }
				else
					table.insert(t[var3], var2)
				end
			end
		end
	end
	return t
end

return function(p3, p4, p5, p6)
	-- upvalues: getUGCBodyPartsAssetTypeMap (ref), constantsModule (ref)
	assert(p3:IsA("Model"), "Invalid root instance, must be a model")
	local t = {}
	
	for i, v in getUGCBodyPartsAssetTypeMap(p3, p4, p5) do
		if table.find(constantsModule.ASSET_TYPES_THAT_SKIP_FOLDER, i) ~= nil then
			t[i] = v
			continue
		end
		local folder = Instance.new("Folder")
		folder.Name = constantsModule.FOLDER_NAMES.R15ArtistIntent
		
		for i_1, v_1 in v do
			v_1.Parent = folder
		end
		t[i] = { folder }
		
		if p6 then
			local var4 = folder:Clone()
			var4.Name = constantsModule.FOLDER_NAMES.R15Fixed
			table.insert(t[i], var4)
			local folder_1 = Instance.new("Folder")
			folder_1.Name = constantsModule.FOLDER_NAMES.R6
			table.insert(t[i], folder_1)
		end
	end
	return t
end