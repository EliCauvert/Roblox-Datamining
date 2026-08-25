local parent = script.Parent.Parent
local _ = require(parent.util.BundlesMetadata)
local constantsModule = require(parent.Constants)

local function getUGCBodyPartsAssetTypeMap(value, p0, p1)
	-- upvalues: constantsModule (ref)
	assert(value:IsA("Model"))
	local var2 = p0[p1]
	
	if var2 == nil then
		return {}
	end
	local t = {}
	
	for i, v in constantsModule.UGC_BODY_PARTS do
		local var4 = value:FindFirstChild(v)
		
		if var4 ~= nil then
			local var5 = constantsModule.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v]
			assert(var5 ~= nil, "Body part doesn't map to an asset type")
			
			if var2.allowedAssetTypeSettings[var5.Name] ~= nil then
				if t[var5] == nil then
					t[var5] = { var4 }
				else
					table.insert(t[var5], var4)
				end
			end
		end
	end
	return t
end

return function(p2, p3, p4, p5)
	-- upvalues: getUGCBodyPartsAssetTypeMap (ref), constantsModule (ref)
	assert(p2:IsA("Model"), "Invalid root instance, must be a model")
	local t = {}
	
	for i, v in getUGCBodyPartsAssetTypeMap(p2, p3, p4) do
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
		
		if p5 then
			local var8 = folder:Clone()
			var8.Name = constantsModule.FOLDER_NAMES.R15Fixed
			table.insert(t[i], var8)
			local folder_1 = Instance.new("Folder")
			folder_1.Name = constantsModule.FOLDER_NAMES.R6
			table.insert(t[i], folder_1)
		end
	end
	return t
end