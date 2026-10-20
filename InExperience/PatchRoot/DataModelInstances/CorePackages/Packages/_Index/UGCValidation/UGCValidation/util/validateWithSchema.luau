local function _(List, p1): boolean
	if type(List) == "table" then
		for _, value in pairs(List) do
			if value == p1 then
				return true
			end
		end
	elseif type(List) == "string" then
		return List == p1
	end
	return false
end

local _ = function(List)
	return if type(List) == "table" then table.concat(List, " or ") elseif type(List) == "string" then List else "*"
end

local function validateWithSchemaHelper(p2, Key, p3)
	-- upvalues: validateWithSchemaHelper (copy)
	repeat
		if Key.ClassName ~= p2.ClassName then break end
		if p2.Name ~= nil then
			local Name = p2.Name
			local Name1 = Key.Name
			local Flag = nil
			repeat
				if type(Name) == "table" then
					for _, value in pairs(Name) do
						if value == Name1 then
							Flag = true
							break
						end
					end
				else
					if type(Name) ~= "string" then break end
					Flag = Name == Name1
					break
				end
				Flag = false
			until true
			if not Flag then continue end
		end
		if p2._ignoreDescendants then
			assert(not p2._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway")
			
			for _, descendant in Key:GetDescendants() do
				p3[descendant] = true
			end
			p3[Key] = true
			
			return { success = true }
		else
			if p2._children then
				local v1 = nil
				local Flag = nil
				for _, child in pairs(p2._children) do
					Flag = false
					v1 = nil
					
					for _, child1 in pairs(Key:GetChildren()) do
						if not p3[child1] then
							local ValidateWithSchemaHelperResult = validateWithSchemaHelper(child, child1, p3)
							
							if ValidateWithSchemaHelperResult.success then
								Flag = true
								break
							elseif ValidateWithSchemaHelperResult.message then
								v1 = ValidateWithSchemaHelperResult
							end
						end
					end
					if not Flag and not child._optional then
						if v1 then
							return v1
						else
							local Name2 = child.Name
							
							return {
								success = false,
								message = "Could not find a " .. child.ClassName .. " called " .. (if type(Name2) == "table" then table.concat(Name2, " or ") elseif type(Name2) == "string" then Name2 else "*") .. " inside " .. Key.Name
							}
						end
					end
				end
			end
			p3[Key] = true
			
			return { success = true }
		end
	until true
	return { success = false }
end

return function(p2, Key, _)
	-- upvalues: validateWithSchemaHelper (copy)
	repeat
		if Key.ClassName ~= p2.ClassName then break end
		if p2.Name ~= nil then
			local Name = p2.Name
			local Name1 = Key.Name
			local Flag = nil
			repeat
				if type(Name) == "table" then
					for _, value in pairs(Name) do
						if value == Name1 then
							Flag = true
							break
						end
					end
				else
					if type(Name) ~= "string" then break end
					Flag = Name == Name1
					break
				end
				Flag = false
			until true
			if not Flag then continue end
		end
		local t = {}
		
		if not validateWithSchemaHelper(p2, Key, t).success then
			return { success = false, message = "" }
		end
		local FullNames = {}
		
		for _, descendant in pairs(Key:GetDescendants()) do
			if t[descendant] == nil then
				FullNames[#FullNames + 1] = descendant:GetFullName()
			end
		end
		return if #FullNames > 0 then { success = false, message = "" } else { success = true }
	until true
	local Name = p2.Name
	
	return {
		success = false,
		message = "Expected top-level instance to be a " .. p2.ClassName .. " named " .. (if type(Name) == "table" then table.concat(Name, " or ") elseif type(Name) == "string" then Name else "*")
	}
end