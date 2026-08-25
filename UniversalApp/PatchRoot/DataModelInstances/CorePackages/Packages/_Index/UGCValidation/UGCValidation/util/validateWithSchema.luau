local getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule = require(script.Parent.Parent.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants)

local function _(p0, p1)
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

local _ = function(p2)
	return if type(p2) == "table" then table.concat(p2, " or ") elseif type(p2) == "string" then p2 else "*"
end

local function validateWithSchemaHelper(p3, p4, p5)
	-- upvalues: getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule (ref), validateWithSchemaHelper (ref)
	local v
	if p4.ClassName == p3.ClassName then
		if p3.Name ~= nil then
			local var2
			local name = p3.Name
			local name_1 = p4.Name
			
			if type(name) == "table" then
				for i, v in pairs(name) do
					if v == name_1 then
						var2 = true
						if not var2 then
							return { success = false }
						end
					end
				end
			elseif type(name) == "string" then
				local _ = name == name_1
			else
				var2 = false
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
			local var3
			for i, v in pairs(p3._children) do
				var3 = false
				local var4 = nil
				
				for i_1, v_1 in pairs(p4:GetChildren()) do
					if not getFFlagUGCValidationExtendSchemaToIgnoreDescendantsModule() or not p5[v_1] then
						local var5 = validateWithSchemaHelper(v, v_1, p5)
						
						if var5.success then
							var3 = true
							break
						elseif var5.message then
							var4 = var5
						end
					end
				end
				if not var3 and not v._optional then
					if var4 then
						return var4
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

return function(p6, p7, _)
	-- upvalues: validateWithSchemaHelper (ref)
	local name_1
	if p7.ClassName == p6.ClassName then
		if p6.Name ~= nil then
			local var6
			local name = p6.Name
			name_1 = p7.Name
			
			if type(name) == "table" then
				for i, v in pairs(name) do
					if v == name_1 then
						var6 = true
						if not var6 then
							local t = { success = false }
							local name = p6.Name
							t.message = "Expected top-level instance to be a " .. p6.ClassName .. " named " .. (if type(name) == "table" then table.concat(name, " or ") elseif type(name) == "string" then name else "*")
							
							return t
						end
					end
				end
			elseif type(name) == "string" then
				local _ = name == name_1
			else
				var6 = false
			end
		end
		local t = {}
		
		if not validateWithSchemaHelper(p6, p7, t).success then
			return { success = false, message = "" }
		end
		name_1 = {}
		
		for i, v in pairs(p7:GetDescendants()) do
			if t[v] == nil then
				name_1[#name_1 + 1] = v:GetFullName()
			end
		end
		return if #name_1 > 0 then { success = false, message = "" } else { success = true }
	end
end