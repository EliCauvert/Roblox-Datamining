local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local buildLibraryQueryModule = require(script.Parent.BuildLibraryQuery)
local AUTHORED_ROOTS = buildLibraryQueryModule.AUTHORED_ROOTS
local IMAGE_PROPERTIES = buildLibraryQueryModule.IMAGE_PROPERTIES
local SELECTORS = buildLibraryQueryModule.SELECTORS

local function localInstanceId(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return tostring(p1.UniqueId)
	end)
	
	return if ok and status ~= "" and status ~= "00000000-0000-0000-0000-000000000000" then `Instance:{status}` else `Instance:{p1.ClassName}:{p1:GetFullName()}:{p2}`
end

local function localRecords()
	-- upvalues: localInstanceId (ref), AUTHORED_ROOTS (ref), SELECTORS (ref)
	local t = {}
	local t_1 = {}
	local var1 = 0
	
	local function _(p1)
		-- upvalues: t_1 (ref), var1 (write), localInstanceId (copy)
		local var2 = t_1[p1]
		
		if var2 == nil then
			var1 += 1
			var2 = localInstanceId(p1, var1)
			t_1[p1] = var2
		end
		return var2
	end
	
	for i, v in AUTHORED_ROOTS do
		for i_1, v_1 in game:GetService(v):GetDescendants() do
			for i_2, v_2 in SELECTORS do
				if table.find(v_2.roots, v) and v_1.ClassName == v_2.className then
					local v_3
					local t_2 = {}
					
					for i_3, v_3 in v_2.properties do
						t_2[v_3] = v_1[v_3]
					end
					local t_3 = {}
					local parent = v_1.Parent
					while parent ~= nil do
						local var2 = parent
						local var3 = t_1[var2]
						
						if var3 == nil then
							var1 += 1
							var3 = localInstanceId(var2, var1)
							t_1[var2] = var3
						end
						table.insert(t_3, var3)
						parent = parent.Parent
					end
					v_3 = {}
					local var4 = t_1[v_1]
					
					if var4 == nil then
						var1 += 1
						var4 = localInstanceId(v_1, var1)
						t_1[v_1] = var4
					end
					v_3.id = var4
					v_3.displayName = v_1.Name
					v_3.path = v_1:GetFullName()
					v_3.className = v_1.ClassName
					v_3.ancestorIds = t_3
					v_3.properties = t_2
					v_3.model = if v_1:IsA("Model") then v_1 else nil
					table.insert(t, v_3)
					break
				end
			end
		end
	end
	return t
end

local function _(p1)
	-- upvalues: IMAGE_PROPERTIES (ref)
	return if p1.className == "Sound" then "Sound" elseif IMAGE_PROPERTIES[p1.className] == nil then "Model" else "Image"
end

local function normalizeRecords(p1, p2)
	-- upvalues: IMAGE_PROPERTIES (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		if (if v.className == "Sound" then "Sound" elseif IMAGE_PROPERTIES[v.className] ~= nil then "Model" else "Image") == "Model" then
			t[v.id] = v
		end
	end
	for i_1, v_1 in t do
		for i_2, v_2 in v_1.ancestorIds do
			if t[v_2] ~= nil then
				t_1[i_1] = v_2
				continue
			end
		end
	end
	local t_2 = {}
	local t_3 = {}
	
	for i_2, v_2 in p1 do
		if not t_3[v_2.id] then
			t_3[v_2.id] = true
			local var5 = if v_2.className == "Sound" then "Sound" elseif IMAGE_PROPERTIES[v_2.className] ~= nil then "Model" else "Image"
			local className = nil
			local soundId = nil
			
			if var5 == "Model" then
				if p2 or t_1[v_2.id] == nil then
					table.insert(t_2, {
						id = v_2.id,
						displayName = v_2.displayName,
						path = v_2.path,
						className = v_2.className,
						kind = var5,
						image = className,
						soundId = soundId,
						model = v_2.model
					})
				end
			elseif var5 == "Image" then
				className = v_2.properties[IMAGE_PROPERTIES[v_2.className]]
				
				if className ~= nil and className ~= "" then
				end
			else
				soundId = v_2.properties.SoundId
				
				if soundId ~= nil and soundId ~= "" then
				end
			end
		end
	end
	local t_4 = { Model = 1, Image = 2, Sound = 3 }
	table.sort(t_2, function(p3, p4)
		-- upvalues: t_4 (ref)
		return if p3.kind == p4.kind then if string.lower(p3.displayName) == string.lower(p4.displayName) then if p3.path == p4.path then p3.id < p4.id else p3.path < p4.path else string.lower(p3.displayName) < string.lower(p4.displayName) else t_4[p3.kind] < t_4[p4.kind]
	end)
	
	return t_2
end

local function localGeneration(p3)
	local var6 = 5381
	
	for i, v in p3 do
		for i_1, v_1 in {
			v.id, v.displayName, v.path, v.className, v.kind, v.image or "",
			v.soundId or ""
		} do
			for i_2 = 1, #v_1 do
				var6 = (var6 * 33 + string.byte(v_1, i_2)) % 2147483647
			end
			var6 = var6 * 33 % 2147483647
		end
	end
	return var6
end

return {
	query = function(p4)
		-- upvalues: localRecords (ref), normalizeRecords (ref), localGeneration (ref)
		local var7 = localRecords()
		local t = {}
		
		for i, v in var7 do
			t[v.id] = v
		end
		local ids = p4.ids or {}
		local t_1 = {}
		
		for i_1, v_1 in normalizeRecords(var7, #ids > 0) do
			if v_1.kind == p4.itemKind and (#ids == 0 or table.find(ids, v_1.id) ~= nil) then
				table.insert(t_1, v_1)
			end
		end
		local var8 = localGeneration(t_1)
		local t_2 = {}
		local lowerText = string.lower(p4.query or "")
		
		for i_2, v_2 in t_1 do
			if lowerText == "" or string.find(string.lower(`{v_2.displayName} {v_2.path}`), lowerText, 1, true) ~= nil then
				table.insert(t_2, t[v_2.id])
			end
		end
		local minValue = math.min(p4.offset, #t_2)
		local minValue_1 = math.min(minValue + p4.limit, #t_2)
		local t_3 = {}
		
		for i_3 = minValue + 1, minValue_1 do
			table.insert(t_3, t_2[i_3])
		end
		return {
			instances = t_3,
			generation = var8,
			total = #t_2,
			hasMore = minValue_1 < #t_2,
			nextOffset = minValue_1
		}
	end
}