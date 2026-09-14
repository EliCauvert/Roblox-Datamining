local buildExperience = script:FindFirstAncestor("BuildExperience")
local logger = require(buildExperience.Parent.Loggers).Logger
local _ = require(script.Parent.AssetLibraryTypes)
local collectWorkspaceModelsModule = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local list = { "Model", "Image", "Audio" }

local function _(p1, p2)
	if p2 ~= nil then
		local uniqueId = p2.getUniqueId(p1)
		
		return if uniqueId == nil or uniqueId == "" then p1:GetFullName() else uniqueId
	end
end

local _ = function(p1)
	local descendants = p1:GetDescendants()
	table.sort(descendants, function(p2, p3)
		return if p2.Name == p3.Name then if p2.ClassName == p3.ClassName then p2:GetFullName() < p3:GetFullName() else p2.ClassName < p3.ClassName else p2.Name < p3.Name
	end)
	
	return descendants
end

local _ = function(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1[p2]
	end)
	
	return if ok and type(status) == "string" and status ~= "" then status else nil
end

local function getImageContent(p1)
	if p1:IsA("Decal") or p1:IsA("Texture") then
		local var1 = "Texture"
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), var1 (ref)
			return p1[var1]
		end)
		
		return if ok and type(status) == "string" and status ~= "" then status else nil
	elseif not p1:IsA("ImageLabel") and not p1:IsA("ImageButton") then
		return nil
	end
	local var2 = "Image"
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var2 (ref)
		return p1[var2]
	end)
	
	return if ok and type(status) == "string" and status ~= "" then status else nil
end

local function getAudioContent(p1)
	if not p1:IsA("Sound") then
		return nil
	end
	local var1 = "SoundId"
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), var1 (ref)
		return p1[var1]
	end)
	
	return if ok and type(status) == "string" and status ~= "" then status else nil
end

local function makeItem(p1, p2, p3, p4)
	local var1
	local t = {}
	
	if p3 ~= nil then
		local uniqueId = p3.getUniqueId(p2)
		var1 = if uniqueId == nil or uniqueId == "" then p2:GetFullName() else uniqueId
	end
	t.id = var1
	t.kind = p1
	t.displayName = if p2.Name ~= "" then p1 else p2.Name
	t.instance = p2
	t.className = p2.ClassName
	t.path = p2:GetFullName()
	t.model = if p2:IsA("Model") then p2 else nil
	t.thumbnail = if p1 == "Image" then p4 else nil
	t.contentId = p4
	
	return t
end

local function isExplicitSemanticContent(p1)
	if p1:GetAttribute("AssetLibraryCategory") == nil and p1:GetAttribute("BuildAssetLibraryCategory") == nil and p1:GetAttribute("ExposeInAssetLibrary") ~= true then
		local ok, status = pcall(function()
			-- upvalues: p1 (ref)
			local collectionService = game:GetService("CollectionService")
			
			return collectionService:HasTag(p1, "AssetLibraryContent") or collectionService:HasTag(p1, "SemanticContent")
		end)
		
		return ok and status
	end
	return true
end

local function collectContentItems(p1, p2, p3, p4, p5)
	-- upvalues: makeItem (ref), isExplicitSemanticContent (ref)
	local t = {}
	local t_1 = {}
	
	local function _(p6)
		-- upvalues: t_1 (ref), p5 (ref), t (ref), makeItem (copy), p1 (ref), p4 (ref)
		if t_1[p6] then return end
		local var1 = p5(p6)
		
		if var1 ~= nil then
			t_1[p6] = true
			table.insert(t, makeItem(p1, p6, p4, var1))
		end
	end
	
	for i, v in p3 do
		if v.model ~= nil then
			for i_1, v_1 in v.model:GetChildren() do
				if not t_1[v_1] then
					local var1 = p5(v_1)
					
					if var1 ~= nil then
						t_1[v_1] = true
						table.insert(t, makeItem(p1, v_1, p4, var1))
					end
				end
			end
		end
	end
	local descendants = p2:GetDescendants()
	table.sort(descendants, function(p6, p7)
		return if p6.Name == p7.Name then if p6.ClassName == p7.ClassName then p6:GetFullName() < p7:GetFullName() else p6.ClassName < p7.ClassName else p6.Name < p7.Name
	end)
	
	for i_1, v_1 in descendants do
		if isExplicitSemanticContent(v_1) and p5(v_1) ~= nil and not t_1[v_1] then
			local var2 = p5(v_1)
			
			if var2 ~= nil then
				t_1[v_1] = true
				table.insert(t, makeItem(p1, v_1, p4, var2))
			end
		end
	end
	return t
end

local function flattenSerializedModels(p6)
	local t = {}
	
	for i, v in p6 do
		if v:IsA("Model") then
			table.insert(t, v)
		end
		for i_1, v_1 in v:GetDescendants() do
			if v_1:IsA("Model") then
				table.insert(t, v_1)
			end
		end
	end
	return t
end

local function orderedMetadata(p7)
	local t = {}
	
	for i, v in p7.items or {} do
		table.insert(t, v)
	end
	return t
end

local function matchModelMetadata(p8, p9, p10, p11)
	local fullName = p8:GetFullName()
	
	for i, v in p9 do
		if not p10[i] and v.path == fullName then
			p10[i] = true
			
			return v
		end
	end
	for i_1, v in p9 do
		if not p10[i_1] and v.displayName == p8.Name then
			p10[i_1] = true
			
			return v
		end
	end
	if p9[p11] == nil or p10[p11] then
		return nil
	end
	p10[p11] = true
	
	return p9[p11]
end

local var3 = nil

local function collectModelItems(p12)
	-- upvalues: collectWorkspaceModelsModule (ref)
	local t = {}
	
	for i, v in collectWorkspaceModelsModule.collectWorkspaceModels(p12) do
		table.insert(t, {
			kind = "Model",
			thumbnail = nil,
			contentId = nil,
			id = v.id,
			displayName = v.name,
			instance = v.model,
			className = v.model.ClassName,
			path = v.path,
			model = if v.model:IsA("Model") then v.model else nil
		})
	end
	return t
end

return {
	collect = function(p13, p14)
		-- upvalues: collectModelItems (ref), collectContentItems (ref), getImageContent (ref), getAudioContent (ref), list (ref)
		local var4 = if p13 ~= nil then workspace else p13.workspace
		local var5 = collectModelItems(p13)
		local t = {
			Model = var5,
			Image = collectContentItems("Image", var4, var5, p13, getImageContent),
			Audio = collectContentItems("Audio", var4, var5, p13, getAudioContent)
		}
		local t_1 = {}
		local t_2 = {}
		
		for i, v in list do
			local var6 = t[v]
			table.sort(var6, function(p15, p16)
				return if p15.displayName == p16.displayName then p15.id < p16.id else p15.displayName < p16.displayName
			end)
			
			for i_1, v_1 in var6 do
				t_1[v_1.id] = v_1
			end
			table.insert(t_2, { kind = v, items = var6 })
		end
		return { categories = t_2, itemsById = t_1, generation = p14 or 0 }
	end,
	collectSerializedPayload = function(p15, p16, p17)
		-- upvalues: var3 (write), list (ref), logger (ref), orderedMetadata (ref), flattenSerializedModels (ref), matchModelMetadata (ref), getImageContent (ref)
		if type(p15.categories) == "table" then
			local t = {}
			local t_1 = {}
			
			for i, v in p15.categories do
				local var7 = var3(v, p17)
				table.insert(t, var7)
				
				for i_1, v_1 in var7.items do
					t_1[v_1.id] = v_1
				end
			end
			return { categories = t, itemsById = t_1, generation = p16 or 0 }
		else
			p17 = p17 or game:GetService("SerializationService")
			local t = {}
			local t_1 = {}
			
			for i, v in list do
				local var8 = p15[`{v}s`]
				local t_2 = {}
				
				if var8 ~= nil then
					local serialized = var8.serialized
					
					if serialized == nil and type(var8.serializedBytes) == "string" then
						serialized = buffer.fromstring(var8.serializedBytes)
					end
					if serialized ~= nil then
						logger:info("BuildAssetLibrary deserializing kind={} type={} bytes={}", v, typeof(serialized), if typeof(serialized) == "buffer" then buffer.len(serialized) else 0)
						t_2 = p17:DeserializeInstancesAsync(serialized)
						logger:info("BuildAssetLibrary deserialized kind={} roots={}", v, #t_2)
					end
				end
				local t_3 = {}
				
				if var8 ~= nil then
					local var9, ok, status, v_1
					local var10 = orderedMetadata(var8)
					
					if v == "Model" then
						local t_4 = {}
						
						for i_1, v_1 in flattenSerializedModels(t_2) do
							var9 = matchModelMetadata(v_1, var10, t_4, i_1)
							ok = {
								kind = "Model",
								className = "Model",
								thumbnail = nil,
								contentId = nil
							}
							status = if var9 == nil or var9.id == nil then `Model:{v_1:GetFullName()}:{i_1}` else var9.id
							ok.id = status
							status = if var9 == nil or var9.displayName == nil then v_1.Name else var9.displayName
							ok.displayName = status
							ok.instance = v_1
							status = if var9 == nil or var9.path == nil then v_1:GetFullName() else var9.path
							ok.path = status
							ok.model = v_1
							table.insert(t_3, ok)
							t_1[ok.id] = ok
						end
					else
						for i_2, i_1 in var10 do
							v_1 = t_2[i_2]
							
							if v_1 ~= nil then
								if v == "Image" then
									var9 = getImageContent(v_1)
								elseif v_1:IsA("Sound") then
									local var11 = "SoundId"
									ok, status = pcall(function()
										-- upvalues: v_1 (ref), var11 (ref)
										return v_1[var11]
									end)
									var9 = if ok and type(status) == "string" and status ~= "" then status else nil
								else
									var9 = nil
								end
								ok = {
									model = nil,
									id = i_1.id,
									kind = v,
									displayName = i_1.displayName,
									instance = v_1,
									className = v_1.ClassName,
									path = i_1.path,
									thumbnail = if v == "Image" then var9 else nil,
									contentId = var9
								}
								table.insert(t_3, ok)
								t_1[ok.id] = ok
							end
						end
					end
				end
				table.insert(t, { kind = v, items = t_3 })
				continue
			end
			return { categories = t, itemsById = t_1, generation = p16 or 0 }
		end
	end,
	collectSerializedCategoryPayload = function(p18, p19)
		-- upvalues: orderedMetadata (ref), logger (ref)
		local kind = p18.kind
		local var12 = orderedMetadata(p18)
		local t = {}
		
		if kind == "Model" and type(p18.serializedBytes) == "string" then
			p19 = p19 or game:GetService("SerializationService")
			local buff = buffer.fromstring(p18.serializedBytes)
			logger:info("BuildAssetLibrary deserializing category={} bytes={}", tostring(p18.key), buffer.len(buff))
			t = p19:DeserializeInstancesAsync(buff)
		end
		local t_1 = {}
		
		for i, v in var12 do
			local var13 = if kind == "Model" then t[i] else nil
			table.insert(t_1, {
				id = v.id,
				kind = kind,
				displayName = v.displayName,
				instance = var13,
				className = v.className,
				path = v.path,
				model = if var13 == nil or not var13:IsA("Model") then nil else var13,
				thumbnail = if kind == "Image" then v.contentId else nil,
				contentId = v.contentId
			})
		end
		return {
			key = p18.key,
			kind = kind,
			count = p18.count or #t_1,
			items = t_1,
			hasMore = p18.hasMore,
			nextOffset = p18.nextOffset
		}
	end
}