local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local buildExperienceLibraryImageClasses = game:DefineFastString("BuildExperienceLibraryImageClasses", "Decal,Texture,ImageLabel,ImageButton")
local buildExperienceLibraryRoots = game:DefineFastString("BuildExperienceLibraryRoots", "Workspace,ReplicatedStorage,ReplicatedFirst,Lighting,SoundService,StarterGui,StarterPack,StarterPlayer")
local buildExperienceLibraryDescriptionAttribute = game:DefineFastString("BuildExperienceLibraryDescriptionAttribute", "SemanticDescription")
local t = {
	Decal = "Texture",
	Texture = "Texture",
	ImageLabel = "Image",
	ImageButton = "Image",
	ParticleEmitter = "Texture",
	Beam = "Texture",
	Trail = "Texture"
}
local t_1 = { Model = 1, Image = 2, Sound = 3 }

local function parseList(p1)
	local t = {}
	
	for i in string.gmatch(p1, "[^,]+") do
		local match = string.match(i, "^%s*(.-)%s*$")
		
		if match ~= "" and not table.find(t, match) then
			table.insert(t, match)
		end
	end
	return t
end

return function(p2)
	-- upvalues: parseList (ref), buildExperienceLibraryImageClasses (ref), buildExperienceLibraryRoots (ref), signalsModule (ref), t (ref), buildExperienceLibraryDescriptionAttribute (ref), t_1 (ref)
	p2 = p2 or game
	local var1 = parseList(buildExperienceLibraryImageClasses)
	local var2 = parseList(buildExperienceLibraryRoots)
	local var3, var4 = signalsModule.createSignal({})
	local tbl = setmetatable({}, { __mode = "k" })
	local var5 = 0
	local var6 = nil
	
	local function _(p3)
		-- upvalues: tbl (ref), var5 (write)
		if tbl[p3] == nil then
			var5 += 1
			tbl[p3] = `Instance:{var5}`
		end
		return tbl[p3]
	end
	
	local t_2 = {}
	
	local function sameItems(p3, p4)
		if #p3 ~= #p4 then
			return false
		end
		for i, v in p4 do
			local var7 = p3[i]
			
			for i_1, v_1 in v do
				if var7[i_1] ~= v_1 then
					return false
				end
			end
			for i_1 in var7 do
				if v[i_1] == nil then
					return false
				end
			end
		end
		return true
	end
	
	return {
		refresh = function()
			-- upvalues: var6 (write), tbl (ref), var5 (write), var2 (ref), p2 (ref), var1 (ref), t (copy), buildExperienceLibraryDescriptionAttribute (copy), t_1 (copy), sameItems (ref), var3 (ref), t_2 (write), var4 (ref)
			local t_3 = {}
			local t_4 = {}
			var6 = nil
			
			local function parentFolderId(p5, p6, p7, p8)
				-- upvalues: tbl (copy), var5 (copy), t_4 (ref), t_3 (ref), parentFolderId (ref)
				local parent = p5.Parent
				while parent ~= nil and parent ~= p6 do
					if parent.ClassName ~= "Folder" then
						parent = parent.Parent
						continue
					end
					local var8 = "%*:%*"
					
					if tbl[parent] == nil then
						var5 += 1
						tbl[parent] = `Instance:{var5}`
					end
					var8 = var8:format(tbl[parent], p8)
					
					if not t_4[var8] then
						t_4[var8] = true
						table.insert(t_3, {
							className = "Folder",
							id = var8,
							instance = parent,
							displayName = parent.Name,
							path = parent:GetFullName(),
							kind = p8,
							folderId = parentFolderId(parent, p6, p7, p8),
							rootName = p7
						})
					end
					return var8
				end
				return nil
			end
			
			for i, v in var2 do
				local ok, status = pcall(function()
					-- upvalues: p2 (copy), v (ref)
					return p2:GetService(v)
				end)
				
				if ok and status ~= nil then
					if v == "Workspace" then
						var6 = status
					end
					local children = status:GetChildren()
					local var9 = 1
					while var9 <= #children do
						local var10 = children[var9]
						var9 += 1
						local className = var10.ClassName
						
						if className ~= "Model" then
							for i_1, v_1 in var10:GetChildren() do
								table.insert(children, v_1)
							end
						end
						local var11
						local var12 = if table.find(var1, className) then t[className] else nil
						local _ = nil
						
						if className == "Model" then
							var11 = "Model"
						elseif className == "Sound" then
							var11 = "Sound"
							var12 = "SoundId"
						elseif var12 == nil then continue end
						var11 = "Image"
						local var13 = if var12 ~= nil then nil else var10[var12]
						
						if var13 == "" then continue end
						local i_1 = var10:GetAttribute(buildExperienceLibraryDescriptionAttribute)
						local t_5 = {}
						
						if tbl[var10] == nil then
							var5 += 1
							tbl[var10] = `Instance:{var5}`
						end
						t_5.id = tbl[var10]
						t_5.instance = var10
						t_5.displayName = var10.Name
						t_5.path = var10:GetFullName()
						t_5.className = className
						t_5.kind = var11
						t_5.folderId = parentFolderId(var10, status, v, var11)
						t_5.rootName = v
						t_5.description = if type(i_1) == "string" and i_1 ~= "" then i_1 else nil
						t_5.image = if var11 == "Image" then var13 else nil
						t_5.soundId = if var11 == "Sound" then var13 else nil
						t_5.model = if var11 == "Model" then var10 else nil
						table.insert(t_3, t_5)
					end
				end
			end
			local t_5 = {}
			
			for i_1, v_1 in t_3 do
				t_5[v_1] = string.lower(v_1.displayName)
			end
			table.sort(t_3, function(p9, p10)
				-- upvalues: t_1 (copy), t_5 (ref)
				if p9.kind ~= p10.kind then
					return t_1[p9.kind] < t_1[p10.kind]
				end
				local var14 = t_5[p9]
				local var15 = t_5[p10]
				
				return if var14 == var15 then if p9.path == p10.path then p9.id < p10.id else p9.path < p10.path else var14 < var15
			end)
			
			if sameItems(var3(false), t_3) then return end
			t_2 = {}
			
			for i_2, v_2 in t_3 do
				t_2[v_2.id] = v_2
			end
			var4(t_3)
		end,
		getItems = var3,
		getItem = function(p9, p10)
			-- upvalues: var3 (ref), t_2 (write)
			var3(p9)
			
			return t_2[p10]
		end,
		resolveWorldItem = function(p9)
			-- upvalues: tbl (ref), t_2 (write), var6 (write)
			local var14
			local var15 = p9
			while var15 ~= nil do
				local var16 = tbl[var15]
				var14 = if var16 ~= nil then nil else t_2[var16]
				
				if var14 == nil or var14.model ~= var15 then
					var15 = var15.Parent
					continue
				end
				return if var6 == nil or not var15:IsDescendantOf(var6) then nil else var14
			end
			return nil
		end
	}
end