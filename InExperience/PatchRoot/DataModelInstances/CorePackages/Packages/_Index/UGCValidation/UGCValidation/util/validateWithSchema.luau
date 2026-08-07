local parent = script.Parent.Parent
local getFFlagUGCValidationEnableFolderStructureModule = require(parent.flags.getFFlagUGCValidationEnableFolderStructure)
local getFFlagUGCValidationCombineEntrypointResultsModule = require(parent.flags.getFFlagUGCValidationCombineEntrypointResults)
local getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(parent.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)

local function _(p0, p1) --[[ line: 9 | named "checkName" ]]
	if type(p0) == "table" then
		for i, v in pairs(p0) do
			if v == p1 then
				return true
			end
		end
	else
		return type(p0) == "string" and p0 == p1
	end
end

local _ = function(p2) --[[ line: 22 | named "getReadableName" ]]
	return if type(p2) == "table" then table.concat(p2, " or ") elseif type(p2) == "string" then p2 else "*"
end

local function validateWithSchemaHelper(p3, p4, p5) --[[ line: 31 ]]
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateWithSchemaHelper (ref)
	local v
	if p4.ClassName == p3.ClassName then
		if p3.Name ~= nil then
			local var4
			local name = p3.Name
			local name_1 = p4.Name
			
			if type(name) == "table" then
				for i, v in pairs(name) do
					if v == name_1 then
						var4 = true
						if not var4 then
							return { success = false }
						end
					end
				end
			elseif type(name) == "string" then
				local _ = name == name_1
			else
				var4 = false
			end
		end
		if getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() and p3._ignoreDescendants then
			assert(not p3._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
			
			for i, v in p4:GetDescendants() do
				p5[v] = true
			end
			p5[p4] = true
			
			return { success = true }
		elseif p3._children then
			local var5
			for i, v in pairs(p3._children) do
				var5 = false
				local var6 = nil
				
				for i_1, v_1 in pairs(p4:GetChildren()) do
					if not getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() or not p5[v_1] then
						local var7 = validateWithSchemaHelper(v, v_1, p5)
						
						if var7.success then
							var5 = true
							break
						elseif var7.message then
							var6 = var7
						end
					end
				end
				if not var5 and not v._optional then
					if var6 then
						return var6
					end
					v = { success = false }
					local name = v.Name
					v.message = "Could not find a " .. v.ClassName .. " called " .. (if type(name) == "table" then table.concat(name, " or ") elseif type(name) == "string" then name else "*") .. " inside " .. p4.Name
					
					return v
				end
			end
		end
		p5[p4] = true
		
		return { success = true }
	end
end

return function(p6, p7, _) --[[ line: 92 | named "validateWithSchema" ]]
	-- upvalues: validateWithSchemaHelper (ref), getFFlagUGCValidationEnableFolderStructureModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref)
	local name, name_1
	if p7.ClassName == p6.ClassName then
		if p6.Name ~= nil then
			local var8
			name = p6.Name
			name_1 = p7.Name
			
			if type(name) == "table" then
				for i, v in pairs(name) do
					if v == name_1 then
						var8 = true
						if not var8 then
							local t = { success = false }
							local name_2 = p6.Name
							t.message = "Expected top-level instance to be a " .. p6.ClassName .. " named " .. (if type(name_2) == "table" then table.concat(name_2, " or ") elseif type(name_2) == "string" then name_2 else "*")
							
							return t
						end
					end
				end
			elseif type(name) == "string" then
				local _ = name == name_1
			else
				var8 = false
			end
		end
		local t = {}
		name = validateWithSchemaHelper(p6, p7, t)
		
		if name.success then
			name_1 = {}
			
			for i, v in pairs(p7:GetDescendants()) do
				if t[v] == nil then
					name_1[#name_1 + 1] = v:GetFullName()
				end
			end
			return if #name_1 > 0 then if getFFlagUGCValidationEnableFolderStructureModule() and getFFlagUGCValidationCombineEntrypointResultsModule() then { success = false, message = "" } else {
				success = false,
				message = "Unexpected Descendants:\n" .. table.concat(name_1, "\n")
			} else { success = true }
		else
			return if getFFlagUGCValidationEnableFolderStructureModule() and getFFlagUGCValidationCombineEntrypointResultsModule() then { success = false, message = "" } else name
		end
	end
end